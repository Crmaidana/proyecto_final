from django.apps import AppConfig # type: ignore


class BlogAuthConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.blog_auth'
