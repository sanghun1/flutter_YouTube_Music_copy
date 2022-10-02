import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  final _style = TextStyle(fontSize: 16, color: Color(0xff8c8c8c), fontWeight: FontWeight.w600);

  PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: <Widget>[
        SizedBox(height: 18),
        buildAboutText(),
        SizedBox(height: 400),
        Center(
          child: CircularProgressIndicator(
            // backgroundColor: Colors.white,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildAboutText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildDragHandle(),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("다음 트랙", style: _style),
                Text("가사", style: _style),
                Text("관련 항목", style: _style),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDragHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
