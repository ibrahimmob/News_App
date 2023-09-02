// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapi/helper/article.dart';
import 'package:newsapi/widges/views.dart';

import '../catogry/article.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, this.category});

final String?category;
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<ArticleModel>article=[];
  bool _loading=true;
  @override
  void initState() {

    super.initState();
    getCategoryNews();
  }
  getCategoryNews()async{
    CategoryNews newsclass=CategoryNews();
    await newsclass.getNews(widget.category!);
     article=newsclass.news;
     setState(() {
       _loading=false;
     });
  }
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
      body:_loading?Center(child: CircularProgressIndicator(color: Colors.red,),) :Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: article.length,
          itemBuilder: (context, index) {
            return ArticleTile(
                imageSite: article[index].urlToImage!,
                titleName: article[index].title!,
                description: article[index].description!);
          },
        ),
      ),
    );
  }
}
