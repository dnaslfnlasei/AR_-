import 'package:flutter/material.dart';
import 'package:senierproject/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_List = [
    {
      "name": "윈드 자켓",
      "picture": "images/products/blazer1.jpg",
      "old_price": 29800,
      "price": 15000,
    },
    {
      "name": "코튼 미",
      "picture": "images/products/dress1.jpg",
      "old_price": 19800,
      "price": 15000,
    },
    {
      "name": "전지현 블레이저",
      "picture": "images/products/jjh_blazer.jpg",
      "old_price": 99800,
      "price": 69000,
    },
    {
      "name": "레인 코트",
      "picture": "images/products/ranicoat.jpg",
      "old_price": 29800,
      "price": 29800,
    },
    {
      "name": "위캔드 ",
      "picture": "images/products/wecant.jpg",
      "old_price": 19800,
      "price": 15000,
    },
    {
      "name": "싱글 트랜치",
      "picture": "images/products/single_tranch.jpg",
      "old_price": 108000,
      "price": 79000,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_List.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context, int index){
      return Single_prod(
        prod_name: product_List[index]['name'],
        prod_picture: product_List[index]['picture'],
        prod_old_price: product_List[index]['old_price'],
        prod_price: product_List[index]['price'],
      );
    });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price
  });
  @override
  //Recent products 그리
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: InkWell(
          onTap:()=> Navigator.of(context).push(new MaterialPageRoute(
            //product의 변수들을 product_detail로 보냄
              builder: (context) => new ProductDetails(
                product_detail_name: prod_name,
                product_detail_new_price: prod_price,
                product_detail_old_price: prod_old_price,
                product_detail_picture: prod_picture,
              ))) ,
          child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: new Row(children: <Widget>[
                    Expanded(
                      child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ),
                    new Text("￦"+"$prod_price",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                  ],)
              ),
              child: Image.asset(prod_picture,
                fit: BoxFit.cover,)),
        ),
      ),
    );
  }
}