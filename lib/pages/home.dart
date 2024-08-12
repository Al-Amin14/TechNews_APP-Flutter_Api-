import 'package:flutter/material.dart';
import 'package:tech_news_app/bacnend/fetching.dart';
import 'package:tech_news_app/components/Search_bar.dart';
import 'package:tech_news_app/components/appbar.dart';
import 'package:tech_news_app/components/newsbox.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/constant.dart';
import 'package:tech_news_app/utils/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchingNews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: appcolors.back,
      appBar: appbar(),
      body: Column(
        children: [
          SerchBar(),
          Expanded(
              child: Container(
            width: w,
            child: FutureBuilder(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage']!=null?snapshot.data![index]['urlToImage']:Containt.imageurl,
                          description:snapshot.data![index]['description'].toString(),
                          title:snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: boldText(
                        text: snapshot.error.toString(),
                        size: 50,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: 50.5,
                      ),
                    );
                  }
                }),
          ))
        ],
      ),
    );
  }
}
