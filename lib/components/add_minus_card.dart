import 'package:flutter/material.dart';

class addMinusCard extends StatelessWidget {
  final IconData icn;
  final Function() updateAge;
  const addMinusCard({required this.icn, required this.updateAge});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: updateAge,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Icon(icn, color: Colors.green),
      ),
    );
  }
}
