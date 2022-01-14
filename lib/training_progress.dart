import 'package:aplikacja_treningowa/bloc/timer_bloc.dart';
import 'package:aplikacja_treningowa/training_spec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/slider_cubit.dart';
import 'ticker.dart';

class TrainingProgress extends StatefulWidget {
  const TrainingProgress({Key? key}) : super(key: key);

  @override
  State<TrainingProgress> createState() => _TrainingProgressState();
}

class _TrainingProgressState extends State<TrainingProgress> {
  // num value = 1;
  @override
  Widget build(BuildContext context) {
    final value = BlocProvider.of<SliderCubit>(context).state as SliderValue;

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Ile zrobisz pompek?'),
        Slider(
          value: value.value as double,
          min: 0,
          max: 100,
          divisions: 20,
          label: value.value.toDouble().round().toString(),
          onChanged: (value) => setState(
            () => context.read<SliderCubit>().setValue(value),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => TimerBloc(ticker: const Ticker()),
                  child: TrainingSpec(value: value.value as double),
                ),
              ),
            );
          },
          color: Colors.purple,
          child: const Text(
            'Trzecia strona',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
