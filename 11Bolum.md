Yazınan Kodlar 


```csharp

    public class OgrenciDogrulama : AbstractValidator<Ogrenci>
    {
        public OgrenciDogrulama()
        {
            RuleFor(x => x.Ad).NotEmpty().WithMessage("Öğrenci Adı  boş Geçilemez");
            RuleFor(x => x.Soyad).NotEmpty().WithMessage("Öğrenci Soyadı  boş Geçilemez");
            RuleFor(x => x.Ad).MinimumLength(3).WithMessage("Öğrenci Adı  enaz 3 karakterden oluşmalı");
            RuleFor(x => x.Soyad).MinimumLength(2).WithMessage("Öğrenci Soyadı  enaz 2 karakterden oluşmalı");
            RuleFor(x => x.OkulNo).NotNull().WithMessage("Okul No boş geçilemez ve rakamdan oluşmalı");


        }
    }

```


```csharp
using FluentValidation;

 internal class OgrenciDogrulama:AbstractValidator<Ogrenci>
    {
        public OgrenciDogrulama()
        {
            RuleFor(x => x.Ad).NotEmpty().WithMessage("Öğrenci Adı  boş Geçilemez");
            RuleFor(x => x.Soyad).NotEmpty().WithMessage("Öğrenci Soyadı  boş Geçilemez");
            RuleFor(x => x.Ad).MinimumLength(3).WithMessage("Öğrenci Adı  enaz 3 karakterden oluşmalı");
            RuleFor(x => x.Soyad).MinimumLength(2).WithMessage("Öğrenci Soyadı  enaz 2 karakterden oluşmalı");
            RuleFor(x => x.OkulNo).NotNull().WithMessage("Okul No boş geçilemez ve rakamdan oluşmalı");


        }
    }

