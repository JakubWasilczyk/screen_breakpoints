import 'package:flutter/widgets.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

class BreakpointConfigurator extends InheritedWidget {
  // Breakpoint configuration
  final BreakpointConfiguration configuration;

  List<Breakpoint> get breakpoints => configuration.breakpoints;

  BreakpointConfigurator({
    Key? key,
    required Widget child,
    this.configuration = kDefaultBreakpoints,
  })  : assert(configuration.sm == null || configuration.sm! > configuration.xs),
        assert(configuration.md == null || configuration.md! > configuration.sm),
        assert(configuration.lg == null || configuration.lg! > configuration.md),
        assert(configuration.xl == null || configuration.xl! > configuration.lg),
        assert(configuration.xxl == null || configuration.xxl! > configuration.xl),
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
