import 'package:flutter/material.dart';
import 'screen_breakpoints.dart';

class CreativeResponsiveWidget extends StatelessWidget {
  final bool useLayoutBuilder;
  final Widget desktop, mobile;
  final Widget _tablet;
  const CreativeResponsiveWidget(
      {Key? key,
      required this.desktop,
      required this.mobile,
      Widget? tablet,
      this.useLayoutBuilder = false})
      : _tablet = tablet ?? desktop,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (useLayoutBuilder) {
      return LayoutBuilder(
          builder: (context, constraits) => _widget(constraits.maxWidth));
    }
    final width = MediaQuery.of(context).size.width;
    return _widget(width);
  }

  Widget _widget(double width) {
    if (width < CreativeScreenBreakpoints.tablet) {
      return mobile;
    } else if (width < CreativeScreenBreakpoints.desktop) {
      return _tablet;
    } else {
      return desktop;
    }
  }
}