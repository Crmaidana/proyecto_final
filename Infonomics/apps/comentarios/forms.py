from django import forms

from .models import Comentarios

class ComentariosForm(forms.modelsforms):

    class Meta:
        model = Comentarios
        field = ['texto']