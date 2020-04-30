import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:recipeze/login_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeze/login_page.dart';


class CreateAccount extends StatefulWidget {
  CreateAccount({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  LoginLogic loginLogic = LoginLogic();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  TextStyle style =
  TextStyle(fontFamily: 'SourceSansPro-Light', fontSize: 20.0);
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final createAccountButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async{

          // when using the try and catch the below code is not required.(Validation)
          /*if (loginLogic.validateLoginCredentials(
              emailController.text, passwordController.text) ==
              true) {
            Navigator.pop(
              context,
            );
          } else {
            print("Invalid email or password. Please try again.");
          } */

          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: email, password: password);
            if(newUser != null){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
            }
          }
          catch(e){
            print(e);
          }
        },
        child: Text("Create My Account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final nameField = TextField(
      controller: nameController,
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "First and Last Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final userNameField = TextField(
      controller: userNameController,
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "User Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField = TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      onChanged: (value) {
         email = value;
    },
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      textAlign: TextAlign.center,
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          color: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(width: 20.0, height: 100.0),
                    Text(
                      "ENTER: ",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20.0, height: 100.0),
                    RotateAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: ["FULL NAME", "USER NAME", "EMAIL", "PASSWORD"],
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "SourceSansPro-Light",
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset(
                      'images/brown_cookbook.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                nameField,
                SizedBox(height: 20.0),
                userNameField,
                SizedBox(height: 20.0),
                emailField,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(height: 20.0),
                createAccountButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}