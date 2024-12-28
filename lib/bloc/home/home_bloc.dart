import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../api/api_service.dart';
import '../../models/product.dart';

part "home_even.dart";
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc(this.apiService) : super(HomeInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(HomeLoading());
      try {
        final products = await apiService.fetchProducts();
        emit(HomeLoaded(
          products: products.map((p) => Product.fromJson(p)).toList(),
        ));
      } catch (e) {
        emit(HomeError(message: "Failed to fetch products."));
      }
    });
  }
}
