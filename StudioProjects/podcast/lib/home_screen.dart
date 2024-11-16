import 'package:flutter/material.dart';
import 'package:podcast/login_screen.dart';
import 'package:podcast/playing.dart';
import 'package:podcast/search_screen.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/pics/girl3.webp'),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.green,
                            ))
                      ],
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Text(
                            'Hi Bruce',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          height: 25,
                        ),
                        Container(
                          child: Text(
                            'Your Friendly Podcast Destination',
                            style: TextStyle(fontSize: 15),
                          ),
                          height: 25,
                        ),
                      ],
                    ),
                    trailing: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: 22,
                      ),
                    ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Trending Podcast',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Container(
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey.shade400))),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                height: 150,
                                width: 260,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset('assets/background.png',
                                      fit: BoxFit.cover),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          lstPngName[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          lstSubPng1[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          lstSubPng2[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(colStr[index]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Container(
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Icon(Icons.play_circle),
                                                Text(lstSub4[index]),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                  Image.asset(
                                    arrPng[index],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Recommended For Today',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Container(
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey.shade400))),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 200,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  arrImg[index],
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    lstName[index],
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    lstSub1[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    lstSub2[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    child: Text(
                      'Recently Played',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    alignment: Alignment.centerLeft,
                    height: 50,
                  ),
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              child: ClipRRect(
                                child: Image.asset(
                                  arrImg[index],
                                  width: 50,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.black, width: 2)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: Text(
                                      lstName[index],
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      lstSub1[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      lstSub2[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.circle,
                                          size: 5,
                                          color: Colors.grey[400],
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Container(
                                        child: Text(
                                          lstSub3[index],
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        ),
                                        alignment: Alignment.center,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            flex: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.play_circle,
                              size: 30,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ]),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.home_outlined,
                        size: 28,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ));
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.search_outlined,
                        size: 28,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return SearchScreen();
                          },
                        ));
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Playing();
                          },
                        ));
                      },
                      child: Icon(
                        Icons.bookmark_border_rounded,
                        size: 28,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        },));
                      },
                      child: Icon(
                        Icons.person_outline,
                        size: 28,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}