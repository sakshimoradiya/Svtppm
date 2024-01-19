import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:media_player/views/screen/formPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:media_player/model/userModal.dart';
import 'package:http/http.dart' as http;

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

DateTime now = DateTime.now();

class _SongPageState extends State<SongPage> {
  bool isPressed = false;

  @override
  Logger logger = Logger();

  var locale = 'en';

  String timeUntil2(String date) {
    // timeago.setLocaleMessages('en', MyCustomMessages());

    logger.i(date.toString());
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    return timeago.format(tempDate, locale: locale, allowFromNow: true);
  }

  List<Event> eventsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final Uri url = Uri.parse(
          'https://svtppm-app-backend.saranginfotech.in/api/all-events');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body)['events'];

        setState(() {
          eventsData = responseData
              .map((eventData) => Event.fromJson(eventData))
              .toList();
        });
      } else {
        print('Error: ${response.statusCode} - Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 17,
                  width: 18,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red.shade700),
                  child: const Text(
                    "2",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: SliderDrawer(
        appBar: const SliderAppBar(
          appBarColor: Colors.white,
          title: Text(
            "",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        slider: Container(
          color: Colors.grey.shade300,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Image.asset(
                'assets/audio/svtppm.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "2020 D",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ]),
        ),
        child: Container(
          color: Colors.white70,
          child: Column(
            children: [
              Image.asset(
                'assets/audio/svtppm.png',
                height: 200,
                width: 200,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Color(0xFDFDFDFF),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+91 9876543210",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Color(0xFDFDFDFF),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              SwipeButton.expand(
                width: 200,
                thumb: const Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white,
                ),
                activeThumbColor: Colors.grey,
                activeTrackColor: Colors.grey.shade300,
                onSwipe: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FormPage(),
                    ),
                  );
                },
                child: const Text(
                  "Form Detail",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: eventsData.isNotEmpty
            ? EventList(events: eventsData)
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  final List<Event> events;

  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventListItem(event: events[index]);
      },
    );
  }
}

class EventListItem extends StatefulWidget {
  final Event event;

  EventListItem({required this.event});

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  String TTitle = "શ્રી વલ્લભીપુર તાલુકા પાટીદાર પ્રગતિ મંડળ - સુરત";

  Future<void> _saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // Download image
      final http.Response response =
          await http.get(Uri.parse(widget.event.file));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void shareContent() {
    // Image URL to be shared
    String imageUri = "${widget.event.file}";

    // Text to be shared
    String textToShare = widget.event.title;

    // Link to be shared
    String linkToShare = widget.event.description;

    // Combine text and link
    String combinedText = '$textToShare\n$linkToShare\n$imageUri';

    // Share using the share package
    Share.share(
      combinedText,
      subject: 'Shared Image', // Subject for email or messages
      sharePositionOrigin: Rect.fromCenter(
        center: const Offset(0, 0),
        width: 0,
        height: 0,
      ),
      // Share image as a file or Uint8List (optional)
      // image: 'image.jpg',
      // mimeType: 'image/jpg',
    );
  }

  bool isImageDownloaded = false;

  Logger logger = Logger();

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        color: const Color(0xF6F6F6FF),
        child: ListTile(
          title: Row(
            children: [
              Image.asset(
                'assets/audio/svtppm.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   timeUntil2(data[index].time),
                  //   style: const TextStyle(
                  //       fontSize: 14, color: Color(0x95959FA7)),
                  // ),
                ],
              ),
              const Flexible(
                child: AutoSizeText(
                  'શ્રી વલ્લભીપુર તાલુકા પાટીદાર પ્રગતિ મંડળ - સુરત',
                  maxLines: 2,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.start,
                widget.event.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.network(widget.event.file),
                ),
              ),
              Text(
                widget.event.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      shareContent();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Share"),
                      ],
                    ),
                  ),const SizedBox(width: 28,),
                  ElevatedButton(
                    onPressed: () {
                      _saveImage(context);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.download),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Download"),
                      ],
                    ),),],
              )
            ],
          ),
        ),
      ),
    );
  }
}
