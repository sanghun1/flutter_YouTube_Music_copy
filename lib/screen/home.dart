import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:musicapp/util/panel.dart';

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
  double _value = 0.0;
  int min = 0;
  int second = 0;
  String cnt = "";

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
        backgroundColor: Color(0xff233316),
        body: SlidingUpPanel(
          color: Color(0xff334D20),
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpen,
          onPanelOpened: open,
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          // onPanelClosed: close,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 20),
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
                            [Color(0xff334D20)],
                            [Color(0xff334D20)]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Color(0xff0A0D06),
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
                                    child: Marquee(
                                      text: 'Brand(feat. Layone)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                      scrollAxis: Axis.horizontal,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      blankSpace: 70.0,
                                      velocity: 40.0,
                                      pauseAfterRound: Duration(seconds: 1),
                                      startPadding: 0.0,
                                      accelerationDuration:
                                          Duration(seconds: 1),
                                      accelerationCurve: Curves.linear,
                                      decelerationDuration:
                                          Duration(milliseconds: 500),
                                    ),
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
                            "BE'O",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffB2B9AE),
                            ),
                          ),
                          Column(
                            children: [
                              Slider(
                                min: 0.0,
                                max: 159.0,
                                value: _value,
                                activeColor: Colors.white,
                                inactiveColor: Color(0xff737E6E),
                                onChanged: (value) {
                                  setState(() {
                                    // print(_value);
                                    // print("min : ${min}");
                                    // print("second : ${second}");
                                    _value = value;
                                  });
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${min}:${cnt}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff737E6E),
                                    ),
                                  ),
                                  Text(
                                    "2:39",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff737E6E),
                                    ),
                                  ),
                                ],
                              )
                            ],
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
                                    width: 100,
                                    height: 100,
                                    color: Color(0xff334D20),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 55,
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
                  color: Color(0xff334D20),
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
