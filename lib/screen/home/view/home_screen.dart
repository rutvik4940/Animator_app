
import 'package:flutter/material.dart';
import 'package:planet_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_helper.dart';
import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().planetgetdata();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller!.addListener(() {setState(() {
    });});
    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Planets",
            style:
            Theme.of(context).textTheme.titleSmall
        ),

        centerTitle: true,
        actions: [
      Consumer<HomeProvider>(
      builder: (context, value1, child) => Switch(
      value: value1.isLight,
      onChanged: (value) {
        ShareHelper  shr=ShareHelper.shareHelper;
         shr.setTheme(value);
        value1.changeTheme();
       },
    ),
      ),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'bookmark');
          }, icon: Icon(Icons.bookmark_add))
        ],
      ),
      body: Stack(
        children: [
          providerW!.isLight==false?Image.asset(
            "assets/image/r6.png",
            fit: BoxFit.cover,
            height: MediaQuery
                .sizeOf(context)
                .height,
          ): Image.asset(
            "assets/image/g1.png",
            fit: BoxFit.cover,
            height: MediaQuery
                .sizeOf(context)
                .height,
          ),
          ListView.builder(
            itemCount: providerW!.planetdata.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    PlanetModel p1 = providerR!.planetdata[index];
                    Navigator.pushNamed(context, 'detail', arguments: p1);
                  },
                  child: Container(
                    //  duration: Duration(seconds: 3),
                    // curve: Curves.easeInCubic,
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          RotationTransition(
                            turns: controller!,
                            child: Hero(
                              tag: '${providerW!.planetdata[index].image}',
                              child: Image.asset(
                                "${providerW!.planetdata[index].image}",
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${providerW!.planetdata[index].name}",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}
