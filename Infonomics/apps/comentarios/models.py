from django.db import models
from django.contrib.auth.models import User
from django.shortcuts import render
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.edit import UpdateView, DeleteView
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


def comentario(request):
    comentarios = comentario.object.all()
    template_name = 'comentarios/listar_comentario.html'
    context = {
    'comentarios' : comentarios,
    }
    return render(request, template_name, context)




class EliminarComentario(LoginRequiredMixin, DeleteView):
    model = Noticia
    template_name = 'generic/confirma_eliminar.html'
    success_url = reverse_lazy('apps.noticias:listar_noticias')