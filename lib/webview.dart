import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:webview/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatefulWidget {
  const webview({Key? key}) : super(key: key);

  @override
  State<webview> createState() => _webviewState();
}

class _webviewState extends State<webview> with SingleTickerProviderStateMixin{
   late WebViewController controller;
 TabController? _controller;
  @override
  void initState(){
    super.initState();
    _controller=TabController(length: 5, vsync:this, initialIndex:0);
  }
  @override

  Widget build(BuildContext context) =>WillPopScope(

      onWillPop: ()async {
        if(await controller.canGoBack()){
controller.canGoBack();
return false;
        }
        else{
          return true;
        }


      },
      child:SafeArea(

      child: Scaffold(
        appBar: AppBar(
backgroundColor: Colors.red,

          actions: [
            new IconButton(onPressed: ()
            {},
                icon:Icon(Icons.share,color: Colors.white,),

            ),
      new IconButton(onPressed: ()
      {},
        icon:Icon(Icons.home,color: Colors.white,),
      ),
      new IconButton(onPressed: ()
      {},
        icon:Icon(Icons.more_vert,color: Colors.white,),),

          ],
          title:  TextField(
    decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(Icons.search),
        onPressed: (){

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
 ],
),

        ),
        resizeToAvoidBottomInset: false,
      body:TabBarView(

        controller: _controller,
        children: [

          Text("Amazon"),
          Text("eBay"),
          Text("Draz"),
          Text("ShopStyle"),

        ],
      ),

     /*/ Container(
        //color: Colors.red,
           height:MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Expanded(
              child: Column(
                children: [

               Container(
                 color: Colors.blue,
                 width: MediaQuery.of(context).size.width,
                 //height: MediaQuery.of(context).size.height,
                 child: Row(
                  children: [
                    TextButton(onPressed: (){
        controller.loadUrl('https://www.amazon.com');
        },
                    child:Text("Amazon" ,
                    style: TextStyle(color: Colors.white),
                    )),

                       //new button

                    TextButton(onPressed: (){
                      controller.loadUrl('https://www.ebay.com');
                    },
                        child:Text("eBay",style: TextStyle(color: Colors.white),)),

                    //New Button

                    TextButton(onPressed: (){
                      controller.loadUrl('https://www.shopstyle.com');
                    },
                        child:Text("ShopStyle",style: TextStyle(color: Colors.white),)),

                             //Next Button

                    TextButton(onPressed: (){
                      controller.loadUrl('https://www.shopping.com');
                    },
                        child:Text("Shooping.com",style: TextStyle(color: Colors.white),)),
        ],
        ),
               ),


SingleChildScrollView(
  reverse: true,
  child:   Expanded(
    child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

                  child:Expanded(
                    child: WebView(


                    initialUrl: 'https://www.amazon.com',
            zoomEnabled: false,

            javascriptMode: JavascriptMode.unrestricted,

            onWebViewCreated: (controller){
            this.controller=controller;
            },
            onPageStarted: (url){
            print("new website:$url");
            },

            ),
                  ),
    ),
  ),
),
        ]
              ),
            ),
          ),*/





      ),
      )

    );
  }

