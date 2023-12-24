import 'package:bloc_counter_app/bloc/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInit()) {
    on<CounterIncrease>((event, emit) {
      counter = counter + 1;
      emit(CounterUpdate(counter: counter));
    });

    on<CounterDecrease>((event, emit) {
      counter = counter - 1;
      emit(CounterUpdate(counter: counter));
    });
  }
}
