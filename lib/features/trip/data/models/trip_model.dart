import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_fun/features/trip/domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel({
    required this.title,
    required this.date,
    required this.description,
    required this.location,
    required this.photos,
  });

  factory TripModel.fromEntity(Trip trip) => TripModel(
        title: trip.title,
        date: trip.date,
        description: trip.description,
        location: trip.location,
        photos: trip.photos,
      );
  Trip toEntity() => Trip(
        date: date,
        title: title,
        location: location,
        photos: photos,
        description: description,
      );
}
