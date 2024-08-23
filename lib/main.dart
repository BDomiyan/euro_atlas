import 'package:euro_atlas/screen/country/country_bloc.dart';
import 'package:euro_atlas/screen/country/country_event.dart';
import 'package:euro_atlas/screen/country/country_list_screen.dart';
import 'package:euro_atlas/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EuroAtlas',
      theme: AppTheme.themeData,
      home: BlocProvider(
        create: (context) => CountryBloc()..add(FetchCountries()),
        child: const CountryListScreen(),
      ),
    );
  }
}

