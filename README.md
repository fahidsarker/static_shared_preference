# Solid Shared Preference For Flutter (A statically typed wrapper around the [shared_preference](http://https://pub.dev/packages/shared_preferences "shared_preference") package)

## Description

With Solid Shared Preference, you can declare your preference once in a top level file and forget about its key and type. It remembers its type and key. So, your change of making mistake is zero. It even understands the difference between nullable and non-nullable types. By default, the value of Preference is non-nullable.

We recommand a single global constant for a single preference but it is also okay to create a local preference.

## Usage

- Add the followinf line to your pubspec.yaml

```yaml
solid_shared_pref: ^1.0.0
```

- import the package in your `main.dart` file

```dart
import 'package:solid_shared_pref/solid_shared_pref.dart';
```

- Make your main function async and call the followinf two functions before runApp:

```dart
  WidgetsFlutterBinding.ensureInitialized();
  await initSolidSharedPreferences();
```

Full main function can be this:

```dart
void main() async{
  /// we initialize the solid shared preference here
  WidgetsFlutterBinding.ensureInitialized();
  await initSolidSharedPreferences();
  runApp(const MyApp());
}
```

- Create a preference variable/constant (We recommand creating a constant whenever possible). As the preference object only contains the key and default values, creating constant wont affect preference values (It will improve performance).
- Cretae a file to store all the top level constants/variables. So you can access them across the app.
- Creating a preference that holds an integer value:

```dart
const counterPreference = IntPreference('my_counter', 0);
// IntPreference(key, defaultValue);
```

- Reading its value:

```dart
final counter = counterPreference.value;
```

- Updating its value:

```dart
counterPreference.value++;
```

- Setting the value to `null` will give us a compile time error since the preference is not nullable. To use a nullablePreference use a NullableIntPreference object;

```dart
 counterPreference.value = null; /// compile time error
 const nullableCounter = NullableIntPreference('my_nullable_counter', 0);
 nullableCounter = null;  /// okay
```

- Removing a value:

```dart
counterPreference.remove();
```

- Creating a shared Preference of a Custom object:

```dart
final jokeMetadata = CustomPreference<JokeMetadata>(
    'joke_metadata', JokeMetadata.defaultValue(),
    fromJson: (json) => JokeMetadata.fromJson(json),
    toJson: (metadata) => metadata.toJson);
	// CustomPreference(key, defaultValue , {fromJson, toJson});
```

- fromJson: A function that takes a Map<String, dynamic>and returns the Object
- toJson: A function that takes an object adn returns a Map<String, dyamic>?

You can now enjoy all the functions of a premetice pregerence for your own custom class.
