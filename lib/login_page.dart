import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:recipeze/login_logic.dart';
import 'create_account.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginLogic loginLogic = LoginLogic();

  TextStyle style =
      TextStyle(fontFamily: 'SourceSansPro-Light', fontSize: 20.0);
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
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
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final createAccountButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAccount()),
          );
        },
        child: Text("Create My Account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title:                         Text(
            "CS-499 - ADV. MOBILE APP. DEV ",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.info), onPressed: () {
              Navigator.of(context).push(_createRoute());
            },),
          ],
        ),




        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
          return Center(
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
                          "RECIPEZE: ",
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
                            text: ["SIMPLE", "FAST", "FUN"],
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
                    Expanded(
                      child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image.asset(
                          'images/chef_hat_cookbook.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    createAccountButton,
                    SizedBox(height: 20.0),
                    emailField,
                    SizedBox(height: 20.0),
                    passwordField,
                    SizedBox(height: 20.0),
                    Material(
                        color: Color(0xff01A0C7),
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            if (loginLogic.validateLoginCredentials(
                                    emailController.text,
                                    passwordController.text) ==
                                true) {
                              /*
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => <NameOfClassHere>()),
                                );
                              */
                            } else {
                              SnackBar snackBar = SnackBar(
                                content: Text(
                                  'Invalid email or password.\nMinimum eight '
                                  'characters, at least one uppercase letter, one lowercase letter and one number.',
                                  textAlign: TextAlign.center,
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: Text("Login",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}




Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TEAM: RECIPEZE'),
        backgroundColor: Colors.red[600],
      ),

        body: Center(
          child: Column(
            children: <Widget>[
              //SizedBox(width: 20.0, height: 100.0),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Our Team:",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ryan Wallace",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "David Rodriguez",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Darius Dumel",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ronith Aerva",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Our Professor",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Dariush Navabi",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),




            ],
          ),
        )
    );
  }
}
