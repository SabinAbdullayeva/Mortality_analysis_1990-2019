---Sual 1: Cədvəldə ümumi neçə sətir var və məlumatlar hansı illəri əhatə edir? 
select count(*) as total_records,
min(year) as start_year,max(year) as end_year 
from fact_mortality;



--Sual 2 : Azərbaycan üçün 2019-cu ildə qeydə alınan ölüm göstəriciləri hansı vəziyyətdədir? 
select * from fact_mortality
where country='Azerbaijan' and year='2019';


--Sual 3: Dünyada elə ölkə və illər varmı ki, orada xərçəng (Neoplasms) ölümləri ürək (Cardiovascular) ölümlərindən daha çox olsun? (Sətirdaxili müqayisə)
select country,year,cancer,cardiovascular from fact_mortality
where cancer<cardiovascular
order by country desc,cancer desc;

--Sual 4: 2019-cu ildə hər bir ölkədə Xərçəng ölümlərinin Ürək və Diabet daxil olmaqla bu 3 əsas xəstəlik arasındakı faiz payı nə qədərdir?
select country,round(cancer*100/(cancer+diabetes+cardiovascular),2) as Cancer_Share from fact_mortality
where year='2019'
order by Cancer_Share desc;


--Sual 5: 1990-2019-cu illər ərzində (30 il boyunca) dünyada Ürək-damar xəstəliklərindən cəmi ən çox insan itirən TOP 5 ölkə hansıdır?
select country,sum(cardiovascular) as Total_30_Year_Heart_Deaths
from fact_mortality
group by country
order by Total_30_Year_Heart_Deaths desc
fetch first 5 rows only;

--Sual 6: 2019-cu ildə hansı ölkələrdə yol qəzaları  səbəbindən ölənlərin sayı yoluxucu xəstəlik olan Vərəmdən  daha çox olub?
select country, road_injuries as TRAFIC_DEATHS,tuberculosis  as TB_DEATHS from fact_mortality
where year=2019 and road_injuries>tuberculosis
order by TRAFIC_DEATHS desc;

--Sual 7: Sual 7: Hər bir il üzrə qlobal miqyasda (bütün ölkələrin cəmi) xərçəng və ürək xəstəliyindən ölənlərin ümumi illik trend dinamikası necə dəyişib? 
select year,sum(cancer) as CANCER_DEATHS, sum(cardiovascular) as CARDIO_DEATHS from fact_mortality
group by year
order by year asc;

--Sual 8: 2019-cu ildə qlobal səviyyədə intiharların (Self_harm) ümumi cəmində hər bir ölkənin faiz payı nə qədərdir? 
SELECT 
    Country, Year, Self_harm AS Suicide_Deaths,
    ROUND((Self_harm / SUM(Self_harm) OVER (PARTITION BY Year)) * 100, 2) AS Global_Suicide_Share_Pct
FROM FACT_MORTALITY
WHERE Year = 2019
ORDER BY Suicide_Deaths DESC;


--Sual 9: Hər bir il üzrə dünyada ən çox körpə ölümü (Neonatal) qeydə alınan TOP 3 lider ölkə hansıdır?
with ranked_table as (select country,year,neonatal_disorders ,dense_rank() over(partition by year order by neonatal_disorders desc) as rnk   from fact_mortality)
select year,country
from ranked_table
where rnk<=3
ORDER BY year DESC, rnk desc;

--Sual 10: Azərbaycanda illər üzrə Xərçəng  ölümlərinin bir əvvəlki ilə nəzərən illik artım faizi (Year-over-Year Growth) nə qədər olub?
select country,year,cancer as CURRENT_YEAR_CANCER_DEATH,lag(cancer,1)over(order by year asc ) AS PREV_YEAR_CANCER_DEATH,round((cancer-lag(cancer,1)over(order by year asc ))/nullif(lag(cancer,1)over(order by year asc ),0)*100,2) as YOY_Growth from fact_mortality 
where country='Azerbaijan';

