import 'package:flutter/material.dart';
import 'screen_breakpoints.dart';

class CreativeResponsiveValue<T> {
  final T _mobile, _tablet, _desktop;
  final BuildContext _context;

  CreativeResponsiveValue(this._context,
      {required T mobile, T? tablet, required T desktop})
      : _desktop = desktop,
        _tablet = tablet ?? desktop,
        _mobile = mobile;

  T get value {
    final width = MediaQuery.of(_context).size.width;
    if (width < CreativeScreenBreakpoints.tablet) {
      return _mobile;
    } else if (width < CreativeScreenBreakpoints.desktop) {
      return _tablet;
    } else {
      return _desktop;
    }
  }
}