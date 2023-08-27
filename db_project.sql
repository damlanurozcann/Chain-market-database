create database db_proje
use db_proje

create table tbl_araclar
(
aracno tinyint primary key ,
plaka varchar(12),
nitelik varchar(12),
yolcu_sayisi tinyint ,
yuk_miktari smallint,
model varchar (20),
kasko_no varchar(12)
)

create table tbl_subeler
(
subeno tinyint primary key,
sube_adi varchar (25),
telefon varchar (12),
adres varchar (100),
metrekare smallint,
calisan_sayisi smallint,
uruncesit_sayisi smallint,
)

create table tbl_departmanlar
(
departman_no tinyint primary key,
departman_isim varchar(50),
sorumluluk varchar(50)
)

create table tbl_calisanlar 
(
calisan_no int primary key,
departman_no tinyint foreign key references tbl_departmanlar(departman_no),
subeno tinyint foreign key references tbl_subeler(subeno),
isim varchar(20),
soyisim varchar(20),
dogum_tarihi date,
dogum_yeri varchar(13),
adres varchar (100),
telefon varchar(12),
cinsiyet varchar (5),
ise_giris_tarih date,
gorev varchar (15),
vatandaslik_no char(11),
sigorta_no char(26),
banka_hesap_no char(12),
maas smallint 
)

create table tbl_aracsurucu
(
surucuno tinyint primary key,
calisan_no int foreign key references tbl_calisanlar(calisan_no),
aracno tinyint foreign key references tbl_araclar(aracno),
ehliyet_sinif char (17),
ehliyetno char (5)
)

create table tbl_musteriler 
(
musteri_card_no char(16)primary key,
isim varchar (15),
soyisim varchar(20),
dogum_tarihi date,
email varchar (30),
vatandaslik_no char(11),
cinsiyet varchar (5),
meslek varchar (15),
adres varchar (100),
telefon varchar(12),
kart_alim_tarih date,
toplam_puan decimal(4,2)
)

create table tbl_urungrup
(
grup_no int primary key,
urun_grup_isim varchar(30),
nitelik varchar(30),
tasima_kriter varchar (30),
saklama_kriter varchar (30)
)

create table tbl_urunler
(
urun_no int primary key,
grup_no int foreign key references tbl_urungrup(grup_no),
urun_ismi varchar (25),
marka varchar (25),
fiyat smallint,
agırlık smallint,
puan char(1)
)

create table tbl_satislar
(
satis_no int primary key,
urun_no int foreign key references tbl_urunler(urun_no),
calisan_no int foreign key references tbl_calisanlar(calisan_no),
musteri_card_no char(16) foreign key references tbl_musteriler(musteri_card_no),
subeno tinyint foreign key references tbl_subeler(subeno),
satis_tarih date,
alisveris_no smallint 
)

create table tbl_musteri_servis
(
sefer_no tinyint primary key,
aracno tinyint foreign key references tbl_araclar(aracno),
surucuno tinyint foreign key references tbl_aracsurucu(surucuno),
sefer_tarih date,
guzergah varchar(25)
)

create table tbl_tedarikci
(
tedarikci_no int primary key,
firma_isim varchar(30),
adres varchar(50),
telefon varchar(12),
email varchar (30)
)

create table tbl_stoklar
(
stok_no int primary key,
grup_no int foreign key references tbl_urungrup(grup_no),
tedarikci_no int foreign key references tbl_tedarikci(tedarikci_no) ,
subeno tinyint foreign key references tbl_subeler (subeno),
urun_no int foreign key references tbl_urunler(urun_no),
giris_tarih date,
urun_sayisi smallint,
raf_omru smallint
)


insert into tbl_araclar values('1','34nn5246','kamyon','5','500','2016','1')
insert into tbl_araclar values('2','54az7854','tır','4','2000','2000','2')
insert into tbl_araclar values('3','18ıs2316','kamyon','5','750','2013','3')
insert into tbl_araclar values('4','01ön6341','kamyon','5','530','2016','4')
insert into tbl_araclar values('5','75jj2510','tır','4','5000','2014','5')
insert into tbl_araclar values('6','10tn2913','kamyon','5','600','2015','6')
insert into tbl_araclar values('7','35zk5398','kamyon','5','550','2014','7')
insert into tbl_araclar values('8','16er8537','tır','4','1500','2011','8')
insert into tbl_araclar values('9','56mn7836','kamyon','5','540','2000','9')
insert into tbl_araclar values('10','65kv7339','tır','4','2500','1999','10')
insert into tbl_araclar values('11','34ed4248','tır','4','4000','2005','11')


