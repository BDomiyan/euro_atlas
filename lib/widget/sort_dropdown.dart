// sort_dropdown.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/country/country_bloc.dart';
import '../screen/country/country_event.dart';


class SortDropdown extends StatelessWidget {
  const SortDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SortBy>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
      onChanged: (SortBy? newValue) {
        if (newValue != null) {
          context.read<CountryBloc>().add(SortCountries(newValue));
        }
      },
      items: const [
        DropdownMenuItem(
          value: SortBy.name,
          child: Text('Sort by Name'),
        ),
        DropdownMenuItem(
          value: SortBy.capital,
          child: Text('Sort by Capital'),
        ),
        DropdownMenuItem(
          value: SortBy.population,
          child: Text('Sort by Population'),
        ),
      ],
      hint: const Text('Sort by'),
    );
  }
}
