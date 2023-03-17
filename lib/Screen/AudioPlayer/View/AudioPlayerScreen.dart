import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_app/Screen/AudioPlayer/Provider/AudioPlayerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayerProvider? audioPlayerProvidertrue, audioPlayerProviderfalse;

  @override
  void initState() {
    super.initState();

    Provider.of<AudioPlayerProvider>(context, listen: false).initAudio();
  }

  @override
  Widget build(BuildContext context) {
    audioPlayerProviderfalse =
        Provider.of<AudioPlayerProvider>(context, listen: false);
    audioPlayerProvidertrue =
        Provider.of<AudioPlayerProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: Stack(
          children: [
            Image.asset(
              "${audioPlayerProviderfalse!.GodImage[2]}",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.topLeft,
              color: Colors.white10,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "${audioPlayerProviderfalse!.GodImage[2]}",
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  PlayerBuilder.currentPosition(
                    player: audioPlayerProviderfalse!.assetsAudioPlayer!,
                    builder: (context, position) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.playlist_add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "${audioPlayerProviderfalse!.GodName[2]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) {
                              audioPlayerProviderfalse!.assetsAudioPlayer!.seek(
                                Duration(
                                  seconds: value.toInt(),
                                ),
                              );
                            },
                            max: audioPlayerProviderfalse!.TotalDuration.inSeconds
                                .toDouble(),
                            autofocus: true,
                            thumbColor: Colors.white,
                            activeColor: Colors.white70,
                            inactiveColor: Colors.white10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${position.inHours} : ${position.inMinutes} : ${position.inSeconds.toInt()}",style: TextStyle(color: Colors.white,fontSize: 15),),
                                Text("${audioPlayerProvidertrue!.TotalDuration.inHours} : ${audioPlayerProvidertrue!.TotalDuration.inMinutes} : ${audioPlayerProvidertrue!.TotalDuration.inSeconds}",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                  border: Border.all(
                                    color: Colors.white,
                                    strokeAlign: StrokeAlign.center,
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    audioPlayerProviderfalse!.BackAudio();
                                  },
                                  icon: Icon(
                                    Icons.skip_previous,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                  border: Border.all(
                                    color: Colors.white,
                                    strokeAlign: StrokeAlign.center,
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    audioPlayerProviderfalse!.changeIcon();
                                  },
                                  icon: Icon(
                                    audioPlayerProvidertrue!.a
                                        ? Icons.play_arrow
                                        : Icons.stop,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white10,
                                  border: Border.all(
                                    color: Colors.white,
                                    strokeAlign: StrokeAlign.center,
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    audioPlayerProviderfalse!.NextAudio();
                                  },
                                  icon: Icon(
                                    Icons.skip_next,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
