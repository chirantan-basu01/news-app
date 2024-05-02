import 'package:flutter/material.dart';
import '../Profile/profile_page.dart';
import 'add_page.dart';
import 'bookmark_page.dart';
import '../Home/Presentation/home_page.dart';
import 'notification_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  // this selectedIndex is to control
  int _selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPage(),
          ),
        ),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left bar row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomePage();
                        _selectedIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color:
                              _selectedIndex == 0 ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const BookMarkPage();
                        _selectedIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmarks_outlined,
                          color:
                              _selectedIndex == 1 ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Right bar row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const NotificationPage();
                        _selectedIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notification_add_outlined,
                          color:
                              _selectedIndex == 2 ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfilePage();
                        _selectedIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          color:
                              _selectedIndex == 3 ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   title: const Text(
      //     'TC',
      //     style: TextStyle(
      //       color: Colors.green,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.search),
      //       color: Colors.black,
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const SearchScreen(),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: const Padding(
      //         padding: EdgeInsets.only(left: 12.0),
      //         child: Icon(
      //           Icons.menu,
      //           color: Colors.black,
      //         ),
      //       ),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //     ),
      //   ),
      // ),

      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 45, left: 20.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => BookMarkPage()),
                  // ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.bookmarks_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Bookmarks',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NotificationPage()),
                  // ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.notification_add_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Notifications',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AccountPage()),
                  // ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
