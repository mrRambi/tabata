import 'package:aplikacja_treningowa/bloc/timer_bloc.dart';
import 'package:aplikacja_treningowa/timer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingSpec extends StatefulWidget {
  const TrainingSpec({
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

  @override
  Widget build(BuildContext context) {
    num countedTrainingValue = trainingOptimzation(widget.value);
    return Scaffold(
      body: BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              const Expanded(child: Center()),
              Text('$countedTrainingValue'),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state is TimerInitial) ...[
                        FloatingActionButton(
                          child: const Icon(Icons.play_arrow),
                          onPressed: () => context
                              .read<TimerBloc>()
                              .add(TimerStarted(duration: state.duration)),
                        ),
                      ],
                      if (state is TimerRunInProgress) ...[
                        FloatingActionButton(
                          child: const Icon(Icons.pause),
                          onPressed: () => context
                              .read<TimerBloc>()
                              .add(const TimerPaused()),
                        ),
                        FloatingActionButton(
                          child: const Icon(Icons.replay),
                          onPressed: () =>
                              context.read<TimerBloc>().add(const TimerReset()),
                        ),
                      ],
                      if (state is TimerRunPause) ...[
                        FloatingActionButton(
                          child: const Icon(Icons.play_arrow),
                          onPressed: () => context
                              .read<TimerBloc>()
                              .add(const TimerResumed()),
                        ),
                        FloatingActionButton(
                          child: const Icon(Icons.replay),
                          onPressed: () =>
                              context.read<TimerBloc>().add(const TimerReset()),
                        ),
                      ],
                      if (state is TimerRunComplete) ...[
                        FloatingActionButton(
                          child: const Icon(Icons.replay),
                          onPressed: () =>
                              context.read<TimerBloc>().add(const TimerReset()),
                        ),
                      ]
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
