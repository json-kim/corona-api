import 'package:corona_info/domain/model/vaccine/country_vaccine.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VaccineListTile extends StatelessWidget {
  final CountryVaccine countryVaccine;
  const VaccineListTile({required this.countryVaccine, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(countryVaccine.countryNm),
              ),
            ),
            ...countryVaccine.vaccines
                .asMap()
                .entries
                .map(
                  (e) => SizedBox(
                    width: 25.w,
                    height: 15.h,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(child: Text('${e.key + 1} 차'))),
                        const Divider(),
                        Expanded(
                            flex: 1,
                            child: Center(child: Text('${e.value.total}명'))),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
        Divider(),
      ],
    );
  }
}
