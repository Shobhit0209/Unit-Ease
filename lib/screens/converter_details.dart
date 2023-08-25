import 'package:flutter/material.dart';
import 'package:unit_converter/models.dart/converters.dart';
import 'package:math_expressions/math_expressions.dart';

class LengthScreen extends StatefulWidget {
  final Converters? converters;
  const LengthScreen({super.key, this.converters});

  @override
  State<LengthScreen> createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {
  final List<String> _measures = ['Meter', 'Kilometer', 'Mile'];
  String frommeasures = 'Meter';
  String tomeasures = 'Kilometer';
  var input = '';
  var output = '';
  // var multiplier = '0.001';
  void onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        if (frommeasures == 'Meter') {
          switch (tomeasures) {
            case 'Kilometer':
              var userInput = '${(input)}*0.001';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile':
              var userInput = '${(input)}*0.0006214';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (frommeasures == 'Kilometer') {
          switch (tomeasures) {
            case 'Meter':
              var userInput = '${(input)}*1000';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile':
              var userInput = '${(input)}*0.6214';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }

        if (frommeasures == 'Mile') {
          switch (tomeasures) {
            case 'Meter':
              var userInput = '${(input)}*1609.26';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer':
              var userInput = '${(input)}*1.60926';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
      }
    } else {
      input += value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text(
              'Length Conversion',
            ),
            backgroundColor: Colors.black),
        body: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.green,
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _measures
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          frommeasures = value!;
                        });
                      },
                      value: frommeasures),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              input,
                              style:
                                  TextStyle(fontSize: 26, color: Colors.yellow),
                            )
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.orange,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _measures
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          tomeasures = value!;
                        });
                      },
                      value: tomeasures),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                output,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white),
                              )
                            ])))
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: '<', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: 'AC', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '=', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '00'),
              button(text: '0'),
              button(text: '.'),
              button(
                  text: '',
                  buttonbgcolor: Colors.transparent,
                  scolor: Colors.transparent)
            ],
          ),
        ]),
      ),
    );
  }

  Widget button(
      {text,
      tcolor = Colors.white,
      buttonbgcolor = Colors.black,
      scolor = Colors.white,
      elevation = 5.0}) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonbgcolor,
                elevation: elevation,
                shadowColor: scolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            onPressed: () {
              onButtonClick(text);
            },
            child: Text(
              text,
              style: TextStyle(color: tcolor, fontSize: 22),
            )),
      ),
    );
  }
}

