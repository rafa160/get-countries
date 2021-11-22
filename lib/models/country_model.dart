class CountryModel {

  String name;
  String alpha2Code;
  String alpha3Code;
  String capital;
  String region;
  String subRegion;
  String population;
  int area;
  double gini;
  String nativeName;
  String flag;
  String cioc;

  CountryModel({
      this.name,
      this.alpha2Code,
      this.alpha3Code,
      this.capital,
      this.region,
      this.subRegion,
      this.population,
      this.area,
      this.gini,
      this.nativeName,
      this.flag,
      this.cioc});

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json['name'],
    alpha2Code: json['alpha2Code'],
    alpha3Code:  json['alpha3Code'],
    capital: json['capital'],
    region: json['region'],
    subRegion: json['subregion'],
    population: json['population'],
    area: json['area'],
    gini: json['gini'],
    nativeName: json['nativeName'],
    flag: json['flag'],
    cioc: json['cioc'],
  );

  String getPopulation() => population ?? 'no data';
  String getSubRegion() => subRegion ?? 'no data';
  String getNativeName() => nativeName ?? 'no data';

}