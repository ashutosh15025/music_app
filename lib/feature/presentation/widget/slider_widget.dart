import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget(
      {super.key, required this.url, required this.counterCallback, required this.songLoading});
  final Function songLoading;
  final String url;
  final Function(int) counterCallback;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentTime = 0;
  double timing = 0;
  Timer? timer;
  int songIndex = -1;
  AudioPlayer? player;
  bool playing = true;
  bool loader = true;

  @override
  void initState() {
    player = null;
    playing = true;
    loader=true;
    playMusic();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SliderWidget oldWidget) {
    playing = true;
    timer?.cancel();
    player?.release();
    playMusic();
    print("object");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    player?.release();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: [
            Container(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 5,
                ),
                child: Slider(
                  activeColor: Color.fromRGBO(30, 206, 240, 1),
                  value: currentTime,
                  max: timing,
                  thumbColor: Colors.white,
                  onChanged: (double value) {
                    setState(() {
                      player?.seek(Duration(milliseconds: value.toInt()));
                      currentTime = value;
                    });
                  },
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(16, 0, 20, 0),
                child: Row(
                  children: [
                    Text(
                      timeInMinute(currentTime.toInt()),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      timeInMinute(timing.toInt()),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.fromLTRB(16, 0, 20, 0),
                child: Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        widget.counterCallback(-1);
                      },
                      child: Container(
                          height: 22,
                          width: 21,
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Image.asset("assets/back.png")),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (playing) {
                            timer?.cancel();
                            player?.pause();
                          } else {
                            player?.resume();
                            setUpTimer();
                          }
                          playing = !playing;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: playing
                            ? Image.asset("assets/pause.png")
                            : Image.asset("assets/play.png"),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          widget.counterCallback(1);
                        },
                        child: Container(
                            height: 22,
                            width: 21,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Image.asset("assets/forwardSong.png"))),
                    Spacer(),
                  ],
                ))
          ],
        ),
      );
  }
  void InititialState() async{
     playMusic();
     widget.songLoading();


  }
  void playMusic() async {
    player = AudioPlayer();
    currentTime = 0;
    await player?.play(UrlSource(widget.url));
    timing = (await player?.getDuration())!.inMilliseconds.toDouble();
    setUpTimer();
    if(loader){
      loader=!loader;
      widget.songLoading();}
  }

  void setUpTimer() {
    timer = Timer.periodic(Duration(milliseconds: 50), ((timer) {
      setState(() {
        if (playing && currentTime < timing) {
          currentTime += 50;
        }
        if (currentTime >= timing) {
          playing = false;
          currentTime = timing.toDouble();
          timer.cancel();
          player?.pause();
          widget.counterCallback(1);
        }
      });
    }));
  }

  String timeInMinute(int duration) {
    return "${(duration / 60000).toInt()}.${((duration % 60000) / 1000).toInt().toString()}";
  }
}