insert into tbl_departmanlar values ('1','taşıma departmanı','taşıma')
insert into tbl_departmanlar values ('2','pazarlama departmanı','pazarlama')
insert into tbl_departmanlar values ('3','muhasebe departmanı','muhasebe')
insert into tbl_departmanlar values ('4','insan kaynakları departmanı','insan kaynakları')
insert into tbl_departmanlar values ('5','ar-ge departmanı','ar-ge')
insert into tbl_departmanlar values ('6','hukuk departmanı','hukuk')
insert into tbl_departmanlar values ('7','finans departmanı','finans')
insert into tbl_departmanlar values ('8','üretim departmanı','üretim')
insert into tbl_departmanlar values ('9','imalat departmanı','imalat')
insert into tbl_departmanlar values ('10','paketleme departmanı','paketleme')
insert into tbl_departmanlar values ('11','çağrı departmanı','çağrı')


insert into tbl_subeler values('1','istanbul subesi','054789654245','istanbul','100','15','140')
insert into tbl_subeler values('2','ankara subesi','054698745632','ankara','100','10','150')
insert into tbl_subeler values('3','sivas subesi','052147963514','sivas','100','7','160')
insert into tbl_subeler values('4','adana subesi ','056397841523','adana','100','5','170')
insert into tbl_subeler values('5','kars subesi','059875632148','kars','100','45','70')
insert into tbl_subeler values('6','balıkesir subesi','054896378945','balıkesir','100','4','80')
insert into tbl_subeler values('7','izmir subesi','izmir','057841539687','100','11','36')
insert into tbl_subeler values('8','aydın subesi','aydın','054789632145','100','13','22')
insert into tbl_subeler values('9','antalya subesi','antalya','051239874586','100','12','88')
insert into tbl_subeler values('10','mersin subesi','mersin','059874365178','100','17','45')
insert into tbl_subeler values('11','rize subesi','rize','054896328459','100','17','14')


insert into tbl_musteriler values ('1','ayse','gündogdu','1976','ayse_gündogdu@gmail.com','12','kadın','ögretmen','istanbul','053694459578','2006','65')
insert into tbl_musteriler values ('2','ayse','gündogdu','1976','ayse_gündogdu@gmail.com','13','kadın','polis','izmir','053697842614','2007','64')
insert into tbl_musteriler values ('3','rümeysa','kara','1983','rumeysa_kara@gmail.com','14','kadın','doktor','istanbul','053145289746','2008','89')
insert into tbl_musteriler values ('4','fatma','ak','1993','fatma_ak@gmail.com','15','kadın','ögretmen','aydın','053518796423','2006','42')
insert into tbl_musteriler values ('5','ali','gündogdu','1985','ali_gündogdu@gmail.com','16','erkek','ögretmen','mardin','053287964587','2010','63')
insert into tbl_musteriler values ('6','hasan','ışık','1993','hasan_ısık@gmail.com','17','erkek','mühendis','ankara','053645239874','2002','25')
insert into tbl_musteriler values ('7','emir','hançer','1991','emir_hancer@gmail.com','18','erkek','müdür','istanbul','053245871239','2012','10')
insert into tbl_musteriler values ('8','can','gül','1996','can_gül@gmail.com','19','erkek','esnaf','istanbul','053685296374','2013','77')
insert into tbl_musteriler values ('9','kaan','fındık','1985','kaan_gül@gmail.com','20','erkek','doktor','sivas','057485963285','2015','52')
insert into tbl_musteriler values ('10','hasan','taş','1997','hasan_taş@gmail.com','21','erkek','ögretmen','burdur','053641896573','2016','36')
insert into tbl_musteriler values ('11','ateş','yakar','1987','ates_yakar@gmail.com','22','erkek','hakim','istanbul','054578963501','2021','46')


insert into tbl_urungrup values ('1','pc','elektronik','yük','yük')
insert into tbl_urungrup values ('2','maus','elektronik','yük','yük')
insert into tbl_urungrup values ('3','dolap','ev esyası','yük','yük')
insert into tbl_urungrup values ('4','masa','ev esyası','yük','yük')
insert into tbl_urungrup values ('5','sandalye','ev esyası','yük','yük')
insert into tbl_urungrup values ('6','kalem','okul','yük','yük')
insert into tbl_urungrup values ('7','silgi','okul','yük','yük')
insert into tbl_urungrup values ('8','kagıt','okul','yük','yük')
insert into tbl_urungrup values ('9','araba','tasıt','yük','yük')
insert into tbl_urungrup values ('10','halı','ev esyası','yük','yük')
insert into tbl_urungrup values ('11','elbise','giyim','yük','yük')


