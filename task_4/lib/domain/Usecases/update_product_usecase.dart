class UpdateProductUsecase implements UseCase<void, Product> {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  @override
  Future<void> call(Product product) {
    return repository.updateProduct(product);
  }
}