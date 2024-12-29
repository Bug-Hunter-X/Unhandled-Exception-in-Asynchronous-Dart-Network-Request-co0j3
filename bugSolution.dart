```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //Provide more specific error information.      throw Exception('Failed to load data. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    //return null or a default value to avoid propagating the error, depending on your needs.
    return null; 
  }
}

void main() async {
  final data = await fetchData();
  if (data != null) {
    print('Data received: $data');
  } else {
    print('Failed to retrieve data.');
  }
}
```