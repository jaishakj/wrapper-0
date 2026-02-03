class SocialActivityAggregate {
  const SocialActivityAggregate({
    required this.id,
    required this.appId,
    required this.periodKey,
    this.reelsWatchedCount,
    this.storiesPostedCount,
    this.postsCreatedCount,
  });

  final String id;
  final String appId;
  final String periodKey;
  final int? reelsWatchedCount;
  final int? storiesPostedCount;
  final int? postsCreatedCount;
}

class MessagingActivityAggregate {
  const MessagingActivityAggregate({
    required this.id,
    required this.appId,
    required this.periodKey,
    required this.messagesSentApproxCount,
    required this.callsDurationMsApprox,
    required this.callsCountApprox,
  });

  final String id;
  final String appId;
  final String periodKey;
  final int messagesSentApproxCount;
  final int callsDurationMsApprox;
  final int callsCountApprox;
}

class VideoActivityAggregate {
  const VideoActivityAggregate({
    required this.id,
    required this.appId,
    required this.periodKey,
    required this.videosWatchedApproxCount,
    required this.watchTimeMs,
  });

  final String id;
  final String appId;
  final String periodKey;
  final int videosWatchedApproxCount;
  final int watchTimeMs;
}
