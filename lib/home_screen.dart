import 'package:aplikacja_treningowa/cubit/slider_cubit.dart';
import 'package:aplikacja_treningowa/training_progress.dart';
import 'package:flutter/material.dart';
import 'simple_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String? title;
  const HomeScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appBar = SimpleAppBar();
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          appBar,
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SliderCubit(),
                    child: TrainingProgress(),
                  ),
                ),
              );
            },
            color: Colors.purple,
            child: const Text(
              'Spalanie brzucha',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
