import 'package:aplikacja_treningowa/bloc/timer_bloc.dart';
import 'package:aplikacja_treningowa/cubit/training_cubit.dart';
import 'package:aplikacja_treningowa/timer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingSpec extends StatefulWidget {
  TrainingSpec({
    Key? key,
    required this.value,
  }) : super(key: key);
  final num value;

  @override
  State<TrainingSpec> createState() => _TrainingSpecState();
}

class _TrainingSpecState extends State<TrainingSpec>
    with TickerProviderStateMixin {
  num trainingOptimzation(num valueFromSlider) {
    return (valueFromSlider * 0.75).floor();
  }

  bool isRest = false;
  @override
  Widget build(BuildContext context) {
    num countedTrainingValue = trainingOptimzation(widget.value);
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<TrainingCubit, TrainingState>(
            builder: (context, state) {
              if (state is TrainingInitialState) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        Expanded(child: Text('ZaRAZ zacznie sie trening xd')),
                        Expanded(child: TimerText()),
                      ],
                    ),
                  ),
                );
              }
              if (state is TrainingRunInProgressState) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        Expanded(child: Text('Mahej tym gownem jebanym')),
                        Expanded(child: TimerText()),
                      ],
                    ),
                  ),
                );
              }
              if (state is TrainingRunPauseState) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        Expanded(child: Text('ZMENCZONY?!:!XDXD')),
                        Expanded(child: TimerText()),
                      ],
                    ),
                  ),
                );
              }
              if (state is TrainingRunCompleteState) {
                setState(() {
                  context.read<TimerBloc>().add(TimerRest(duration: 20));
                });
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        Expanded(child: Text('KONIEC KONCA')),
                        Expanded(child: TimerText()),
                      ],
                    ),
                  ),
                );
              }
              if (state is TrainingRestState) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Column(
                      children: [
                        Expanded(child: Text('ODPOCZNIJ BO BEDZIE WPIERDAL')),
                        Expanded(child: TimerText()),
                      ],
                    ),
                  ),
                );
              }

              return SizedBox();
            },
          ),
          Expanded(child: Center()),
          Text('$countedTrainingValue'),
          BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
            if (state is TimerInitial) {
              return Row(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          context
                              .read<TrainingCubit>()
                              .startTrainingRunInProgressState();
                          context
                              .read<TimerBloc>()
                              .add(TimerStarted(duration: 20));
                        });
                      }),
                ],
              );
            }
            if (state is TimerRunInProgress) {
              return Row(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.pause),
                      onPressed: () {
                        setState(() {
                          context.read<TrainingCubit>().pauseTraining();
                          context.read<TimerBloc>().add(const TimerPaused());
                        });
                      }),
                  FloatingActionButton(
                      child: const Icon(Icons.replay),
                      onPressed: () {
                        setState(() {
                          context.read<TrainingCubit>().startTrainingCubit();
                          context.read<TimerBloc>().add(const TimerReset());
                        });
                      }),
                ],
              );
            }
            return SizedBox();
          }),
          BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
            if (state is TimerRunPause) {
              return Row(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          context
                              .read<TrainingCubit>()
                              .startTrainingRunInProgressState();
                          context.read<TimerBloc>().add(const TimerResumed());
                        });
                      }),
                  FloatingActionButton(
                      child: const Icon(Icons.replay),
                      onPressed: () {
                        setState(() {
                          context.read<TrainingCubit>().startTrainingCubit();
                          context.read<TimerBloc>().add(const TimerReset());
                        });
                      }),
                ],
              );
            }
            return SizedBox();
          }),
          BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
            if (state is TimerRunComplete) {
              return Row(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.replay),
                      onPressed: () {
                        setState(() {
                          context.read<TrainingCubit>().startTrainingCubit();
                          context.read<TimerBloc>().add(const TimerReset());
                        });
                      }),
                ],
              );
            }
            return SizedBox();
          }),
        ],
      ),
    );
  }
}
