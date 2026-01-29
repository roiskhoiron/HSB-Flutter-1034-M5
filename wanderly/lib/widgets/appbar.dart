import 'package:flutter/material.dart';

class WanderlyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WanderlyAppBar({super.key});

  static const primaryColor = Color(0xFF13B6EC);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      titleSpacing: 16,

      shape: Border(
        bottom: BorderSide(color: Colors.grey.shade300, width: 0.6),
      ),

      /// LEFT: Logo + Brand
      title: Row(
        children: [
          Image.asset('assets/images/wanderly.png', height: 28),
          const SizedBox(width: 8),
          const Text(
            'Wanderly',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ],
      ),

      /// RIGHT: Actions
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.grey.shade700,
          onPressed: () {
            // TODO: search action
          },
        ),
        IconButton(
          icon: const Icon(Icons.person_outline),
          color: Colors.grey.shade700,
          onPressed: () {
            // TODO: profile action
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
