import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sa_movie_ft/app_constans.dart';
import 'package:sa_movie_ft/movie/providers/movie_get_detail_provider.dart';
import 'package:sa_movie_ft/movie/providers/movie_get_discover_provider.dart';
import 'package:sa_movie_ft/movie/providers/movie_get_now_playing_provider.dart';
import 'package:sa_movie_ft/movie/providers/movie_get_top_rated_provider.dart';
import 'package:sa_movie_ft/movie/providers/movie_get_videos_provider.dart';
import 'package:sa_movie_ft/movie/providers/movie_search_provider.dart';
import 'package:sa_movie_ft/movie/repositories/movie_repository.dart';
import 'package:sa_movie_ft/movie/repositories/movie_repository_impl.dart';

final sl = GetIt.instance;

void setup() {
  // Register Provider
  sl.registerFactory<MovieGetDiscoverProvider>(
    () => MovieGetDiscoverProvider(sl()),
  );
  sl.registerFactory<MovieGetTopRatedProvider>(
    () => MovieGetTopRatedProvider(sl()),
  );
  sl.registerFactory<MovieGetNowPlayingProvider>(
    () => MovieGetNowPlayingProvider(sl()),
  );
  sl.registerFactory<MovieGetDetailProvider>(
    () => MovieGetDetailProvider(sl()),
  );
  sl.registerFactory<MovieGetVideosProvider>(
    () => MovieGetVideosProvider(sl()),
  );
  sl.registerFactory<MovieSearchProvider>(
    () => MovieSearchProvider(sl()),
  );

  // Register Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Register Http Client (DIO)
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: AppConstans.baseUrl,
        queryParameters: {'api_key': AppConstans.apiKey},
      ),
    ),
  );
}
