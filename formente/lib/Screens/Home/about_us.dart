import 'dart:convert';

import 'package:asset_webview/asset_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_web_view/easy_web_view.dart';

import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/services.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  AboutUsState createState() {
    return AboutUsState();
  }
}

class AboutUsState extends State<AboutUs> {
  final _templateMemoizer = AsyncMemoizer<String>();
  EasyWebViewControllerWrapperBase? _controller;
  final _key = const ValueKey('aboutUs.html');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About us')),
      body:  FutureBuilder<String>(
          future: _templateMemoizer.runOnce(
            () => rootBundle.loadString('assets/aboutUs.html')),
            builder: (context, snapshot) {
              final invoiceSrc = snapshot.data;
              if (invoiceSrc == null) {
                return const Center(child: CircularProgressIndicator());
              }
            return EasyWebView(
              src: invoiceSrc,
              onLoaded: (controller) {
              setState(() {
                _controller = controller;
              });
            },
            key: _key,
          );
        }
      )
    );
  }
}