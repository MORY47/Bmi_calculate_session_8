import 'package:body_weight_app/Widgets/gender_card.dart';
import 'package:body_weight_app/Widgets/main_button.dart';
import 'package:body_weight_app/Widgets/weight_age_card.dart';
import 'package:body_weight_app/core/colors.dart';
import 'package:body_weight_app/page/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int weight = 60;
  int age = 20;
  int height = 180;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.pgColor,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Appcolor.whiteColor),
        ),
        backgroundColor: Appcolor.pgColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          children: [
            // male and female
            maleandFemale(),

            // height
            heightUi(),

            // weight & age
            weightandAge(),

            // calculate button
            MainButton(
              onTop: () {
                // BMI calculation
                double result = weight / (height * height * 0.0001);

                // Navigate to result screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // male & female widget
  Expanded maleandFemale() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          GenderCard(
            title: 'Male',
            icon: Icons.male,
            color: isMale ? Appcolor.primaryColor : Appcolor.secondaryColor,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          GenderCard(
            title: 'Female',
            icon: Icons.female,
            color: !isMale ? Appcolor.primaryColor : Appcolor.secondaryColor,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  // height widget
  Expanded heightUi() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Appcolor.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            const Text(
              'Height',
              style: TextStyle(
                color: Appcolor.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: const TextStyle(
                    color: Appcolor.whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'cm',
                  style: TextStyle(
                    color: Appcolor.whiteColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 220,
              activeColor: Appcolor.primaryColor,
              inactiveColor: Appcolor.grayColor,
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // weight & age widget
  Expanded weightandAge() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          weightAgeCard(
            title: 'Weight',
            value: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 30) {
                setState(() {
                  weight--;
                });
              }
            },
          ),
          weightAgeCard(
            title: 'Age',
            value: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 1) {
                setState(() {
                  age--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
