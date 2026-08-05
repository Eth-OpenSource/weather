import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherApi {
Future<dynamic> fetch() async {
  // Fetch current weather from Open-Meteo for Addis Ababa coordinates
  final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
    'latitude': '8.9806',
    'longitude': '38.7578',
    'current_weather': 'true',
    'hourly':
        'temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,wind_speed_10m,wind_direction_10m',
    'timezone': 'UTC',
  });

  try {
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) { 
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      return {"Status": response.statusCode};
    }
  } catch (e) {
    return {"error": e.toString()};
  }
}
}
