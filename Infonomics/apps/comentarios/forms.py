from django import forms # type: ignore

from .models import Comentarios

class ComentariosForm(forms.ModelForm):

    class Meta:
        model = Comentarios
        fields = ['texto']