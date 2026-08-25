import 'package:flutter/foundation.dart';

enum DramaStatus { ongoing, completed, upcoming }

@immutable
class Drama {
  final String id;
  final String title;
  final String originalTitle;
  final String description;
  final String thumbnailUrl;
  final String backdropUrl;
  final List<String> genres;
  final int year;
  final int totalEpisodes;
  final int currentEpisode;
  final DramaStatus status;
  final double rating;
  final String country;
  final String language;
  final List<String> cast;
  final String director;
  final String videoUrl;
  final int views;
  final DateTime releaseDate;

  const Drama({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.description,
    required this.thumbnailUrl,
    required this.backdropUrl,
    required this.genres,
    required this.year,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.status,
    required this.rating,
    required this.country,
    required this.language,
    required this.cast,
    required this.director,
    required this.videoUrl,
    required this.views,
    required this.releaseDate,
  });

  String get formattedViews {
    if (views >= 1000000) {
      return '${(views / 1000000).toStringAsFixed(1)}M';
    } else if (views >= 1000) {
      return '${(views / 1000).toStringAsFixed(1)}K';
    }
    return views.toString();
  }

  String get statusText {
    switch (status) {
      case DramaStatus.ongoing:
        return 'Đang phát (Tập $currentEpisode/$totalEpisodes)';
      case DramaStatus.completed:
        return 'Hoàn thành ($totalEpisodes tập)';
      case DramaStatus.upcoming:
        return 'Sắp ra mắt';
    }
  }

  String get progressText {
    if (totalEpisodes == 0) return '0%';
    final progress = (currentEpisode / totalEpisodes * 100).round();
    return '$progress%';
  }

  Drama copyWith({
    String? id,
    String? title,
    String? originalTitle,
    String? description,
    String? thumbnailUrl,
    String? backdropUrl,
    List<String>? genres,
    int? year,
    int? totalEpisodes,
    int? currentEpisode,
    DramaStatus? status,
    double? rating,
    String? country,
    String? language,
    List<String>? cast,
    String? director,
    String? videoUrl,
    int? views,
    DateTime? releaseDate,
  }) {
    return Drama(
      id: id ?? this.id,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      genres: genres ?? this.genres,
      year: year ?? this.year,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      currentEpisode: currentEpisode ?? this.currentEpisode,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      country: country ?? this.country,
      language: language ?? this.language,
      cast: cast ?? this.cast,
      director: director ?? this.director,
      videoUrl: videoUrl ?? this.videoUrl,
      views: views ?? this.views,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Drama && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}