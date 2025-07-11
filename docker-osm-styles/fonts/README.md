# Mapory OSM 스타일 - 폰트 설정

## 사용 폰트: Noto Sans

Mapory 앱의 지도 스타일에서는 **Noto Sans** 폰트 패밀리를 사용합니다.

### 폰트 특징
- **제공**: Google Fonts (오픈소스)
- **라이선스**: Apache License 2.0 (상업적 사용 가능)
- **언어 지원**: 전 세계 모든 언어 지원 (한국어 완벽 지원)
- **가독성**: 모바일 화면에서도 뛰어난 가독성

### 사용 폰트 목록

#### 1. 기본 폰트
- **Noto Sans**: 기본 라틴 문자
- **Noto Sans CJK KR**: 한국어 전용
- **Noto Sans CJK JP**: 일본어 지원 (필요시)
- **Noto Sans CJK SC**: 중국어 간체 지원 (필요시)

#### 2. 폰트 스타일
- **Regular**: 기본 텍스트
- **Bold**: 강조 텍스트 (도시명, 주요 지점)
- **Medium**: 중간 강조 (구역명)

## Docker 컨테이너에서 폰트 설치

### 1. 폰트 다운로드
```bash
# 컨테이너 내부에서 실행
apt-get update
apt-get install -y fonts-noto fonts-noto-cjk
```

### 2. 폰트 확인
```bash
# 설치된 폰트 확인
fc-list | grep -i noto
```

### 3. 폰트 캐시 업데이트
```bash
# 폰트 캐시 새로고침
fc-cache -fv
```

## CartoCSS에서 폰트 사용

### 기본 설정
```css
/* custom-style.mss */
#labels {
  text-face-name: "Noto Sans CJK KR";
  text-size: 10;
  text-fill: #333333;
}
```

### 폰트 폴백 설정
```css
#labels {
  text-face-name: "Noto Sans CJK KR, Noto Sans, sans-serif";
  text-size: 10;
  text-fill: #333333;
}
```

## Mapnik XML에서 폰트 사용

### 기본 설정
```xml
<!-- project.mml -->
<TextSymbolizer face-name="Noto Sans CJK KR" size="10" fill="#333333">
  <CssParameter name="text-transform">none</CssParameter>
</TextSymbolizer>
```

### 폰트 폴백 설정
```xml
<TextSymbolizer face-name="Noto Sans CJK KR, Noto Sans, sans-serif" size="10" fill="#333333">
  <CssParameter name="text-transform">none</CssParameter>
</TextSymbolizer>
```

## 폰트 파일 구조

```
docker-osm-styles/
├── fonts/
│   ├── README.md              # 이 파일
│   ├── noto-sans/             # Noto Sans 폰트 파일들 (필요시)
│   │   ├── NotoSans-Regular.ttf
│   │   ├── NotoSans-Bold.ttf
│   │   └── NotoSans-Medium.ttf
│   └── noto-sans-cjk-kr/      # 한국어 폰트 파일들 (필요시)
│       ├── NotoSansCJKkr-Regular.ttf
│       ├── NotoSansCJKkr-Bold.ttf
│       └── NotoSansCJKkr-Medium.ttf
```

## 폰트 최적화

### 1. 서브셋 폰트 사용
- 필요한 문자만 포함된 폰트 파일 사용
- 파일 크기 최적화로 로딩 속도 향상

### 2. 폰트 프리로딩
- 컨테이너 시작 시 폰트 캐시 미리 생성
- 렌더링 성능 향상

### 3. 폰트 폴백 전략
```css
/* 한국어 → 영어 → 기본 폰트 순서 */
text-face-name: "Noto Sans CJK KR, Noto Sans, Arial, sans-serif";
```

## 문제 해결

### 한글이 깨지는 경우
1. 폰트 설치 확인: `fc-list | grep -i noto`
2. 폰트 캐시 업데이트: `fc-cache -fv`
3. 컨테이너 재시작

### 폰트가 로드되지 않는 경우
1. 폰트 파일 경로 확인
2. 파일 권한 확인
3. Mapnik 폰트 설정 확인

## 참고 자료

- [Noto Sans 공식 사이트](https://fonts.google.com/noto)
- [Noto Sans CJK 다운로드](https://github.com/googlefonts/noto-cjk)
- [Mapnik 폰트 설정 가이드](https://mapnik.org/docs/) 