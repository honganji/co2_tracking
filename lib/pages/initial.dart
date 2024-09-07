import 'package:co2_tracking/pages/init_second.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  late VideoPlayerController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> myStrings = [
    "Let's work\ntogether\nto reduce\ncarbon emission!",
    "Let's\nstart\ndecarborning\nthis planet!"
  ];
  int num = 0;

  void _initializeVideoController() {
  _controller = VideoPlayerController.asset('assets/videos/video_1.mp4')
    ..initialize().then((_) {
      setState(() {});
      _controller.play();
      _controller.setLooping(true);
    });
}

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              if (num == 1)
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InitSecond())
                );
                return ;
              }
              setState(() {
                num++;
                // _controller.dispose();
                // _initializeVideoController();
              });
            },
            child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFE8DFCA),
                size: 50,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  // "Let's work\ntogether\nto reduce\ncarbon emission!",
                  myStrings[num],
                  style: const TextStyle(
                      color: Colors.white, fontSize: 40, fontFamily: "Domine"),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
