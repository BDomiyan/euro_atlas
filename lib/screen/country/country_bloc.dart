import 'package:flutter_bloc/flutter_bloc.dart';
import '../../usecase/country_usecase.dart';import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryUseCase _countryUseCase;

  CountryBloc() : _countryUseCase = CountryUseCase(), super(CountryInitial()) {
    on<FetchCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await _countryUseCase.fetchCountries();
        emit(CountryLoaded(countries: countries));
      } catch (e) {
        emit(CountryError(message: e.toString()));}
    });

    on<SortCountries>((event, emit) {
      if (state is CountryLoaded) {
        final currentState = state as CountryLoaded;
        final sortedCountries = _countryUseCase.sortCountries(currentState.countries, event.sortBy);
        emit(CountryLoaded(countries: sortedCountries));
      }
    });
  }
}