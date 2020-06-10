import 'package:flutter/material.dart';
import 'package:senierproject/pages/AR.dart';
import 'package:senierproject/main.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  new AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(249, 227, 203, 1),
        title: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
            child: Text('AR_#')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("￦"+"${widget.product_detail_old_price}",
                            style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),)
                      ),
                      Expanded(
                          child: new Text("￦"+"${widget.product_detail_new_price}",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
//      ==================첫번째 버튼=====================
          Row(
            children: <Widget>[
              // ============사이즈 버튼===================
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("choose the size"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);//팝업창에서 닫기눌렀을때 팝업창 닫게하는 소스코드
                              },
                                  child: new Text("close", style: TextStyle(color: Colors.blue),)
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Size")
                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              ),
              //======================색상=================
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("choose a color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);//팝업창에서 닫기눌렀을때 팝업창 닫게하는 소스코드
                              },
                                  child: new Text("close", style: TextStyle(color: Colors.blue),)
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text("Color")
                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              ),
              //====================수량===================
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);//팝업창에서 닫기눌렀을때 팝업창 닫게하는 소스코드
                              },
                                  child: new Text("close", style: TextStyle(color: Colors.blue),)
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Quantity",
                          style: TextStyle(fontSize: 13),//크기 조절안하면 2줄로 표시됨
                        ),


                      ),
                      Expanded(
                          child: new Icon(Icons.arrow_drop_down)
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

          //      ==================두번째 버튼=====================
          Row(
            children: <Widget>[
              //==========AR 쇼핑 버튼========
              InkWell( child: Image.asset('images/AR_Button.png', width: 100, height: 36),
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new AR_service())),
              ),
              // ============구매 버튼===================
              Expanded(
                child: MaterialButton(onPressed: (){},
                  color: Color.fromRGBO(249, 227, 203, 1),
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("바로 구매",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Color.fromRGBO(204, 204, 204, 1)), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite, color: Color.fromRGBO(204, 204, 204, 1),), onPressed: (){})
            ],
          ),

          Divider(),

          new ListTile(
            title: new Text("상품 상세",style: TextStyle(fontWeight: FontWeight.bold),),//product details
            subtitle: new Text("이제 완연한 봄날씨를 만끽하는 계절이 왔네요! 봄에 편하게 입을수 있는 댄디룩을 여러분들께 소개해드릴까하는데요" +'\n'+"아무래도 봄이다보니 무게감있는 어두운 컬러보단 밝은컬러로 스타일링된 코디를 많이 보실 수 있으실거에요!"),
          ),
          Divider(),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text("상품명",style: TextStyle(fontSize: 12),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name, style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1),),),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text("브랜드",style: TextStyle(fontSize: 12),),),

              //브랜드 db추가
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("GIORDANO",style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1),),),)
            ],
          ),

          //출시연도 db추가

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text("출시연도",style: TextStyle(fontSize: 10),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("20.04", style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1),),),)
            ],
          ),

          Divider(),
          Padding(
              padding: const EdgeInsets.all(8),
              child: new Text("내가 본 상품의 연관 상품")
          ),
          // SIMILAR PRODUCTS 부분
          Container(
            height: 340,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_List = [
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
      return Similar_Single_prod(
        prod_name: product_List[index]['name'],
        prod_picture: product_List[index]['picture'],
        prod_old_price: product_List[index]['old_price'],
        prod_price: product_List[index]['price'],
      );
    });
  }
}


class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
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