import 'package:flutter/material.dart';

Color customColor({String? date}) {
  switch (date) {
    case 'Today':
    return Colors.blue;
    case 'Tomorrow':
    return Colors.red;
    case 'Yesterday':
    return Colors.pink;
    default:
    return Colors.grey;
  }
}