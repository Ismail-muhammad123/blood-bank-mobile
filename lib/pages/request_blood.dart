import 'package:blood_bank_master/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestBloodFormPage extends StatefulWidget {
  const RequestBloodFormPage({Key? key}) : super(key: key);

  @override
  State<RequestBloodFormPage> createState() => _RequestBloodFormPageState();
}

class _RequestBloodFormPageState extends State<RequestBloodFormPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _groupController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _numberController.dispose();
    _groupController.dispose();
    _quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Request Blood'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  label: Text('Address'),
                ),
              ),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Contact Number'),
                ),
              ),
              TextFormField(
                controller: _groupController,
                decoration: const InputDecoration(
                  label: Text('Blood Group'),
                ),
              ),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Quantity needed'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
              ),
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    await Provider.of<ReciepientModel>(context, listen: false)
                        .addReciepient(
                            _groupController.text,
                            _numberController.text,
                            _addressController.text,
                            int.parse(_quantityController.text),
                            _nameController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text('Request'),
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
