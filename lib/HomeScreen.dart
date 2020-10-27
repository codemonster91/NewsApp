import 'package:api_by_mobx/FullStoryScreen.dart';
import 'package:api_by_mobx/NewsCustomCard.dart';
import 'package:api_by_mobx/TopNewsApiModel.dart';
import 'package:api_by_mobx/TopTechNewsApiModel.dart';
import 'package:api_by_mobx/news_api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsApiStore storeobj;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeobj = new NewsApiStore();
    storeobj.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // NewsApiStore storeobj = new NewsApiStore();
    // storeobj.fetchData();
    // NewsApiCalls obj = new NewsApiCalls();
    // obj.getTechNews();
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body:
          // FutureBuilder(
          //   builder: (context, snapshot) {
          //     if (snapshot.data == null) {
          //       return Center(child: CircularProgressIndicator());
          //     } else {
          //       TopTechNewsApiModel obj = snapshot.data;
          // return Text(obj.articles.elementAt(0).title);
          Container(
        color: Colors.black12,
        child: storeobj.topNewsApiModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Observer(builder: (context) {
                print(storeobj.topNewsApiModel.status + "------------");

                return ListView.builder(
                    itemBuilder: (context, index) {
                      TopNewsApiModel obj= storeobj.topNewsApiModel;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FullStoryScreen(
                                    text: obj.articles
                                        .elementAt(index)
                                        .title,
                                    url: obj.articles
                                        .elementAt(index)
                                        .url,
                                  )));
                        },
                        child: NewsCustomCard().showCard(
                            context: context,
                            title: obj.articles
                                .elementAt(index)
                                .title,
                            description: obj.articles
                                .elementAt(index)
                                .description,
                            image_url: obj.articles
                                .elementAt(index)
                                .urlToImage,
                            link: obj.articles
                                .elementAt(index)
                                .url,
                            source: obj.articles
                                .elementAt(index)
                                .source
                                .name,
                            time: storeobj.topNewsApiModel.articles
                                .elementAt(index)
                                .publishedAt),
                      );
                    },
                    itemCount: storeobj.topNewsApiModel.articles.length);
              }),
        // );
        // }
        // },
        // future: NewsApiCalls().getTechNews(),
      ),
    );
  }
}
