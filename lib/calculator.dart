import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  late String _display;

  @override
  void initState() {
    super.initState();
    _display = '0';
  }

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        _clear();
      } else if (value == '=') {
        _calculateResult();
      } else {
        if (_display == '0' || _display == 'Error') {
          _display = value;
        } else {
          _display += value;
        }
      }
    });
  }

  void _calculateResult() {
    try {
      final expression = _display.replaceAll('x', '*');
      final result = Parser().parse(expression).evaluate(EvaluationType.REAL, ContextModel());
      _display = result.toString();
    } catch (e) {
      _display = 'Error';
    }
  }

  void _clear() {
    _display = '0';
  }

  Widget calcButton(String btnTxt, Color btnColor, Color txtColor,
      {double fontSize = 35}) {
    return Expanded(
      child: Container(
        height: 80,
        width: 80,
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(btnTxt),
          child: Text(
            btnTxt,
            style: TextStyle(
              fontSize: fontSize,
              color: txtColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: btnColor,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text(
          'Dev_Calculator',
          style: TextStyle(color: Colors.deepPurple[600]),
        ),
        backgroundColor: Colors.purple[50],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              _display,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                calcButton('AC', Colors.purple[200]!, Colors.black),
                
                
                calcButton('+/-', Colors.purple[200]!, Colors.black),
                calcButton('%', Colors.purple[200]!, Colors.black),
                calcButton(
                  '/',
                  Colors.purple[200]!,
                  Colors.black,
                  fontSize: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('7', Colors.purple[600]!, Colors.white),
                calcButton('8', Colors.purple[600]!, Colors.white),
                calcButton('9', Colors.purple[600]!, Colors.white),
                calcButton(
                  'x',
                  Colors.purple[200]!,
                  Colors.black,
                  fontSize: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('4', Colors.purple[600]!, Colors.white),
                calcButton('5', Colors.purple[600]!, Colors.white),
                calcButton('6', Colors.purple[600]!, Colors.white),
                calcButton(
                  '-',
                  Colors.purple[200]!,
                  Colors.black,
                  fontSize: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton('1', Colors.purple[600]!, Colors.white),
                calcButton('2', Colors.purple[600]!, Colors.white),
                calcButton('3', Colors.purple[600]!, Colors.white),
                calcButton(
                  '+',
                  Colors.purple[200]!,
                  Colors.black,
                  fontSize: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 160,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed('0'),
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.purple[600],
                    ),
                  ),
                ),
                calcButton('.', Colors.purple[600]!, Colors.white),
                calcButton(
                  '=',
                  Colors.purple[200]!,
                  Colors.black,
                  fontSize: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

