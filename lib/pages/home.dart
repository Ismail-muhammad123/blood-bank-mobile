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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
      ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: Provider.of<AchievementModel>(context, listen: false).store,
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
            print(data);

            var lastDonation =
                (data![0]['Last Donation Date'] as Timestamp).toDate();
            var nextDonation = lastDonation.add(
              Duration(days: 10),
            );

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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Number Of Donations'.toUpperCase(),
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                                data![0]['Number of Donations'] ??
                                    '0'.toString(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
