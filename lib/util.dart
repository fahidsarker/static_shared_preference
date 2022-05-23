part of solid_shared_pref;


SharedPreferences? __preferences;

Future<void> initSolidSharedPreferences() async {
  __preferences = await SharedPreferences.getInstance();
}

SharedPreferences get _preferences {
  if (__preferences == null) {
    throw Exception(
        'SharedPreferences is not initialized. Call `await initSolidSharedPreferences()` first before using this class');
  }

  return __preferences!;
}



