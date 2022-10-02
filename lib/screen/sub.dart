import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/util/panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Sub extends StatefulWidget {
  const Sub({Key? key}) : super(key: key);

  @override
  State<Sub> createState() => _SubState();
}

class _SubState extends State<Sub> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final panelHeightClosed = size.height * 0.1;
    final panelHeightOpen = size.height * 0.9;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff382D0D),
        body: SlidingUpPanel(
          color: Color(0xff594915),
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpen,
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          defaultPanelState: PanelState.OPEN,
          // onPanelOpened: open,
          onPanelClosed: close,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04 , vertical: size.height * 0.18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "album",
                  child: Image.asset(
                    "assets/album.jpg",
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.width * 0.02, horizontal: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hate you", style: TextStyle(fontSize: 18,
                            color: Colors.white),),
                        Text("백예린", style: TextStyle(fontSize: 18, color: Color(0xffB2B9AE)),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.02, horizontal: size.width * 0.04),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.02, horizontal: size.width * 0.02),
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
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

  void close() {
    // Navigator.pushNamed(context, "/home");
    Get.toNamed("/home");

  }
}
