import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "레인 코트",
      "picture": "images/products/ranicoat.jpg",
      "price": 29800,
      "size": "M",
      "color": "nomal",
      "quantity": 1,
    },
    {
      "name": "전지현 블레이저",
      "picture": "images/products/jjh_blazer.jpg",
      "price": 69000,
      "size": "90",
      "color": "nomal",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index){
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["size"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this. cart_prod_name,
    this. cart_prod_picture,
    this. cart_prod_price,
    this. cart_prod_size,
    this. cart_prod_color,
    this. cart_prod_qty
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //leading--------
        leading: new Image.asset(cart_prod_picture,width: 80,height: 80,),
        //title----------
        title: new Text(cart_prod_name),
        //subtitle--------
        subtitle: new Column(
          children: <Widget>[
            //row inside the cloumn
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size,style: TextStyle(color: Color.fromRGBO(249, 227, 203, 1)),),
                ),
//color-----------
                new Padding(padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_color,style: TextStyle(color: Color.fromRGBO(249, 227, 203, 1)),),
                ),
              ],
            ),
            //price----------------------
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("￦"+"$cart_prod_price",style: TextStyle(color: Color.fromRGBO(249, 227, 203, 1),fontSize: 17,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child:
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_drop_up),iconSize: 38, onPressed: () {}),
              Text('$cart_prod_qty',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              IconButton(icon: Icon(Icons.arrow_drop_down),iconSize: 38, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}