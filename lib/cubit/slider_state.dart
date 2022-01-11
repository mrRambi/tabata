part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderValue extends SliderState {
  final num value;
  SliderValue(this.value);
}
