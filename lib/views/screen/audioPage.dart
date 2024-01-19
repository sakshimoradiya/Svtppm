import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siri_wave/siri_wave.dart';
import '../../controller/audioController.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    final controller = IOS7SiriWaveformController(
      amplitude: 0.5,
      color: Colors.indigo,
      frequency: 4,
      speed: 0.12,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Audio",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Consumer<AudioController>(builder: (context, provider, child) {
          return StreamBuilder(
            stream: provider.currentPosition,
            builder: (context, AsyncSnapshot<Duration> snapshot) {
              if (snapshot.hasData) {
                double currentPosition = snapshot.data!.inSeconds.toDouble();

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SiriWaveform.ios7(
                          controller: controller,
                        ),
                        // Waves(),

                        // Padding(
                        //     padding: const EdgeInsets.all(10.00),
                        //
                        //     child: Container(
                        //
                        //         width: 200.00,
                        //         height: 200.00,
                        //
                        //         decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: Color(0xFF35DEF3),
                        //           gradient: LinearGradient(
                        //               begin: Alignment.topCenter,
                        //               end: Alignment.bottomCenter,
                        //               colors: [Colors.grey, Colors.black]),
                        //         ),
                        //
                        //         child: Padding(
                        //             padding: const EdgeInsets.all(5.00),
                        //             child: Container(
                        //
                        //               width: double.infinity,
                        //               height: double.infinity,
                        //
                        //               decoration: const BoxDecoration(
                        //                   shape: BoxShape.circle,
                        //
                        //
                        //                   image: DecorationImage(
                        //                       image: NetworkImage(
                        //                           "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg"),
                        //                       fit: BoxFit.cover,
                        //                       colorFilter: ColorFilter.mode(
                        //                           Colors.black, BlendMode.softLight)
                        //                   ) // Image
                        //               ), // Box Decoration
                        //             ) // Container,
                        //
                        //         ) // Padding,
                        //
                        //     ) // Container,
                        // ),
                      ],
                    ), // Padding
                    Slider(
                      min: 0,
                      max: provider.totalDuration.inSeconds.toDouble(),
                      value: currentPosition,
                      onChanged: (val) {
                        provider.seek(second: val.toInt());
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: (provider.isPlaying)
                              ? const Icon(Icons.play_arrow_outlined)
                              : const Icon(Icons.pause),
                          onPressed: () {
                            setState(() {
                              (provider.isPlaying)
                                  ? provider.play()
                                  : provider.pause();
                            });;
                          },
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }),
      ),
    );
  }
}