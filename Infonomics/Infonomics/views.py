from django.views.generic import TemplateView # type: ignore

class HomeView(TemplateView):
    template_name = 'index.html'