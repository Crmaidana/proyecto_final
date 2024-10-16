from django.contrib import admin # type: ignore
from django.urls import path # type: ignore
from .views import HomeView
from django.conf.urls.static import static # type: ignore
from django.contrib.staticfiles.urls import staticfiles_urlpatterns # type: ignore
from django.conf import settings # type: ignore
from django.urls import include,path # type: ignore

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', HomeView.as_view(), name= 'index'),
    path("users/", include('apps.blog_auth.urls')),
    path("noticias/", include('apps.noticias.urls')),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.STATIC_URL, document_root = settings.STATIC_ROOT)
