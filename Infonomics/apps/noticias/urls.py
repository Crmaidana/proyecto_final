from django.conf import settings # type: ignore
from django.urls import path # type: ignore
from django.conf.urls.static import static # type: ignore
from django.contrib.staticfiles.urls import staticfiles_urlpatterns # type: ignore

from .views import CrearCategoria, ActualizarCategoria, EliminarCategoria, CrearNoticia, ActualizarNoticia, ListarNoticias, EliminarNoticia,listar_noticia_por_categoria, ordenar_por

app_name = 'apps.noticias'

urlpatterns = [
    path("agregar_categoria/", CrearCategoria.as_view(), name= 'agregar_categoria'),
    path("actualizar_categoria/<int:pk>", ActualizarCategoria.as_view(), name = 'actualizar_categoria'),
    path("eliminar_categoria/<int:pk>", EliminarCategoria.as_view(), name= 'eliminar_categoria'),
    path("agregar_noticia/", CrearNoticia.as_view(), name= 'agregar_noticia'),
    path("actualizar_noticia/<int:pk>", ActualizarNoticia.as_view(), name = 'actualizar_noticia'),
    path("eliminar_noticia/<int:pk>", EliminarNoticia.as_view(), name= 'eliminar_noticia'),
    path("listar_noticias/", ListarNoticias.as_view(), name='listar_noticias'),
    path("listar_por_categoria/<str:categoria>", listar_noticia_por_categoria, name='listar_por_categoria' ),
    path("ordenar_por/", ordenar_por, name = 'ordenar_por')
]

""""path("noticia/<int:id>", nota_noticia, name = 'noticia'),"""#para cuando se genere opiniones