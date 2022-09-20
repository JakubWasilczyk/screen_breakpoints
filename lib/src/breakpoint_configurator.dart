import 'package:flutter/widgets.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

class BreakpointConfigurator extends InheritedWidget {
  // Breakpoint configuration
  final BreakpointConfiguration configuration;

  List<Breakpoint> get breakpoints => configuration.breakpoints;

  BreakpointConfigurator({
    Key? key,
    required Widget child,
    BreakpointConfiguration? configuration,
  })  : configuration = configuration ?? DefaultBreakpoints(),
        super(key: key, child: child);

  static BreakpointConfigurator of(BuildContext context) {
    final BreakpointConfigurator? result = context.dependOnInheritedWidgetOfExactType<BreakpointConfigurator>();
    assert(result != null, 'No BreakpointConfigurator found in context');
    return result!;
  }

  static BreakpointConfigurator? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BreakpointConfigurator>();
  }

  @override
  bool updateShouldNotify(BreakpointConfigurator old) {
    return configuration != old.configuration;
  }
}
