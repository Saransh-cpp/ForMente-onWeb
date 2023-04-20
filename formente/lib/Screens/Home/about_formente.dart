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

class AboutForMente extends StatefulWidget {
  const AboutForMente({Key? key}) : super(key: key);

  @override
  AboutForMenteState createState() {
    return AboutForMenteState();
  }
}

class AboutForMenteState extends State<AboutForMente> {
  final _templateMemoizer = AsyncMemoizer<String>();
  EasyWebViewControllerWrapperBase? _controller;
  final _key = const ValueKey('forMentee.html');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('About ForMente')),
        body:  FutureBuilder<String>(
            future: _templateMemoizer.runOnce(
                    () => rootBundle.loadString('assets/forMentee.html')),
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
