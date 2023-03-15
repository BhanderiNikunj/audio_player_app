import 'package:audio_player_app/Screen/AudioPlayer/Provider/AudioPlayerProvider.dart';
import 'package:flutter/material.dart';
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

    Provider.of<AudioPlayerProvider>(context,listen: false).initAudio();
  }
  @override
  Widget build(BuildContext context) {
    audioPlayerProviderfalse =
        Provider.of<AudioPlayerProvider>(context, listen: false);
    audioPlayerProvidertrue =
        Provider.of<AudioPlayerProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: audioPlayerProvidertrue!.Image1.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Center(
                  child: Image.asset(
                    "${audioPlayerProviderfalse!.Image1[index]}",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Color(0x86000000),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("${audioPlayerProviderfalse!.Image1[index]}",height: 150,width: 150,),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   onPressed: () {
                      //     audioPlayerProviderfalse!.BackAudio();
                      //   },
                      //   icon: Icon(Icons.skip_previous,color: Colors.white,size: 30,),
                      // ),
                      // SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          audioPlayerProviderfalse!.StartAudio();
                        },
                        icon: Icon(Icons.play_arrow,color: Colors.white,size: 30,),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          audioPlayerProviderfalse!.StopAudio();
                        },
                        icon: Icon(Icons.stop,color: Colors.white,size: 30,),
                      ),
                      // SizedBox(width: 20),
                      // IconButton(
                      //   onPressed: () {
                      //     audioPlayerProviderfalse!.NextAudio();
                      //   },
                      //   icon: Icon(Icons.skip_next,color: Colors.white,size: 30,),
                      // ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
