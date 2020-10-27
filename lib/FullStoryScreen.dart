import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullStoryScreen extends StatelessWidget {
  String url;
  String text;

  FullStoryScreen({this.text, this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        text,
        overflow: TextOverflow.ellipsis,
      )),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
