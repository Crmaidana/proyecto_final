from django.contrib.auth.mixins import UserPassesTestMixin # type: ignore
from django.contrib import messages # type: ignore
from django.shortcuts import redirect # type: ignore

class CustomTestMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_staff # type: ignore
    
    def handle_no_permission(self) :
        messages.error(self.request, "No tenes permiso para acceder a esta vista") # type: ignore
        return redirect('index')