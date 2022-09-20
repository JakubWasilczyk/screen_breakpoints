import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

class Breakpoint extends Equatable {
  // Breakpoint from which it will apply
  final double breakpoint;

  // Body maximum width
  final double width;

  // Margin (only left and right)
  final double? _marginValue;

  // Margin (only left and right)
  EdgeInsets? get margin => _marginValue != null ? EdgeInsets.symmetric(horizontal: _marginValue!) : null;

  // Padding (only left and right)
  final double _paddingValue;

  // Padding (only left and right)
  EdgeInsets get padding => EdgeInsets.symmetric(horizontal: _paddingValue);

  // Number of columns on that breakpoint
  final int columns;

  const Breakpoint({
    required this.breakpoint,
    required this.width,
    required double? margin,
    required double padding,
    required this.columns,
  })  : _marginValue = margin,
        _paddingValue = padding;

  @override
  List<Object?> get props => [breakpoint, width, margin, padding, columns];

  bool operator >(dynamic other) {
    if (other is double) return breakpoint > other;
    if (other is! Breakpoint) return false;
    return breakpoint > other.breakpoint;
  }

  bool operator <(dynamic other) {
    if (other is double) return breakpoint < other;
    if (other is! Breakpoint) return false;
    return breakpoint < other.breakpoint;
  }

  bool operator >=(dynamic other) {
    if (other is double) return breakpoint >= other;
    if (other is! Breakpoint) return false;
    return breakpoint >= other.breakpoint;
  }

  bool operator <=(dynamic other) {
    if (other is double) return breakpoint <= other;
    if (other is! Breakpoint) return false;
    return breakpoint <= other.breakpoint;
  }

  static Breakpoint fromMediaQuery(MediaQueryData mediaQuery, [BreakpointConfiguration? configuration]) {
    final breakpoints = (configuration ?? kDefaultBreakpoints).breakpoints;
    final width = mediaQuery.size.width;
    for (int i = breakpoints.length - 1; i >= 0; i--) {
      final breakpoint = breakpoints[i];
      if (breakpoint <= width) return breakpoint;
    }
    return breakpoints.first;
  }

  static Breakpoint fromContext(BuildContext context) {
    final configuration = BreakpointConfigurator.maybeOf(context)?.configuration;
    return fromMediaQuery(MediaQuery.of(context), configuration);
  }
}
