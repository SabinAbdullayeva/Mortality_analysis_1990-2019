# Mortality_analysis_1990-2019
Ölüm göstəricilərinin trendlərini, demoqrafik paylanmasını və əsas səbəblərini analiz edən SQL layihəsi.

# 📊 Mortality (Ölüm Oranı) Analizi — SQL Layihəsi

Bu layihə, müxtəlif ölkələr və illər üzrə xəstəliklərdən qaynaqlanan ölüm hallarını analiz etmək üçün hazırlanmış bir SQL layihəsidir. Layihə 1990-2019cu illərin datasını əhatə edir və məlumatların trendləri və qlobal göstəriciləri təhlil edilir.

## 🗂️ Data Strukturu (Sütunlar)
Analiz olunan məlumat bazası aşağıdakı 4 sadə və təmiz sütundan ibarətdir:
* `Country` — Ölüm halının qeydə alındığı ölkə.
* `Year` — Hadisənin baş verdiyi il.
* `Disease`  — Hər xəstəliyin adına müvafiq ölüm sayı.
* 

## 🎯 Layihənin Məqsədləri
* Qlobal və regional səviyyədə ən çox ölümə səbəb olan xəstəlikləri tapmaq.
* İllər üzrə ölüm saylarının artma və ya azalma trendlərini izləmək.
* Ölkələr arasındakı ölüm göstəricilərini müqayisə etmək.

## 🛠️ İstifadə Olunan SQL Alətləri
* **Aqreqat Funksiyaları:** `SUM()`, `AVG()`, `COUNT()`
* **Qruplaşdırma və Sıralama:** `GROUP BY`, `ORDER BY`, `HAVING`
* **Filtrləmə:** `WHERE` şərtləri

