import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedState extends Equatable {
  final int totalCartItems;

  const SharedState({this.totalCartItems = 0});


  SharedState copyWith({int? totalItems}){
    return SharedState(totalCartItems: totalItems ?? totalCartItems);
  }

  @override
  List<Object?> get props => [totalCartItems];
}

final sharedStateProvider = StateProvider<SharedState>((ref) => SharedState());
