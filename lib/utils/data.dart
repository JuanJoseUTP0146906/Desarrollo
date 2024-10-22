import 'dart:math';

Random random = Random();

List<String> names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
];

List<String> location = [
  "Gran Muralla China",
  "Chichén Itzá",
  "Machu Picchu",
  "Cristo Redentor",
  "Coliseo",
  "Petra",
  "Taj Mahal",
  "Cañón del Antílope",
  "Stonehenge",
  "Pirámides de Giza",
];

List<String> places = [
  "El Templo Mayor",
  "La Plaza de San Pedro",
  "Las Cataratas del Niágara",
  "El Parque Nacional Torres del Paine",
  "El Machu Picchu",
];

List<String> city = [
  "Beijing",
  "Cancún",
  "Cusco",
  "Río de Janeiro",
  "Roma",
  "Amán",
  "Agra",
  "Las Vegas",
  "Londres",
  "El Cairo",
];

List<Map<String, dynamic>> data = List.generate(10, (index) => {
  "name": names[random.nextInt(names.length)],
  "city": city[random.nextInt(city.length)],
  "location": location[random.nextInt(location.length)],
  "places": places[random.nextInt(places.length)],
  "dp": "assets/images/friends/dp${random.nextInt(11)}.jpg",
  "posts": "assets/images/posts/post${random.nextInt(6)}.jpg",
  "saved": "assets/images/saved/saved${random.nextInt(6)}.jpg",
  "story": "assets/images/story/cm${random.nextInt(25)}.jpg",
});


