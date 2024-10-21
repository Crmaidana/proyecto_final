from django.urls import path
from .views import Comentar, EliminarComentario, ModificarComentario

app_name = 'apps.comentarios'

urlpatterns= [
    path('Comentar/', Comentar, name= 'comentar' ),
    path('modificar_comentario/<int:pk>', ModificarComentario.as_view(), name = 'modificar_comentario' ),
    path('eliminar_comentario/<int:pk>', EliminarComentario.as_view(), name = 'eliminar_comentario' )
]