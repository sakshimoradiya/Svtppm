import 'package:flutter/material.dart';
import 'package:media_player/views/screen/medicalPage.dart';
import 'package:media_player/views/screen/navaShabhyaPage.dart';
import 'package:media_player/views/screen/sikshanPage.dart';
import 'package:media_player/views/screen/vibhvaPage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FormPage extends StatefulWidget {
  FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color(0xFDFDFDFF),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  NavaSabhyaPage()));
                  },
                  child: Flexible(
                    child: const Row(
                      children: [
                        Text(
                          "નવા સભ્ય",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "-t\t\t\t\tt\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\--",
                          style: TextStyle(color: Color(0xFDFDFDFF)),
                        ),
                        Icon(Icons.navigate_next_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color(0xFDFDFDFF),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  SikshanPage(),
                    ));
                  },
                  child: Flexible(
                    child: const Row(
                      children: [
                        Text(
                          "શિક્ષણ સહાય ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "-\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\--",
                          style: TextStyle(color: Color(0xFDFDFDFF)),
                        ),
                        Icon(Icons.navigate_next_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),


          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color(0xFDFDFDFF),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  MedicalPage()));
                  },
                  child: Flexible(
                    child: const Row(
                      children: [
                        Text(
                          "મેડિકલ સહાય ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "-\tt\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tt\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\--",
                          style: TextStyle(color: Color(0xFDFDFDFF)),
                        ),
                        Icon(Icons.navigate_next_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),   const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color(0xFDFDFDFF),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  VidhvaPage(),
                    ));
                  },
                  child: Flexible(
                    child: const Row(
                      children: [
                        Text(
                          "વિધવા, અપંગ ,અને વૃદ્ધ સહાય  ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "-\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\--",
                          style: TextStyle(color: Color(0xFDFDFDFF)),
                        ),
                        Icon(Icons.navigate_next_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 80,),
          const Card(
            color: const Color(0xFFFFFA9F),
child: Column(children: [
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Note:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
  ),  Text("ફોર્મ ની ઝેરોક્ષ કરાવી તાલુકા ની ઓફિસે જમા કરાવી",style: TextStyle(color: Colors.red,fontSize: 20),),

],
),
          )
        ],),
      ),
    );
  }
}
