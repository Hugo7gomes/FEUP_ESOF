import 'package:flutter/material.dart';

class Delivery {
  String subject;
  DateTime date;
  String type;

  Delivery(String subject, DateTime date, String type) {
    this.subject = subject;
    this.date = date;
    this.type = type;
  }
}
