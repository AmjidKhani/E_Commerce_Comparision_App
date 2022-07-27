import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview/fragment.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}
var _textcontrol = TextEditingController();
class _firstpageState extends State<firstpage>with AutomaticKeepAliveClientMixin {
  int _value = 0;
  double webprogress = 0;
   late WebViewController controller;
  TabController? _controller;
  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();

  void initState() {
    super.initState();
    // Enable hybrid composition.
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  Future<bool> _onBack() async {

   late bool goBack;

    var value = await controller.canGoBack();
    // check webview can go back

    if (value) {

      controller.goBack(); // perform webview back operation

      return false;


    }
    else {

      await
      //Future.delayed(Duration(seconds: 1) );
      showDialog(

        context: context,

        builder: (context) => new AlertDialog(

          title: new Text('Confirmation ', style: TextStyle(color: Colors.purple)),

          // Are you sure?

          content: new Text('Do you want exit app ? '),

          // Do you want to go back?

          actions: <Widget>[

            new FlatButton(

              onPressed: () {

                Navigator.of(context).pop(false);

                setState(() {

                  goBack = false;

                });

              },

              child: new Text('No'), // No

            ),

            new FlatButton(

              onPressed: () {

                Navigator.of(context).pop();

                setState(() {

                  goBack = true;

                });

              },
              child: new Text('Yes'), // Yes

            ),

          ],

        ),

      );


      if (goBack) Navigator.pop(context);   // If user press Yes pop the page

      return goBack;

    }

  }
  Future<bool> _goBack(BuildContext context) async {
    if ( await controller.canGoBack()) {
      controller.goBack();
      return  Future.value(false);
    }

      else{

        return Future.value(true);
    }
    //return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            initialUrl: 'https://www.amazon.com/',
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

          )]
    )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  //bool get wantKeepAlive => throw UnimplementedError();

  }
