import 'package:flutter/material.dart';
import 'package:news_app/profile/profile_picture.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Todo: Profile Picture
            ProfilePicture(),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.black,
                ),
                title: Text(
                  'A C C O U N T',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  'S E T T I N G S',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.key,
                  color: Colors.black,
                ),
                title: Text(
                  'P A S S W O R D S',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.chat_bubble,
                  color: Colors.black,
                ),
                title: Text(
                  'L A N G U A G E',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.mobile_friendly,
                  color: Colors.black,
                ),
                title: Text(
                  'D E V I C E S',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
