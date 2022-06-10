import 'package:flutter/foundation.dart';
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

  Event(String title, DateTime date) {
    this.title = title;
    this.description = '';
    this.date = date;
    evaluationMoment = false;
    this.delivery = false;
    this.subject = '';
  }

  String getTitle() {
    return title;
  }

  void examEvent(Exam exam) {
    title = exam.subject + ' (' + exam.examType + ')';
    if (exam.begin != null) {
      description = ' [Hora: ' + exam.begin + ']';
    } else {
      description = '';
    }
    date = exam.date;
    evaluationMoment = true;
    delivery = false;
    subject = exam.subject;
  }

  void deliveryEvent(Delivery delivery) {
    title = delivery.subject + ' (' + delivery.type + ')';
    DateFormat dateFormat = DateFormat('HH:mm');
    if (dateFormat.format(delivery.date) != '00:00') {
      description = ' [Hora: ' + dateFormat.format(delivery.date) + ']';
    } else {
      description = '';
    }
    date = delivery.date;
    evaluationMoment = true;
    this.delivery = true;
    subject = delivery.subject;
  }

  void setTitle(String title) {
    this.title = title;
  }
}
