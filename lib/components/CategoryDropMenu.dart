import 'package:flutter/material.dart';

class CategoryDropMenu extends StatefulWidget {
  @override
  _CategoryDropMenu createState() => _CategoryDropMenu();
}

class _CategoryDropMenu extends State<CategoryDropMenu> {

  String dropdownValue = "Pasta & Noodles";

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String Value) {
        setState(() {
          dropdownValue = Value;
        });
      },
      items: <String>['Pasta & Noodles']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        );
        }).toList(),
      ));
  }

}