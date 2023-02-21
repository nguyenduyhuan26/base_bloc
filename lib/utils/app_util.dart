import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtil {
  static void showLog(String text) {
    debugPrint("====> $text");
  }

  static Future<String> getString(String key) async {
    String result = "";
    var storage = await SharedPreferences.getInstance();
    if (storage.containsKey(key) && storage.getString(key) != null) {
      result = storage.getString(key)!;
    }
    return result;
  }

  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static void showLogFull(String text) {
    log(text);
  }
}
