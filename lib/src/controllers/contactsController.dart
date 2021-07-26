import 'package:contacts/src/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ContactsController extends GetxController {
  final name = ''.obs;
  final phoneNumber = ''.obs;
  final emailAddress = ''.obs;
  final myAddress = ''.obs;

  final contacts = RxList<Contact>();

  // void addContact() {

  // }
  void addContact() {
    final contactData = Contact(
      id: Uuid().v1(),
      fullName: name.value,
      imageurl: 'assets/images/person_img.png',
      phoneNumber: phoneNumber.value,
      email: emailAddress.value,
      address: myAddress.value,
    );
    contacts.add(contactData);
    Get.back();
    // print(name.value);
    // print(phoneNumber.value);
  }

  void deleteContact({@required String id}) {
    Get.defaultDialog(middleText: 'Are you sure', actions: [
      // ignore: deprecated_member_use
      FlatButton(
        color: Colors.grey,
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cencal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      FlatButton(
        color: Colors.red,
        onPressed: () {
          contacts.removeWhere((item) => item.id == id);
          Get.back();
          Get.snackbar(
            'Successfully',
            'Contact Number is Delete',
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.done,
            ),
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
          );
        },
        child: Text(
          'Confirm',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ]);

    // Get.snackbar(
    //   'Successfully',
    //   'Contact Number is Delete',
    //   backgroundColor: Colors.white,
    //   icon: Icon(
    //     Icons.done,
    //   ),
    //   colorText: Colors.black,
    //   snackPosition: SnackPosition.TOP,
    // );
  }

  void editContact({@required String id}) {
    final updateData = Contact(
      id: id,
      fullName: name.value,
      imageurl: 'assets/images/person_img.png',
      phoneNumber: phoneNumber.value,
      email: emailAddress.value,
      address: myAddress.value,
    );
    contacts[contacts.indexWhere((contactItem) => contactItem.id == id)] =
        updateData;

    Get.back();
    Get.snackbar(
      'Successfully',
      'Contact Number is Update',
      backgroundColor: Colors.red[300],
      icon: Icon(
        Icons.done_all,
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
