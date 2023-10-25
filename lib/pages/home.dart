import 'package:flutter/material.dart' hide SearchBar;
import 'package:tech_news/backend/function.dart';
import 'package:tech_news/components/appbar.dart';
import 'package:tech_news/components/newsbox.dart';
import 'package:tech_news/components/searchbar.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/constants.dart';

class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() {
    return _HomeState();
  }

  static int currentIndex = 0;
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  void selectedCategory(int index) {
    setState(() {
      Home.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: SizedBox(
                width: w,
                child: FutureBuilder<List>(
                  future: fetchnews(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data![index]['url'],
                            imageurl: snapshot.data![index]['urlToImage'] ??
                                Constants.imageurl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'].toString(),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ));
                  },
                )),
          ),
          BottomNavigationBar(
            currentIndex: Home.currentIndex,
            onTap: selectedCategory, items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart), label: 'Techonology'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business_sharp), label: 'Bussiness'),
            BottomNavigationBarItem(
                icon: Icon(Icons.science), label: 'Science'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_esports), label: 'Sports'),
          ]),
        ],
      ),
    );
  }
}
