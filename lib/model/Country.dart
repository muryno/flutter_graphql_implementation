
class Country {
    String capital;
    String code;
    String currency;
    String emoji;
    String emojiU;
    String name;
    String phone;

    Country({this.capital, this.code, this.currency, this.emoji, this.emojiU, this.name, this.phone});

    factory Country.fromJson(Map<String, dynamic> json) {
        return Country(
            capital: json['capital'], 
            code: json['code'], 
            currency: json['currency'], 
            emoji: json['emoji'], 
            emojiU: json['emojiU'], 
            name: json['name'], 
            phone: json['phone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['capital'] = this.capital;
        data['code'] = this.code;
        data['currency'] = this.currency;
        data['emoji'] = this.emoji;
        data['emojiU'] = this.emojiU;
        data['name'] = this.name;
        data['phone'] = this.phone;
        return data;
    }
}