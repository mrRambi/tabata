part of 'training_cubit.dart';

abstract class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

class TrainingInitialState extends TrainingState {}

class TrainingRunPauseState extends TrainingState {}

class TrainingRunInProgressState extends TrainingState {}

class TrainingRunCompleteState extends TrainingState {}

class TrainingRestState extends TrainingState {}
