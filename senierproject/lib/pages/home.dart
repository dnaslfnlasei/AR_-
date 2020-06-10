import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';

//my own imports
import 'package:senierproject/componets/horizontal_listview.dart';
import 'package:senierproject/componets/products.dart';
import 'package:senierproject/pages/cart.dart';
import 'package:senierproject/pages/login.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [//이미지 넣을려면 pubspec.yaml에서 assets에 사진 올리고 pub upgrade한다음 여기에도 똑같은 주소 올리기
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w3.jpeg'),
        ],
        autoplay: true,
        dotSize: 4.0,//점 크기
        //dotColor: ,
        indicatorBgPadding: 2.0, //점있는 공간 패딩 크기
        dotBgColor: Colors.transparent, //점있는공간 배경없애기
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),//사진 자동으로 넘기는거 주기
      ),
    );

    return Scaffold(
      //Scaffold 대가리
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(249, 227, 203, 1),
        title: Text('AR_#'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (Context)=> new Cart()));
              })
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//header
            new UserAccountsDrawerHeader(
              accountName: Text('Dev Lim'),
              accountEmail: Text('dev_lim@naver.com'),
              currentAccountPicture: GestureDetector(
                //게스트 계정일때
                child: new CircleAvatar(
                  backgroundColor: Color.fromRGBO(204, 204, 204, 1),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(249, 227, 203, 1), // 석삼자 누르면 나오는 창 색상
              ),
            ),
//body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('홈페이지'),
                leading: Icon(Icons.home, color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('내 계정'),
                leading: Icon(Icons.person, color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('주문목록'),
                leading: Icon(Icons.dvr, color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('장바구니'),
                leading: Icon(Icons.shopping_cart,color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('찜'),
                leading: Icon(Icons.favorite,color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),

            Divider(),//선긋기

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('설정'),
                leading: Icon(Icons.settings, color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('로그아웃'),
                leading: Icon(Icons.exit_to_app, color: Color.fromRGBO(204, 204, 204, 1)),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          //image carousel 시작부분
          image_carousel,
          //padding_widget
          new Padding(padding: const EdgeInsets.all(10.0),
            child: new Text('Categories'),),

          //Horizontal list view 시작 부분
          HorizontalList(),

          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('New Arrivals'),),

          //grid view
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}