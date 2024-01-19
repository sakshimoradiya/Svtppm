import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

import '../model/userModal.dart';

class AudioController extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = Duration.zero;

  Logger logger = Logger();

  AudioController() {
    // logger.e('hello');
    // logger.e(MySong);
  }

  setPath(String path) async {
    logger.e(path);

    assetsAudioPlayer
        .open(
          Audio(path, metas: Metas()),
          autoStart: false,
        )
        .then(
          (value) =>
              {totalDuration = assetsAudioPlayer.current.value!.audio.duration},
        );
  }

  play() async {
    await assetsAudioPlayer.play();
  }

  skip({required int second}) async {
    await assetsAudioPlayer.seekBy(
      Duration(seconds: 10),
    );
  }

  seek({required int second}) async {
    await assetsAudioPlayer.seek(
      Duration(seconds: second),
    );
  }

  pause() async {
    await assetsAudioPlayer.pause();
  }

  get isPlaying {
    return assetsAudioPlayer.isPlaying.value;
  }

  get currentPosition {
    return assetsAudioPlayer.currentPosition;
  }
}

class videoController extends ChangeNotifier {
   static late VideoPlayerController videoPlayerController;
  static late ChewieController chewieController;

  List<String> videos = [
    "assets/video/khalasi.mp4",
    "assets/video/sorath.mp4",
  ];

  videoController() {
    init();
  }

  init({int index = 0}) {
    videoPlayerController = VideoPlayerController.asset(
      videos[index],
    )..initialize().then((value) {
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            aspectRatio: videoPlayerController.value.aspectRatio);
        notifyListeners();
      });
  }

  changeIndex({required int index}) {
    videoPlayerController.play();
    chewieController.pause();
    notifyListeners();
  }

  play() async {
    await videoPlayerController.play();
    notifyListeners();
  }

  pause() async {
    await videoPlayerController.pause();
    notifyListeners();
  }
}
