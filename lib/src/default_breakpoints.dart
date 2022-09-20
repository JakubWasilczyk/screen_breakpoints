import 'package:screen_breakpoints/screen_breakpoints.dart';

final kDefaultBreakpoints = DefaultBreakpoints();
final kMaterialBreakpoints = MaterialBreakpoints();

// Default breakpoints based on Bootstrap
class DefaultBreakpoints extends BreakpointConfiguration {
  const DefaultBreakpoints()
      : super(
          xs: const Breakpoint(breakpoint: 0, width: double.infinity, margin: null, padding: 16, columns: 4),
          sm: const Breakpoint(breakpoint: 576, width: 540, margin: null, padding: 16, columns: 8),
          md: const Breakpoint(breakpoint: 768, width: 720, margin: null, padding: 16, columns: 12),
          lg: const Breakpoint(breakpoint: 992, width: 960, margin: null, padding: 16, columns: 12),
          xl: const Breakpoint(breakpoint: 1200, width: 1140, margin: null, padding: 24, columns: 12),
          xxl: const Breakpoint(breakpoint: 1400, width: 1320, margin: null, padding: 24, columns: 12),
        );
}

// Material breakpoints based on Material Design
class MaterialBreakpoints extends BreakpointConfiguration {
  const MaterialBreakpoints()
      : super(
          xs: const Breakpoint(breakpoint: 0, width: double.infinity, margin: 16, padding: 0, columns: 4),
          sm: const Breakpoint(breakpoint: 600, width: double.infinity, margin: 32, padding: 0, columns: 8),
          md: const Breakpoint(breakpoint: 905, width: 840, margin: null, padding: 0, columns: 12),
          lg: const Breakpoint(breakpoint: 1240, width: double.infinity, margin: 200, padding: 0, columns: 12),
          xl: const Breakpoint(breakpoint: 1440, width: 1040, margin: null, padding: 0, columns: 12),
          xxl: null,
        );
}
