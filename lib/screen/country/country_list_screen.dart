import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/country.dart';
import '../../widget/country_details_bottom_sheet.dart';
import '../../widget/country_tile.dart';
import '../../widget/sort_dropdown.dart';
import 'country_bloc.dart';
import 'country_state.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Euro Atlas'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SortDropdown(), // Use the new widget
          ),
          Expanded(
            child: BlocListener<CountryBloc, CountryState>(
              listener: (context, state) {
                if (state is CountryError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${state.message}'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: BlocBuilder<CountryBloc, CountryState>(
                builder: (context, state) {
                  if (state is CountryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CountryLoaded) {
                    if (state.countries.isEmpty) {
                      return const Center(child: Text('No countries found.'));
                    }
                    return ListView.builder(
                      itemCount: state.countries.length,
                      itemBuilder: (context, index) {
                        final country = state.countries[index];
                        return CountryListTile(
                          country: country,
                          onTap: (selectedCountry) {
                            _showCountryDetails(context, selectedCountry);
                          },
                        );
                      },
                    );
                  }
                  return const Center(child: Text('No Data'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCountryDetails(BuildContext context, Country country) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return CountryDetailsBottomSheet(country: country);
      },
    );
  }
}
