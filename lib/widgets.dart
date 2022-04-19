import 'package:blood_bank_master/pages/authenticate.dart';
import 'package:blood_bank_master/pages/donate_blood.dart';
import 'package:blood_bank_master/pages/donors.dart';
import 'package:blood_bank_master/pages/home.dart';
import 'package:blood_bank_master/pages/reciepients.dart';
import 'package:blood_bank_master/pages/request_blood.dart';
import 'package:blood_bank_master/pages/splash_screen.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/about.dart';
import 'pages/faq.dart';

class DonorCard extends StatelessWidget {
  final String name, address, number, group, uid;
  final int quantity;
  const DonorCard({
    Key? key,
    required this.name,
    required this.address,
    required this.number,
    required this.group,
    required this.uid,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(6.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Contact: $number',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Address: $address',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Blood Group: $group',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Quantity (bags): ${quantity.toString()}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReciepientCard extends StatelessWidget {
  final String name, address, number, group;
  final int quantity;
  const ReciepientCard({
    Key? key,
    required this.name,
    required this.address,
    required this.number,
    required this.group,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(6.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Contact: $number',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Address: $address',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Blood Group: $group',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Quantity needed (bags): ${quantity.toString()}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 6.0,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/blood.png'),
              ),
              color: Colors.redAccent,
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30.0,
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: Text(
                Provider.of<AuthUserModel>(context).userEmail ?? 'User Email'),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  subtitle: Text('Your Donation History'),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DonorSPage(),
                    ),
                  ),
                  leading: Icon(Icons.bloodtype),
                  title: Text('Blood Donors'),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DonorSPage(),
                    ),
                  ),
                  leading: Icon(Icons.add),
                  title: Text('Donate Blood'),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DonateBloodFormPage(),
                    ),
                  ),
                  leading: Icon(Icons.bloodtype),
                  title: Text('Recipient Requests'),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DonateBloodFormPage(),
                    ),
                  ),
                  leading: Icon(Icons.add),
                  title: Text('Add Request'),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  ),
                  leading: Icon(Icons.info),
                  title: Text('About'),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FaqPage(),
                    ),
                  ),
                  leading: Icon(Icons.help),
                  title: Text('Frequently Asked Questions'),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<AuthUserModel>(context, listen: false)
                        .credentials
                        .signOut();
                    Navigator.of(context)
                      ..pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SplashScreen(),
                          ),
                          (route) => false);
                  },
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