class CurrencyScreen extends StatefulWidget {
  final Converters? converters;
  const CurrencyScreen({super.key, this.converters});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final List<String> _currency = [
    'INR',
    'USD',
    'Euro',
    'Thai Baht',
    'Russian Rubel',
    'UAE Dirham'
  ];
  String fromcurrency = 'INR';
  String tocurrency = 'USD';
  var input = '';
  var output = '';
  void onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        if (fromcurrency == 'INR') {
          switch (tocurrency) {
            case 'USD':
              var userInput = '${(input)}*0.012';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Euro':
              var userInput = '${(input)}*0.011';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Thai Baht':
              var userInput = '${(input)}*0.42';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Russian Rubel':
              var userInput = '${(input)}*1.15';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'UAE Dirham':
              var userInput = '${(input)}*0.044';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'INR':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromcurrency == 'USD') {
          switch (tocurrency) {
            case 'INR':
              var userInput = '${(input)}*82.60';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Euro':
              var userInput = '${(input)}*0.92';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Thai Baht':
              var userInput = '${(input)}*34.98';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Russian Rubel':
              var userInput = '${(input)}*94.75';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'UAE Dirham':
              var userInput = '${(input)}*3.67';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'USD':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromcurrency == 'Euro') {
          switch (tocurrency) {
            case 'INR':
              var userInput = '${(input)}*89.43';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'USD':
              var userInput = '${(input)}*1.08';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Thai Baht':
              var userInput = '${(input)}*37.86';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'UAE Dirham':
              var userInput = '${(input)}*3.98';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Russian Rubel':
              var userInput = '${(input)}*102.25';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Euro':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromcurrency == 'Thai Baht') {
          switch (tocurrency) {
            case 'INR':
              var userInput = '${(input)}*2.63';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'USD':
              var userInput = '${(input)}*0.029';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Thai Baht':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'UAE Dirham':
              var userInput = '${(input)}*0.11';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Russian Rubel':
              var userInput = '${(input)}*2.70';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Euro':
              var userInput = '${(input)}*0.026';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromcurrency == 'Russian Rubel') {
          switch (tocurrency) {
            case 'INR':
              var userInput = '${(input)}*0.88';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'USD':
              var userInput = '${(input)}*0.011';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Thai Baht':
              var userInput = '${(input)}*0.37';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'UAE Dirham':
              var userInput = '${(input)}*0.39';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Russian Rubel':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Euro':
              var userInput = '${(input)}*0.0098';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromcurrency == 'UAE Dirham') {
          switch (tocurrency) {
            case 'INR':
              var userInput = '${(input)}*22.49';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'USD':
              var userInput = '${(input)}*0.27';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Thai Baht':
              var userInput = '${(input)}*9.52';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'UAE Dirham':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Russian Rubel':
              var userInput = '${(input)}*25.73';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Euro':
              var userInput = '${(input)}*0.25';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
      }
    } else {
      input += value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text(
              'Currency Conversion',
            ),
            backgroundColor: Colors.black),
        body: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.green,
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _currency
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromcurrency = value!;
                        });
                      },
                      value: fromcurrency),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              input,
                              style:
                                  TextStyle(fontSize: 26, color: Colors.yellow),
                            )
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.orange,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _currency
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          tocurrency = value!;
                        });
                      },
                      value: tocurrency),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                output,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white),
                              )
                            ])))
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: '<', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: 'AC', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '=', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '00'),
              button(text: '0'),
              button(text: '.'),
              button(
                  text: '',
                  buttonbgcolor: Colors.transparent,
                  scolor: Colors.transparent)
            ],
          ),
        ]),
      ),
    );
  }

  Widget button(
      {text,
      tcolor = Colors.white,
      buttonbgcolor = Colors.black,
      scolor = Colors.white,
      elevation = 5.0}) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonbgcolor,
                elevation: elevation,
                shadowColor: scolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            onPressed: () {
              onButtonClick(text);
            },
            child: Text(
              text,
              style: TextStyle(color: tcolor, fontSize: 22),
            )),
      ),
    );
  }
}

class SpeedScreen extends StatefulWidget {
  final Converters? converters;
  const SpeedScreen({super.key, this.converters});

  @override
  State<SpeedScreen> createState() => _SpeedScreenState();
}

class _SpeedScreenState extends State<SpeedScreen> {
  final List<String> _speeds = [
    'Speed of light(c)',
    'Kilometer per second(km/s)',
    'Kilometer per hour(km/h)',
    'Mile/hour(mph)',
    'Mach',
    'Inch/second(in/s)',
    'Meter per second(m/s)'
  ];
  String fromspeed = 'Speed of light(c)';
  String tospeed = 'Kilometer per hour(km/h)';
  var input = '';
  var output = '';
  void onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        if (fromspeed == 'Speed of light(c)') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*299796.13';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*1079266099.05';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*670624775.15';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*880980.93';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*11802997661.59';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*299796138.62';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromspeed == 'Kilometer per second(km/s)') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*0.0000033356';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*3600';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*2236.936';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*2.9386';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*33370.079';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*1000';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromspeed == 'Mile/hour(mph)') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*1.49';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*0..00044';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*1.60';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*0.0013';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*17.60';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*0.44';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromspeed == 'Mach') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*0.000001135';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*0.34';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*1225.07';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*761.25';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*13397.56';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*340.298';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromspeed == 'Inch/second(in/s)') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*8.47';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*0.000025';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*0.0914';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*0.056';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*0.000074';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*0.025';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromspeed == 'Meter per second(m/s)') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*0.00033356';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*0.001';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*3.6';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*2.23';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*0.0029';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*39.37';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromspeed == 'Kilometer per hour(km/h)') {
          switch (tospeed) {
            case 'Speed of light(c)':
              var userInput = '${(input)}*0.28167';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per second(km/s)':
              var userInput = '${(input)}*0.00027';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kilometer per hour(km/h)':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mile/hour(mph)':
              var userInput = '${(input)}*0.62';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Mach':
              var userInput = '${(input)}*0.00081';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Inch/second(in/s)':
              var userInput = '${(input)}*10.93';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Meter per second(m/s)':
              var userInput = '${(input)}*0.277';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
      }
    } else {
      input += value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text(
              'Speed Conversion',
            ),
            backgroundColor: Colors.black),
        body: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.green,
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _speeds
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromspeed = value!;
                        });
                      },
                      value: fromspeed),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              input,
                              style:
                                  TextStyle(fontSize: 26, color: Colors.yellow),
                            )
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.orange,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _speeds
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          tospeed = value!;
                        });
                      },
                      value: tospeed),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                output,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white),
                              )
                            ])))
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: '<', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: 'AC', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '=', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '00'),
              button(text: '0'),
              button(text: '.'),
              button(
                  text: '',
                  buttonbgcolor: Colors.transparent,
                  scolor: Colors.transparent)
            ],
          ),
        ]),
      ),
    );
  }

  Widget button(
      {text,
      tcolor = Colors.white,
      buttonbgcolor = Colors.black,
      scolor = Colors.white,
      elevation = 5.0}) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonbgcolor,
                elevation: elevation,
                shadowColor: scolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            onPressed: () {
              onButtonClick(text);
            },
            child: Text(
              text,
              style: TextStyle(color: tcolor, fontSize: 22),
            )),
      ),
    );
  }
}

