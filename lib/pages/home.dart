import 'package:blood_bank_master/pages/about.dart';
import 'package:blood_bank_master/pages/faq.dart';
import 'package:blood_bank_master/pages/donors.dart';
import 'package:blood_bank_master/pages/profile.dart';
import 'package:blood_bank_master/pages/sigin.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _items = [
    {
      'title': 'Total Donations',
      'value': 2,
    },
    {
      'title': 'Last Donated',
      'value': '12/02/2022',
    },
    {
      'title': 'Next Available Donation (Days)',
      'value': 114,
    },
  ];

  Future _refresh() async =>
      await Future.delayed(Duration(seconds: 3), () => true);

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
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.redAccent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  _items.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(14.0),
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            _items[index]['title'].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            _items[index]['value'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
