import 'package:blood_bank_master/pages/donors.dart';
import 'package:blood_bank_master/pages/home.dart';
import 'package:blood_bank_master/pages/profile.dart';
import 'package:blood_bank_master/pages/sigin.dart';
import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/faq.dart';

class DonorCard extends StatelessWidget {
  const DonorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: Abdul khalek',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Contact: 3456789087654',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Address: Tangail',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Total Donations: 1 time',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Last Donation: 23/10/2018',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ],
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
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            ),
            leading: const Icon(
              Icons.person,
            ),
            title: Text('Abdul Khalek'),
            subtitle: Text('khalek191@gmail.com'),
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
                  title: Text('Find Blood Donor'),
                ),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text('Nearest Hospitals'),
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
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  ),
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
