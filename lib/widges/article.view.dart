// ignore_for_file: avoid_unnecessary_containers, depend_on_referenced_packages, prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
   ArticleView({super.key, this.blogUrl});
  final String? blogUrl;


  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text(
          "flutter news",
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: Colors.black,)),
        centerTitle: true,
      ),
      body:

      Container(
        child: WebView(

          initialUrl: widget.blogUrl,


    ),
        ),
    );
  }
}
