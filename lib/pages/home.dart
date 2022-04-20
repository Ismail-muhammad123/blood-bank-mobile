import 'package:blood_bank_master/pages/about.dart';
import 'package:blood_bank_master/pages/donate_blood.dart';
import 'package:blood_bank_master/pages/request_blood.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firestore = FirebaseFirestore.instance.collection('achievements');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Blood Point',
                    style: TextStyle(
                      fontSize: 64.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  MaterialButton(
                    child: const Text(
                      'About The App',
                      style: TextStyle(color: Colors.red, fontSize: 22.0),
                    ),
                    color: Colors.white,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutPage(),
                      ),
                    ),
                  ),
                ],
              ),
              width: double.maxFinite,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.red[900],
                image: const DecorationImage(
                  opacity: 0.3,
                  image: AssetImage('assets/images/blood.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Divider(),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Quick Links'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DonateBloodFormPage(),
                    ),
                  ),
                  child: Card(
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.bloodtype,
                            color: Colors.red,
                            size: 70,
                          ),
                          Text(
                            'Donate',
                            style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RequestBloodFormPage(),
                    ),
                  ),
                  child: Card(
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.red,
                            size: 70,
                          ),
                          Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Provider.of<DonorModel>(context, listen: false).donors,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data!.docs.isNotEmpty) {
                  var data = snapshot.data?.docs
                      .map((e) => e.data()! as Map<String, dynamic>)
                      .toList();

                  var myDonations = data
                      ?.takeWhile((value) =>
                          value['uid'] ==
                          Provider.of<AuthUserModel>(context)
                              .credentials
                              .currentUser!
                              .uid)
                      .toList();
                  if (myDonations!.isEmpty) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              size: 50,
                              color: Colors.yellow,
                            ),
                            Text(
                              'You Have Note Donated Yet',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  var lastDonation =
                      (myDonations[0]['date'] as Timestamp).toDate();
                  var nextDonation = lastDonation.add(
                    Duration(days: 10),
                  );
                  var totalDonations = myDonations.length;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          Card(
                            child: Container(
                              height: 100,
                              width: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Number Of Donations'.toUpperCase(),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    totalDonations.toString(),
                                    style: TextStyle(fontSize: 26.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Last Donation Date'.toUpperCase(),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                      '${lastDonation.day} /${lastDonation.month}/ ${lastDonation.year}',
                                      style: TextStyle(fontSize: 26.0)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Next Donation available'.toUpperCase(),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                      '${nextDonation.day} /${nextDonation.month}/ ${nextDonation.year}',
                                      style: TextStyle(fontSize: 26.0)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Center(child: Text('An erro has occured'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
