import 'package:audio_player_app/Screen/AudioPlayer/Provider/AudioPlayerProvider.dart';
import 'package:audio_player_app/Screen/AudioPlayer/View/AudioPlayerScreen.dart';
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
        routes: {
          '/': (context) => const AudioPlayerScreen(),
        },
      ),
    ),
  );
}
