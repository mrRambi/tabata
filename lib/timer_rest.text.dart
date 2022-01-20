import 'package:aplikacja_treningowa/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerRestText extends StatelessWidget {
  const TimerRestText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 20).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 20).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
