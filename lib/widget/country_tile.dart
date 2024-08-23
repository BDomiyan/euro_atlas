import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/country.dart';

class CountryListTile extends StatelessWidget {
  final Country country;
  final Function(Country) onTap;

  const CountryListTile({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: country.flags.png,
            width: 70,
            height: 40,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(
          country.name.common,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          country.capital.isNotEmpty ? country.capital.first : 'N/A',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        onTap: () => onTap(country),
      ),
    );
  }
}
