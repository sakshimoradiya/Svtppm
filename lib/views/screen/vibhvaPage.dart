import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:share_extend/share_extend.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents VidhvaPage for Navigation
class VidhvaPage extends StatefulWidget {
  @override
  _VidhvaPage createState() => _VidhvaPage();
}

class _VidhvaPage extends State<VidhvaPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override


  Future download(String url, String filename) async {
    var savePath = '/storage/emulated/0/Download/$filename';
    var dio = Dio();
    dio.interceptors.add(LogInterceptor());
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      var file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      debugPrint((received / total * 100).toStringAsFixed(0) + '%');
    }
  }
  Logger logger = Logger();

  var url = 'https://saranginfotech.in/VIDHVAVRUDHDHVIKLANG.pdf';
  var filename = 'વિધવા, અપંગ ,અને વૃદ્ધ સહાય .pdf';
  @override
  void initState() {
    super.initState();
    // download(url, filename);
    logger.e(download(url, filename));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('વિધવા, અપંગ ,અને વૃદ્ધ સહાય '), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.share,
            color: Colors.black,
          ),
          onPressed: () async {

            final urlPreview ='https://saranginfotech.in/VIDHVAVRUDHDHVIKLANG.pdf';

            await Share.share(urlPreview);


          },
        ),  IconButton(
          icon: const Icon(
            Icons.download,
            color: Colors.black,
          ),
          onPressed: () async {

            download(url, filename);


          },
        ),
      ]),
      body: SfPdfViewer.network(
        'https://saranginfotech.in/VIDHVAVRUDHDHVIKLANG.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
