import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ListButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'List Of Orders',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.green[700],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
