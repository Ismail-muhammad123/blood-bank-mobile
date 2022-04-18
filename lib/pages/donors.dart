import 'package:blood_bank_master/pages/search_donor.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

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
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FindDonorPage(),
              ),
            ),
            icon: Icon(
              Icons.search,
            ),
          )
        ],
        backgroundColor: Colors.red,
        title: Text('Blood Point'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.redAccent,
        strokeWidth: 3.0,
        onRefresh: _refresh,
        child: ListView(
          children: [
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
            DonorCard(),
            Divider(),
          ],
        ),
      ),
    );
  }
}
