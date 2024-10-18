from django.shortcuts import render

from Infonomics.apps.comentarios.forms import ComentariosForm

# Create your views here.
def Comentar(request):
    form = ComentariosForm(request.POST)
    if form.is_valid():
        form.save()
        form = ComentariosForm
    template_name= 'Comentarios/crear_comentario.html'
    context = {
        'form' : form,
    }
    return render(request, template_name, context)