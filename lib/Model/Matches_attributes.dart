class Matches {
  String? countryName;
  String? leagueId;
  String? leagueName;
  String? leagueSeason;
  String? leagueLogo;
  String? countryFlag;
  Matches(
      {this.countryName,
      this.leagueId,
      this.leagueName,
      this.leagueSeason,
      this.leagueLogo,
      this.countryFlag});
  Matches.fromJson(Map<String, dynamic> json) {
    countryFlag = json["country_logo"];
    leagueLogo = json["league_logo"].isNotEmpty ? json["league_logo"] : null;
    countryName = json["country_name"];
    leagueId = json["league_id"];
    leagueName = json["league_name"];
    leagueSeason = json["league_season"];
  }
}
