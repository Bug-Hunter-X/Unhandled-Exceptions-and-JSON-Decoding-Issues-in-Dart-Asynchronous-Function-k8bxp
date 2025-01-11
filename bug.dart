```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Here's the problem: assuming JSON response
      final jsonData = jsonDecode(response.body);
      // ... further processing of jsonData ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // This handles all exceptions, masking potential issues
    print('Error: $e');
  }
}
```