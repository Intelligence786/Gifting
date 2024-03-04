import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/eventModel/event_model.dart';
import 'models/personModel/person_model.dart';

class DataManager {
  static const String _personKeyPrefix = 'person_';
  static const String _eventKeyPrefix = 'event_';

  static Future<void> savePerson(Person person) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = _personKeyPrefix + person.name;
    await prefs.setString(key, json.encode(person.toJson()));
  }

  static Future<Person?> getPerson(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = _personKeyPrefix + name;
    final String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return Person.fromJson(json.decode(jsonString));
    }
    return null;
  }

  static Future<void> saveEvent(EventModel event) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = _eventKeyPrefix + event.name;
    await prefs.setString(key, json.encode(event.toJson()));
  }

  static Future<EventModel?> getEvent(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = _eventKeyPrefix + name;
    final String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return EventModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  static Future<List<Person>> getAllPersons() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> keys = prefs.getKeys().where((key) => key.startsWith(_personKeyPrefix)).toList();
    final List<Person> persons = [];
    for (String key in keys) {
      final String? jsonString = prefs.getString(key);
      if (jsonString != null) {
        persons.add(Person.fromJson(json.decode(jsonString)));
      }
    }
    return persons;
  }

  static Future<List<EventModel>> getAllEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> keys = prefs.getKeys().where((key) => key.startsWith(_eventKeyPrefix)).toList();
    final List<EventModel> events = [];
    for (String key in keys) {
      final String? jsonString = prefs.getString(key);
      if (jsonString != null) {
        events.add(EventModel.fromJson(json.decode(jsonString)));
      }
    }
    return events;
  }
}