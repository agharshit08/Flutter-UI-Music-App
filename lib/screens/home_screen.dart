import 'package:flutter/material.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          'Discover',
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle,
              color: kPrimaryColor,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 0.75 * size.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildNavigationRail(), _buildPlaylistAndSongs(size)],
            ),
          ),
          _buildCurrentPlayingSong(size),
          _buildBottomBar()
        ],
      ),
    );
  }

  GestureDetector _buildCurrentPlayingSong(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/song');
      },
      child: Container(
        height: 0.09 * (size.height),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: kSecondaryColor,
        ),
        child: Row(children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/colors.jpg'),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rewrite the stars',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                'Zac Effron',
                style: TextStyle(color: kWhiteColor, fontSize: 12.0),
              ),
            ],
          ),
          Expanded(child: Container()),
          Icon(
            Icons.favorite_border,
            color: kPrimaryColor,
          ),
          SizedBox(width: 10.0),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Icon(
              Icons.pause,
              color: kPrimaryColor,
            ),
          )
        ]),
      ),
    );
  }

  Column _buildPlaylistAndSongs(Size size) {
    return Column(
      children: <Widget>[
        Container(
          height: 0.35*size.height,
          width: size.width*0.8,
          // color: Colors.purple,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            itemBuilder: (context, index) => _buildPlaylistItem(
              image: playlists[index].image,
              title: playlists[index].playlistName
            ),
          ),
        ),
        Container(
          height: 0.40*size.height,
          width: size.width*0.8,
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) => _buildSonglistItem(
              image: songs[index].image,
              title: songs[index].songName,
              subtitle: songs[index].artist,
            ),
          ),
        )
      ],
    );
  }

  NavigationRail _buildNavigationRail() {
    return NavigationRail(
      minWidth: 56.0,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      groupAlignment: -0.1,
      labelType: NavigationRailLabelType.all,
      leading: Column(
        children: [
          Icon(
            Icons.playlist_play,
            color: kPrimaryColor,
          ),
          SizedBox(
            height: 5.0,
          ),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              "Your playlists",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      selectedLabelTextStyle:
          TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      unselectedLabelTextStyle:
          TextStyle(color: kLightColor, fontWeight: FontWeight.bold),
      destinations: [
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: -1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Recent"),
            ),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RotatedBox(
              quarterTurns: -1,
              child: Text("Like"),
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildBottomBar() {
    return Expanded(
      child: Container(
        color: kSecondaryColor,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home,
                color: kLightColor,
              ),
              Icon(
                Icons.search,
                color: kLightColor,
              ),
              Icon(
                Icons.playlist_play,
                color: kLightColor,
              ),
              Icon(
                Icons.favorite_border,
                color: kLightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPlaylistItem({String title, String image}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    width: 220,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      // color: Colors.orange,
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
            height: 0,
          )),
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Icon(
              Icons.play_circle_outline,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildSonglistItem({String image, String title, String subtitle}) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(color: kPrimaryColor),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(color: kLightColor),
    ),
    leading: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}
