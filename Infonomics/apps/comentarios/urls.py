from django.urls import path # type: ignore
from .views import Crear_comentario, EliminarComentario, ModificarComentario

app_name = 'apps.comentarios'
urlpatterns = [
    path('crear_comentario/', Crear_comentario, name='crear_comentario'),
    path('modificar_comentario/<int:pk>/', ModificarComentario.as_view(), name='modificar_comentario'),
    path('eliminar_comentario/<int:pk>/', EliminarComentario.as_view(), name='eliminar_comentario')
]