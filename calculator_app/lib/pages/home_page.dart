import 'package:calculator_app/util/my_button';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var output = '';

  // Array of buttons
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            "Calculator",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.deepPurple),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      output,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: EdgeInsets.only(top: 50),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                // Clear Button
                if (index == 0) {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        userInput = '';
                        output = '0';
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.blue[50],
                    textColor: Colors.black,
                  );
                }
                // +/- Button
                else if (index == 1) {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        userInput += '+/-';
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.blue[50],
                    textColor: Colors.black,
                  );
                }
                // % Button
                else if (index == 2) {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        userInput += '%';
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.blue[50],
                    textColor: Colors.black,
                  );
                }
                // Delete Button
                else if (index == 3) {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        userInput = userInput.isNotEmpty
                            ? userInput.substring(0, userInput.length - 1)
                            : '';
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.blue[50],
                    textColor: Colors.black,
                  );
                }
                // Equal Button
                else if (index == 18) {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        equalPressed();
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                  );
                }
                // Other buttons
                else {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        userInput += buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.blue[50],
                    textColor: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.black,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  // Function to calculate the result
  void equalPressed() {
    String finalUserInput = userInput;
    finalUserInput = finalUserInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    output = eval.toString();
  }
}
