import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview/fifthpage.dart';
import 'package:webview/firstpage.dart';
import 'package:webview/fourpage.dart';
import 'package:webview/secondepage.dart';
import 'package:webview/thirdpage.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_share/flutter_share.dart';
class fragment extends StatefulWidget {
  const fragment({Key? key}) : super(key: key);

  @override
  State<fragment> createState() => _fragmentState();
}
class _fragmentState extends State<fragment> with SingleTickerProviderStateMixin{
  DateTime? lastPressed;
   late WebViewController controller;
  final TextEditingController _textcontrol=TextEditingController();



  TabController? _controller;
  @override
  void initState(){

    //super.initState();

    _controller=TabController(length: 5, vsync:this, initialIndex:0);
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
   Future<bool>_onBackPresses()async{
     return  await showDialog(
         context: context,
         builder:(context)=>AlertDialog(
           title: Text("Do You Really Want to Exit The App"),
           actions: [
             FlatButton(
               child: Text("No"),
               onPressed:()=>Navigator.pop(context,false),
             ),
             FlatButton(
               child: Text("Yes"),
               onPressed: ()=>Navigator.pop(context,true),
             ),
           ],
         )
     );

   }
   Future<bool> _goBack(BuildContext context) async {
     if (await controller.canGoBack()) {
       controller.goBack();
       return  Future.value(false);
     }

     else{
       showDialog(
           context: context,
           builder: (context) => AlertDialog(
             title: Text('Do you want to exit'),
             actions: <Widget>[
               FlatButton(
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
                 child: Text('No'),
               ),
               FlatButton(
                 onPressed: () {
                   SystemNavigator.pop();
                 },
                 child: Text('Yes'),
               ),
             ],
           ));
       return Future.value(true);
     }
   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child:  Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.red,

                  actions: [
                    new IconButton(onPressed: () {

                      Share.share( 'https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf&hl=en');
                    },
                      icon: Icon(Icons.share, color: Colors.white,),

                    ),
                    new IconButton(onPressed: () {


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fragment()),
                        );


                    },
                      icon: Icon(Icons.home, color: Colors.white,),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.white,
                        iconTheme: IconThemeData(color: Colors.white),
                        textTheme: TextTheme().apply(
                          bodyColor: Colors.white
                        )
                      ),
                      child: PopupMenuButton<int>(
color: Colors.red,

                onSelected:(item)=>onSelected(context,item),

                itemBuilder:(context)=>[

                   PopupMenuItem<int>(
                      value:0,

                      child:Row(
                        children: [
                          Icon(Icons.share
                            ,color: Colors.black,),
                          SizedBox(width: 8),
                          Text("Share"),
                        ],
                      ),
                  ),
                  PopupMenuDivider(),
                   PopupMenuItem<int>(
                      value:1,
                      child:Row(
                  children: [
                  Icon(Icons.link
                      ,color: Colors.black,),
                  SizedBox(width: 8),
                  Text("Study Links"),
                ],
                      ),
                  ),
                  PopupMenuDivider(),
                   PopupMenuItem<int>(
                      value:2,
                      child:Row(
                        children: [
                          Icon(Icons.logout
                            ,color: Colors.black,),
                          SizedBox(width: 8),
                          Text("Sign Out"),
                        ],
                      ),
                  ),
                  PopupMenuDivider(),
                   PopupMenuItem<int>(
                      value:3,
                      child:Row(
                        children: [
                          Icon(Icons.star_rate
                            ,color: Colors.black,),
                          SizedBox(width: 8),
                          Text("Rate Us"),
                        ],
                      ),
                  ),
                  PopupMenuDivider(),
                   PopupMenuItem<int>(
                      value:4,
                      child:Row(
                        children: [
                          Icon(Icons.help
                            ,color: Colors.black,),
                          SizedBox(width: 8),
                          Text("About"),
                        ],
                      ),
                  ),

                ],
              ),
                    ),

                  ],
                  title: TextField(
                    controller: _textcontrol,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          setState() {
                            //controller?.loadUrl('https://www.amazon.com/s?k=$_textcontrol');

                          }
                          // final  link='https://www.amazon.com/s?k=$_textcontrol';

                          //final field= "shoes";
                          //_textcontrol.text;
                          //controller?.evaluateJavascript(
                          // "document.getElementById('kw').value='$field'");
//nav-search-keywords
                          // await Future.delayed(Duration(seconds: 1));
                          //await controller?.runJavascript("docment.forms[0].submit()");

                          // controller!.runJavascriptReturningResult("self.find('${_textcontrol.text}')").then((value) => print(value));

                        },
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Enter Anything For ",
                      labelStyle: TextStyle(),
                      hintText: "Enter Anything For Search",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),

                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    controller: _controller,
                    tabs: [
                      Tab(
                        text: "Amazon",
                      ),
                      Tab(
                        text: "ebay",
                      ),
                      Tab(
                        text: "Draz ",
                      ),
                      Tab(
                        text: "Shopping.com",
                      ),
                      Tab(
                        text: "shopStyle",
                      ),


                    ],
                  ),
                ),

                resizeToAvoidBottomInset: false,
                body: TabBarView(
                    //
                    physics: NeverScrollableScrollPhysics(),
                    //physics: BouncingScrollPhysics(),

                    controller: _controller,
                    children: [
                      firstpage(),

                      secondepage(),
                      thirdpage(),
                      fourpage(),
                      fifthpage(),

                    ],
                  ),
                ),
    );
  }
   void onSelected(BuildContext context, int item) {
     switch (item) {
       case 0:
         Navigator.of(context).push(
           MaterialPageRoute(builder: (context) => secondepage()),
         );
         break;
       case 1:
         Navigator.of(context).push(
           MaterialPageRoute(builder: (context) => thirdpage()),
         );
         break;
       case 2:
         Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (context) => fourpage()),
               (route) => false,
         );
         break;
       case 3:
         Navigator.of(context).push(
           MaterialPageRoute(builder: (context) => thirdpage()),
         );
         break;
       case 4:
         Navigator.of(context).push(
           MaterialPageRoute(builder: (context) => thirdpage()),
         );
         break;
     }
   }



     }