insert into tbl_urunler values('1','1','pc','sony','5','1','5')
insert into tbl_urunler values('2','2','maus','sony','2','1','9')
insert into tbl_urunler values('3','3','dolap','istikbal','5','10','5')
insert into tbl_urunler values('4','4','masa','istikbal','25','10','2')
insert into tbl_urunler values('5','5','sandalye','istikbal','1','5','3')
insert into tbl_urunler values('6','6','kalem','faber','5','1','4')
insert into tbl_urunler values('7','7','silgi','faber','5','1','1')
insert into tbl_urunler values('8','8','kagıt','faber','5','1','6')
insert into tbl_urunler values('9','9','araba','hot wheels','5','1','8')
insert into tbl_urunler values('10','10','halı','kilim','50','15','7')
insert into tbl_urunler values('11','11','elbise','koton','25','5','9')


insert into tbl_tedarikci values ('1','kartal','istanbul','054687963542','kartal_tasıma@hotmail.com')
insert into tbl_tedarikci values ('2','sürat','istanbul','05469871534','sürat_tasıma@hotmail.com')
insert into tbl_tedarikci values ('3','aras','istanbul','054579321436','aras_tasıma@hotmail.com')
insert into tbl_tedarikci values ('4','fırat','ankara','051254789658','fırat_tasıma@hotmail.com')
insert into tbl_tedarikci values ('5','hançer','istanbul','05897412369','hançer_tasıma@hotmail.com')
insert into tbl_tedarikci values ('6','yılmaz','istanbul','05698742365','yılmaz_tasıma@hotmail.com')
insert into tbl_tedarikci values ('7','güneş','izmir','057896541236','güneş_tasıma@hotmail.com')
insert into tbl_tedarikci values ('8','gün','istanbul','059874538974','gün_tasıma@hotmail.com')
insert into tbl_tedarikci values ('9','hava','istanbul','05398745632','hava_tasıma@hotmail.com')
insert into tbl_tedarikci values ('10','ataş','adana','05478963514','ateş_tasıma@hotmail.com')
insert into tbl_tedarikci values ('11','getir','istanbul','05968574156','getir_tasıma@hotmail.com')


insert into tbl_stoklar values ('1','1','1','1','1','2004','50','10')
insert into tbl_stoklar values ('2','2','2','2','2','2006','5','15')
insert into tbl_stoklar values ('3','3','3','3','3','2007','60','11')
insert into tbl_stoklar values ('4','4','4','4','4','2005','78','15')
insert into tbl_stoklar values ('5','5','5','5','5','2001','36','19')
insert into tbl_stoklar values ('6','6','6','6','6','2000','25','9')
insert into tbl_stoklar values ('7','7','7','7','7','2020','45','6')
insert into tbl_stoklar values ('8','8','8','8','8','2018','5','7')
insert into tbl_stoklar values ('9','9','9','9','9','2014','69','3')
insert into tbl_stoklar values ('10','10','10','10','10','2015','14','54')
insert into tbl_stoklar values ('11','11','11','11','11','2004','3','36')


insert into tbl_calisanlar values('1','1','1','emircan','hançer','1978','ardahan','istanbul','053698745612','erkek','1991','söför','1','1','1','3800')
insert into tbl_calisanlar values('2','2','2','enes','kaya','1983','balıkesir','istanbul','053698745612','erkek','1991','söför','2','2','2','4000')
insert into tbl_calisanlar values('3','3','3','ali','yılmaz','1996','istanbul','istanbul','053698745612','erkek','1991','söför','3','3','3','6500')
insert into tbl_calisanlar values('4','4','4','ayşe','kara','1973','istanbul','ankara','053698745612','kadın','1991','söför','4','4','4','3800')
insert into tbl_calisanlar values('5','5','5','hatice','yeşil','1985','istanbul','istanbul','053698745612','kadın','1991','söför','5','5','5','5000')
insert into tbl_calisanlar values('6','6','6','baran','aknaş','1990','sivas','ardahan','053698745612','erkek','1991','söför','6','6','6','3800')
insert into tbl_calisanlar values('7','7','7','damla','özcan','1989','istanbul','balıkesir','053698745612','kadın','1991','söför','7','7','7','3800')
insert into tbl_calisanlar values('8','8','8','rıfar','kara','1984','adana','sivas','053698745612','erkek','1991','söför','8','8','8','3800')
insert into tbl_calisanlar values('9','9','9','hasan','ılık','1989','istanbul','izmir','053698745612','erkek','1991','söför','9','9','9','3800')
insert into tbl_calisanlar values('10','10','10','süleyman','can','1989','izmir','kars','053698745612','erkek','1991','söför','10','10','10','2800')
insert into tbl_calisanlar values('11','11','11','yılmaz','çakır','1986','istanbul','mardin','053698745612','erkek','1991','söför','11','11','11','3800')


