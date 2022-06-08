import 'package:flutter/material.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/delivery.dart';
import 'package:intl/intl.dart';

class Event {
  String title;
  String description;
  DateTime date;
  bool evaluationMoment;
  bool delivery;
  String subject;

  Event(String title, String date) {
    this.title = title;
    this.description = '';
    this.date = DateTime.parse(date);
    evaluationMoment = false;
    this.delivery = false;
    this.subject = '';
  }

  void examEvent(Exam exam) {
    title = exam.subject + ' (' + exam.examType + ')';
    final DateFormat dateFormat = DateFormat('HH:mm:ss');
    description = ' Hora: ' + dateFormat.format(exam.date);
    date = exam.date;
    evaluationMoment = true;
    delivery = false;
    subject = exam.subject;
  }

  void deliveryEvent(Delivery delivery) {
    title = delivery.subject + ' (' + delivery.type + ')';
    DateFormat dateFormat = DateFormat('HH:mm:ss');
    description = ' Hora: ' + dateFormat.format(delivery.date);
    date = delivery.date;
    evaluationMoment = true;
    this.delivery = true;
    subject = delivery.subject;
  }
}
