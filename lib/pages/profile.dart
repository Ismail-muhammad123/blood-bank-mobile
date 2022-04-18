import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final InputDecoration inputDecoration =
      const InputDecoration(border: InputBorder.none);

  final TextStyle _inputLabelStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  final _inputBoxDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );

  final _b_groups = [
    'a',
    'b',
    'ab',
    'o',
  ];

  var blood_group = 'a';

  var _gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Name:', style: _inputLabelStyle),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration: _inputBoxDecoration,
                      child: Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Email:', style: _inputLabelStyle),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration: _inputBoxDecoration,
                      child: Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Contact No:', style: _inputLabelStyle),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration: _inputBoxDecoration,
                      child: Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Address:', style: _inputLabelStyle),
                      ),
                    ),
                    Container(
                      width: 250,
                      decoration: _inputBoxDecoration,
                      child: Expanded(
                        child: TextFormField(
                          minLines: 3,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Gender:', style: _inputLabelStyle),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: [
                          DropdownMenuItem(
                            child: Text('Male'),
                            value: 'male',
                          ),
                          DropdownMenuItem(
                            child: Text('Female'),
                            value: 'female',
                          ),
                        ],
                        value: _gender,
                        onChanged: (val) => setState(
                          () {
                            _gender = val.toString();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Blood Group:', style: _inputLabelStyle),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: List.generate(
                          _b_groups.length,
                          (index) => DropdownMenuItem(
                            child: Text(_b_groups[index].toUpperCase()),
                            value: _b_groups[index],
                          ),
                        ),
                        value: blood_group,
                        onChanged: (val) => setState(
                          () {
                            blood_group = val.toString();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 14.0)),
                Center(
                  child: MaterialButton(
                    color: Colors.white,
                    minWidth: 300.0,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      // TODO: update profile
                      Navigator.of(context).pop();
                    },
                    child: Text('Update'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
