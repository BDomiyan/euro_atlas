import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/country.dart';

class CountryDetailsBottomSheet extends StatelessWidget {
  final Country country;

  const CountryDetailsBottomSheet({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2.0,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: country.flags.png,
                  width: 100,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildListTile(
              context,
              Icons.flag,
              'Name:',
              country.name.common,
            ),
            _buildListTile(
              context,
              Icons.location_city,
              'Capital:',
              country.capital.isNotEmpty ? country.capital.first : 'N/A',
            ),
            _buildListTile(
              context,
              Icons.people,
              'Population:',
              '${country.population}',
            ),
            _buildListTile(
              context,
              Icons.language,
              'Languages:',
              country.languages.values.join(', '),
            ),
            _buildListTile(
              context,
              Icons.account_balance,
              'Official Name:',
              country.name.official,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
