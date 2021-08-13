import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  static const routeName = "/edit-product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Your Product"),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter The Product Title", labelText: "title"),
            )
          ],
        ),
      )),
    );
  }
}
