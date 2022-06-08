 ##### Not İşlemlerinin Tasarımı-3 ##


### Öğrenci Arama, Seçme, Bir Window içerisindeki nesne ve event’lara Diğer Window içinden Erişim ###
 

### OgrenciSecmePenceresi classında yazılan kodlar ###
```csharp

public partial class OgrenciSecmePenceresi : Window
    {
        VtIslemOgrenci vtIslemOgrenci;
        public OgrenciSecmePenceresi()
        {
            InitializeComponent();
            vtIslemOgrenci = new VtIslemOgrenci();
        }

        protected override void OnClosing(CancelEventArgs e)
        {
            base.OnClosing(e);

            e.Cancel = true;

            this.Visibility = Visibility.Hidden;
            
        }

        private void btn_Click(object sender, RoutedEventArgs e)
        {
            this.Visibility = Visibility.Hidden;
        }

        private void txtAd_TextChanged(object sender, TextChangedEventArgs e)
        {
            ogrenciListesiniGuncelle();
        }

        private void txtSoyad_TextChanged(object sender, TextChangedEventArgs e)
        {
            ogrenciListesiniGuncelle();
        }

        private void txtOkulNo_TextChanged(object sender, TextChangedEventArgs e)
        {
            ogrenciListesiniGuncelle();
        }

        private void ogrenciListesiniGuncelle()
        {
          
            int? okulNo = (Int32.TryParse(txtOkulNo.Text, out int okulno) ? okulno : (int?)null);

            List<Ogrenci> ogrenciler = null;

            if (okulNo != null)
            {
                ogrenciler = vtIslemOgrenci.OgrencileriSecOkulNoyaGore(okulno);
            }
            else
            {
                
                ogrenciler = vtIslemOgrenci.OgrencileriSecAdSoyadaGore(txtAd.Text.Trim(), txtSoyad.Text.Trim());

            }

            lstOgrenciler.ItemsSource = ogrenciler;


        }
    }
```

### NotIslemleri classında ogrenci seçme için yazılan kodlar ###
```csharp

     Ogrenci? secilenOgrenci;
        OgrenciSecmePenceresi ogrenciSecmePenceresi;
        OzIzlemePenceresi ozIzlemePenceresi;
        public NotIslemleri()
        {
            InitializeComponent();
            ogrenciSecmePenceresi = new OgrenciSecmePenceresi();
            ogrenciSecmePenceresi.lstOgrenciler.SelectionChanged += LstOgrenciler_SelectionChanged;

            ozIzlemePenceresi = new OzIzlemePenceresi();
        }

        private void LstOgrenciler_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ogrenciSecmePenceresi.lstOgrenciler.SelectedItem!=null)
            {
                secilenOgrenci = ogrenciSecmePenceresi.lstOgrenciler.SelectedItem as Ogrenci;
                txtSecilenOgrenci.Text = secilenOgrenci.ToString();
            }
        }

```
