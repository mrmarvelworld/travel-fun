import 'package:dartz/dartz.dart';
import 'package:travel_fun/core/error/failure.dart';
import 'package:travel_fun/features/trip/domain/entities/trip.dart';

abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}
