import 'package:dartz/dartz.dart';
import 'package:travel_fun/core/error/failure.dart';
import 'package:travel_fun/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_fun/features/trip/data/models/trip_model.dart';
import 'package:travel_fun/features/trip/domain/entities/trip.dart';
import 'package:travel_fun/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);
  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = localDataSource.getTrips();
      List<Trip> response =
          tripModels.map((model) => model.toEntity()).toList();
      return Right(response);
    } catch (error) {
      return Left(ShowSpecificError(error.toString()));
    }
  }

  @override
  Future<void> deleteTrip(int index) async {
    throw UnimplementedError();
  }
}
