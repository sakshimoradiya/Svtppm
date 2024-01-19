
class Event {
  final int id;
  // final String photo;
  final String title;
  final String description;
  final String file;

  Event({
    required this.id,
    // required this.photo,
    required this.title,
    required this.description,
    required this.file,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      // photo: json['photo'] ,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      file: json['file'] ?? '',
    );
  }
}

// List<userModal> data = [
//
//   userModal(
//
//       title: 'શ્રી વલ્લભીપુર તાલુકા પાટીદાર પ્રગતિ મંડળ - સુરત',
//       descprition: dummyD4,
//       file: 'શ્રી વલ્લભીપુર તાલુકા પાટીદાર પ્રગતિ મંડળ - સુરત',
//       id: 1),
// ];

String dummyD =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
String dummyD3 =
    "Dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
String dummyD4 = "SAID and scrambled it to make a type specimen book.";
String add =
    "અમદાવાદમાં આજે કોરોનાના વધુ 8 કેસ: નવરંગપુરા\nજોધપુર, થલતેજ, ગોતા સહિતના વિસ્તારમાંથી\n કેસ નોંધાયા; ત્રણ દર્દીઓની અમેરિકા\n દુબઈ, મથુરાની ટ્રાવેલ હિસ્ટ્રી મળી";
String dummyD2 =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry..";
