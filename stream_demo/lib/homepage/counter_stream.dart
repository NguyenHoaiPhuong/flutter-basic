import 'dart:async';

enum CounterEvent {
  Increment,
  Decrement
}

// CounterStream : singleton
class CounterStream {
  // singleton instance
  static final CounterStream _instance = CounterStream._();

  // named constructor
  CounterStream._() {
    counter = 0;

    counterEventController = StreamController<CounterEvent>();    
    counterController = StreamController<int>();

    counterEventController.stream.listen((event) {
      switch (event) {
        case CounterEvent.Increment:
          counter++;
          counterController.add(counter);
          break;
        case CounterEvent.Decrement:
          counter--;
          counterController.add(counter);
          break;
        default:
          throw Exception("Unhandling event $event");
          break;
      }
    });
  }

  // Create instance: returns _instance
  factory CounterStream() {
    return _instance;
  }

  int counter;

  StreamController<CounterEvent> counterEventController;
  StreamController<int> counterController;

  void dispose() {    
    counterEventController.close();
    counterController.close();
  }

}