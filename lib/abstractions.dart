part of solid_shared_pref;

abstract class SolidPreference<T extends Object?> {
  final String key;
  final T defaultValue;

  const SolidPreference._(this.key, this.defaultValue);

  Object? get _rawValue;

  set value(T value);

  T get value {
    final val = _rawValue;
    if (val == null) {
      return defaultValue;
    }
    return val as T;
  }

  void remove(){
    _preferences.remove(key);
  }

  bool exists(){
    return _preferences.containsKey(key);
  }
}

abstract class _IntegerPreference<T extends int?> extends SolidPreference<T> {
  const _IntegerPreference(String key, T defaultValue)
      : super._(key, defaultValue);

  @override
  int? get _rawValue => _preferences.getInt(key);

  @override
  set value(T value) => _preferences.setInt(key, value!);
}

abstract class _BooleanPreference<T extends bool?> extends SolidPreference<T> {
  const _BooleanPreference(String key, T defaultValue)
      : super._(key, defaultValue);

  @override
  bool? get _rawValue => _preferences.getBool(key);

  @override
  set value(T value) => _preferences.setBool(key, value!);
}

abstract class _DoublePreference<T extends double?>
    extends SolidPreference<T> {
  const _DoublePreference(String key, T defaultValue)
      : super._(key, defaultValue);

  @override
  double? get _rawValue => _preferences.getDouble(key);

  @override
  set value(T value) => _preferences.setDouble(key, value!);
}

abstract class _StringPreference<T extends String?>
    extends SolidPreference<T> {
  const _StringPreference(String key, T defaultValue)
      : super._(key, defaultValue);

  @override
  String? get _rawValue => _preferences.getString(key);

  @override
  set value(T value) => _preferences.setString(key, value!);
}

abstract class _StringListPreferences<T extends List<String>?>
    extends SolidPreference<T> {
  const _StringListPreferences(String key, T defaultValue)
      : super._(key, defaultValue);

  @override
  List<String>? get _rawValue => _preferences.getStringList(key);

  @override
  set value(T value) => _preferences.setStringList(key, value!);
}