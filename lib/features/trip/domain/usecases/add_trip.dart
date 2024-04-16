import 'package:travel_fun/features/trip/domain/entities/trip.dart';
import 'package:travel_fun/features/trip/domain/repositories/trip_repository.dart';

class AddTrip {
  final TripRepository repository;
  AddTrip(this.repository);

  Future<void> call(Trip trip) {
    return repository.addTrip(trip);
  }
}
