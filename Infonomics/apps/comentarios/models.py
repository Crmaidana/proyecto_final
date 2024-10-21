from django.db import models # type: ignore
from django.contrib.auth.models import User # type: ignore
from apps.noticias.models import Noticia

# Create your models here.
class Comentarios(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    noticia = models.ForeignKey(Noticia, on_delete=models.CASCADE)  # Corrige aquí
    texto = models.TextField(verbose_name='comentario')
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.texto

    class Meta:
        ordering = ['-fecha']