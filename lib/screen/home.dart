import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:musicapp/util/panel.dart';
import 'package:musicapp/util/page_manager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Home(),
//       ),
//     );
//   }
// }

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageManager _pageManager;

  double _value = 0.0;
  int min = 0;
  int second = 0;
  String cnt = "";

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final panelHeightClosed = size.height * 0.1;
    final panelHeightOpen = size.height * 0.9;

    min = (_value / 60).floor();
    second = (_value % 60).floor();

    if (second <= 9) {
      cnt = "0${second}";
    } else {
      cnt = "${second}";
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff382D0D),
        body: SlidingUpPanel(
          color: Color(0xff594915),
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpen,
          onPanelOpened: open,
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          // onPanelClosed: close,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20, 15.0, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                        ToggleSwitch(
                          minWidth: 95.0,
                          minHeight: 45,
                          cornerRadius: 25.0,
                          activeBgColors: [
                            [Color(0xff594915)],
                            [Color(0xff594915)]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Color(0xff0D0A03),
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: ['노래', '동영상'],
                          fontSize: 16,
                          radiusStyle: true,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 1 / 12,
                          size.height * 1 / 10,
                          size.width * 1 / 10,
                          size.height * 1 / 10),
                      child: Column(
                        children: [
                          Hero(
                              tag: "album",
                              child: Image.asset("assets/album.jpg")),
                          // assets/
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                size.width * 1 / 30,
                                size.height * 1 / 30,
                                size.width * 1 / 30,
                                size.height * 1 / 150),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.thumb_down_alt_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Container(
                                  height: 40,
                                  width: 240,
                                  child: Expanded(
                                    child: Center(
                                      child: Text(
                                        "Hate you",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Marquee(
                                    //   text: 'Hate you',
                                    //   style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 28,
                                    //       fontWeight: FontWeight.bold),
                                    //   scrollAxis: Axis.horizontal,
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //   blankSpace: 100.0,
                                    //   velocity: 40.0,
                                    //   pauseAfterRound: Duration(seconds: 1),
                                    //   startPadding: 0.0,
                                    //   accelerationDuration:
                                    //       Duration(seconds: 1),
                                    //   accelerationCurve: Curves.linear,
                                    //   decelerationDuration:
                                    //       Duration(milliseconds: 500),
                                    // ),
                                  ),
                                ),
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "백예린",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffB2B9AE),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, size.height * 1 / 50, 0, 0),
                            child: Column(
                              children: [
                                ValueListenableBuilder<ProgressBarState>(
                                  valueListenable:
                                      _pageManager.progressNotifier,
                                  builder: (_, value, __) {
                                    return ProgressBar(
                                      progressBarColor: Colors.white,
                                      baseBarColor: Color(0xff5F583C),
                                      bufferedBarColor: Color(0xff807A64),
                                      thumbColor: Colors.white,
                                      timeLabelPadding: 5.0,
                                      timeLabelTextStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Color(0xffBCB8AC),
                                      ),
                                      progress: value.current,
                                      buffered: value.buffered,
                                      total: value.total,
                                      onSeek: _pageManager.seek,
                                    );
                                  },
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "${min}:${cnt}",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.w400,
                                //         fontSize: 15,
                                //         color: Color(0xff737E6E),
                                //       ),
                                //     ),
                                //     Text(
                                //       "2:39",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.w400,
                                //         fontSize: 15,
                                //         color: Color(0xff737E6E),
                                //       ),
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                size.width * 0,
                                size.height * 1 / 100,
                                size.width * 0,
                                size.height * 1 / 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.shuffle,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    color: Color(0xff594915),
                                    child: ValueListenableBuilder<ButtonState>(
                                      valueListenable:
                                          _pageManager.buttonNotifier,
                                      builder: (_, value, __) {
                                        switch (value) {
                                          case ButtonState.loading:
                                            return Container(
                                              margin: const EdgeInsets.all(8.0),
                                              width: 32.0,
                                              height: 32.0,
                                              color: Colors.white,
                                              child:
                                                  const CircularProgressIndicator(),
                                            );
                                          case ButtonState.paused:
                                            return IconButton(
                                              icon:
                                                  const Icon(Icons.play_arrow),
                                              iconSize: 45.0,
                                              color: Colors.white,
                                              onPressed: _pageManager.play,
                                            );
                                          case ButtonState.playing:
                                            return IconButton(
                                              icon: const Icon(Icons.pause),
                                              iconSize: 45.0,
                                              color: Colors.white,
                                              onPressed: _pageManager.pause,
                                            );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: 45,
                                ),
                                Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: Color(0xff594915),
                  padding: EdgeInsets.fromLTRB(
                      size.width * 18 / 40, 12, size.width * 18 / 40, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      color: Color(0xff737E6E),
                    ),
                  ),
                ),
              )
            ],
          ),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
          ),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(panelHeightClosed * 0.1)),
        ),
      ),
    );
  }

  void open() {
    Navigator.pushNamed(context, "/sub");
  }
}
