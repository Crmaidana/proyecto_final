from django.shortcuts import render
from typing import Any
from apps.comentarios.forms import ComentariosForm
from django.urls import reverse_lazy
from django.views.generic.edit import UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models.query import QuerySet

# Create your views here.
def Comentar(request):
    form = ComentariosForm(request.POST)
    if form.is_valid():
        form.save()
        form = ComentariosForm
    template_name= 'Comentarios/crear_comentario.html'
    context = {
        'form' : form,
    }
    return render(request, template_name, context)
    
def comentarios(request):
    comentarios = comentarios.object.all()
    template_name = 'comentarios/listar_comentarios.html'
    context = {
    'comentarios' : comentarios,
    }
    return render(request, template_name, context)

class ModificarComentario(LoginRequiredMixin, UpdateView):
    model = comentarios
    fields = ['texto',]
    template_name = 'comentarios/crear_comentario.html'
    success_url = reverse_lazy('apps.noticias:listar_noticias')

    def get_queryset(self) -> QuerySet[Any]:
        queryset = super().get_queryset()
        return queryset.filter(usuario = self.request.user)
    
class EliminarComentario(LoginRequiredMixin, DeleteView):
    model = comentarios
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('apps.noticias:listar_noticias')