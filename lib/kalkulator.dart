import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _input = '';
  String _result = '';

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        _hitung();
      } else if (value == '√') {
        if (_input.isNotEmpty) {
          double? val = double.tryParse(_input);
          if (val != null) {
            _result = sqrt(val).toString();
          }
        }
      } else if (value == 'x²') {
        if (_input.isNotEmpty) {
          double? val = double.tryParse(_input);
          if (val != null) {
            _result = (val * val).toString();
          }
        }
      } else {
        _input += value;
      }
    });
  }

  void _hitung() {
    try {
      String exp = _input.replaceAll('×', '*').replaceAll('÷', '/');
      // Sederhana: hanya operasi dasar
      double hasil = _eval(exp);
      _result = hasil.toString();
    } catch (e) {
      _result = 'Error';
    }
  }

  double _eval(String exp) {
    // Hanya mendukung operasi + - * /
    List<String> tokens = exp
        .split(RegExp(r'([+\-*/])'))
        .where((e) => e.isNotEmpty)
        .toList();
    List<String> ops = [];
    List<double> nums = [];

    int i = 0;
    while (i < exp.length) {
      if ('+-*/'.contains(exp[i])) {
        ops.add(exp[i]);
        i++;
      } else {
        int j = i;
        while (j < exp.length && !'+-*/'.contains(exp[j])) j++;
        nums.add(double.parse(exp.substring(i, j)));
        i = j;
      }
    }

    // Kalkulasi dari kiri ke kanan (tidak memperhatikan prioritas operator)
    double result = nums.isNotEmpty ? nums[0] : 0;
    for (int k = 0; k < ops.length; k++) {
      if (ops[k] == '+') result += nums[k + 1];
      if (ops[k] == '-') result -= nums[k + 1];
      if (ops[k] == '*') result *= nums[k + 1];
      if (ops[k] == '/') result /= nums[k + 1];
    }
    return result;
  }

  Widget _buildButton(String value, {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Color(0xFF31363F),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _onPressed(value),
          child: Text(
            value,
            style: TextStyle(fontSize: 22, fontFamily: 'Questrial'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // color: Colors.blue,
            width: double.infinity,
            margin: EdgeInsets.only(top: 14, left: 20, right: 20),
            child: Text("Kalkulator", style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Questrial')),
          ),
          Divider(color: Colors.white, thickness: 1, indent: 20, endIndent: 20),
          Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  child: Text(
                    _input,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Questrial',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF810CA8),
                      fontFamily: 'Questrial',
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      children: [
                        _buildButton('√', color: Color(0xFF810CA8)),
                        _buildButton('x²', color: Color(0xFF810CA8)),
                        _buildButton('C', color: const Color.fromARGB(255, 187, 187, 187)),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('7'),
                        _buildButton('8'),
                        _buildButton('9'),
                        _buildButton('÷', color: Color(0xFF810CA8)),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('4'),
                        _buildButton('5'),
                        _buildButton('6'),
                        _buildButton('×', color: Color(0xFF810CA8)),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('1'),
                        _buildButton('2'),
                        _buildButton('3'),
                        _buildButton('-', color: Color(0xFF810CA8)),
                      ],
                    ),
                    Row(
                      children: [
                        _buildButton('0'),
                        _buildButton('.'),
                        _buildButton('=', color: Colors.green),
                        _buildButton('+', color: Color(0xFF810CA8)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
