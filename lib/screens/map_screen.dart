// Main map screen implementation

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../services/location_service.dart';
import 'dart:io';
import 'package:logger/logger.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final LocationService _locationService = LocationService();
  final Logger _logger = Logger();

  // 서울 시청 좌표 (기본 위치)
  static const LatLng _defaultLocation = LatLng(37.5665, 126.9780);

  // 현재 위치 상태
  LatLng? _currentLocation;
  bool _isLoadingLocation = false;
  bool _isTrackingLocation = false;
  bool _hasNetworkError = false;

  @override
  void initState() {
    super.initState();
    _checkNetworkAndInitialize();
  }

  /// 네트워크 연결 확인 및 초기화
  Future<void> _checkNetworkAndInitialize() async {
    try {
      // 네트워크 연결 확인
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _logger.i('네트워크 연결 확인됨');
        setState(() {
          _hasNetworkError = false;
        });
        _initializeLocation();
      }
    } on SocketException catch (_) {
      _logger.e('네트워크 연결 실패');
      setState(() {
        _hasNetworkError = true;
      });
    }
  }

  /// 위치 서비스 초기화
  Future<void> _initializeLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      // 현재 위치 가져오기
      LatLng? location = await _locationService.getCurrentLocation();
      if (location != null) {
        setState(() {
          _currentLocation = location;
        });
        // 지도를 현재 위치로 이동
        _mapController.move(location, 15.0);
      }
    } catch (e) {
      _logger.e('위치 초기화 중 오류: $e');
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  /// 현재 위치로 이동
  Future<void> _moveToCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      LatLng? location = await _locationService.getCurrentLocation();
      if (location != null) {
        setState(() {
          _currentLocation = location;
        });
        _mapController.move(location, 15.0);
      } else {
        // 위치를 가져올 수 없는 경우 스낵바 표시
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('현재 위치를 가져올 수 없습니다.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      _logger.e('현재 위치 이동 중 오류: $e');
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  /// 위치 추적 시작/중지
  Future<void> _toggleLocationTracking() async {
    if (_isTrackingLocation) {
      await _locationService.stopLocationTracking();
      setState(() {
        _isTrackingLocation = false;
      });
    } else {
      await _locationService.startLocationTracking();
      setState(() {
        _isTrackingLocation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapory Map'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // 위치 추적 토글 버튼
          IconButton(
            onPressed: _toggleLocationTracking,
            icon: Icon(
              _isTrackingLocation
                  ? Icons.location_searching
                  : Icons.location_disabled,
              color: _isTrackingLocation ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation ?? _defaultLocation,
              initialZoom: 13.0,
              onTap: (tapPosition, point) {
                // 지도 탭 시 처리
                _logger.i('Tapped at: ${point.latitude}, ${point.longitude}');
              },
            ),
            children: [
              // OpenStreetMap 타일 레이어 (CartoDB 서버 사용)
              TileLayer(
                urlTemplate:
                    'https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.mapory',
                maxZoom: 19,
              ),
              // 마커 레이어
              MarkerLayer(
                markers: [
                  // 현재 위치 마커
                  if (_currentLocation != null)
                    Marker(
                      point: _currentLocation!,
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                  // 예시 마커 (기본 위치)
                  if (_currentLocation == null)
                    Marker(
                      point: _defaultLocation,
                      width: 80,
                      height: 80,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                ],
              ),
            ],
          ),
          // 로딩 인디케이터
          if (_isLoadingLocation)
            const Positioned(
              top: 20,
              right: 20,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 8),
                      Text('위치 확인 중...'),
                    ],
                  ),
                ),
              ),
            ),
          // 네트워크 에러 표시
          if (_hasNetworkError)
            const Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Card(
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.wifi_off, color: Colors.white),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '네트워크 연결을 확인해주세요',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoadingLocation ? null : _moveToCurrentLocation,
        child: _isLoadingLocation
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.my_location),
      ),
    );
  }

  @override
  void dispose() {
    _locationService.stopLocationTracking();
    super.dispose();
  }
}
