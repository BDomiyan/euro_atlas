import 'package:dio/dio.dart';
import '../model/country.dart';

class CountryService {
  static const String _countryListUrl = "https://restcountries.com/v3.1/region/europe?fields=name,capital,flags,region,languages,population";

  final Dio _dio = Dio();

  Future<List<dynamic>> _fetchCountriesJson(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        if (data.isEmpty) {
          throw Exception("No countries found");
        }
        return data;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          throw Exception("Connection timeout. Please try again later.");
        } else if (e.type == DioExceptionType.receiveTimeout) {
          throw Exception("Receive timeout. Please try again later.");
        } else if (e.type == DioExceptionType.cancel) {
          throw Exception("Request was cancelled.");
        } else {
          throw Exception("Unexpected error occurred: $e");
        }
      } else {
        throw Exception("Error fetching countries: $e");
      }
    }
  }

  Future<List<Country>> getCountries() async {
    try {
      final jsonData = await _fetchCountriesJson(_countryListUrl);
      return jsonData.map((data) {
        try {
          return Country.fromJson(data);
        } catch (e) {
          throw Exception("Error parsing country data: $e");
        }
      }).toList();
        } catch (e) {
      throw Exception("Error processing country data: $e");
    }
  }
}

