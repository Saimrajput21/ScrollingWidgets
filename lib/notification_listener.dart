import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrolling/page_view_widget.dart';


class ScrollNotificationExample extends StatefulWidget {
  @override
  _ScrollNotificationExampleState createState() => _ScrollNotificationExampleState();
}

class _ScrollNotificationExampleState extends State<ScrollNotificationExample> {
  String _scrollInfo = "Scroll to see the notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          OutlinedButton(onPressed: (){
            Get.to(()=>PageViewExample());
          }, child: Text('Next Widget🥵'))
        ],
        title: Text('NotificationListener'),),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          setState(() {
            _scrollInfo = "Scrolled to: ${notification.metrics.pixels} pixels";
          });
          return true;
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(_scrollInfo),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
