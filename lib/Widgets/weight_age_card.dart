import 'package:body_weight_app/core/colors.dart';
import 'package:flutter/material.dart';

class weightAgeCard extends StatelessWidget {
  const weightAgeCard({super.key, required this.title, required this.value, required this.onAdd, required this.onRemove});

  final String title;
  final int value;
  final Function() onAdd;
  final Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Appcolor.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Appcolor.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                color: Appcolor.whiteColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Appcolor.grayColor,
                    foregroundColor: Appcolor.whiteColor,
                    shape: CircleBorder(),
                  ),
                  onPressed: onRemove,
                  icon: Icon(Icons.remove, color: Appcolor.whiteColor),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Appcolor.grayColor,
                    foregroundColor: Appcolor.whiteColor,
                    shape: CircleBorder(),
                  ),
                  onPressed: onAdd,
                  icon: Icon(Icons.add, color: Appcolor.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
