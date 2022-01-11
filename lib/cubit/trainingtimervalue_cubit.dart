import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trainingtimervalue_state.dart';

class TrainingtimervalueCubit extends Cubit<TrainingtimervalueState> {
  TrainingtimervalueCubit() : super(TimerInitial());
}
