# Mapory 개발 세션 로그

## 프로젝트 개요
- **프로젝트명**: Mapory (Flutter 지도 앱)
- **목적**: GPS 기반 위치 추적 및 지도 표시 앱
- **현재 브랜치**: feature/Map-develop

## 구현 완료된 기능

### 1. 지도 기능
- ✅ flutter_map 패키지 통합
- ✅ MapLibre 타일 서버 사용
- ✅ 기본 지도 표시 및 줌 기능

### 2. GPS 위치 기능
- ✅ geolocator 패키지 설치 및 설정
- ✅ permission_handler로 위치 권한 관리
- ✅ 현재 위치 가져오기
- ✅ 실시간 위치 추적
- ✅ LocationService 클래스 구현

### 3. UI/UX
- ✅ MapScreen 구현
- ✅ 현재 위치 마커 표시
- ✅ 위치 추적 토글 버튼
- ✅ 로딩 인디케이터
- ✅ 네트워크 에러 표시

### 4. Android 설정
- ✅ 위치 권한 설정 (ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION)
- ✅ 인터넷 권한 설정
- ✅ NDK 버전 설정으로 경고 해결

## 해결된 문제들

### 1. 빌드 경고/에러
- ✅ NDK 버전 불일치 경고 해결 (build.gradle.kts에 ndkVersion 추가)
- ✅ local.properties sdk.dir 경로 설정
- ✅ geolocator deprecated API 경고 해결 (locationSettings 사용)
- ✅ print 문을 logger 패키지로 교체
- ✅ widget_test.dart MyApp → MaporyApp 수정
- ✅ withOpacity deprecated → withValues(alpha: 0.3) 교체

### 2. 권한 및 설정
- ✅ Android 위치 권한 설정
- ✅ iOS 위치 권한 설정 (Info.plist)
- ✅ 인터넷 권한 설정

## 현재 이슈 및 해결 방안

### 1. GPS 위치가 미국 LA로 표시되는 문제
**원인**: 
- IP 기반 위치 추정
- 실내 GPS 신호 약화
- 에뮬레이터 사용

**해결 방안**:
- 실외에서 테스트
- 위치 권한 재확인
- 앱 권한 설정 확인

### 2. 핫스팟 사용 시 지도 타일이 안 뜨는 문제
**원인**: 네트워크 연결 문제

**해결 방안**:
- ping 테스트로 네트워크 상태 확인
- 대체 타일 서버 사용
- 네트워크 상태 확인 기능 추가

## 남은 작업

### 1. GPS 정확도 개선
- [ ] 실외 테스트 진행
- [ ] 위치 필터링 알고리즘 구현
- [ ] GPS 신호 강도 표시

### 2. 네트워크 안정성
- [ ] 타일 서버 fallback 구현
- [ ] 오프라인 모드 지원
- [ ] 네트워크 상태 모니터링

### 3. UI/UX 개선
- [ ] 지도 마커 커스터마이징
- [ ] 위치 히스토리 표시
- [ ] 설정 화면 구현

## 기술 스택

### Flutter 패키지
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_map: ^6.1.0
  geolocator: ^10.1.0
  permission_handler: ^11.0.1
  supabase_flutter: ^2.0.0
  logger: ^2.0.2+1
```

### 주요 파일 구조
```
lib/
├── main.dart
├── app.dart
├── screens/
│   └── map_screen.dart
├── services/
│   ├── location_service.dart
│   └── supabase_service.dart
├── models/
│   ├── track.dart
│   ├── note.dart
│   └── photo.dart
└── widgets/
    └── map_marker.dart
```

## 개발 환경
- **OS**: macOS 24.3.0
- **Flutter**: 최신 버전
- **IDE**: Cursor
- **Git**: feature/Map-develop 브랜치

## 다음 세션 시작 시 확인사항
1. 현재 브랜치: `git branch`
2. 최신 상태 확인: `git pull origin feature/Map-develop`
3. 의존성 업데이트: `flutter pub get`
4. 빌드 테스트: `flutter build apk`

---
**마지막 업데이트**: 2024년 현재
**세션**: macOS 개발 환경 