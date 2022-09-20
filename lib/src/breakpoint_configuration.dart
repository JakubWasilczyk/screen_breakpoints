import 'package:equatable/equatable.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

class BreakpointConfiguration extends Equatable {
  // Breakpoint for the smallest device starting from 0px
  final Breakpoint xs;

  // Breakpoint for the small device
  final Breakpoint? sm;

  // Breakpoint for the medium device
  final Breakpoint? md;

  // Breakpoint for the large device
  final Breakpoint? lg;

  // Breakpoint for the extra large device
  final Breakpoint? xl;

  // Breakpoint for the extra extra large device
  final Breakpoint? xxl;

  List<Breakpoint> get breakpoints {
    final result = <Breakpoint>[xs];
    if (sm != null) result.add(sm!);
    if (md != null) result.add(md!);
    if (lg != null) result.add(lg!);
    if (xl != null) result.add(xl!);
    if (xxl != null) result.add(xxl!);
    return result;
  }

  const BreakpointConfiguration({required this.xs, this.sm, this.md, this.lg, this.xl, this.xxl})
      : assert((sm != null && xs < sm) || sm == null),
        assert((md != null && sm != null && sm < md) || md == null),
        assert((lg != null && md != null && md < lg) || lg == null),
        assert((xl != null && lg != null && lg < xl) || xl == null),
        assert((xxl != null && xl != null && xl < xxl) || xxl == null);

  @override
  List<Object?> get props => [xs, sm, md, lg, xl, xxl];

  BreakpointConfiguration copyWith({
    Breakpoint? xs,
    Breakpoint? sm,
    Breakpoint? md,
    Breakpoint? lg,
    Breakpoint? xl,
    Breakpoint? xxl,
  }) =>
      BreakpointConfiguration(
        xs: xs ?? this.xs,
        sm: sm ?? this.sm,
        md: md ?? this.md,
        lg: lg ?? this.lg,
        xl: xl ?? this.xl,
        xxl: xxl ?? this.xxl,
      );
}
