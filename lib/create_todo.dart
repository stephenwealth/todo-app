// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/home_view.dart';

class CreateToDo extends StatelessWidget {
  CreateToDo({Key? key}) : super(key: key);

  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timecontroller = TextEditingController();

  final DateFormat _dateFormat = DateFormat('MM/dd/yy');

  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create To Do'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _titlecontroller,
                maxLines: 1,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  hintText: ('Please write a title '),
                  hintStyle: TextStyle(fontSize: 12),
                ),
                validator: (Value) {
                  if (Value!.isEmpty) {
                    return 'title is a required field';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 1,
                decoration: const InputDecoration(
                  label: Text(
                    'Description',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  hintText: ('Please write a description '),
                  hintStyle: TextStyle(fontSize: 12),
                ),
                validator: (Value) {
                  if (Value!.isEmpty) {
                    return 'description is a required field';
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((selectedDate) {
                          _dateController.text =
                              _dateFormat.format(selectedDate!);
                        });
                      },
                      controller: _dateController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        label: Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        hintText: ('Please enter here '),
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'date is a required field';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((selectedtime) {
                          _timecontroller.text = selectedtime!.format(context);
                        });
                      },
                      controller: _timecontroller,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        label: Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        hintText: ('Please enter here'),
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'time is a required field';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(29, 38, 104, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    //print('success');
                  } else {
                    //print('failed');
                  }
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
