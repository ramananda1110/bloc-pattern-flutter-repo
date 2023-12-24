import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();

}

class CounterInit extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterUpdate extends CounterState {
  final int counter;

  CounterUpdate({required this.counter});

  @override
  List<Object?> get props => [counter];
}
