import 'package:audio_player_app/Screen/AudioPlayer/Provider/AudioPlayerProvider.dart';
import 'package:audio_player_app/Screen/AudioPlayer/View/AudioPlayerScreen.dart';
import 'package:audio_player_app/Screen/HomePage/View/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioPlayerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          'audio': (context) => const AudioPlayerScreen(),
        },
      ),
    ),
  );
}
