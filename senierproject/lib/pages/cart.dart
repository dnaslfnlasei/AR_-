import 'package:flutter/material.dart';

//my imports
import 'package:senierproject/componets/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(249, 227, 203, 1),
        title: Text('장바구니'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new Cart_products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("합계:"),
              subtitle: new Text("￦"+"230"),
            )),

            Expanded(
              child: new MaterialButton(onPressed: () {},
                  child: new Text("주문하기", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  color: Color.fromRGBO(249, 227, 203, 1)),
            )
          ],
        ),
      ),
    );
  }
}