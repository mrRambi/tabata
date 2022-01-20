import 'package:aplikacja_treningowa/bloc/timer_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'training_state.dart';

class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit() : super(TrainingInitialState());

  void startTrainingCubit() {
    emit(TrainingInitialState());
    // timerBloc.add(TimerStarted(duration: 3));
  }

  void pauseTraining() {
    emit(TrainingRunPauseState());
    //timerBloc.add(TimerPaused());
  }

  void startTrainingRunInProgressState() {
    emit(TrainingRunInProgressState());
    timerBloc.add(TimerTicked(duration: 20));
    //timerBloc.add(TimerResumed());
  }

  void startTrainingRunCompleteState() {
    emit(TrainingRunCompleteState());
    timerBloc.add(TimerRest(duration: 20));
    //tu trzeba zrobic jakas funkcje zeby rozroznialo ze jesli nie runinprogressstate to trainingruncomplete
  }

  void startTrainingRestState() {
    emit(TrainingRestState());
    // timerBloc.add(TimerRest(duration: 20));
  }
}
