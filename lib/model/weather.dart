

class Weather {
  final String name;
  final String description;
  final String icon;
  final double temp;

  const Weather({
    this.name = '',
    this.description = '',
    this.icon = '',
    this.temp = 0.0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    String checkedIcon = ''; 
    if(json['weather'][0]['icon'] != null){
      checkedIcon = 'http://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png';
    }
    
    return Weather(
      name: json['name'] ?? '',
      description: json['weather'][0]['description'] ?? '',
      icon: checkedIcon,
      temp: json['main']['temp'] ?? 0,
    );

    
  }
  
}
