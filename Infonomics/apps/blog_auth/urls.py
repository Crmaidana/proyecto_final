from django.urls import path # type: ignore
from django.contrib.auth.views import LoginView, LogoutView # type: ignore
from .views import RegistrarseView


app_name = 'apps.blog_auth'


urlpatterns = [
    path("registrarse/", RegistrarseView.as_view(), name = 'registrarse'),
    path("iniciar_sesion/", LoginView.as_view(template_name='users/iniciar_sesion.html'), name = 'iniciar_sesion'),
    path("cerrar_sesion/", LogoutView.as_view(), name = 'cerrar_sesion')
]