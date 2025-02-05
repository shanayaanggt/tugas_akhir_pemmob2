import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather/application/providers.dart';

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({super.key});

  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 30.0;

  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: _radius * 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_radius),
                      bottomLeft: Radius.circular(_radius),
                    ),
                    borderSide: BorderSide.none, // Remove border line
                  ),
                  hintText: 'Enter city name',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onSubmitted: (value) =>
                    ref.read(cityProvider.notifier).state = value,
              ),
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 72, 1, 225),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.search,
                          color: Colors.white), // Search icon
                      const SizedBox(width: 5.0), // Space between icon and text
                      Text(
                        'Search',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                FocusScope.of(context).unfocus();
                ref.read(cityProvider.notifier).state = _searchController.text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
