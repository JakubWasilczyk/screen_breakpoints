import 'package:flutter/widgets.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

extension BreakpointExtension on BuildContext {
  Breakpoint get breakpoint => Breakpoint.fromContext(this);
}
