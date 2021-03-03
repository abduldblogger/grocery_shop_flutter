import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/models/Product.dart';
import 'package:grocery_shop_flutter/views/ProductView.dart';

class ProductWidget extends StatelessWidget {

  final Product product;

  ProductWidget({Key key, this.product}) : super(key:key);

  @override
  Widget build(BuildContext context){

    double height = MediaQuery.of(context).size.height/1.2;
    double fontSize = (height/24).round().toDouble();

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductView(product: this.product)));
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Hero(
                          tag: "tagHero${this.product.id}",
                          child: Image.asset(this.product.urlToImage,
                              fit: BoxFit.cover, height: height * 0.20))),
                  Container(
                      height: height * 0.25,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("\$${this.product.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: fontSize)),
                            Container(
                                margin: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text("${this.product.title}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: fontSize * 0.65))),
                            Text("${this.product.weight}g",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: fontSize * 0.48))
                          ]))
                ])));
  }

}