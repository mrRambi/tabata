part of 'trainingtimervalue_cubit.dart';

abstract class TrainingtimervalueState{

  const TrainingtimervalueState();

  @override
  List<Object> get props => [];
}

class TimerInitial extends TrainingtimervalueState {
  const TimerInitial();

}

class TimerRunPause extends TrainingtimervalueState {
  const TimerRunPause();

}

class TimerRunInProgress extends TrainingtimervalueState {
  const TimerRunInProgress();

}

class TimerRunComplete extends TrainingtimervalueState {
  const TimerRunComplete();
}
