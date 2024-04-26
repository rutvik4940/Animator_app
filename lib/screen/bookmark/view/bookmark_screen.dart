import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<HomeProvider>().getData();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("bookmark"),
      ),
      body: Expanded(
        child: ListView.builder(itemCount:providerW!.nameList.length ,itemBuilder:  (context, index) {
          Container(
              //  duration: Duration(seconds: 3),
              // curve: Curves.easeInCubic,
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          ),
            child: Row(
              children: [
                Image.asset("${providerW!.imageList![index]}"),
              Text("${providerW!.nameList[index]}"),
              ],
            ),
          );
        },),
      ),
    );
  }
}
