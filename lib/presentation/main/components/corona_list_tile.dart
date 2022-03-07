import 'package:corona_info/domain/model/country.dart';
import 'package:flutter/material.dart';

class CoronaListTile extends StatelessWidget {
  final Country country;

  const CoronaListTile({required this.country, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: Center(child: Text(country.countryName))),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('확진자 수 : '),
                      Text(country.totalCase.toString()),
                      Text('  (+${country.newCase.toString()})'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('사망자 수 : '),
                      Text(country.death.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
