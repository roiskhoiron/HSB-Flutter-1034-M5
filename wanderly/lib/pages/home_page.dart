import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_card.dart';
import '../widgets/trip_form_sheet.dart';
import '../widgets/footer.dart';
import '../widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Trip> trips = [];

  void showForm({Trip? trip, int? index}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => TripFormSheet(
        initialTrip: trip,
        onSubmit: (newTrip) {
          setState(() {
            if (index == null) {
              trips.add(newTrip);
              showSnack('Trip added successfully');
            } else {
              trips[index] = newTrip;
              showSnack('Trip updated successfully');
            }
          });
        },
      ),
    );
  }

  void deleteTrip(int index) {
    setState(() => trips.removeAt(index));
    showSnack('Trip deleted');
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WanderlyAppBar(),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Upcoming Trips (${trips.length})',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          ...trips.asMap().entries.map(
            (entry) => TripCard(
              trip: entry.value,
              onEdit: () => showForm(trip: entry.value, index: entry.key),
              onDelete: () => deleteTrip(entry.key),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),

      bottomNavigationBar: const AppFooter(),

      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
