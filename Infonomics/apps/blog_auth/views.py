from django.shortcuts import render # type: ignore

from django.http import Http404, HttpResponse # type: ignore
from django.shortcuts import get_object_or_404, render # type: ignore
from pyexpat.errors import messages

from django.urls import reverse_lazy # type: ignore
from django.views.generic import FormView, UpdateView # type: ignore
from django.contrib.auth.views import LoginView # type: ignore
from django.contrib.auth.models import User # type: ignore
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin # type: ignore
from django.contrib import messages # type: ignore

from .forms import RegistrarseForm

# Create your views here.
class RegistrarseView(FormView):
    template_name = 'users/registrarse.html'
    form_class = RegistrarseForm
    success_url = reverse_lazy('index')
    def form_valid(self, form) :
        form.save()
        return super().form_valid(form)
    
    def form_invalid(self, form):
      print("Formulario no válido:", form.errors)  # Verifica los errores en la consola
      return super().form_invalid(form)
    
class IniciarSesionView(LoginView):
    template_name = 'users/iniciar_sesion.html'
    
class EditarPerfil(LoginRequiredMixin ,UpdateView):
    model = User
    form_class = RegistrarseForm
    template_name = 'users/registrarse.html'
    success_url = reverse_lazy('index')  

    def get_object(self, queryset=None):
            return get_object_or_404(User, pk=self.request.user.pk)

    def dispatch(self, request, *args, **kwargs):
        user_id = self.kwargs.get('pk')
        if str(user_id) != str(request.user.pk):
            raise Http404("No tienes permiso para editar este perfil.")
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        messages.success(self.request, "Perfil actualizado correctamente.")
        return super().form_valid(form)    
