import 'package:flutter/material.dart';

class Lab10 extends StatefulWidget {
  const Lab10({super.key});

  @override
  State<Lab10> createState() => _Lab10State();
}

class _Lab10State extends State<Lab10> with TickerProviderStateMixin {
  late TabController _myTabController;

  @override
  void initState() {
    super.initState();
    _myTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(controller: _myTabController, tabs: [
            Tab(
              text: 'Chats',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Call',
            ),
          ]),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/pics/shinchan.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shinchan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('shinchan@gmail.com')
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.grey.shade400,),
                title: Text('Home'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey.shade300,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.account_circle_rounded, color: Colors.grey.shade400,),
                title: Text('About'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey.shade300,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey.shade400,),
                title: Text('Settings'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _myTabController,
          children: [
            ListTile(
              title: Center(
                child: Text(
                  'Chats',
                  style: TextStyle(
                      color: Colors.purpleAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Status',
                  style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Call',
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
