import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planet_app/screen/home/model/home_model.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  HomeProvider? providerR;
  HomeProvider? providerW;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().planetgetdata();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller!.addListener(() {});
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
    PlanetModel p1 = ModalRoute
        .of(context)!
        .settings
        .arguments as PlanetModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${p1.name}",
            style:
            TextStyle(color: Colors.white,fontFamily: "f6",fontWeight: FontWeight.bold)
        ),
        backgroundColor: Colors.black ,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          // IconButton(onPressed: () {
          //   providerR!.setData(
          //       n1: p1.name, i1: p1.image!, d1: p1.description!);
          // }, icon: Icon(Icons.favorite))
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
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const SizedBox(
            height: 50,
          ),
          RotationTransition(
            turns: controller!,
            child: Hero(
              tag: "${p1.image}",
              child: Image.asset("${p1.image}"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${p1.description}",
              style:
              Theme
                  .of(context)
                  .textTheme
                  .titleSmall),
        const SizedBox(
          height: 20,
        ),
        Text("distance_sun:${p1.distance_sun}",
            style:
            Theme.of(context).textTheme.titleSmall),
        Text("gravity:${p1.gravity}",
            style:
            Theme.of(context).textTheme.titleSmall),
        ],
      ),
    ),),
    ]
    ),
    );
  }

}
