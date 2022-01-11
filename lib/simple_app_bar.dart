import 'package:aplikacja_treningowa/training_progress.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SimpleAppBar extends StatefulWidget {
  const SimpleAppBar({Key? key}) : super(key: key);

  @override
  _SimpleAppBarState createState() => _SimpleAppBarState();
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: Text('TABATA TRENER'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.question_answer),
            onPressed: () {
              _showMyDialog();
            },
          )
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bedziesz ulancem?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Podpisz cyrograf.'),
                Text('Nie odpuscisz"??'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('100% albo Jaglak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
