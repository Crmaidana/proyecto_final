from django.shortcuts import render # type: ignore
from django.urls import reverse_lazy # type: ignore
from django.views.generic.edit import UpdateView, DeleteView # type: ignore
from django.contrib.auth.mixins import LoginRequiredMixin # type: ignore
from .forms import ComentariosForm
from .models import Comentarios

def Crear_comentario(request):
    form = ComentariosForm(request.POST or None)
    if form.is_valid():
        form.save()
        form = ComentariosForm()
    template_name = 'comentarios/crear_comentario.html'
    context = {
        'form': form,
    }
    return render(request, template_name, context)

class ModificarComentario(LoginRequiredMixin, UpdateView):
    model = Comentarios
    fields = ['texto']
    template_name = 'comentarios/modificar_comentario.html'
    success_url = reverse_lazy('apps.noticias:listar_noticias')

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(usuario=self.request.user)

class EliminarComentario(LoginRequiredMixin, DeleteView):
    model = Comentarios
    template_name = 'generic/confirma_eliminar.html'
    success_url = reverse_lazy('apps.noticias:listar_noticias')
