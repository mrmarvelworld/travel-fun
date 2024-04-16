import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_fun/features/trip/domain/entities/trip.dart';
import 'package:travel_fun/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: 'Title');
  final _locationController = TextEditingController(text: 'location');
  final _descController = TextEditingController(text: 'Description');
  final _pictureController = TextEditingController(text: 'Pictures');
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(children: <Widget>[
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(labelText: 'title'),
        ),
        TextFormField(
          controller: _locationController,
          decoration: InputDecoration(labelText: 'location'),
        ),
        TextFormField(
          controller: _descController,
          decoration: InputDecoration(labelText: 'description'),
        ),
        TextFormField(
          controller: _pictureController,
          decoration: InputDecoration(
            labelText: 'title',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            pictures.add(_pictureController.text);
            if (_formKey.currentState!.validate()) {
              final newTrip = Trip(
                title: _titleController.text,
                description: _descController.text,
                date: DateTime.now(),
                location: _locationController.text,
                photos: pictures,
              );
              ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
              ref.watch(tripListNotifierProvider.notifier).loadTrip();
            }
          },
          child: Text('Add Trip'),
        )
      ]),
      key: _formKey,
    );
  }
}
