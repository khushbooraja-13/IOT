import 'package:flutter/material.dart';
import 'package:podcast/home_screen.dart';

class Playing extends StatefulWidget {
  Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  bool isIconOn = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        child: Image.asset(
                          'assets/background.png',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        height: MediaQuery.of(context).size.height * 0.6,
                      )),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Image.asset("assets/doraemon.png")),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      leading: InkWell(onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        },));
                      },
                        child: Card(
                            color: Colors.white70,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        'Now Playing',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      trailing: Card(
                          color: Colors.white60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: MediaQuery.of(context).size.width * 0.25,
                    right: MediaQuery.of(context).size.width * 0.25,
                    child: Container(
                        height: 50,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(child: Icon(Icons.share_outlined)),
                            InkWell( onTap: () {
                              setState(() {
                                isIconOn = !isIconOn;
                              });
                            },
                                child: Icon(
                                  isIconOn ? Icons.favorite : Icons.favorite_border,
                                  color: isIconOn ? Colors.red : null,
                                )),
                            Container(child: Icon(Icons.downloading)),
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Lily Williams',
                    style: TextStyle(fontSize: 18),
                  )),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Wellness and Mental Health',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  'Insights',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                // child: MusicVisualizer(
                //   barCount: 30,
                //   colors: [Colors.orange,Colors.grey.shade400],
                //   duration: [100, 200, 300, 200, 100],
                // )
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade400,
                  value: 0.6,
                  valueColor: AlwaysStoppedAnimation(Colors.orange),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                // margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('18:35'),
                    Text('40:20'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.skip_previous,
                    color: Colors.black,
                    size: 35,
                  ),
                  Image.asset('assets/pics/replay.png',height: 35,),
                  Icon(
                    Icons.play_circle,
                    color: Colors.orange,
                    size: 60,
                  ),
                  Image.asset('assets/pics/fastforward.png',height: 45,),
                  Icon(
                    Icons.skip_next,
                    color: Colors.black,
                    size: 35,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => true;
}