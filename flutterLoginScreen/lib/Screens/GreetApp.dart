import 'package:flutter/material.dart';
class GreetApp extends StatefulWidget {
  @override
  _GreetAppState createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {

  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();
  var value = "Login Screen";

  _createButton(String label, Color color, Function fn) {
    return Container(
      margin: EdgeInsets.all(20),
      child: RaisedButton(
          color: color,
          padding: EdgeInsets.fromLTRB(10,5,10,5),
          onPressed: () {
             value = fn();
            setState(() {});
          },
          child: Text(
            label,
            style: TextStyle(fontSize: 15),
          )),
    );
  }

  Widget _loginTextField(String label, TextEditingController _controller){
    return Container(
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.name,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            fillColor: Colors.white54,
            focusColor: Colors.tealAccent,
            labelText: label,

            border: OutlineInputBorder(
                borderSide: BorderSide(width: 10.0),
                borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
    );
  }
  String _loginSuccessful(){
     if(_tc1.text == 'Admin'){
       return 'Login Successful';
     }else{
       return 'Login Failed';
     }
  }
  String _loginFailed(){
      _tc1.text = '';
      _tc2.text = '';
      return 'Login Screen';
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(value),
      ),
      body: SafeArea(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: new NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/8/84/Bath_spa_drone.jpg',
                  ),
                ),
              ),
              ),
              Container(
                color: Colors.white54,
                height: 300,
                margin: EdgeInsets.all(20),
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _loginTextField('Username',_tc1),
                        _loginTextField('Password',_tc2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _createButton('Login',Colors.greenAccent,_loginSuccessful),
                            _createButton('Clear',Colors.red,_loginFailed),
                          ],
                        )
                      ],
                    ),
                ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}
