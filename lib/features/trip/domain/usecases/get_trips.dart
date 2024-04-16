import 'package:dartz/dartz.dart';
import 'package:travel_fun/core/error/failure.dart';
import 'package:travel_fun/features/trip/domain/entities/trip.dart';
import 'package:travel_fun/features/trip/domain/repositories/trip_repository.dart';

class GetTrips {
  final TripRepository repository;
  GetTrips(this.repository);

  Future<Either<Failure , List<Trip>>> call() {
    return repository.getTrips();
  }
}
