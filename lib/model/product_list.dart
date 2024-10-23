class Product {
  String image;
  String title;
  int price;
  String description;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

var productList = [
  Product(
    image: 'img/1.jpg',
    title: 'Cincin Titanium Pria',
    price: 7000,
    description: 'Cincin titanium pria dengan design yang mewah dan juga elegan dan cocok untuk digunakan untuk daily, formal, dan berbagai aktivitas lainnya.'
  ),
  Product(
    image: 'img/2.jpg',
    title: 'Cincin Titanium Batu Onyx',
    price: 60000,
    description: 'Bahan Asli Titanium 316L (Baja Titanium) adalah kualitas Titanium terbaik dikelasnya. Diproduksi dengan teknik yang terbaik sehingga kualitas produk yang dihasilkan halus dan elegan serta memiliki daya tahan yang sangat tinggi.'
  ),
  Product(
    image: 'img/3.jpg',
    title: 'Kalung Titanium Pria Model Balok',
    price: 10000,
    description: 'Kalung Terbuat dari Bahan Asli Titanium 316L (Baja Titanium) yang merupakan Kualitas Titanium terbaik dikelasnya.'
  ),
  Product(
    image: 'img/4.jpg',
    title: 'Kalung Rantai Besi Pria',
    price: 20000,
    description: 'Kalung ini memiliki durabilitas yang luar biasa. Dapat dipakai seumur hidup dan resisten terhadap berbagai kondisi seperti terkena air, maupun keringat akan tetap bersinar, tidak berkarat dan menimbulkan alergi.'
  ),
  Product(
    image: 'img/5.jpg',
    title: 'Paket Gelang Pria Tali Mix',
    price: 25000,
    description: 'Paket isi 4 gelang mix yang cocok untuk style pria cool. Tahan panas, basah, dan tidak mudah putus'
  ),
  Product(
    image: 'img/6.jpeg',
    title: 'Gelang Rantai Besi Pria',
    price: 30000,
    description: 'Bahan stainless steel handmade (buatan pengrajin tangan). Dari segi kerapian produk handmade jangan samakan dengan titanium yang dibuat cetakan/pabrik. Namun dari segi kualitas dan ketahanan boleh di adu, produk dijamin anti karat dan anti luntur.'
  ),
];