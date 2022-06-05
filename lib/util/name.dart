import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  final List<Widget> items;
  final Duration animationDuration, backDuration, pauseDuration;

  const Name({
    Key? key,
    required this.items,
    this.animationDuration = const Duration(seconds: 1),
    this.backDuration = const Duration(seconds: 1),
    this.pauseDuration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // print("addPostFrameCallback");
      Future.doWhile(_scroll);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),
      child: Row(children: widget.items),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _scroll() async {
    // var pauseDuration = Duration(seconds: 1);
    // var animationDuration = Duration(seconds: 1);
    // var backDuration = Duration(seconds: 1);

    await Future.delayed(widget.pauseDuration);
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: widget.animationDuration, curve: Curves.easeInOut);
    await Future.delayed(widget.pauseDuration);
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: widget.backDuration, curve: Curves.easeInOut);
    return true;
  }
}
