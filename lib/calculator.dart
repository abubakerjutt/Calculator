import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String result = "";
  Widget button(number) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width / 4,
      child: ElevatedButton(
        onPressed: () {
          maths(number);
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.black26),
            ),
          ),
        ),
        child: Text(number),
      ),
    );
  }

  maths(number) {
    setState(() {
      result = result + number;
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  clrscrn() {
    setState(() {
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.grey[500],
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "$result",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                button("1"),
                button("2"),
                button("3"),
                button("+"),
              ],
            ),
            Row(
              children: [
                button("4"),
                button("5"),
                button("6"),
                button("-"),
              ],
            ),
            Row(
              children: [
                button("7"),
                button("8"),
                button("9"),
                button("*"),
              ],
            ),
            Row(
              children: [
                button("0"),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 10,
                  child: ElevatedButton(
                    onPressed: output,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.black26),
                        ),
                      ),
                    ),
                    child: Text('='),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 10,
                  child: ElevatedButton(
                    onPressed: clrscrn,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.black26),
                        ),
                      ),
                    ),
                    child: Text('Clear'),
                  ),
                ),
                button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
