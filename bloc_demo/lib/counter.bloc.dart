import 'dart:async';
import 'dart:developer';
import 'counter.event.dart';

class CounterBloc {
  int _counter = 0;
  
  // state: expose only the stream, which is an output
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  // event: expose only the sink which is an input
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}