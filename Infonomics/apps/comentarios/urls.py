from django.urls import path
from .views import Comentar

app_name = 'apps.comentarios'

urlpatterns= [
    path('comentar/', Comentar, name= 'comentar' )
]