class TemperatureScreen extends StatefulWidget {
  final Converters? converters;
  const TemperatureScreen({super.key, this.converters});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final List<String> _temperatures = [
    'Degree Celsius',
    'Degree Rankine',
    'Degree Reaumur',
    'Degree Fahrenheit',
    'Kelvin'
  ];
  String fromtemp = 'Degree Celsius';
  String totemp = 'Degree Fahrenheit';
  var input = '';
  var output = '';
  // var multiplier = '0.001';
  void onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        if (fromtemp == 'Degree Celsius') {
          switch (totemp) {
            case 'Degree Celsius':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Fahrenheit':
              var userInput = '(${(input)}*(9/5))+32';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Rankine':
              var userInput = '${(input)}*(9/5 + 491.67)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Reaumur':
              var userInput = '${(input)}*0.8';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kelvin':
              var userInput = '${(input)}+274.15';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromtemp == 'Degree Rankine') {
          switch (totemp) {
            case 'Degree Celsius':
              var userInput = '(${(input)}-491.67)*(5/9)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Rankine':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Reaumur':
              var userInput = '(${(input)}-491.67)*0.44';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Fahrenheit':
              var userInput = '${(input)}+(-459.669)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kelvin':
              var userInput = '${(input)}*(5/9)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromtemp == 'Degree Reaumur') {
          switch (totemp) {
            case 'Degree Reaumur':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Celsius':
              var userInput = '${(input)}*1.25';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Rankine':
              var userInput = '${(input)}*2.25+32+459.67';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Fahrenheit':
              var userInput = '${(input)}*2.25+32';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kelvin':
              var userInput = '${(input)}*1.25+273.15';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromtemp == 'Degree Fahrenheit') {
          switch (totemp) {
            case 'Degree Reaumur':
              var userInput = '(${(input)}-32)*(4/9)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Celsius':
              var userInput = '(${(input)}-32)*(5/9)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Rankine':
              var userInput = '${(input)} + 459.67';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Fahrenheit':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kelvin':
              var userInput = '(${(input)}-32)*(5/9) + 273.15';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromtemp == 'Kelvin') {
          switch (totemp) {
            case 'Degree Reaumur':
              var userInput = '(${(input)} - 273.15)*0.8';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Celsius':
              var userInput = '${(input)}+(-273.15)';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Rankine':
              var userInput = '${(input)}*1.8';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Degree Fahrenheit':
              var userInput = '${(input)}+(-273.15)*(9/5)+32';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kelvin':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
      }
    } else {
      input += value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text(
              'Temperature Conversion',
            ),
            backgroundColor: Colors.black),
        body: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.green,
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _temperatures
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromtemp = value!;
                        });
                      },
                      value: fromtemp),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              input,
                              style:
                                  TextStyle(fontSize: 26, color: Colors.yellow),
                            )
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.orange,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _temperatures
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          totemp = value!;
                        });
                      },
                      value: totemp),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                output,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white),
                              )
                            ])))
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: '<', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: 'AC', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '=', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '00'),
              button(text: '0'),
              button(text: '.'),
              button(
                  text: '',
                  buttonbgcolor: Colors.transparent,
                  scolor: Colors.transparent)
            ],
          ),
        ]),
      ),
    );
  }

  Widget button(
      {text,
      tcolor = Colors.white,
      buttonbgcolor = Colors.black,
      scolor = Colors.white,
      elevation = 5.0}) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonbgcolor,
                elevation: elevation,
                shadowColor: scolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            onPressed: () {
              onButtonClick(text);
            },
            child: Text(
              text,
              style: TextStyle(color: tcolor, fontSize: 22),
            )),
      ),
    );
  }
}

