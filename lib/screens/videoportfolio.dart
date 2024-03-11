import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoPortfolio extends StatefulWidget {
  const VideoPortfolio({super.key});

  @override
  State<VideoPortfolio> createState() => _VideoPortfolioState();
}

class _VideoPortfolioState extends State<VideoPortfolio> {
  late VideoPlayerController videoController;
  late Future<void> initializePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // videoController = VideoPlayerController.asset('assets/videos/myvideo.mp4');
    final uri = Uri.parse(
        'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_5mb.mp4');
    videoController = VideoPlayerController.networkUrl(uri);
    initializePlayer = videoController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: initializePlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  ),
                  VideoProgressIndicator(videoController, allowScrubbing: true),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (videoController.value.isPlaying) {
            videoController.pause();
          } else {
            videoController.play();
          }
          setState(() {});
        },
        child: FaIcon(videoController.value.isPlaying
            ? FontAwesomeIcons.pause
            : FontAwesomeIcons.play),
      ),
    );
  }
}
