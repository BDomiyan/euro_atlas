import '../../model/country.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  CountryLoaded({required this.countries});
}

class CountryError extends CountryState {
  final String message;

  CountryError({required this.message});
}
