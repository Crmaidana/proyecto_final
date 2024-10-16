from django.db import models # type: ignore

# Create your models here.

class Categoria(models.Model):
    nombre= models.CharField(max_length=20)
    id={}
    def __str__(self):
        return self.nombre
    
class Noticia(models.Model):
    titulo=models.CharField(max_length=20, null=False)
    autor=models.CharField(max_length=20, null=False)   
    categoria=models.ForeignKey(Categoria, on_delete=models.SET_NULL, null=True)
    nota=models.TextField()
    fecha_agregado=models.DateTimeField(auto_now_add=True)
    imagen=models.ImageField(null=True,upload_to='noticias' ,blank=True,default='noticias/noticia_default.jpg')
    
    def __str__(self):
        return self.titulo

