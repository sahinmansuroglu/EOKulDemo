Not İşlemlerinin Tasarımı-2 

(Veritabanında CRUD İşlemileri İçin gerekli Metotların Oluşturulması)
using Dapper;
using EOkulProjesi.Models;
using EOkulProjesi.ViewModel;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EOkulProjesi.VtIslem
{
    internal class VtIslemOgrenciPuan : Base
    {
        public List<OgrenciDersPuan> TumPuanlariCek()
        {
            List<OgrenciDersPuan> puanlar = null;
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {

                string sorgu = "select ders.DersAdi, ders.DersSaati, ogrencipuan.*,ogrenci.Ad,ogrenci.Soyad,ogrenci.OkulNo  from ogrencipuan " +
                                "inner join ders on ders.Id = ogrencipuan.DersId " +
                                "inner join ogrenci on ogrenci.Id = ogrencipuan.OgrenciId";
                puanlar = baglanti.Query<OgrenciDersPuan>(sorgu).ToList();


            }

            return puanlar;

        }

        public List<OgrenciDersPuan> OgrenciPuanAraOgrenciIdYeGore(int ogrenciId)
        {
            List<OgrenciDersPuan> puanlar = null;
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                string sorgu = "select ders.DersAdi, ders.DersSaati, ogrencipuan.*,ogrenci.Ad,ogrenci.Soyad,ogrenci.OkulNo  from ogrencipuan " +
                               "inner join ders on ders.Id = ogrencipuan.DersId " +
                               "inner join ogrenci on ogrenci.Id = ogrencipuan.OgrenciId " +
                               "where OgrenciId=@OgrenciId";

                puanlar = baglanti.Query<OgrenciDersPuan>(sorgu, new { OgrenciId = ogrenciId }).ToList();


            }
            return puanlar;

        }

        public double? agirlikliOrtalamaHesapla(List<OgrenciDersPuan> puanlar)
        {
            int dersSaatToplam = 0;
            double? agirlikliToplam = 0;
            foreach (var puan in puanlar)
            {
                dersSaatToplam += puan.DersSaati;
                agirlikliToplam += puan.DersSaati * puan.Ortalama;

            }

            return agirlikliToplam / dersSaatToplam;
        }

        public List<OgrenciDersPuan> OgrenciPuanAraDersIdYeGore(int dersId)
        {
            List<OgrenciDersPuan> puanlar = null;
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                string sorgu = "select ders.DersAdi, ders.DersSaati, ogrencipuan.*,ogrenci.Ad,ogrenci.Soyad,ogrenci.OkulNo  from ogrencipuan " +
                               "inner join ders on ders.Id = ogrencipuan.DersId " +
                               "inner join ogrenci on ogrenci.Id = ogrencipuan.OgrenciId " +
                               "where DersId=@DersId";

                puanlar = baglanti.Query<OgrenciDersPuan>(sorgu, new { DersId = dersId }).ToList();


            }
            return puanlar;

        }

        public OgrenciPuan PuanBulOgrenciveDerseGore(int ogrenciId, int dersId)
        {
            OgrenciPuan bulunanOgrenciPuan = null;
            string sorgu = "select *  from ogrencipuan  where OgrenciId=@OgrenciId and DersId=@DersId";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                bulunanOgrenciPuan = baglanti.QuerySingleOrDefault<OgrenciDersPuan>(sorgu, new { OgrenciId = ogrenciId, DersId = dersId });
            }
            return bulunanOgrenciPuan;
        }

        public int YeniOgrenciPuanEkle(OgrenciPuan eklenecekOgrenciPuan)
        {
            int eklenenOgrenciPuanSayisi;
            string sorgu = "Insert into ogrencipuan(OgrenciId,DersId,Yazili1,Yazili2,Performans1,Performans2,Ortalama,Durum) " +
                "values (@OgrenciId,@DersId,@Yazili1,@Yazili2,@Performans1,@Performans2,@Ortalama,@Durum)";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                eklenenOgrenciPuanSayisi = baglanti.Execute(sorgu, eklenecekOgrenciPuan);
            }
            return eklenenOgrenciPuanSayisi;
        }

        public int OgrenciPuanGuncelle(OgrenciPuan guncellenecekOgrenciPuan)
        {
            int guncellenecekOgrenciPuanSayisi;
            string sorgu = "update ogrencipuan set Yazili1=@Yazili1,Yazili2=@Yazili2," +
                           "Performans1=@Performans1,Performans2=@Performans2," +
                           "Ortalama=@Ortalama,Durum=@Durum  " +
                           "where Id=@Id";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                guncellenecekOgrenciPuanSayisi = baglanti.Execute(sorgu, guncellenecekOgrenciPuan);
            }
            return guncellenecekOgrenciPuanSayisi;
        }

        public int OgrenciPuanSil(int id)
        {
            int silinenOgrenciPuanSayisi;
            string sorgu = "delete  from ogrencipuan  where Id=@Id";
            using (IDbConnection baglanti = new MySqlConnection(ConnectionString))
            {
                silinenOgrenciPuanSayisi = baglanti.Execute(sorgu, new { Id = id });
            }
            return silinenOgrenciPuanSayisi;
        }

    }


}
