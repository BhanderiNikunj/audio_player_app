import 'package:audio_player_app/Screen/AudioPlayer/Provider/AudioPlayerProvider.dart';
import 'package:audio_player_app/Screen/AudioPlayer/View/AudioPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayerProvider? audioPlayerProvidertrue, audioPlayerProviderfalse;
  List Screens = [
    AudioPlayerScreen(),
    AudioPlayerScreen(),
    AudioPlayerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    audioPlayerProviderfalse =
        Provider.of<AudioPlayerProvider>(context, listen: false);
    audioPlayerProvidertrue =
        Provider.of<AudioPlayerProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Screens[audioPlayerProvidertrue!.i],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: audioPlayerProvidertrue!.i,
          onTap: (value) {
            audioPlayerProviderfalse!.changeScreen(value);
          },
          selectedFontSize: 20,
          selectedIconTheme: IconThemeData(color: Colors.black, size: 40),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_arrow,
              ),
              label: "Video",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
