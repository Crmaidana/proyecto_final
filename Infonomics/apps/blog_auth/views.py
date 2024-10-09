from django.shortcuts import render # type: ignore

from pyexpat.errors import messages
from django.shortcuts import render # type: ignore
from django.urls import reverse_lazy # type: ignore
from django.views.generic import FormView # type: ignore
from django.contrib.auth.views import LoginView # type: ignore
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
