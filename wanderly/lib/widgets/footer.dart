import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const textMuted = Color(0xFF4C869A);
    const textDark = Color(0xFF0D181B);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 0.6),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Brand
          Text(
            'Wanderly',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textDark,
            ),
          ),

          const SizedBox(height: 8),

          /// Address
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 14, color: textMuted),
              SizedBox(width: 6),
              Text(
                '123 Travel Lane',
                style: TextStyle(fontSize: 13, color: textMuted),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// Phone
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone, size: 14, color: textMuted),
              SizedBox(width: 6),
              Text(
                '+1 555-WANDER',
                style: TextStyle(fontSize: 13, color: textMuted),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Divider
          Divider(thickness: 0.5, color: Colors.grey.shade300),

          const SizedBox(height: 8),

          /// Creator
          Text(
            'Created with ❤️ by Wanderly Team',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
