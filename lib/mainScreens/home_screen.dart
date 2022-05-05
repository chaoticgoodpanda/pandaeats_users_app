import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pandaeats_users_app/widgets/progress_bar.dart';
import 'package:pandaeats_users_app/widgets/user_drawer.dart';


import '../authentication/auth_screen.dart';
import '../global/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // TODO: Surely there's an easier way to populate this
  final items = [
    "slider/0.jpg",
    "slider/1.jpg",
    "slider/2.jpg",
    "slider/3.jpg",
    "slider/4.jpg",
    "slider/5.jpg",
    "slider/6.jpg",
    "slider/7.jpg",
    "slider/8.jpg",
    "slider/9.jpg",
    "slider/10.jpg",
    "slider/11.jpg",
    "slider/12.jpg",
    "slider/13.jpg",
    "slider/14.jpg",
    "slider/15.jpg",
    "slider/16.jpg",
    "slider/17.jpg",
    "slider/18.jpg",
    "slider/19.jpg",
    "slider/20.jpg",
    "slider/21.jpg",
    "slider/22.jpg",
    "slider/23.jpg",
    "slider/24.jpg",
    "slider/25.jpg",
    "slider/26.jpg",
    "slider/27.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: colorful gradient thingy you'll want to change later
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.amber,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )
          ),
        ),
        title: Text(
          sharedPreferences!.getString("name")!,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      drawer: UserDrawer(),
      body: CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
      child: Container(
        // flexible values for different screen sizes -- take 30% of screen height
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .3,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: items.map((index) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                      index,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            });
          }).toList(),
        ),
    ),
    ),
    ),
      // write query to get seller Json data from firebase
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("sellers")
            .snapshots(),
        builder: (context, snapshot)
        {
          // ternary to see whether there's data or not to retrieve
          return !snapshot.hasData ?
          SliverToBoxAdapter(child: Center(child: circularProgress(),),) :
              Sliver
        },
      ),
    ],
    ),
    );
  }
}