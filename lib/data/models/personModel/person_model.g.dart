// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      name: json['name'] as String,
      whoIsForYou: json['whoIsForYou'] as String,
      age: json['age'] as int,
      photo: json['photo'] as String,
      events: (json['events'] as List<dynamic>)
          .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'whoIsForYou': instance.whoIsForYou,
      'age': instance.age,
      'photo': instance.photo,
      'events': instance.events,
    };
