import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  final Logger _logger = Logger();
  StreamSubscription<Position>? _positionStream;
  final StreamController<LatLng> _locationController =
      StreamController<LatLng>.broadcast();

  Stream<LatLng> get locationStream => _locationController.stream;

  /// 위치 권한 요청
  Future<bool> requestLocationPermission() async {
    // 위치 권한 상태 확인
    PermissionStatus status = await Permission.location.status;

    if (status.isDenied) {
      // 권한 요청
      status = await Permission.location.request();
    }

    if (status.isPermanentlyDenied) {
      // 설정에서 권한을 수동으로 활성화해야 함
      await openAppSettings();
      return false;
    }

    return status.isGranted;
  }

  /// 위치 서비스가 활성화되어 있는지 확인
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// 현재 위치 가져오기
  Future<LatLng?> getCurrentLocation() async {
    try {
      // 권한 확인
      bool hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        _logger.w('위치 권한이 없습니다.');
        return null;
      }

      // 위치 서비스 확인
      bool isEnabled = await isLocationServiceEnabled();
      if (!isEnabled) {
        _logger.w('위치 서비스가 비활성화되어 있습니다.');
        return null;
      }

      // 현재 위치 가져오기 (최신 geolocator 방식)
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 5,
        ),
      );

      _logger.i('GPS 위치: ${position.latitude}, ${position.longitude}');
      _logger.i('정확도: ${position.accuracy}미터');

      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      _logger.e('현재 위치를 가져오는 중 오류 발생: $e');
      return null;
    }
  }

  /// 위치 추적 시작
  Future<void> startLocationTracking() async {
    try {
      // 권한 확인
      bool hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        _logger.w('위치 권한이 없습니다.');
        return;
      }

      // 위치 서비스 확인
      bool isEnabled = await isLocationServiceEnabled();
      if (!isEnabled) {
        _logger.w('위치 서비스가 비활성화되어 있습니다.');
        return;
      }

      // 기존 스트림 정리
      await stopLocationTracking();

      // 위치 추적 시작
      _positionStream =
          Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.bestForNavigation, // 최고 정확도
              distanceFilter: 5, // 5미터마다 업데이트 (더 민감하게)
            ),
          ).listen(
            (Position position) {
              LatLng location = LatLng(position.latitude, position.longitude);
              _logger.i(
                '위치 추적 업데이트: ${location.latitude}, ${location.longitude}',
              );
              _logger.i('정확도: ${position.accuracy}미터');
              _locationController.add(location);
            },
            onError: (error) {
              _logger.e('위치 추적 중 오류 발생: $error');
            },
          );
    } catch (e) {
      _logger.e('위치 추적을 시작하는 중 오류 발생: $e');
    }
  }

  /// 위치 추적 중지
  Future<void> stopLocationTracking() async {
    await _positionStream?.cancel();
    _positionStream = null;
  }

  /// 두 지점 간의 거리 계산 (미터)
  double calculateDistance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
  }

  /// 리소스 정리
  void dispose() {
    stopLocationTracking();
    _locationController.close();
  }
}
