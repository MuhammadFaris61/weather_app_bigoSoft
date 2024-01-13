
import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime){
  return DateFormat('dd/MM/yyyy\nhh:mm a').format(dateTime).toString();
}

String capitalizeEveryWord(String sentence) {
  List<String> words = sentence.split(' ');
  List<String> capitalizedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      capitalizedWords.add(capitalizedWord);
    }
  }

  return capitalizedWords.join(' ');
}

final List<Map<String, dynamic>> cities = [
  {"name": "Karachi", "latitude": 24.8607, "longitude": 67.0011},
  {"name": "Lahore", "latitude": 31.5497, "longitude": 74.3436},
  {"name": "Islamabad", "latitude": 33.6844, "longitude": 73.0479},
  {"name": "Rawalpindi", "latitude": 33.5651, "longitude": 73.0169},
  {"name": "Faisalabad", "latitude": 31.5497, "longitude": 73.0782},
  {"name": "Multan", "latitude": 30.1798, "longitude": 71.4250},
  {"name": "Peshawar", "latitude": 33.6844, "longitude": 71.5429},
  {"name": "Quetta", "latitude": 30.1798, "longitude": 66.9750},
  {"name": "Sialkot", "latitude": 32.4945, "longitude": 74.5222},
  {"name": "Gujranwala", "latitude": 32.1617, "longitude": 74.1883},
  {"name": "Abbottabad", "latitude": 35.3191, "longitude": 73.1964},
  {"name": "Bahawalpur", "latitude": 29.3700, "longitude": 71.6655},
  {"name": "Sargodha", "latitude": 32.0836, "longitude": 72.6744},
  {"name": "Sukkur", "latitude": 27.7131, "longitude": 68.8482},
  {"name": "Jhang", "latitude": 31.2690, "longitude": 72.3164}
];