import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact {
  final String id;
  final String fullName;
  final String imageurl;
  final String phoneNumber;
  final String email;
  final String address;
  Contact(
      {@required this.id,
      @required this.fullName,
      @required this.imageurl,
      @required this.phoneNumber,
      @required this.email,
      @required this.address});
}
