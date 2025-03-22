import 'package:equatable/equatable.dart';
import 'package:yabiso_ecommerce/domain/models/product.dart';

class ProductDetailState extends Equatable {
  final Product? product;
  final bool isLoading;
  final String? errorMessage;

  const ProductDetailState({
    this.product = null,
    this.isLoading = false,
    this.errorMessage = null,
  });

  ProductDetailState copyWith({
    Product? product,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProductDetailState(
      product: product,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [product, isLoading, errorMessage];
}
