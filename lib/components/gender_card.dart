import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String gender;
  final bool isSelected;

  const GenderCard({
    super.key,
    required this.icon,
    required this.gender,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.green : Colors.grey,
          size: 70,
        ),
        Text(
          gender,
          style: GoogleFonts.anton(
            color: isSelected ? Colors.green : Colors.grey,
          ),
        )
      ],
    );
  }
}
