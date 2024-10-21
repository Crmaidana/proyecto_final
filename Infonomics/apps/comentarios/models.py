from django.db import models
from django.contrib.auth.models import User

from apps.noticias.models import Noticia
#-------------------------modelo------------------
class Comentarios(models.Model):
    usuario = models.ForeignKey(User, on_delete= models.CASCADE)
    noticia = models.ForeignKey(Noticia, on_delete = models.CASCADE)
    texto = models.TextField(verbose_name= 'comentario')
    fecha = models.DateTimeField(auto_now_add= True)

    def __str__(self):
        return self.texto
    
    class Meta:
        ordering = ['-fecha']