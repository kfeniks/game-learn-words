import 'package:flutter/material.dart';
import 'package:agro_app/agro_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agriparck"),
      ),
      body: Center(
        child: MyWebView(
        //  title: "Alligator.io",
          selectedUrl: "https://www.agriparck.com",
        ),
      ),
    );
  }
}