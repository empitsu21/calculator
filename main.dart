import 'package:calculator_app/pages/result_page.dart';
import 'package:calculator_app/widgets/calculator_brain.dart';
import 'package:calculator_app/widgets/circled_button.dart';
import 'package:calculator_app/widgets/icon_content.dart';
import 'package:calculator_app/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 51, 1),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(0, 0, 51, 1),
          title: Text(
            "BMI CALCULATOR",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: MainCalcWidget(

        ),
      ),
    ),
  );
}

class MainCalcWidget extends StatefulWidget {
  @override
  _MainCalcWidgetState createState() => _MainCalcWidgetState();
}

class _MainCalcWidgetState extends State<MainCalcWidget> {

  int _height = 180;
  int _weight = 70;
  int _age = 0;
  Gender gender;
  Color activeCardColor = Color.fromRGBO(25, 25, 120, 0.4);
  Color inActiveCardColor = Color.fromRGBO(25, 25, 120, 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.MALE;
                      });
                    },
                    color: gender == Gender.MALE
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                      size: 80,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        gender = Gender.FEMALE;
                      });
                    },
                    color: gender == Gender.FEMALE
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                      size: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ReusableCard(
              color: Color.fromRGBO(25, 25, 120, 0.8),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "HEIGHT",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _height.toString(),
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                        child: Text(
                          "cm",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Slider(
                    activeColor: Colors.pinkAccent,
                    value: _height.toDouble(),
                    min: 0,
                    max: 250,
                    divisions: 250,
                    onChanged: (double value) {
                      setState(() {
                        _height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                  child: ReusableCard(
                    color: Color.fromRGBO(25, 25, 120, 0.8),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _weight.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircledButton(
                                sign: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (_weight > 0) {
                                      _weight--;
                                    }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircledButton(
                                sign: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                  child: ReusableCard(
                    color: Color.fromRGBO(25, 25, 120, 0.8),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _age.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircledButton(
                                sign: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    if (_age > 0) {
                                      _age--;
                                    }
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircledButton(
                                sign: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            CalculatorBrain calculatorBrain = CalculatorBrain();
            double bmi = calculatorBrain.calculateIndex(_weight, _height);
            String result = calculatorBrain.getResult(bmi);
            String interpretation = calculatorBrain.getInterpretation(bmi);
            Route route = MaterialPageRoute(builder: (context) => ResultPage(weight: result, info: interpretation));
            Navigator.push(context, route);
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 80,
            color: Colors.pinkAccent,
            child: Text(
              "CALCULATE",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


