import 'dart:io';

class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);
}

class ProductManager {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  List<Product> getAllProducts() => _products;

  Product getProduct(int index) {
    return _products[index];
  }

  void editProduct(int index, String name, String description, double price) {
    _products[index].name = name;
    _products[index].description = description;
    _products[index].price = price;
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
  }
}

void main() {
  final productManager = ProductManager();
  bool exit = false;

  while (!exit) {
    print('\n=== eCommerce App ===');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Single Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addProduct(productManager);
        break;
      case '2':
        viewAllProducts(productManager);
        break;
      case '3':
        viewSingleProduct(productManager);
        break;
      case '4':
        editProduct(productManager);
        break;
      case '5':
        deleteProduct(productManager);
        break;
      case '6':
        exit = true;
        print('Exiting...');
        break;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void addProduct(ProductManager manager) {
  stdout.write('Enter product name: ');
  var name = stdin.readLineSync() ?? '';
  stdout.write('Enter product description: ');
  var description = stdin.readLineSync() ?? '';
  stdout.write('Enter product price: ');
  var priceInput = stdin.readLineSync() ?? '0';
  var price = double.tryParse(priceInput) ?? 0.0;

  if (name.isNotEmpty && description.isNotEmpty && price > 0) {
    manager.addProduct(Product(name, description, price));
    print('Product added successfully.');
  } else {
    print('Error: Invalid input. Please try again.');
  }
}

void viewAllProducts(ProductManager manager) {
  final products = manager.getAllProducts();
  if (products.isEmpty) {
    print('No products available.');
    return;
  }
  print('\nAll Products:');
  for (var i = 0; i < products.length; i++) {
    final product = products[i];
    print('${i + 1}. ${product.name} - \$${product.price.toStringAsFixed(2)}');
    print('   Description: ${product.description}');
  }
}

void viewSingleProduct(ProductManager manager) {
  stdout.write('Enter product number: ');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input) ?? -1;

  if (index < 1 || index > manager.getAllProducts().length) {
    print('Error: Invalid product number.');
    return;
  }

  final product = manager.getProduct(index - 1);
  print('\nProduct Details:');
  print('Name: ${product.name}');
  print('Description: ${product.description}');
  print('Price: \$${product.price.toStringAsFixed(2)}');
}

void editProduct(ProductManager manager) {
  stdout.write('Enter product number to edit: ');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input) ?? -1;

  if (index < 1 || index > manager.getAllProducts().length) {
    print('Error: Invalid product number.');
    return;
  }

  final product = manager.getProduct(index - 1);
  print('Editing product: ${product.name}');

  stdout.write('Enter new name (${product.name}): ');
  var name = stdin.readLineSync() ?? product.name;
  stdout.write('Enter new description (${product.description}): ');
  var description = stdin.readLineSync() ?? product.description;
  stdout.write('Enter new price (${product.price}): ');
  var priceInput = stdin.readLineSync() ?? product.price.toString();
  var price = double.tryParse(priceInput) ?? product.price;

  manager.editProduct(index - 1, name, description, price);
  print('Product updated successfully.');
}

void deleteProduct(ProductManager manager) {
  stdout.write('Enter product number to delete: ');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input) ?? -1;

  if (index < 1 || index > manager.getAllProducts().length) {
    print('Error: Invalid product number.');
    return;
  }

  manager.deleteProduct(index - 1);
  print('Product deleted successfully.');
}