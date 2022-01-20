import 'package:aplikacja_treningowa/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    print(
      '$minutesStr:$secondsStr',
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$minutesStr:$secondsStr',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ],
    );
  }
}
