from django.http.response import HttpResponseRedirect # type: ignore
from django.shortcuts import redirect, render  # type: ignore
from django.urls import reverse_lazy # type: ignore
from django.views.generic.edit import CreateView, UpdateView, DeleteView # type: ignore
from django.views.generic.list import ListView # type: ignore
from django.contrib.auth.mixins import LoginRequiredMixin   # type: ignore

from mixins.custom_test_mixin import CustomTestMixin
#from apps.opiniones.forms import OpinionForm
#from apps.opiniones.models import Opinion

from .models import Categoria, Noticia


# Create your views here.

# ------- Categorias -----------------

class CrearCategoria(LoginRequiredMixin,CustomTestMixin, CreateView):
    model = Categoria
    fields = ['nombre']
    template_name = 'noticias/agregar_categoria.html'
    success_url = reverse_lazy('index')

class ActualizarCategoria(UpdateView, CustomTestMixin):
    model = Categoria
    fields = ['nombre']
    template_name = 'noticias/actualizar_categoria.html'
    success_url = reverse_lazy('index')

class EliminarCategoria(DeleteView, CustomTestMixin):
    model = Categoria
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

# ------- Noticias -----------------

class CrearNoticia(CreateView , CustomTestMixin):
    model = Noticia
    fields = ['titulo','autor','nota','categoria','imagen']
    template_name = 'noticias/agregar_noticia.html'
    success_url = reverse_lazy('index')

class ActualizarNoticia(UpdateView , CustomTestMixin):
    model = Noticia
    fields = ['titulo','autor','descripcion','categoria','imagen']
    template_name = 'noticias/actualizar_noticia.html'
    success_url = reverse_lazy('index')

class EliminarNoticia(DeleteView, CustomTestMixin):
    model = Noticia
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

class ListarNoticias(ListView):
    model = Noticia
    template_name = 'noticias/listar_noticias.html'
    context_object_name = 'noticias'

    def get_context_data(self) :
        context=super().get_context_data()
        categorias = Categoria.objects.all()
        context["categorias"] = categorias
        return context
    
     
    def get_queryset(self):
        query = self.request.GET.get('buscador')
        queryset= super().get_queryset()

        if query:
            queryset = queryset.filter(titulo__icontains=query)
        
        return queryset.order_by('titulo')

def listar_noticia_por_categoria(request, categoria):
    categoria_db = Categoria.objects.filter(nombre = categoria)
    noticias = Noticia.objects.filter(categoria = categoria_db[0].id) 
    template_name = 'noticias/listar_noticias.html'
    context = {
        'noticias' : noticias
    }
    return render(request, template_name=template_name, context=context)

#para vuando se genere la app opiniones

""""def nota_noticia(request,id):
    noticia = Noticia.objects.get(id = id)
    
    opiniones = Opinion.objects.filter(noticia = id)
    form = OpinionForm(request.POST)
    if form.is_valid():
        if request.user.is_authenticated:
            aux = form.save(commit=False)
            aux.noticia = noticia
            aux.usuario = request.user
            aux.save()
            form = OpinionForm()
        else:
            return redirect('apps.blog_auth:iniciar_sesion')

    context= {
        "noticia": noticia,
        "form" : form, 
        "opiniones" : opiniones
    }
    template_name = "noticias/noticia_detalle.html"

    return render(request, template_name=template_name,context=context)"""
    
def ordenar_por(request):
    orden = request.GET.get('orden',' ')

    if orden == 'fecha':
        noticias = Noticia.objects.order_by('fecha_agregado')
    elif orden == 'titulo':
        noticias = Noticia.objects.order_by('titulo')
    else : 
        noticias = Noticia.objects.all()
    
    template_name = 'noticias/listar_noticias.html'
    context = {
        'noticias' : noticias
    }
    return render(request, template_name, context)    