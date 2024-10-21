from django.shortcuts import render, redirect # type: ignore
from django.contrib.auth.decorators import login_required # type: ignore
from .forms import ContactoForm

@login_required
def contacto(request):
    if request.method == 'POST':
        form = ContactoForm(request.POST)
        if form.is_valid():
            contacto = form.save(commit=False)
            contacto.usuario = request.user
            contacto.save()
            
            return redirect('index')
    else:
        form = ContactoForm()
    return render(request, 'contacto/contacto.html', {'form': form})


