// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapi/catogry/article.dart';
import 'package:newsapi/helper/addpathmaumal.dart';
import 'package:newsapi/helper/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapi/widges/article.view.dart';
import 'package:newsapi/widges/category_screen.dart';

import '../catogry/catogry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> catogry = [];
  List<ArticleModel> article = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    catogry = ApiCategory().getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;
    setState(() {
      _loading = false;
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
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: catogry.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            catogryName: catogry[index].title!,
                            catogryImage: catogry[index].urlToImage!,
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: article.length,
                        itemBuilder: (context, index) {
                          return ArticleTile(
                              imageSite: article[index].urlToImage!,
                              titleName: article[index].title!,
                              description: article[index].description!,
                              url: article[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  CategoryTile(
      {super.key,  this.catogryName,  this.catogryImage});

  final String? catogryName;
  final String? catogryImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoriesScreen( category: catogryName!.toLowerCase(),),)
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: catogryImage!,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Text(
                "$catogryName",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  const ArticleTile(
      {super.key,
       this.imageSite,
       this.description,
       this.titleName,
        this.url});

  final String? imageSite;
  final String? description;
  final String? titleName;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url),));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageSite!),
            ),
            Text(
              titleName!,
              style: TextStyle(
                  color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              description!,
              style: TextStyle(
                  color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
