import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewStack extends StatefulWidget {
  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("https://v4.belebgo.com/")),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false
                  ),
                ),
                // grant permission for camera when using
                androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                  return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                },
                // grant permission for location when using
                androidOnGeolocationPermissionsShowPrompt: (InAppWebViewController controller, String origin) async {
                  return GeolocationPermissionShowPromptResponse(origin: origin, allow: true, retain: true);
                },
                onProgressChanged: (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
            ),
            Align(
              alignment: Alignment.center,
              child: _buildProgressBar()
            )
      ],
    );
  }

  Widget _buildProgressBar() {
    if (progress != 1.0) {
      return CircularProgressIndicator();
    }
    return Container();
  }
}
