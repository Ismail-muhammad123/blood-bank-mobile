import 'package:flutter/material.dart';

import '../widgets.dart';

class FindDonorPage extends StatefulWidget {
  const FindDonorPage({Key? key}) : super(key: key);

  @override
  State<FindDonorPage> createState() => _FindDonorPageState();
}

class _FindDonorPageState extends State<FindDonorPage> {
  final _blood_groups = [
    'a',
    'b',
    'ab',
    'o',
  ];

  final _divisions = [
    'dhaka',
    'kano',
  ];

  var _blood_group = 'a';
  var _division = 'dhaka';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Find Donor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Choose Blood Group:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: List.generate(
                      _blood_groups.length,
                      (index) => DropdownMenuItem(
                        child: Text(
                          _blood_groups[index].toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _blood_groups[index],
                      ),
                    ),
                    value: _blood_group,
                    onChanged: (val) => setState(
                      () {
                        _blood_group = val.toString();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Choose Your Division:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                Expanded(
                  child: DropdownButton<String>(
                    items: List.generate(
                      _divisions.length,
                      (index) => DropdownMenuItem(
                        child: Text(
                          _divisions[index].toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _divisions[index],
                      ),
                    ),
                    value: _division,
                    onChanged: (val) => setState(
                      () {
                        _division = val.toString();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red.withOpacity(0.5),
                  minWidth: 200,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
