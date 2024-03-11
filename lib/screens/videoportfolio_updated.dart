import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPortfolio extends StatefulWidget {
  const VideoPortfolio({super.key});

  @override
  State<VideoPortfolio> createState() => _VideoPortfolioState();
}

class _VideoPortfolioState extends State<VideoPortfolio> {
  late VideoPlayerController videoController;
  late ChewieController chewieController;
  // late Future<void> initializePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // videoController = VideoPlayerController.asset('assets/videos/myvideo.mp4');
    final uri = Uri.parse(
        'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_5mb.mp4');
    videoController = VideoPlayerController.networkUrl(uri);
    videoController.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: videoController,
        allowFullScreen: true,
        allowPlaybackSpeedChanging: true,
        aspectRatio: videoController.value.aspectRatio,
        autoPlay: false,
        looping: false,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoController.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (videoController.value.isPlaying) {
      //       videoController.pause();
      //     } else {
      //       videoController.play();
      //     }
      //     setState(() {});
      //   },
      //   child: FaIcon(videoController.value.isPlaying
      //       ? FontAwesomeIcons.pause
      //       : FontAwesomeIcons.play),
      // ),
    );
  }
}
