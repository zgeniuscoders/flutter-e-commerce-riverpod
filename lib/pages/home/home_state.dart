import 'package:equatable/equatable.dart';
import 'package:yabiso_ecommerce/domain/models/product.dart';

class HomeState extends Equatable {
  final List<Product> products;
  final bool isLoading;
  final int totalCartItems;
  final String? errorMessage;

  const HomeState({
    this.products = const [],
    this.totalCartItems = 0,
    this.isLoading = false,
    this.errorMessage = "",
  });

  HomeState copyWith({
    List<Product>? products,
    int? totalCartItems,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      totalCartItems: totalCartItems ?? this.totalCartItems,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, errorMessage];
}
