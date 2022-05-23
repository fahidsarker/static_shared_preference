part of static_shared_preference;


SharedPreferences? __preferences;

Future<void> initStaticPreferences() async {
  __preferences = await SharedPreferences.getInstance();
}

SharedPreferences get _preferences {
  if (__preferences == null) {
    throw Exception(
        'SharedPreferences is not initialized. Call `await initSharedPreferences()` first before using this class');
  }

  return __preferences!;
}



