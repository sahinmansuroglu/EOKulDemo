### Öğrenci İşlemlerinin Tasarımı-2 ###

#### Veritabanında CRUD İşlemi İçin gerekli Metotların Oluşturulması ####


```csharp
using Dapper;
using EOkulProjesi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EOkulProjesi.VtIslem
{
    internal class VtIslemOgrenci : Base
    {
        public List<Ogrenci> OgrencileriSecAdSoyadaGore(string Ad, String Soyad)
        {
            List<Ogrenci> ogrencis = null;
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {

                string sorgu = "select * from ogrenci where Ad Like @Ad and Soyad Like @Soyad";
                ogrencis = baglanti.Query<Ogrenci>(sorgu, new { Ad = Ad + "%", Soyad = Soyad + "%" }).ToList();


            }


            return ogrencis;

        }


        public List<Ogrenci> OgrencileriSecOkulNoyaGore(int? okulNo)
        {
            List<Ogrenci> ogrencis = null;
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                string sorgu = "select * from ogrenci where OkulNo=@OkulNo";
                ogrencis = baglanti.Query<Ogrenci>(sorgu, new { OkulNo = okulNo }).ToList();
            }
            return ogrencis;

        }


        public Ogrenci OgrenciSecOkulNoyaGore(int? okulNo)
        {
            Ogrenci bulunanOgrenci = null;
            string sorgu = "select * from ogrenci where OkulNo=@OkulNo";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {

                bulunanOgrenci = baglanti.QuerySingleOrDefault<Ogrenci>(sorgu, new { OkulNo = okulNo });
            }
            return bulunanOgrenci;

        }

        public Ogrenci OgrenciSecIdyeGore(int? id)
        {
            Ogrenci bulunanOgrenci = null;
            string sorgu = "select * from ogrenci where Id=@Id";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {

                bulunanOgrenci = baglanti.QuerySingleOrDefault<Ogrenci>(sorgu, new { Id = id });
            }
            return bulunanOgrenci;

        }

        public Ogrenci GuncellemeIcinOgrenciAra(int? okulNo, int id)
        {
            Ogrenci bulunanOgrenci = null;
            string sorgu = "select * from ogrenci where OkulNo=@OkulNo and Id !=@Id ";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {

                bulunanOgrenci = baglanti.QuerySingleOrDefault<Ogrenci>(sorgu, new { OkulNo = okulNo, Id = id });
            }
            return bulunanOgrenci;

        }

        public List<Ogrenci> SoneklenenOnOgrenciyiSec()
        {
            List<Ogrenci> ogrencis = null;
            string sorgu = "select * from ogrenci ORDER BY Id DESC LIMIT 10";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                ogrencis = baglanti.Query<Ogrenci>(sorgu).ToList();
            }
            return ogrencis;

        }

        public int YeniOgrenciEkle(Ogrenci eklenecekOgrenci)
        {
            int eklenenOgrenciSayisi;
            string sorgu = "Insert into ogrenci(Ad,Soyad,OkulNo) values (@Ad,@Soyad,@OkulNo)";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                eklenenOgrenciSayisi = baglanti.Execute(sorgu, eklenecekOgrenci);
            }
            return eklenenOgrenciSayisi;
        }

        public int OgrenciGuncelle(Ogrenci guncellenecekOgrenci)
        {
            int guncellenenOgrenciSayisi;
            string sorgu = "update ogrenci set Ad=@Ad,Soyad=@Soyad,OkulNo=@OkulNo where Id=@Id";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                guncellenenOgrenciSayisi = baglanti.Execute(sorgu, guncellenecekOgrenci);
            }
            return guncellenenOgrenciSayisi;
        }


        public int OgrenciSil(int ogrenciId)
        {
            int silinenOgrenciSayisi;
            string sorgu = "delete from ogrenci  where Id=@Id";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                silinenOgrenciSayisi = baglanti.Execute(sorgu, new { Id = ogrenciId });
            }
            return silinenOgrenciSayisi;
        }
    }
}


```