class WeightScreen extends StatefulWidget {
  final Converters? converters;
  const WeightScreen({super.key, this.converters});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final List<String> _weights = [
    'G',
    'Kg',
    'Quintal',
    'Ton',
  ];
  String fromwght = 'G';
  String towght = 'Kg';
  var input = '';
  var output = '';
  // var multiplier = '0.001';
  void onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        if (fromwght == 'G') {
          switch (towght) {
            case 'Kg':
              var userInput = '${(input)}*0.001';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Quintal':
              var userInput = '(${(input)}*0.00001';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Ton':
              var userInput = '${(input)}*0.000001';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'G':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
          setState(() {
            print('output id $output');
          });
        }
        if (fromwght == 'Kg') {
          switch (towght) {
            case 'G':
              var userInput = '(${(input)}*1000';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Quintal':
              var userInput = '${(input)}*0.01';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Ton':
              var userInput = '(${(input)}*0.001';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kg':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromwght == 'Quintal') {
          switch (towght) {
            case 'G':
              var userInput = '${(input)}*100000';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kg':
              var userInput = '${(input)}*100';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Ton':
              var userInput = '${(input)}*0.1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Quintal':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
        if (fromwght == 'Ton') {
          switch (towght) {
            case 'G':
              var userInput = '(${(input)}*1000000';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Kg':
              var userInput = '(${(input)}*1000';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Quintal':
              var userInput = '${(input)} *10';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
            case 'Ton':
              var userInput = '${(input)}*1';
              Parser p = Parser();
              Expression exp = p.parse(userInput);
              ContextModel cm = ContextModel();
              var finalvalue = exp.evaluate(EvaluationType.REAL, cm);
              output = finalvalue.toString();
              if (output.endsWith('0')) {
                output = output.substring(0, output.length - 2);
              }
              break;
          }
        }
      }
    } else {
      input += value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text(
              'Weight Conversion',
            ),
            backgroundColor: Colors.black),
        body: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.green,
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _weights
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromwght = value!;
                        });
                      },
                      value: fromwght),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              input,
                              style:
                                  TextStyle(fontSize: 26, color: Colors.yellow),
                            )
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.orange,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.centerStart,
                      items: _weights
                          .map((String value) => DropdownMenuItem<String>(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          towght = value!;
                        });
                      },
                      value: towght),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                output,
                                style: TextStyle(
                                    fontSize: 26, color: Colors.white),
                              )
                            ])))
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: '<', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: 'AC', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '=', buttonbgcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: '00'),
              button(text: '0'),
              button(text: '.'),
              button(
                  text: '',
                  buttonbgcolor: Colors.transparent,
                  scolor: Colors.transparent)
            ],
          ),
        ]),
      ),
    );
  }

  Widget button(
      {text,
      tcolor = Colors.white,
      buttonbgcolor = Colors.black,
      scolor = Colors.white,
      elevation = 5.0}) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonbgcolor,
                elevation: elevation,
                shadowColor: scolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            onPressed: () {
              onButtonClick(text);
            },
            child: Text(
              text,
              style: TextStyle(color: tcolor, fontSize: 22),
            )),
      ),
    );
  }
}
