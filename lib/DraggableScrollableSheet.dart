import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'costum_Scroll_Widget.dart';
import 'main.dart';

class DraggableScrollableShet extends StatefulWidget {
  const DraggableScrollableShet({super.key});

  @override
  State<DraggableScrollableShet> createState() => _DraggableScrollableShetState();
}

class _DraggableScrollableShetState extends State<DraggableScrollableShet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
         OutlinedButton(onPressed: (){
           Get.to(()=>CustomScroll());
         },child: Text('click to next Widget'),
         )],
        title: const Text('DraggableScrollableSheet Sample'),
      ),
      body: const DraggableScrollableSheetExample(),
    );
  }
}
