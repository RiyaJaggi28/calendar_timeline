import 'package:flutter/material.dart';

/// Creates a Widget to represent the months.
class MonthItem extends StatelessWidget {
  final String name;
  final Function onTap;
  final bool isSelected;
  final Color? color;
  final String? year;
  final TextStyle monthNameTextStyle;

  MonthItem({
    required this.name,
    required this.onTap,
    this.isSelected = false,
    this.color,
    this.year,
    required this.monthNameTextStyle
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Text(
        this.name + " $year",
        style: isSelected ? monthNameTextStyle.copyWith( color: color ?? Colors.black87) : monthNameTextStyle.copyWith(color: Colors.black38)
      ),
    );
  }
}