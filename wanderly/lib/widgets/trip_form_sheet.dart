import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripFormSheet extends StatefulWidget {
  final Trip? initialTrip;
  final void Function(Trip trip) onSubmit;

  const TripFormSheet({super.key, this.initialTrip, required this.onSubmit});

  @override
  State<TripFormSheet> createState() => _TripFormSheetState();
}

class _TripFormSheetState extends State<TripFormSheet> {
  late TextEditingController titleController;
  late TextEditingController locationController;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.initialTrip?.title ?? '',
    );
    locationController = TextEditingController(
      text: widget.initialTrip?.location ?? '',
    );
    dateController = TextEditingController(
      text: widget.initialTrip?.date ?? '',
    );
  }

  void submit() {
    if (titleController.text.isEmpty ||
        locationController.text.isEmpty ||
        dateController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('All fields are required')));
      return;
    }

    widget.onSubmit(
      Trip(
        title: titleController.text,
        location: locationController.text,
        date: dateController.text,
      ),
    );

    Navigator.pop(context);
  }

  InputDecoration inputDecoration({required String label, IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon) : null,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        24,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Text(
              widget.initialTrip == null ? 'Add New Trip' : 'Edit Trip',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: inputDecoration(
                label: 'Trip Name',
                icon: Icons.title,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: locationController,
              decoration: inputDecoration(
                label: 'Destination',
                icon: Icons.place,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: dateController,
              decoration: inputDecoration(
                label: 'Date',
                icon: Icons.calendar_today,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  widget.initialTrip == null ? 'Add Trip' : 'Update Trip',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
