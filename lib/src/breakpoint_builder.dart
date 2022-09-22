import 'package:flutter/widgets.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

typedef BreakpointBuilderCallback = Widget Function(BuildContext, Breakpoint, BreakpointConfiguration);

class BreakpointBuilder extends StatelessWidget {
  // Child's widget builder
  final BreakpointBuilderCallback builder;

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

  // If set overrides the default padding set in BreakpointConfigurator
  final EdgeInsets? padding;

  const BreakpointBuilder({
    Key? key,
    required this.builder,
    this.height,
    this.decoration,
    this.backgroundDecoration,
    this.foregroundDecoration,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.fluid = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configuration = BreakpointConfigurator.maybeOf(context)?.configuration ?? kDefaultBreakpoints;
    final mediaQuery = MediaQuery.of(context);
    final breakpoint = Breakpoint.fromMediaQuery(mediaQuery, configuration);
    return BreakpointContainer(
      height: height,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      backgroundDecoration: backgroundDecoration,
      alignment: alignment,
      clipBehavior: clipBehavior,
      fluid: fluid,
      padding: padding,
      child: builder(context, breakpoint, configuration),
    );
  }
}
