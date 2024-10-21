from django.urls import path # type: ignore
from .views import contacto

app_name = 'apps.contacto'
urlpatterns = [
    path('contacto/', contacto, name='contacto'),
]

