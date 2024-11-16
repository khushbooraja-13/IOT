import 'package:flutter/material.dart';
import 'package:podcast/home_screen.dart';

import 'constants.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return HomeScreen();
                              },
                            ));
                          },
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_back_ios_new_outlined),
                          )),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                        height: 50,
                      ),
                      Container(
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.filter_alt),
                        )),
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Search Podcast...',
                              hintText: 'Search Podcast...',
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(width: 3)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.purpleAccent)))),
                      height: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text(
                      'Top Categories',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    height: 35,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(6),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              color: colColor[index],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                    colStr[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                              Text(
                                '240 Podcast',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text(
                      'Popular Podcast',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    height: 35,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: ClipRRect(
                                child: Image.asset(
                                  arrImg[index],
                                  width: 80,
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
                                          '16 min',
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
                          Expanded(
                            child: Container(
                              child: Icon(
                                Icons.play_circle,
                                size: 30,
                                color: Colors.orange,
                              ),
                              height: 80,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/pics/girl3.webp'),
                    ),
                    title: Text(
                      'Seasonal Wellness: Navigating\nHealth Through the Year',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.play_circle,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      value: 0.6,
                      valueColor: AlwaysStoppedAnimation(Colors.orange),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
