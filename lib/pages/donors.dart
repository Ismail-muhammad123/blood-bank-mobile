import 'package:blood_bank_master/pages/search_donor.dart';
import 'package:blood_bank_master/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';
import 'donate_blood.dart';

class DonorSPage extends StatefulWidget {
  const DonorSPage({Key? key}) : super(key: key);

  @override
  State<DonorSPage> createState() => _DonorSPageState();
}

class _DonorSPageState extends State<DonorSPage> {
  Future<bool> _refresh() async =>
      await Future.delayed(Duration(seconds: 5), () => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Blood Donors'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DonateBloodFormPage(),
            ),
          );
        },
        label: Text('Donate'),
        backgroundColor: Colors.red,
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.redAccent,
        strokeWidth: 3.0,
        onRefresh: _refresh,
        child: StreamBuilder<QuerySnapshot>(
          stream: Provider.of<DonorModel>(context).donors,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No Donors Available'),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map(
                (DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return DonorCard(
                    name: data['name'],
                    number: data['contact number'],
                    address: data['address'],
                    group: data['blood group'],
                    quantity: data['quantity(bags)'] ?? 0,
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
