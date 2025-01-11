```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } on FormatException {
        print('Error: Invalid JSON format');
        return null; // or throw a custom exception
      } 
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on http.ClientException catch (e) {
    print('Network error: $e');
    return null; // or throw a custom exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw to handle it higher up if needed
  }
}
```