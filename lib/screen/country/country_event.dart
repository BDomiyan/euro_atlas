abstract class CountryEvent {}

class FetchCountries extends CountryEvent {}

class SortCountries extends CountryEvent {
  final SortBy sortBy;

  SortCountries(this.sortBy);
}

enum SortBy { name, capital, population }
