import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_f_app/domain/user.dart';
import 'package:my_f_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:my_f_app/service/app_panels.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum ProfileTabs {
  About,
  Photo,
  Events
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileTabs _currentTab = ProfileTabs.About;

  var _isFABVisible = false;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    final profileImage = Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage('asset/images/chatAva.png') //Change to profile.image
            )
        )
    );

    final profileName = Container(
        child: Text(
          user.name.toString() + " " + user.surname.toString(),
          style:  TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        )
    );

    final profilePanel = Container(
        height: 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  profileImage,
                  profileName
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.assignment_ind_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  //tooltip: 'Swipe events',
                  onPressed: () {
                    setState(() {
                      _isFABVisible = false;
                      _currentTab = ProfileTabs.About;
                    });
                  },
                ),
                Text(
                  '|',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      letterSpacing: 0.5,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 30,
                  ),
                  //tooltip: 'Profile',
                  onPressed: () {
                    setState(() {
                      _isFABVisible = false;
                      _currentTab = ProfileTabs.Photo;
                    });
                  },
                ),
                Text(
                  '|',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      letterSpacing: 0.5,
                      color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.format_list_bulleted_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  //tooltip: 'Messages',
                  onPressed: () {
                    setState(() {
                      _isFABVisible = true;
                      _currentTab = ProfileTabs.Events;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFF0069C0)
        )
    );

    Widget ProfileAbout = Center(
      child: Text("About me..."),
    );

    Widget ProfitePhotos = Center(
      child: Text("Photos"),
    );

    Widget ProfileEvets = Center(
      child: Text("Events"),
    );

    Widget currentProfilePage() {
      switch(_currentTab){
        case ProfileTabs.Events:
          return ProfileEvets;
          break;
        case ProfileTabs.Photo:
          return ProfitePhotos;
        case ProfileTabs.About:
        default:
          return ProfileAbout;
      }
    }

    final bottomPanel = JoinMeAppPanels().getBottomPanel(context);

    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                profilePanel,
                currentProfilePage(),
              ],
            ),
          ),
          floatingActionButton: Visibility(
            visible: _isFABVisible,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/events');
              },
              backgroundColor: Color(0xFF0069C0),
              child: const Icon(Icons.add),
            ),
          ),
          bottomSheet: bottomPanel,
        )
    );
  }
}


