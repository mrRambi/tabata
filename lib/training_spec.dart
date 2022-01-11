import 'dart:async';
import 'package:aplikacja_treningowa/cubit/trainingtimervalue_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'training_progress.dart';

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
  late AnimationController controller;

  num get countText {
    Duration count = controller.duration! * controller.value;
    print(count.inSeconds);
    print(count);
    return count.inSeconds;
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  num trainingOptimzation(num valueFromSlider) {
    return (valueFromSlider * 0.75).floor();
  }

  bool isTimePlaying = true;

  @override
  Widget build(BuildContext context) {
    num countedTrainingValue = trainingOptimzation(widget.value);
    return Scaffold(
      body: BlocBuilder<TrainingtimervalueCubit, TrainingtimervalueState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                  child: Center(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => Text(
                    countText == 0 ? '60' : '$countText',
                  ),
                ),
              )),
              Text('$countedTrainingValue'),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.reset();
                          if (isTimePlaying) {
                            isTimePlaying = isTimePlaying;
                            setState(() {});
                          } else {
                            isTimePlaying = !isTimePlaying;
                            setState(() {});
                          }
                        },
                        child: Icon(Icons.refresh, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: Colors.blue,
                          onPrimary: Colors.red,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.isAnimating) {
                            controller.stop();
                            isTimePlaying = !isTimePlaying;
                            setState(() {});
                          } else {
                            isTimePlaying = !isTimePlaying;
                            controller.reverse(
                                from: controller.value == 0
                                    ? 1.0
                                    : controller.value);
                            setState(() {});
                          }
                        },
                        child: isTimePlaying
                            ? Icon(Icons.play_arrow, color: Colors.white)
                            : Icon(Icons.pause, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: Colors.blue,
                          onPrimary: Colors.red,
                        ),
                      )
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