insert into tbl_aracsurucu values('1','1','1','c','1')
insert into tbl_aracsurucu values('2','2','2','ce','2')
insert into tbl_aracsurucu values('3','3','3','c','3')
insert into tbl_aracsurucu values('4','4','4','c','4')
insert into tbl_aracsurucu values('5','5','5','ce','5')
insert into tbl_aracsurucu values('6','6','6','c','6')
insert into tbl_aracsurucu values('7','7','7','c','7')
insert into tbl_aracsurucu values('8','8','8','ce','8')
insert into tbl_aracsurucu values('9','9','9','c','9')
insert into tbl_aracsurucu values('10','10','10','ce','10')
insert into tbl_aracsurucu values('11','11','11','ce','11')


insert into tbl_satislar values('1','1','1','1','1','2005','1')
insert into tbl_satislar values('2','2','2','2','2','2005','2')
insert into tbl_satislar values('3','3','3','3','3','2005','3')
insert into tbl_satislar values('4','4','4','4','4','2005','4')
insert into tbl_satislar values('5','5','5','5','5','2005','5')
insert into tbl_satislar values('6','6','6','6','6','2005','6')
insert into tbl_satislar values('7','7','7','7','7','2005','7')
insert into tbl_satislar values('8','8','8','8','8','2005','8')
insert into tbl_satislar values('9','9','9','9','9','2005','9')
insert into tbl_satislar values('10','10','10','10','10','2005','10')
insert into tbl_satislar values('11','11','11','11','11','2005','11')


insert into tbl_musteri_servis values ('1','1','1','04-15-2020','izmir')
insert into tbl_musteri_servis values ('2','2','3','07-12-2021','mardin')
insert into tbl_musteri_servis values ('3','3','3','12-16-2021','konya')
insert into tbl_musteri_servis values ('4','4','4','01-23-2019','sivas')
insert into tbl_musteri_servis values ('5','5','5','09-09-2021','ankara')
insert into tbl_musteri_servis values ('6','6','6','06-14-2021','ankara')
insert into tbl_musteri_servis values ('7','7','7','05-04-2021','ankara')
insert into tbl_musteri_servis values ('8','8','8','05-04-2021','ankara')
insert into tbl_musteri_servis values ('9','9','9','05-05-2021','istanbul')
insert into tbl_musteri_servis values ('10','10','10','07-04-2021','istanbul')
insert into tbl_musteri_servis values ('11','11','11','08-19-2019','balıkesir')


/*1)Sefer tarihi 2021-06-15 küçük ve güzegahı Ankara olan aracların seferno,aracno,surucuno,sefertarihi,guzergahını getiriniz.*/
select * from tbl_musteri_servis where sefer_tarih < '2021-6-15' and guzergah='ankara'

/*2)çalışanlar tablosunda isminde a geçen kişilerin isim ve telefon bilgleri getiriniz.*/
select isim , telefon from tbl_calisanlar  where  isim  like '%a%' 

/*3)Tedarikçi tablosunda firamaların email getiriniz.*/
select email,firma_isim from tbl_tedarikci 

/*4)departmanlar tablosunda departman ismi 5 karekter getiriniz.*/
select SUBSTRING(departman_isim,1,5) from tbl_departmanlar

/*5)stoklar tablosunda urunsayısı en fazla kaçtır?*/
select max(urun_sayisi) from tbl_stoklar


/*6)palakası 34nn5246 olan aracın   nitelik,yuk_miktari,yolcu_sayisi getiriniz.*/
select  nitelik,yuk_miktari,yolcu_sayisi  from tbl_araclar where plaka='34nn5246'

/*8)sefer tarihi 2020-04-15 ve 2021-05-04 arasında olan guzergahaları getiriniz.*/
select guzergah from tbl_musteri_servis where sefer_tarih between '2020-04-15' and  '2021-05-04'


create function buyukharf (@gelendeger varchar(10))
returns varchar(10)
as
begin
return upper(@gelendeger)
end
select dbo.buyukharf(isim) from tbl_calisanlar






