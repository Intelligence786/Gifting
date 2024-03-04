import 'package:json_annotation/json_annotation.dart';

import '../personModel/person_model.dart';
import 'gift_model/gift_model.dart';

part 'event_model.g.dart';
@JsonSerializable()
class EventModel {
  String name;
  String date;
  bool willThereBeCelebration;
  List<Gift> gifts;
  Person person;

  EventModel({required this.name, required this.date, required this.willThereBeCelebration, required this.gifts, required this.person});

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}