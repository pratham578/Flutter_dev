import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  bool add,sub,mul,div;
  String _textFieldValue= '',_displayValue = '0';
  double res1, res2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String generateNumber(String label){
    if(label == '.'){
      if(!_textFieldValue.contains(label)){
        _textFieldValue = _textFieldValue + label ;
      }
    }
    else{
      _textFieldValue = _textFieldValue + label ;
    }
    return _textFieldValue;
  }
  String posNeg(String label){

    if(!_textFieldValue.contains('-') && !_textFieldValue.contains('+') ) {
      _textFieldValue = '+' + _textFieldValue;
    }
    if(_textFieldValue.contains('-')){
      _textFieldValue = _textFieldValue.replaceAll('-', '+');
    }
    else if(_textFieldValue.contains('+')){
      _textFieldValue = _textFieldValue.replaceAll('+', '-');
    }
    return _textFieldValue;
  }
  String operations(String label){
    switch(label) {
      case '+': {
        if(_textFieldValue == ''){
          _displayValue = '0';
        }
        else{
          res1 = double.parse(_textFieldValue);
          _displayValue = '0';
          _textFieldValue = '';
          add = true;
          sub = false;
          mul = false;
          div = false;
        }
      }
      break;

      case '-': {
        if(_textFieldValue == ''){
          _displayValue = '0';
        }
        else{

          res1 = double.parse(_textFieldValue);
          print("result 1 variable $res1");
          _displayValue = '0';
          _textFieldValue = '';
          add = false;
          sub = true;
          mul = false;
          div = false;
        }
      }
      break;

      case '*': {
        if(_textFieldValue == ''){
          _displayValue = '0';
        }
        else{

          res1 = double.parse(_textFieldValue);
          print("result 1 variable $res1");
          _displayValue = '0';
          _textFieldValue = '';
          add = false;
          sub = false;
          mul = true;
          div = false;
        }
      }
      break;

      case '/': {
        if(_textFieldValue == ''){
          _displayValue = '0';
        }
        else{

          res1 = double.parse(_textFieldValue);
          print("result 1 variable $res1");
          _displayValue = '0';
          _textFieldValue = '';
          add = false;
          sub = false;
          mul = false;
          div = true;
        }
      }
      break;
    }
    return _displayValue;
  }

  String printResult(String label){
    res2 = double.parse(_textFieldValue);
    if(add == true){
      res1 =  res1 + res2 ;
      add = false;
    }else if(sub == true){
      res1 =  res1 - res2 ;
      sub = true;
    }else if(mul == true){
      res1 =  res1 * res2 ;
      mul = true;
    }else if(div == true){
      res1 =  res1 / res2 ;
      div = true;
    }
    res2 = null;
    _textFieldValue = res1.toString();
    return res1.toString();
    }

  String clearDisplayValue(String label){
    _textFieldValue= '';
    _displayValue = '0';
    res1 = null;
    res2 = null;
    return _displayValue;
  }

   _calculatorDisplay(double scrHeight, double scrWidth){
    return Container(
      height:scrHeight,
      width: scrWidth,
      color: Colors.black,
        child:  Text(_displayValue, style: TextStyle(fontSize: 32,color: Colors.white),),
    );
  }


  Widget _calculatorButton(double buttonHeight,double buttonWidth, buttonColors, String buttonLabel,Function fn){
     return Container(
           height: buttonHeight,
           width: buttonWidth,
           decoration: BoxDecoration(
               border: Border.all(width: 1,color:Colors.black)
           ),
           child: RaisedButton(
             color: buttonColors,
             onPressed: (){
               _displayValue = fn(buttonLabel);
               // print("_display label $_displayLabel");
               setState(() {});
             },
               child: Text(buttonLabel,style: TextStyle(fontSize: 30, color: Colors.white),
               )
           ),
     );
  }

  Widget _calculatorButtonLastRow(double buttonHeight, double buttonWidth, List rowElement){
     return Row(
       children: [
         _calculatorButton(buttonHeight,buttonWidth + buttonWidth,rowElement[0][0],rowElement[0][1],rowElement[0][2]),
         _calculatorButton(buttonHeight,buttonWidth,rowElement[1][0],rowElement[1][1],rowElement[1][2]),
         _calculatorButton(buttonHeight,buttonWidth,rowElement[2][0],rowElement[2][1],rowElement[2][2]),
       ],
     );
  }
  Widget _calculatorButtonRow(double buttonHeight, double buttonWidth, List rowElement){
  return Row(
    children: [
      _calculatorButton(buttonHeight,buttonWidth,rowElement[0][0],rowElement[0][1],rowElement[0][2]),
      _calculatorButton(buttonHeight,buttonWidth,rowElement[1][0],rowElement[1][1],rowElement[1][2]),
      _calculatorButton(buttonHeight,buttonWidth,rowElement[2][0],rowElement[2][1],rowElement[2][2]),
      _calculatorButton(buttonHeight,buttonWidth,rowElement[3][0],rowElement[3][1],rowElement[3][2]),
    ],
    );
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double buttonHeight = screenSize.height * 0.152;
    double buttonWidth = screenSize.width / 4;

    List calcKeys = [[[Colors.black54,'C',clearDisplayValue],[Colors.black54,'+/-',posNeg],[Colors.black54,'%',generateNumber],[Colors.yellow[400],'/',operations]],
                    [[Colors.black12,'7',generateNumber],[Colors.black12,'8',generateNumber],[Colors.black12,'9',generateNumber],[Colors.yellow[400],'*',operations]],
                    [[Colors.black12,'4',generateNumber],[Colors.black12,'5',generateNumber],[Colors.black12,'6',generateNumber],[Colors.yellow[400],'-',operations]],
                    [[Colors.black12,'1',generateNumber],[Colors.black12,'2',generateNumber],[Colors.black12,'3',generateNumber],[Colors.yellow[400],'+',operations]],
                    [[Colors.black12,'0',generateNumber],[Colors.black12,'.',generateNumber],[Colors.red[400],'=',printResult]]];

    return Scaffold(
      body: SafeArea(
        child: Container(
             child: Column(
              children: [
                Container(
                  child: _calculatorDisplay(screenSize.height * 0.2, screenSize.width),
                ),
                Container(
                  // height:
                  child: Column(
                    children: [
                      _calculatorButtonRow(buttonHeight,buttonWidth,calcKeys[0]),
                      _calculatorButtonRow(buttonHeight,buttonWidth,calcKeys[1]),
                      _calculatorButtonRow(buttonHeight,buttonWidth,calcKeys[2]),
                      _calculatorButtonRow(buttonHeight,buttonWidth,calcKeys[3]),
                      _calculatorButtonLastRow(buttonHeight,buttonWidth,calcKeys[4]),
                    ],
                  )
                )
              ],
          ),
          )
        ),
    );
  }
}
