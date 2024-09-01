import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DraggableScrollableSheet.dart';


void main() => runApp(const DraggableScrollableSheetExampleApp());

class DraggableScrollableSheetExampleApp extends StatelessWidget {
  const DraggableScrollableSheetExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
      ),
      home: DraggableScrollableShet(),
    );
  }
}

class DraggableScrollableSheetExample extends StatefulWidget {
  const DraggableScrollableSheetExample({super.key});

  @override
  State<DraggableScrollableSheetExample> createState() =>
      _DraggableScrollableSheetExampleState();
}

class _DraggableScrollableSheetExampleState
    extends State<DraggableScrollableSheetExample> {
  double _sheetPosition = 0.5;
  final double _dragSensitivity = 600;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: _sheetPosition,
      builder: (BuildContext context, ScrollController scrollController) {
        return ColoredBox(
          color: colorScheme.primary,
          child: Column(
            children: [
              Grabber(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _sheetPosition -= details.delta.dy / _dragSensitivity;
                    if (_sheetPosition < 0.25) {
                      _sheetPosition = 0.25;
                    }
                    if (_sheetPosition > 1.0) {
                      _sheetPosition = 1.0;
                    }
                  });
                },
                isOnDesktopAndWeb: _isOnDesktopAndWeb,
              ),
              Flexible(
                child: ListView.builder(
                  controller: _isOnDesktopAndWeb ? null : scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        'Item $index',
                        style: TextStyle(color: colorScheme.surface),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       home: Home(),
//     );
//   }
// }
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ListView(
//           children: [
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//             Text('saim'),
//           ],
//         ),
//       ),
//     );
//   }
// }
