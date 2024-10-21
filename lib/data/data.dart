import '../models/maravilla_model.dart';
import '../models/popular_tours_model.dart';

List<CountryModel> getCountrys() {
  return [
    CountryModel(
      countryName: "Chichén Itzá",
      label: "Popular",
      noOfTours: 18,
      rating: 4.5,
      imgUrl: "https://images.pexels.com/photos/14981609/pexels-photo-14981609/free-photo-of-chichen-itza-in-mexico.jpeg",
    ),
    CountryModel(
      countryName: "Cristo Redentor",
      label: "Más Visitado",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/15397926/pexels-photo-15397926/free-photo-of-jesus-christ-sculpture-on-rock-formation.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    ),
    CountryModel(
      countryName: "Petra",
      label: "Educativo",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/19161139/pexels-photo-19161139/free-photo-of-facade-of-the-palace-tomb-in-the-petra-archaeological-park-in-jordan.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    CountryModel(
      countryName: "La Gran Muralla",
      label: "Aventura",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/6294688/pexels-photo-6294688.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    CountryModel(
      countryName: "Machu Picchu",
      label: "Inspirador",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/90597/pexels-photo-90597.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    CountryModel(
      countryName: "Coliseo Romano",
      label: "Educativo",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/28903455/pexels-photo-28903455/free-photo-of-stunning-black-and-white-colosseum-in-rome.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    CountryModel(
      countryName: "Taj Mahal",
      label: "Educativo",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/7263897/pexels-photo-7263897.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    CountryModel(
      countryName: "Pirámides de Giza",
      label: "Aventura",
      noOfTours: 12,
      rating: 4.3,
      imgUrl: "https://images.pexels.com/photos/3185480/pexels-photo-3185480.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    // Agrega más países de forma similar...
  ];
}

List<PopularTourModel> getPopularTours() {
  return [
    PopularTourModel(
      imgUrl: "https://images.pexels.com/photos/14981609/pexels-photo-14981609/free-photo-of-chichen-itza-in-mexico.jpeg",
      title: "Chichén Itzá",
      desc: "Visita a la maravilla del mundo maya",
      price: "\$ 120.00",
      rating: 4.7,
    ),
    PopularTourModel(
      imgUrl: "https://images.pexels.com/photos/15397926/pexels-photo-15397926/free-photo-of-jesus-christ-sculpture-on-rock-formation.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
      title: "Cristo Redentor",
      desc: "Tour por Río de Janeiro y el famoso Cristo",
      price: "\$ 95.00",
      rating: 4.6,
    ),
    PopularTourModel(
      imgUrl: "https://images.pexels.com/photos/90597/pexels-photo-90597.jpeg?auto=compress&cs=tinysrgb&w=600",
      title: "Machu Picchu",
      desc: "Explora la antigua ciudad inca",
      price: "\$ 150.00",
      rating: 4.8,
    ),
    PopularTourModel(
      imgUrl: "https://images.pexels.com/photos/7263897/pexels-photo-7263897.jpeg?auto=compress&cs=tinysrgb&w=600",
      title: "Taj Mahal",
      desc: "Descubre la joya de la India",
      price: "\$ 200.00",
      rating: 4.9,
    ),
    PopularTourModel(
      imgUrl: "https://images.pexels.com/photos/6294688/pexels-photo-6294688.jpeg?auto=compress&cs=tinysrgb&w=600",
      title: "La Gran Muralla",
      desc: "Recorrido por la Gran Muralla China",
      price: "\$ 180.00",
      rating: 4.7,
    ),
    PopularTourModel(
      imgUrl: "https://images.pexels.com/photos/28903455/pexels-photo-28903455/free-photo-of-stunning-black-and-white-colosseum-in-rome.jpeg?auto=compress&cs=tinysrgb&w=600",
      title: "Coliseo Romano",
      desc: "Visita al histórico Coliseo en Roma",
      price: "\$ 110.00",
      rating: 4.5,
    ),
  ];
}
