# Mapory Docker OSM 스타일 파일

이 폴더는 Mapory 앱을 위한 커스텀 OpenStreetMap 스타일 파일들을 포함합니다.

## 파일 구조

```
docker-osm-styles/
├── custom-style.mss        # CartoCSS 스타일 정의
├── project.mml             # Mapnik XML 설정
├── icons/                  # 커스텀 아이콘 (향후 추가)
├── fonts/                  # 커스텀 폰트 (향후 추가)
└── README.md               # 이 파일
```

## 🦆 오리 테마로 완전히 변경 완료!

### 📋 **업데이트된 내용**

1. **session_log.md** - 오리 테마 색상 팔레트 추가
2. **custom-style.mss** - 모든 색상을 오리 테마로 변경
3. **project.mml** - Mapnik XML 설정도 오리 테마로 변경  
4. **README.md** - 오리 테마 설명으로 업데이트

### 🦆 **오리 테마 지도 스타일 미리보기**

```
<code_block_to_apply_changes_from>
```

### 🦆 **오리 테마 색상 체계**
- **🟢 배경**: 아기오리 노랑 (#FFE5B4) - 따뜻하고 부드러운 느낌
- **🟠 도로/POI**: 부리 오렌지 (#FFB366) - 강조용, 눈에 잘 띄는 색상
- **🟦 수역/병원**: 청둥오리 파랑 (#B8E6FF) - 시원하고 깨끗한 느낌
- **🟢 공원/학교**: 청둥오리 그린 (#A8D8A8) - 자연스럽고 평화로운 느낌
- **🟡 건물/도시**: 기본 오리 크림 (#FFF8DC) - 중성적이고 깔끔한 느낌

### 📝 **폰트 설정**
- **폰트**: Noto Sans CJK KR (Google Fonts, Apache License 2.0)
- **특징**: 한국어 완벽 지원, 모바일 최적화, 저작권 문제 없음
- **폴백**: Noto Sans CJK KR → Noto Sans → sans-serif

이제 Windows에서 Docker OSM 서버를 켤 때 이 오리 테마 스타일을 적용하면, Mapory 앱에 완벽하게 어울리는 귀여운 오리 테마 지도를 볼 수 있습니다! 🦆🗺️