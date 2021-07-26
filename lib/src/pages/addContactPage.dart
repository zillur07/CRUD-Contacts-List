import 'package:contacts/src/controllers/contactsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactPage extends StatefulWidget {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String address;

  AddContactPage({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.address,
  });

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final contactController = Get.put(
    ContactsController(),
    permanent: true,
  );

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.fullName;
    phoneController.text = widget.phoneNumber;
    emailController.text = widget.email;
    addressController.text = widget.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id != null ? 'Update Contact' : 'Add Contact',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: widget.id != null ? Colors.red[300] : Colors.teal[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              //Text('${widget.fullName}'),
              TextField(
                controller: nameController,
                onChanged: contactController.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Full Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneController,
                onChanged: contactController.phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: contactController.emailAddress,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Email Address',
                ),
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: addressController,
                onChanged: contactController.myAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: 'Address',
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: Get.width,
                child: TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      widget.id != null ? Colors.redAccent : Colors.teal[400],
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    widget.fullName != null
                        ? contactController.editContact(id: widget.id)
                        : contactController.addContact();
                  },
                  icon: Icon(
                    widget.id != null ? Icons.upload_file : Icons.add,
                  ),
                  label: Text(widget.id != null ? 'Update' : 'Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
