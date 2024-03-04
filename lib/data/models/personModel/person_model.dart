import 'dart:io';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

import '../eventModel/event_model.dart';

part 'person_model.g.dart';

@JsonSerializable()
class Person {
  String name;
  String whoIsForYou;
  int age;
  String photo;
  List<EventModel> events;

  Person(
      {required this.name,
      required this.whoIsForYou,
      required this.age,
      required this.photo,
      required this.events});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
