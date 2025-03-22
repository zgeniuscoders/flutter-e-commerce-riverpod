import 'package:equatable/equatable.dart';
import 'package:yabiso_ecommerce/domain/models/product.dart';

class HomeState extends Equatable {
  final List<Product> products;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    this.products = const [],
    this.isLoading = false,
    this.errorMessage = "",
  });

  HomeState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, errorMessage];
}
