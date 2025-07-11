/* Mapory Custom Style - CartoCSS */
/* 오리 테마 기반 */

/* 기본 맵 설정 */
Map {
  background-color: #FFE5B4; /* 아기오리 노랑 배경 */
}

/* ===== LANDUSE (토지 이용) ===== */
#landuse {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.8;
}

#landuse[landuse="park"] {
  polygon-fill: #A8D8A8; /* 청둥오리 그린 */
  polygon-opacity: 0.7;
}

#landuse[landuse="forest"] {
  polygon-fill: #A8D8A8; /* 청둥오리 그린 */
  polygon-opacity: 0.6;
}

#landuse[landuse="residential"] {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.5;
}

#landuse[landuse="commercial"] {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.6;
}

/* ===== WATER (수역) ===== */
#water {
  polygon-fill: #B8E6FF; /* 청둥오리 파랑 */
  polygon-opacity: 0.8;
}

#water[water="river"] {
  polygon-fill: #B8E6FF; /* 청둥오리 파랑 */
  polygon-opacity: 0.9;
}

#water[water="lake"] {
  polygon-fill: #B8E6FF; /* 청둥오리 파랑 */
  polygon-opacity: 0.8;
}

/* ===== ROADS (도로) ===== */
#roads {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 1;
  line-opacity: 0.9;
}

#roads[highway="motorway"] {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 4;
  line-opacity: 0.9;
}

#roads[highway="trunk"] {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 3;
  line-opacity: 0.9;
}

#roads[highway="primary"] {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 2.5;
  line-opacity: 0.9;
}

#roads[highway="secondary"] {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 2;
  line-opacity: 0.8;
}

#roads[highway="tertiary"] {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 1.5;
  line-opacity: 0.8;
}

#roads[highway="residential"] {
  line-color: #FFB366; /* 부리 오렌지 */
  line-width: 1;
  line-opacity: 0.7;
}

/* ===== BUILDINGS (건물) ===== */
#buildings {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.7;
}

#buildings[building="commercial"] {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.8;
}

#buildings[building="residential"] {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.6;
}

#buildings[building="school"] {
  polygon-fill: #A8D8A8; /* 청둥오리 그린 */
  polygon-opacity: 0.7;
}

#buildings[building="hospital"] {
  polygon-fill: #B8E6FF; /* 청둥오리 파랑 */
  polygon-opacity: 0.8;
}

/* ===== POINTS OF INTEREST (관심지점) ===== */
#poi {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 3;
  marker-opacity: 0.8;
}

#poi[amenity="restaurant"] {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 4;
}

#poi[amenity="cafe"] {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 3;
}

#poi[amenity="school"] {
  marker-fill: #A8D8A8; /* 청둥오리 그린 */
  marker-width: 4;
}

#poi[amenity="hospital"] {
  marker-fill: #B8E6FF; /* 청둥오리 파랑 */
  marker-width: 4;
}

#poi[shop="supermarket"] {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 4;
}

#poi[leisure="park"] {
  marker-fill: #A8D8A8; /* 청둥오리 그린 */
  marker-width: 3;
}

/* ===== LABELS (라벨) ===== */
#labels {
  text-name: "[name]";
  text-face-name: "Noto Sans CJK KR, Noto Sans, sans-serif";
  text-size: 10;
  text-fill: #333333;
  text-opacity: 0.8;
  text-halo-radius: 1;
  text-halo-fill: #ffffff;
  text-halo-opacity: 0.8;
}

#labels[place="city"] {
  text-size: 14;
  text-fill: #000000;
  text-weight: bold;
  text-face-name: "Noto Sans CJK KR Bold, Noto Sans Bold, sans-serif";
}

#labels[place="town"] {
  text-size: 12;
  text-fill: #333333;
  text-weight: bold;
  text-face-name: "Noto Sans CJK KR Bold, Noto Sans Bold, sans-serif";
}

#labels[place="village"] {
  text-size: 10;
  text-fill: #666666;
  text-face-name: "Noto Sans CJK KR, Noto Sans, sans-serif";
}

/* ===== ADMINISTRATIVE BOUNDARIES (행정 경계) ===== */
#admin {
  line-color: #666666;
  line-width: 1;
  line-opacity: 0.5;
}

#admin[admin_level="2"] {
  line-color: #333333;
  line-width: 2;
  line-opacity: 0.7;
}

#admin[admin_level="4"] {
  line-color: #666666;
  line-width: 1.5;
  line-opacity: 0.6;
}

/* ===== NATURAL FEATURES (자연 지형) ===== */
#natural {
  polygon-fill: #A8D8A8; /* 청둥오리 그린 */
  polygon-opacity: 0.6;
}

#natural[natural="wood"] {
  polygon-fill: #A8D8A8; /* 청둥오리 그린 */
  polygon-opacity: 0.5;
}

#natural[natural="water"] {
  polygon-fill: #B8E6FF; /* 청둥오리 파랑 */
  polygon-opacity: 0.7;
}

#natural[natural="beach"] {
  polygon-fill: #FFF8DC; /* 기본 오리 크림 */
  polygon-opacity: 0.8;
}

/* ===== TRANSPORT (교통) ===== */
#transport {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 3;
  marker-opacity: 0.8;
}

#transport[railway="station"] {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 4;
}

#transport[railway="subway_entrance"] {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 3;
}

#transport[highway="bus_stop"] {
  marker-fill: #FFB366; /* 부리 오렌지 */
  marker-width: 2;
}

/* ===== ZOOM LEVEL ADJUSTMENTS ===== */
/* 줌 레벨 10 이하 */
Map [zoom<10] {
  #roads[highway="residential"] {
    line-width: 0.5;
  }
  
  #buildings {
    polygon-opacity: 0.3;
  }
  
  #poi {
    marker-width: 2;
  }
}

/* 줌 레벨 15 이상 */
Map [zoom>=15] {
  #roads[highway="residential"] {
    line-width: 1.5;
  }
  
  #buildings {
    polygon-opacity: 0.8;
  }
  
  #poi {
    marker-width: 4;
  }
  
  #labels {
    text-size: 12;
  }
} 