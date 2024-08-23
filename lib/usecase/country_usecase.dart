import '../model/country.dart';
import '../screen/country/country_event.dart';
import '../service/country_service.dart';

class CountryUseCase {
  final CountryService _countryService;

  CountryUseCase() : _countryService = CountryService();

  Future<List<Country>> fetchCountries() async {
    try {
      return await _countryService.getCountries();
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  List<Country> sortCountries(List<Country> countries, SortBy sortBy) {
    List<Country> sortedCountries = List.from(countries);
    switch (sortBy) {
      case SortBy.name:
        sortedCountries.sort((a, b) => a.name.common.compareTo(b.name.common));
        break;
      case SortBy.capital:
        sortedCountries.sort((a, b) {
          // Handle cases where the capital list might be empty or have multiple capitals.
          final capitalA = a.capital.isNotEmpty ? a.capital.first : '';
          final capitalB = b.capital.isNotEmpty ? b.capital.first : '';
          return capitalA.compareTo(capitalB);
        });
        break;
      case SortBy.population:
        sortedCountries.sort((a, b) => b.population.compareTo(a.population));
        break;
    }
    return sortedCountries;
  }
}
