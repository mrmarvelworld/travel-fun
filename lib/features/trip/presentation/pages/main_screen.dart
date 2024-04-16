import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_fun/features/trip/presentation/pages/my_trip_screen.dart';
import 'package:travel_fun/features/trip/presentation/providers/trip_provider.dart';

class MainScreens extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrip();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi Marvel',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'Travelling Today 2',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          )),
      body: PageView(controller: _pageController, children: [
        MyTripScreen(),
        Text('1'),
        Text('1'),
        Text('1'),
      ]),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, pageIndex, child) {
          return BottomNavigationBar(
            currentIndex: pageIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'My trips'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Add trips'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
            ],
            onTap: (index) {},
          );
        },
      ),
    );
  }
}
