import 'package:flutter/material.dart';
import 'package:grocery_shop_flutter/components/CategoryDropMenu.dart';
import 'package:grocery_shop_flutter/components/MinimalCart.dart';
import 'package:grocery_shop_flutter/components/ProductWidget.dart';
import 'package:grocery_shop_flutter/models/Product.dart';
import 'package:grocery_shop_flutter/repositories/ProductsRepository.dart';

class GridShop extends StatefulWidget {
  @override
  _GridShop createState() => _GridShop();
}

class _GridShop extends State<GridShop> {
  @override
  Widget build(BuildContext context) {
    double _gridSize =
        MediaQuery.of(context).size.height * 0.88; //88% of screen
    double childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 1.0);

    List<Product> _products = ProductsRepository().fetchAllProducts();

    return Column(children: <Widget>[
      Container(
          height: _gridSize,
          decoration: BoxDecoration(
              color: const Color(0xFFeeeeee),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_gridSize / 10),
                  bottomRight: Radius.circular(_gridSize / 10))),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CategoryDropMenu(),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.filter_list),
                            label: Text(""))
                      ]),
                  Container(
                      height: _gridSize - 88,
                      margin: EdgeInsets.only(top: 0),
                      child: PhysicalModel(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(_gridSize / 10 - 10),
                              bottomRight:
                                  Radius.circular(_gridSize / 10 - 10)),
                          clipBehavior: Clip.antiAlias,
                          child: GridView.builder(
                              itemCount: _products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: childAspectRatio),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: index % 2 == 0 ? 20 : 0,
                                        right: index % 2 == 0 ? 5 : 0,
                                        left: index % 2 == 1 ? 5 : 0,
                                        bottom: index % 2 == 1 ? 20 : 0),
                                    child: ProductWidget(
                                        product: _products[index]));
                              }))
            )
          ])
          )
        ])
      ),
      MinimalCart(_gridSize)
    ]);
  }

}