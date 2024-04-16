import 'package:hive/hive.dart';
import 'package:travel_fun/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_fun/features/trip/data/models/trip_model.dart';
import 'package:travel_fun/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:travel_fun/features/trip/domain/entities/trip.dart';
import 'package:travel_fun/features/trip/domain/repositories/trip_repository.dart';
import 'package:travel_fun/features/trip/domain/usecases/add_trip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_fun/features/trip/domain/usecases/delete_trip.dart';
import 'package:travel_fun/features/trip/domain/usecases/get_trips.dart';

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final getTripProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});
final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripProvider);
  final addTrip = ref.read(addTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);
  addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }

  loadTrip() async {
    final tripsOrFailure = await _getTrips();
    tripsOrFailure.fold((error) => state = [], (trips) => state = trips);
  }
}
