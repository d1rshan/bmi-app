// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bmiapp/components/add_minus_card.dart';
import 'package:bmiapp/components/slider.dart';
import 'package:bmiapp/components/gender_card.dart';
import 'package:bmiapp/components/reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum gender {
  male,
  female,
}

double _heightValue = 175;
double _weightValue = 50;
int _age = 18;
int index = 0;
double bmi = 0;
final List categoryList = [
  [null, null],
  ['Underweight', Colors.orange],
  ['Normal', Colors.green],
  ['Overweight', Colors.orange],
  ['Obesity', Colors.red],
];

class _HomePageState extends State<HomePage> {
  gender selectedGender = gender.male;

  void getBmiCategory(double bmi) {
    if (bmi <= 18.5) {
      index = 1;
    } else if (18.5 < bmi && bmi <= 24.9) {
      index = 2;
    } else if (25 <= bmi && bmi <= 29.9) {
      index = 3;
    } else if (bmi >= 30) {
      index = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Body Mass Index',
          style: GoogleFonts.anton(wordSpacing: 1.5),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(title: 'Gender'),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                      child: ReusableCard(
                        cardChild: GenderCard(
                          icon: Icons.male,
                          gender: 'MALE  ',
                          isSelected:
                              selectedGender == gender.male ? true : false,
                        ),
                        selectionHighlight:
                            selectedGender == gender.male ? true : false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = gender.female;
                        });
                      },
                      child: ReusableCard(
                        cardChild: GenderCard(
                          icon: Icons.female,
                          gender: 'FEMALE',
                          isSelected:
                              selectedGender == gender.female ? true : false,
                        ),
                        selectionHighlight:
                            selectedGender == gender.female ? true : false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SubHeading(title: 'Height'),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_heightValue.round().toString()} cm',
                      style: GoogleFonts.anton(
                        fontSize: 30,
                      ),
                    ),
                    SliderWidget(
                      minVal: 150,
                      maxVal: 200,
                      val: _heightValue,
                      onChange: (newValue) {
                        setState(() {
                          _heightValue = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SubHeading(title: 'Weight & Age'),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotatedBox(
                              quarterTurns: 3,
                              child: SliderWidget(
                                minVal: 40,
                                maxVal: 120,
                                val: _weightValue,
                                onChange: (newValue) {
                                  setState(() {
                                    _weightValue = newValue;
                                  });
                                },
                              )),
                          Text(
                            _weightValue.round() >= 100
                                ? '${_weightValue.round().toString()} kg'
                                : ' ${_weightValue.round().toString()} kg',
                            style: GoogleFonts.anton(
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          addMinusCard(
                            icn: Icons.remove,
                            updateAge: () {
                              setState(
                                () {
                                  _age--;
                                },
                              );
                            },
                          ),
                          Text(
                            _age.toString(),
                            style: GoogleFonts.anton(
                              fontSize: 24,
                            ),
                          ),
                          addMinusCard(
                            icn: Icons.add,
                            updateAge: () {
                              setState(() {
                                _age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        child: Text(''),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bmi = (_weightValue * 10000) / (_heightValue * _heightValue);
            getBmiCategory(bmi);
          });
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your BMI is',
                      style: GoogleFonts.anton(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      bmi.toStringAsPrecision(3),
                      style: GoogleFonts.anton(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                    Text(
                      categoryList[index][0],
                      style: GoogleFonts.anton(
                        color: categoryList[index][1],
                        fontSize: 45,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        child: Text(
          'BMI',
          style: GoogleFonts.anton(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SubHeading extends StatelessWidget {
  final String title;
  const SubHeading({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: GoogleFonts.anton(
          fontSize: 18,
        ),
      ),
    );
  }
}
