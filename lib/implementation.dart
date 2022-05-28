part of solid_shared_pref;

class IntPreference extends _IntegerPreference<int> {
  const IntPreference(String key, int defaultValue) : super(key, defaultValue);

  static NullableIntPreference nullable(String key, int? defaultValue) =>
      NullableIntPreference(key, defaultValue);
}

class NullableIntPreference extends _IntegerPreference<int?> {
  const NullableIntPreference(String key, [int? defaultValue])
      : super(key, defaultValue);
}

class BoolPreference extends _BooleanPreference<bool> {
  const BoolPreference(String key, bool defaultValue)
      : super(key, defaultValue);

  static NullableBoolPreference nullable(String key, bool? defaultValue) =>
      NullableBoolPreference(key, defaultValue);
}

class NullableBoolPreference extends _BooleanPreference<bool?> {
  const NullableBoolPreference(String key, [bool? defaultValue])
      : super(key, defaultValue);
}

class DoublePreference extends _DoublePreference<double> {
  const DoublePreference(String key, double defaultValue)
      : super(key, defaultValue);

  static NullableDoublePreference nullable(String key, double? defaultValue) =>
      NullableDoublePreference(key, defaultValue);
}

class NullableDoublePreference extends _DoublePreference<double?> {
  const NullableDoublePreference(String key, [double? defaultValue])
      : super(key, defaultValue);
}

class StringPreference extends _StringPreference<String> {
  const StringPreference(String key, String defaultValue)
      : super(key, defaultValue);

  static NullableStringPreference nullable(String key, String? defaultValue) =>
      NullableStringPreference(key, defaultValue);
}

class NullableStringPreference extends _StringPreference<String?> {
  const NullableStringPreference(String key, [String? defaultValue])
      : super(key, defaultValue);
}

class StringListPreference extends _StringListPreferences<List<String>> {
  const StringListPreference(String key, List<String> defaultValue)
      : super(key, defaultValue);

  static NullableStringListPreference nullable(
      String key, List<String>? defaultValue) =>
      NullableStringListPreference(key, defaultValue);
}

class NullableStringListPreference
    extends _StringListPreferences<List<String>?> {
  const NullableStringListPreference(String key, [List<String>? defaultValue])
      : super(key, defaultValue);
}

class CustomPreference<T extends Object?> extends SolidPreference<T> {
  final T? Function(Map<String, dynamic>) _fromJson;
  final Map<String, dynamic>? Function(T) _toJson;

  const CustomPreference(String key, T defaultValue,
      {required T? Function(Map<String, dynamic>) fromJson,
        required Map<String, dynamic>? Function(T) toJson})
      : _fromJson = fromJson,
        _toJson = toJson,
        super._(key, defaultValue);

  @override
  T? get _rawValue  {
    final strVal = _preferences.getString(key);
    if (strVal == null) {
      return null;
    }
    return _fromJson(json.decode(strVal));
  }

  @override
  set value(T value) => _preferences.setString(key, jsonEncode(_toJson(value)));
}

class DateTimePreference extends SolidPreference<DateTime>{
  const DateTimePreference(String key, DateTime defaultValue) : super._(key, defaultValue);

  @override
  DateTime? get _rawValue {
    final strVal = _preferences.getString(key);
    if (strVal == null) {
      return null;
    }
    return DateTime.parse(strVal);
  }

  @override
  set value(DateTime value) {
    _preferences.setString(key, value.toIso8601String());
  }


}