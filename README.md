Another breakpoint framework. Aims to simplify as much as possible building adaptive layouts.

## Features

Really simple implementation 
Works with and without configuration 
Highly customizable
Bootstrap breakpoints or Material Design breakpoints

## Getting started

Import the library

```dart
import 'package:screen_breakpoints/screen_breakpoints.dart';
```

If you want to personalize all the breakpoints, wrap up any widget above MaterialApp (or any other
App that you use). For example:

```dart
/* ... */
// This is just like the default configuration
final myBreakpoints = BreakpointConfiguration(
  xs: const Breakpoint(breakpoint: 0, width: double.infinity, margin: null, padding: 16, columns: 4),
  sm: const Breakpoint(breakpoint: 576, width: 540, margin: null, padding: 16, columns: 8),
  md: const Breakpoint(breakpoint: 768, width: 720, margin: null, padding: 16, columns: 12),
  lg: const Breakpoint(breakpoint: 992, width: 960, margin: null, padding: 16, columns: 12),
  xl: const Breakpoint(breakpoint: 1200, width: 1140, margin: null, padding: 24, columns: 12),
  xxl: const Breakpoint(breakpoint: 1400, width: 1320, margin: null, padding: 24, columns: 12),
);

Widget build(BuildContext context) {
  return BreakpointConfigurator(
    configuration: myBreakpoints,
    child: MaterialApp(
      /* ... */
    ),
  );
}
/* ... */
```

Every breakpoint is a Breakpoint type, each one has to be higher, if any set to NULL, they will default to the lower one.
The default Breakpoints are based on Bootstrap
To use Material change the configuration parameter to kMaterialBreakpoints:

```dart
/* ... */
Widget build(BuildContext context) {
  return BreakpointConfigurator(
    configuration: kMaterialBreakpoints,
    child: MaterialApp(
      /* ... */
    ),
  );
}
/* ... */
```


Otherwise, you can just use it, it will use the default settings.

## Usage

This package contains 2 basic Widgets that you can use: 
    -   BreakpointContainer
    -   BreakpointBuilder


BreakpointContainer - Use it if you want to place object inside a container that will be resized based on the breakpoint.
    Generally good to use inside Scaffold's body. It can automatically swap children that match the layout for the current breakpoint.

```dart
/* ... */

Scaffold(
    appBar: AppBar(
        title: const BreakpointContainer(
            fluid: true,
            alignment: Alignment.center,
            xlChild: Text('Sample Items - Desktop'),
            mdChild: Text('Sample Items - Tablet'),
            child: Text('Sample Items - Mobile'),
        ),
    ),
    body: BreakpointContainer(
        decoration: BoxDecoration(color: theme.cardColor),
        xlChild: _DesktopView(),
        mdChild: _TabletView(),
        child: _MobileView(),
    ),
);

/* ... */
```

Parameters list:

```dart
BreakpointContainer(
    height: // Height of the container
    decoration: // Decoration of the centered Container
    backgroundDecoration: // Decoration of the Container behind
    foregroundDecoration: // Foreground decoration on top of the centered Container
    alignment: // Alignment of the centered Container
    clipBehavior: // Clipping of the centered Container
    fluid: // Setting fluid to true will ignore breakpoint's width and margin
    xxlChild: // Child to be shown at XXL Breakpoint, if null will use one below
    xlChild: // Child to be shown at XL Breakpoint, if null will use one below
    lgChild: // Child to be shown at LG Breakpoint, if null will use one below
    mdChild: // Child to be shown at MD Breakpoint, if null will use one below
    smChild: // Child to be shown at SM Breakpoint, if null will use one below
    child: // Child to be shown at XS and up Breakpoint, this one is required.
);
```


BreakpointBuilder - This is the builder based on the BreakpointContainer. 
    If you need to build a complex layout for each breakpoint you can use this one.
    It uses the BreakpointContainer under the hood but gives back a builder that on each rebuild will provide:
    BuildContext, Breakpoint you are currently in and BreakpointConfiguration.


Example:
```dart
/* ... */

Scaffold(
    /* ... */
    body: BreakpointBuilder(
        decoration: BoxDecoration(color: theme.cardColor),
        builder: (context, breakpoint, configuration) {
          if(breakpoint >= configuration.xl) return _DesktopView();
          if(breakpoint >= configuration.md) return _TabletView();
          return _MobileView();
        }
    ),
    /* ... */
);

/* ... */
```

The outcome if the above example will be the exact same as the previous BreakpointContainer, 
the difference here is that you have a builder with a context in it so you can control more the result.


Parameters list:

```dart
BreakpointContainer(
    builder: // Builder that will build the widget
    height: // Height of the container
    decoration: // Decoration of the centered Container
    backgroundDecoration: // Decoration of the Container behind
    foregroundDecoration: // Foreground decoration on top of the centered Container
    alignment: // Alignment of the centered Container
    clipBehavior: // Clipping of the centered Container
    fluid: // Setting fluid to true will ignore breakpoint's width and margin
);
```
