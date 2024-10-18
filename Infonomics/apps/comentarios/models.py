from django.db import models
from django.contrib.auth.models import User

from apps.noticias.models import Noticia
# Create your models here.
class Comentarios(models.Model):
    usuario = models.ForeignKey(User, on_delete= models.CASCADE)
    noticia = models.Model(Noticia, on_delete = models.CASCADE)
    texto = models.TextField(verbose_name= 'comentario')
    fecha = models.DateTimeField(auto_now_add= True)

    def __str__(self):
        return self.texto
    
    class Meta:
        ordering = ['-fecha']