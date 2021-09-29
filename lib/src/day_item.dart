
import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool? isAfter;
  final TextStyle txtStyle;
  final TextStyle shortNametxtStyle;

  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.isAfter,
    required this.txtStyle,
    required this.shortNametxtStyle
  }) : super(key: key);

  final double height = 70.0;
  final double width = 60.0;

  _buildDay(BuildContext context) {
    final textStyle = txtStyle.copyWith(color:isAfter! ? Color(0xffAAAAAA) : Color(0xff212121) );

    final selectedStyle =  txtStyle.copyWith(color:activeDayColor ?? Colors.white,);

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        decoration: isSelected
          ? BoxDecoration(
          color:
          activeDayBackgroundColor ?? Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.0),
        )
          : BoxDecoration(color: Colors.transparent),
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            // if (isSelected) ...[
            //   SizedBox(height: 7),
            //   _buildDots(),
            //   SizedBox(height: 12),
            // ] else
              SizedBox(height: 5),
            // Text(
            //   dayNumber.toString(),
            //   style: isSelected ? selectedStyle : textStyle,
            // ),
            // if (isSelected)
              Text(
                shortName.substring(0,1),
                style: shortNametxtStyle.copyWith(color: isSelected ? dayNameColor ?? activeDayColor ?? Colors.white : Color(0xffBCC1CD),)
              ),
            SizedBox(height: 15,),
            Text(
              dayNumber.toString(),
              style: isSelected ? selectedStyle : textStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    final dot = Container(
      height: 5,
      width: 5,
      decoration: new BoxDecoration(
        color: this.dotsColor ?? this.activeDayColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [dot, dot],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}