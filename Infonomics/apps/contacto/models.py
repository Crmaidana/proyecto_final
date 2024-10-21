from django.db import models # type: ignore
from django.contrib.auth.models import User # type: ignore

class Contacto(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    asunto = models.CharField(max_length=100)
    mensaje = models.TextField()
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.usuario} - {self.asunto}'
