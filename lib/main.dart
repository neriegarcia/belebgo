import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_in_flutter/src/web_view_stack.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.location.request();
  await Permission.camera.request();

  runApp(
    const MaterialApp(
       home: WebViewApp(),
    )
    //WebCustomTab()
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0, // 1
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black, // 2
          ),
        ),
      ),
      body: WebViewStack(),
    );
  }
}