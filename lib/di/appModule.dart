import 'package:get_it/get_it.dart';
import 'package:yabiso_ecommerce/data/local/local_product_service_impl.dart';
import 'package:yabiso_ecommerce/domain/services/ProductService.dart';

final getIt = GetIt.instance;


void setup(){
  getIt.registerLazySingleton<ProductService>(() => LocalProductServiceImpl());
}