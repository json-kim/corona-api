class CountryVaccine {
  final String countryNm;
  List<Vaccine> vaccines;

  CountryVaccine({
    required this.countryNm,
    required this.vaccines,
  });

  factory CountryVaccine.fromJson(Map<String, dynamic> json) {
    List<Vaccine> vaccines = [
      Vaccine(
        total: json['vaccine_1']['vaccine_1'],
        newCnt: json['vaccine_1']['vaccine_1_new'],
        oldCnt: json['vaccine_1']['vaccine_1_old'],
      ),
      Vaccine(
        total: json['vaccine_2']['vaccine_2'],
        newCnt: json['vaccine_2']['vaccine_2_new'],
        oldCnt: json['vaccine_2']['vaccine_2_old'],
      ),
      Vaccine(
        total: json['vaccine_3']['vaccine_3'],
        newCnt: json['vaccine_3']['vaccine_3_new'],
        oldCnt: json['vaccine_3']['vaccine_3_old'],
      ),
    ];

    return CountryVaccine(
      countryNm: json['countryNm'],
      vaccines: vaccines,
    );
  }

  @override
  String toString() =>
      'CountryVaccine(countryNm: $countryNm, vaccines: $vaccines)';
}

class Vaccine {
  final int total;
  final int newCnt;
  final int oldCnt;

  Vaccine({
    required this.total,
    required this.newCnt,
    required this.oldCnt,
  });

  @override
  String toString() =>
      'Vaccine(total: $total, newCnt: $newCnt, oldCnt: $oldCnt)';
}
