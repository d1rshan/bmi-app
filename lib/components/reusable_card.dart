import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final bool selectionHighlight;

  ReusableCard({
    required this.cardChild,
    this.selectionHighlight = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: selectionHighlight ? Colors.black : Colors.grey,
          width: selectionHighlight ? 3 : 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
