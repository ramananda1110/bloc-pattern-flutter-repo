import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterIncrease extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class CounterDecrease extends CounterEvent {
  @override
  List<Object?> get props => [];
}
