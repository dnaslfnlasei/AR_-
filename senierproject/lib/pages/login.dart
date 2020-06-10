import 'package:flutter/material.dart';
import 'package:senierproject/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  get firebaseUser => null;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    await firebaseAuth.currentUser().then((user){
      if(user != null){
        setState(() => isLogedin = true);
      }
    });
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,// flutter Keyboard bottom overflow
      body: Stack(
        children: <Widget>[
          Image.asset('images/back3.jpg',
              fit: BoxFit.contain, width: double.infinity, height: double.infinity),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
          ),

              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.5),
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                    hintText: "Email",enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                                      color: Colors
                                          .transparent)),
                                    icon: Icon(Icons.person),
                                      border: InputBorder.none
                                  ),
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.5),
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _passwordTextController,
                                  decoration: InputDecoration(
                                    hintText: "Password",enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                                      color: Colors
                                          .transparent)),
                                    icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none
                                  ),
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "비밀번호를 입력해주세요";
                                    }else if(value.length < 6){
                                      return "비밀번호가 너무 짧습니다. 6글자 이상으로 해주세요";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(249, 227, 203, 1).withOpacity(0.8),
                              elevation: 0,
                              child: MaterialButton(onPressed: (){},
                              minWidth: MediaQuery.of(context).size.width,
                                child: Text("Login", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
                              )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                              },
                              child: Text("회원가입 하기", style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
                            ),

//                                new TextSpan(
//                                  text: "Sign up", style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)
//                                )

                          ),


                          Expanded(child: Container()),
                          Text("다른 방법으로 로그인하기",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(249, 227, 203, 1).withOpacity(0.8),
                                elevation: 0,
                                child: MaterialButton(onPressed: (){
//                                  _testSignInWithGoogle();
                                },
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text("Sign in with google", textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
                                )
                            ),
                          ),

                        ],
                      )),

          ),
              ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
