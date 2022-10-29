import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/icon_content.dart';
import 'package:bmi_calculator_flutter/components/reuseable_card.dart';
import 'package:bmi_calculator_flutter/components/round_icon_button.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  /*int maleCardColor = inActiveCardColor;
  int femaleCardColor = inActiveCardColor;

  void updateColor(Gender gender) {
    setState(
      () {
        gender == Gender.male
            ? (maleCardColor == inActiveCardColor)
                ? {
                    maleCardColor = activeCardColor,
                    femaleCardColor = inActiveCardColor
                  }
                : maleCardColor = inActiveCardColor
            : null;

        gender == Gender.female
            ? (femaleCardColor == inActiveCardColor)
                ? {
                    femaleCardColor = activeCardColor,
                    maleCardColor = inActiveCardColor
                  }
                : femaleCardColor = inActiveCardColor
            : null;
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI CALCULATOR"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuseableCard(
                    Color(selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor),
                    IconContent(
                      "MALE",
                      FontAwesomeIcons.mars,
                    ),
                    () => () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ResuseableCard(
                    Color(selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor),
                    IconContent("FEMALE", FontAwesomeIcons.venus),
                    () => () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                      //updateColor(Gender.female);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuseableCard(
                      Color(kActiveCardColor),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xDFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29FFEB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      () {}),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuseableCard(
                      Color(kActiveCardColor),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGH',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                FontAwesomeIcons.minus,
                                () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                FontAwesomeIcons.plus,
                                () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: ResuseableCard(
                      Color(kActiveCardColor),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                FontAwesomeIcons.minus,
                                () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                FontAwesomeIcons.plus,
                                () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      () {}),
                ),
              ],
            ),
          ),
          BottomButton('CALCULATE', () {
            CalculatorBrain calc = CalculatorBrain(height, weight);
            print('button press');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  calc.calculateBMI(),
                  calc.getResult(),
                  calc.getInterpretation(),
                ),
              ),
            );
            /*Future.delayed(Duration.zero, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    calc.calculateBMI(),
                    calc.getResult(),
                    calc.getInterpretation(),
                  ),
                ),
              );
            });*/
            /*   WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultsPage(
                      calc.calculateBMI(),
                      calc.getResult(),
                      calc.getInterpretation(),
                    ),
                  ),
                );
              },
            );*/
          }),
        ],
      ),
    );
  }
}
