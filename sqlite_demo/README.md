# Persist data with SQLite

If writing an app that needs to persist and query larger amounts of data on the local device, consider using a database instead of a local file or key-value store. In general, databases provide faster inserts, updates, and queries, compared to other local persistence solutions.

Flutter apps can make use of the SQLite databases via the sqflite plugin available on pub. This recipe demonstrates the basics of using sqflite to insert, read, update, and remove data about various Dogs.

This recipe uses the following steps:

* Add the dependencies.
* Define the Dog data model.
* Open the database.
* Create the dogs table.
* Insert a Dog into the database.
* Retrieve the list of dogs.
* Update a Dog in the database
* Delete a Dog from the database.

## 1. Add the dependencies

```
dependencies:
  flutter:
    sdk: flutter
  sqflite:
  path:
```

```
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
```

## 2. Define the Dog data model

```
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});
}
```

## 3. Open the database

Before reading and writing data to the database, open a connection to the database. This involves two steps:

1. Define the path to the database file using `getDatabasesPath()` from the sqflite package, combined with the path function from the path package.
2. Open the database with the `openDatabase()` function from sqflite.

```
// Open the database and store the reference.
final Future<Database> database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  join(await getDatabasesPath(), 'doggie_database.db'),
);
```

## 4. Create the dogs table

Next, create a table to store information about various Dogs. For this example, create a table called dogs that defines the data that can be stored. Each Dog contains an id, name, and age. Therefore, these are represented as three columns in the dogs table.

```
final Future<Database> database = openDatabase(
  // Set the path to the database.
  join(await getDatabasesPath(), 'doggie_database.db'),
  // When the database is first created, create a table to store dogs.
  onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
    );
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 1,
);
```

## 5. Insert a Dog into the database

Now that you have a database with a table suitable for storing information about various dogs, it’s time to read and write data.

First, insert a Dog into the dogs table. This involves two steps:

1. Convert the Dog into a Map
2. Use the `insert()` method to store the Map in the dogs table.

```
// Update the Dog class to include a `toMap` method.
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}

// Define a function that inserts dogs into the database
Future<void> insertDog(Dog dog) async {
  // Get a reference to the database.
  final Database db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// Create a Dog and add it to the dogs table.
final fido = Dog(
  id: 0,
  name: 'Fido',
  age: 35,
);

await insertDog(fido);
```

## 6. Retrieve the list of Dogs

Now that a Dog is stored in the database, query the database for a specific dog or a list of all dogs. This involves two steps:

1. Run a query against the dogs table. This returns a List<Map>.
2. Convert the List<Map> into a List<Dog>.

```
// A method that retrieves all the dogs from the dogs table.
Future<List<Dog>> dogs() async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dogs');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}

// Now, use the method above to retrieve all the dogs.
print(await dogs()); // Prints a list that include Fido.
```

## 7. Update a Dog in the database

After inserting information into the database, you might want to update that information at a later time. You can do this by using the `update()` method from the sqflite library.

This involves two steps:
1. Convert the Dog into a Map.
2. Use a `where` clause to ensure you update the correct Dog.

```
Future<void> updateDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toMap(),
    // Ensure that the Dog has a matching id.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}

// Update Fido's age.
await updateDog(Dog(
  id: 0,
  name: 'Fido',
  age: 42,
));

// Print the updated results.
print(await dogs()); // Prints Fido with age 42.
```
## 8. Delete a Dog from the database

In addition to inserting and updating information about Dogs, you can also remove dogs from the database. To delete data, use the delete() method from the sqflite library.

In this section, create a function that takes an id and deletes the dog with a matching id from the database. To make this work, you must provide a `where` clause to limit the records being deleted.

```
Future<void> deleteDog(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the Database.
  await db.delete(
    'dogs',
    // Use a `where` clause to delete a specific dog.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
```

## References

- https://flutter.dev/docs/cookbook/persistence/sqlite
- https://www.sqlitetutorial.net/
- https://www.sqlite.org/datatype3.html
