import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_demo/blocs/counter/counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncrement) {
      yield state + 1;
    } else if (event is CounterDecrement) {
      yield state - 1;
    }
    else {
      throw Exception('Unhandling event: $event');
    }
  }
}