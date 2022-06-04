
## ÖnIzleme Penceresi   ##
```xaml
  <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="23*"/>
            <RowDefinition Height="219*"/>
            <RowDefinition Height="30*"/>
            <RowDefinition Height="22*"/>
        </Grid.RowDefinitions>


        <Label Grid.Row="0" Grid.Column="0" Content="Karne Ön İzlemesi" Background="#FFCCABAB" Foreground="#FF050435" FontSize="20" FontWeight="Bold" Margin="3,3,3,3" HorizontalContentAlignment="Center"/>
        <FlowDocumentReader x:Name="dokumanOkuyucu"  xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Margin="3,3,3,3"  Grid.Row="1" Grid.Column="0" Grid.ColumnSpan="1" Grid.RowSpan="1" >
            <FlowDocument x:Name="dokuman1">


            </FlowDocument>
        </FlowDocumentReader>
        
        <Grid Grid.Column="0" Grid.Row="2">
            <Grid.ColumnDefinitions>
                <ColumnDefinition></ColumnDefinition>
                <ColumnDefinition></ColumnDefinition>
            </Grid.ColumnDefinitions>

            <Button Grid.Column="0" x:Name="btnYazdir"  FontSize="18" FontWeight="Bold" Background="#FF7F2584" Foreground="#FFF9F9F9" Margin="3,3,3,3">Yazdır</Button>
            <Button Grid.Column="1" x:Name="btnKapat"  FontSize="18" FontWeight="Bold" Background="#FF534054" Foreground="#FFF9F9F9" Margin="3,3,3,3">Kapat</Button>

        </Grid>
    </Grid>
```

## Öğrenci Seçme Penceresi ##

```xaml
  <GroupBox   Grid.Row="0" Grid.Column="0"
                    Header="Öğrenci Seçme"
                    Margin="5"
                    >
            <StackPanel  Margin="5"  >
                <Label Content="Ad " Margin="0 -5 0 -4" />
                <TextBox Name="txtAd" Cursor="Arrow"   />
                <Label Content="Soyad " Margin="0 0 0 -4" />
                <TextBox Name="txtSoyad" />
                <Label Content="Okul No" Margin="0 10 0 -4" />
                <TextBox Name="txtOkulNo" />

            <ListBox Name="lstOgrenciler" Height="130"/>
            <Button   x:Name="btn"  Margin="3,3,3,3"   > Önceki Sayfaya Dön</Button>
            </StackPanel>
        </GroupBox>
```
