# Fetch data from the internet

Fetching data from the internet is necessary for most apps. Luckily, Dart and Flutter provide tools, such as the `http` package, for this type of work.

This recipe uses the following steps:

1. Add the http package.
2. Make a network request using the http package.
3. Convert the response into a custom Dart object.
4. Fetch and display the data with Flutter.

## 1. Add the http package

To install the http package, add it to the dependencies section of the `pubspec.yaml` file. You can find the latest version of the http package the pub.dev.

```
dependencies:
  http: <latest_version>
```

Import the http package.

```
import 'package:http/http.dart' as http;
```

## 2. Make a network request

This recipe covers how to fetch a sample album from the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) using the `http.get()` method.

```
Future<http.Response> fetchAlbum() {
  return http.get('https://jsonplaceholder.typicode.com/albums/1');
}
```

The http.get() method returns a Future that contains a Response.


* Future is a core Dart class for working with async operations. A Future object represents a potential value or error that will be available at some time in the future.
* The http.Response class contains the data received from a successful http call.

## 3. Convert the response into a custom Dart object

While it’s easy to make a network request, working with a raw Future<http.Response> isn’t very convenient. To make your life easier, convert the http.Response into a Dart object.

### Create an Album class

```
class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
```

### Convert the http.Response to an Album

```
Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
```

## 4. Fetch the data

Call the fetch() method in either the initState() or didChangeDependencies() methods.

The initState() method is called exactly once and then never again. If you want to have the option of reloading the API in response to an InheritedWidget changing, put the call into the didChangeDependencies() method. See [State](https://api.flutter.dev/flutter/widgets/State-class.html) for more details.

```
class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
```

## 5. Display the data

To display the data on screen, use the FutureBuilder widget. The FutureBuilder widget comes with Flutter and makes it easy to work with asynchronous data sources.

You must provide two parameters:

1. The Future you want to work with. In this case, the future returned from the fetchAlbum() function.
2. A builder function that tells Flutter what to render, depending on the state of the Future: loading, success, or error.

Note that snapshot.hasData only returns true when the snapshot contains a non-null data value. This is why the fetchAlbum function should throw an exception even in the case of a “404 Not Found” server response. If fetchAlbum returns null then the spinner displays indefinitely.

```
FutureBuilder<Album>(
  future: futureAlbum,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data.title);
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }

    // By default, show a loading spinner.
    return CircularProgressIndicator();
  },
);
```

## Why is fetchAlbum() called in initState()?

Although it’s convenient, it’s not recommended to put an API call in a build() method.

Flutter calls the build() method every time it needs to change anything in the view, and this happens surprisingly often. Leaving the fetch call in your build() method floods the API with unnecessary calls and slows down your app.

## Testing

For information on how to test this functionality, see the following recipes:

* [Introduction to unit testing](https://flutter.dev/docs/cookbook/testing/unit/introduction)
* [Mock dependencies using Mockito](https://flutter.dev/docs/cookbook/testing/unit/mocking)

## References

* https://flutter.dev/docs/cookbook/networking/fetch-data
* https://www.melvinvivas.com/flutter-listview-example-using-data-from-a-rest-api/
