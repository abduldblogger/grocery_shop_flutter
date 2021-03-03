import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/bloc/CartBloc.dart';
import 'package:grocery_shop_flutter/models/Order.dart';
import 'package:grocery_shop_flutter/models/Product.dart';

class ProductView extends StatefulWidget{

  final Product product;
  ProductView({Key key, this.product}) : super(key:key);

  @override
  _ProductView createState() => _ProductView();
}

class _ProductView extends State<ProductView> {

  final CartBloc _cartBloc = CartBloc();
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.73,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Center(
                        child: StreamBuilder(
                            initialData: null,
                            stream: _cartBloc.observableLastOrder,
                            builder: (context, AsyncSnapshot<Order> snapshot) {
                              String tag = snapshot.data == null
                                  ? "tagHero${widget.product.id}"
                                  : "tagHeroOrder${snapshot.data.id}";
                              return Hero(
                                  tag: tag,
                                  child: Image.asset(widget.product.urlToImage,
                                      fit: BoxFit.cover,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4));
                            })),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(widget.product.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("${widget.product.weight}g",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey)),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(children: <Widget>[
                                  InkWell(
                                    child: Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                    onTap: _decrement,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(_quantity.toString(),
                                          style: TextStyle(fontSize: 20))),
                                  InkWell(
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                    onTap: _increment,
                                  ),
                                ]),
                              ),
                              Text(
                                  "\$${(widget.product.price * _quantity).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.black)),
                            ])),
                    Container(
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("About the product:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(widget.product.about,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18)))
                            ]))
                  ])
              )
            ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 30.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              )
            ]),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                      label: Text("")),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: RaisedButton(
                          color: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          padding: EdgeInsets.all(20),
                          onPressed: () {
                            _cartBloc.addOrderToCart(widget.product, _quantity);
                            Navigator.of(context).pop();
                          },
                          child: Text("Add to cart",
                              style: TextStyle(fontWeight: FontWeight.bold))))
                ]),
            )
          ])
      )
    );
  }

}