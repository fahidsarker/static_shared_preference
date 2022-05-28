import 'package:example/counter.dart';
import 'package:solid_shared_pref/solid_shared_pref.dart';

final counterPreference = CustomPreference(
    'my_counter', Counter('my counter', 0),
    fromJson: (map) => Counter(map['type'], map['value']),
    toJson: (counter) =>  {'type': counter.type, 'value': counter.value});
