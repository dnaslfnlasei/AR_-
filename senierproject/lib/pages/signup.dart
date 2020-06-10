import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senierproject/db/users.dart';
import 'package:senierproject/pages/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  String groupValue ="male";
  bool hidePass =true;


  bool loading = false;

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
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "name",enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                                  color: Colors
                                      .transparent)),
                                icon: Icon(Icons.sentiment_satisfied),
                                  border: InputBorder.none
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return "이름을 입력해주세요";
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
                                    return '이메일 양식으로 입력해주세요';
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
                            child: ListTile(
                              title: TextFormField(
                                controller: _passwordTextController,
                                obscureText: hidePass,
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
                              trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                setState(() {
                                  hidePass = false;
                                });
                              }),
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
                            child: ListTile(
                              title: TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  hintText: "Confirm password",enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                                    color: Colors
                                        .transparent)),
                                  icon: Icon(Icons.lock),
                                  border: InputBorder.none
                                ),
                                validator: (value){
                                  if(value.isEmpty){
                                    return "비밀번호를 다시 입력해주세요";
                                  }else if(value.length < 6){
                                    return "비밀번호가 너무 짧습니다. 6글자 이상으로 해주세요";
                                  }else if(_passwordTextController.text != value){
                                    return "비밀번호를 다시 한번 확인해주세요";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                setState(() {
                                  hidePass = false;
                                });
                              }),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(70.0, 8.0, 70.0, 8.0),
                        child:  Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "남자",
                                      textAlign: TextAlign.right,
                                    ),
                                    trailing: Radio(
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  )),
                              Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "여자",
                                      textAlign: TextAlign.right,
                                    ),
                                    trailing: Radio(
                                        value: "female",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  )),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(249, 227, 203, 1).withOpacity(0.8),
                            elevation: 0,
                            child: MaterialButton(onPressed: (){
                              validateForm();
                            },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text("회원가입하기", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text("아이디가 있으면 로그인하기",textAlign: TextAlign.center, style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
                        ),

//                                new TextSpan(
//                                  text: "Sign up", style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)
//                                )

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

  valueChanged(e){
    setState(() {
      if(e == 'male'){
        groupValue = e;
        gender = e;
      }else if(e == 'female'){
        groupValue = e;
        gender = e;
      }
    });
  }
  Future validateForm() async {
    FormState formState = _formKey.currentState;


    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();


      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
            .then(
              (user) => Firestore.instance.collection("users").add({
            "username": _nameTextController.text,
            "email": _emailTextController.text,
            "userId": user.user.uid,
            "gender": gender,
          }),
        )
            .catchError(
              (err) => print(
            err.toString(),
          ),
        );


        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            ModalRoute.withName(HomePage().toString()));
      } else {
        print("already a user");
      }
    }
  }


}