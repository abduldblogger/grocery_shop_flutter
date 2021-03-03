import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/models/Order.dart';

class OrderWidget extends StatelessWidget {

  final Order _order;
  final double _gridSize;
  OrderWidget(this._order, this._gridSize);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipOval(
              child: Container(
                  color: Colors.white,
                  child: Image.asset(this._order.product.urlToImage),
                  height:
                      (MediaQuery.of(context).size.height - _gridSize) * 0.5)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(this._order.quantity.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          Text("x",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Flexible(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(this._order.product.title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          Flexible(
              flex: 1,
              child: Text("\$${this._order.orderPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)))
        ]);
  }

}