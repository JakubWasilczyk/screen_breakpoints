import 'package:flutter/widgets.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

class BreakpointContainer extends StatelessWidget {
  // XS and up child widget
  final Widget child;

  // SM and up child widget. If null will use child
  final Widget? smChild;

  // MD and up child widget. If null will use smaller breakpoint child
  final Widget? mdChild;

  // LG and up child widget. If null will use smaller breakpoint child
  final Widget? lgChild;

  // XL and up child widget. If null will use smaller breakpoint child
  final Widget? xlChild;

  // XXL and up child widget. If null will use smaller breakpoint child
  final Widget? xxlChild;

  // Height of the container. Default: null
  final double? height;

  // Decoration behind the child container
  final Decoration? decoration;

  // Child's Container Decoration
  final Decoration? backgroundDecoration;

  // Child's Container Foreground Decoration
  final Decoration? foregroundDecoration;

  // Content alignment inside Container
  final Alignment? alignment;

  // Clip Behavior for the child's container, default is Clip.none
  final Clip clipBehavior;

  // If fluid is true, the width will always be max
  final bool fluid;

  const BreakpointContainer({
    Key? key,
    this.height,
    this.decoration,
    this.backgroundDecoration,
    this.foregroundDecoration,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.fluid = false,
    this.xxlChild,
    this.xlChild,
    this.lgChild,
    this.mdChild,
    this.smChild,
    required this.child,
  }) : super(key: key);

  Widget getChild(Breakpoint breakpoint, BreakpointConfiguration configurator) {
    if (xxlChild != null && breakpoint >= configurator.xxl) return xxlChild!;
    if (xlChild != null && breakpoint >= configurator.xl) return xlChild!;
    if (lgChild != null && breakpoint >= configurator.lg) return lgChild!;
    if (mdChild != null && breakpoint >= configurator.md) return mdChild!;
    if (smChild != null && breakpoint >= configurator.sm) return smChild!;
    return child;
  }

  @override
  Widget build(BuildContext context) {
    final configuration = BreakpointConfigurator.maybeOf(context)?.configuration ?? kDefaultBreakpoints;
    final breakpoint = Breakpoint.fromContext(context);
    EdgeInsets? margin;
    if (breakpoint.margin != null && !fluid) {
      margin = EdgeInsets.only(left: breakpoint.margin!, right: breakpoint.margin!);
    }
    final padding = EdgeInsets.only(left: breakpoint.padding, right: breakpoint.padding);
    final child = getChild(breakpoint, configuration);

    return Container(
      alignment: Alignment.topCenter,
      decoration: backgroundDecoration,
      child: Container(
        clipBehavior: clipBehavior,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        alignment: alignment,
        margin: margin,
        padding: padding,
        height: height,
        width: fluid ? double.infinity : breakpoint.width,
        child: child,
      ),
    );
  }
}
