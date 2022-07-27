import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class fourpage extends StatefulWidget {
  const fourpage({Key? key}) : super(key: key);

  @override
  State<fourpage> createState() => _fourpageState();
}

class _fourpageState extends State<fourpage> with AutomaticKeepAliveClientMixin{
  int _value = 0;
  double webprogress=0;
  late WebViewController controller;
  TabController? _controller;

  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();

  void initState() {
    super.initState();
    // Enable hybrid composition.
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  Future<bool> _goBack(BuildContext context) async {

    if (await controller.canGoBack()) {
      controller.goBack();
      return Future.value(false);
    } else {

      return Future.value(true);
    }

  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
        body:  Column(
          children: [
        webprogress<1?
        SizedBox(
        height: 5,
          child: LinearProgressIndicator(
            value:webprogress,
            color: Colors.blue,
            backgroundColor: Colors.black,

          ),
        ):SizedBox(),

      WillPopScope(
      onWillPop: () => _goBack(context),
      child: Expanded(
        child: WebView(
          initialUrl: 'https://www.shopping.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controllerCompleter.future.then((value) =>
            controller = value  );
            _controllerCompleter.complete(webViewController);
          },
          onProgress: (progress)=>setState(() {
            this.webprogress = progress / 100;
          }
          ),
        ),
      ),
    )
    ]
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  //bool get wantKeepAlive => throw UnimplementedError();
}
