import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/bloc/CartBloc.dart';
import 'package:grocery_shop_flutter/components/CartManager.dart';
import 'package:grocery_shop_flutter/components/GridShop.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _showCart = false;
  CartBloc _cartBloc;

  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    _scrollController = ScrollController();
    _cartBloc = CartBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: Stack(children: <Widget>[
          CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(child: GridShop()),
                SliverToBoxAdapter(child: CartManager()),
              ]),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: FloatingActionButton(
                      onPressed: () {
                        if (_showCart)
                          _scrollController.animateTo(
                              _scrollController.position.minScrollExtent,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2));
                        else
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(seconds: 2));

                        setState(() {
                          _showCart = !_showCart;
                        });
                      },
                      backgroundColor: Colors.amber,
                      child:
                          Icon(_showCart ? Icons.close : Icons.shopping_cart)))
        )
      ])
    );
  }


  @override
  void dispose() {
    _cartBloc.dispose();
    super.dispose();
  }
}
