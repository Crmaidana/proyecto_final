from pathlib import Path
import os
from dotenv import load_dotenv   # type: ignore
from django.urls import reverse_lazy # type: ignore

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
#-----------------------------------------------------------
#para loguearse
from django.urls import reverse_lazy # type: ignore

LOGIN_URL = reverse_lazy('apps.blog_auth:iniciar_sesion')
LOGIN_REDIRECT_URL = reverse_lazy('index')
LOGOUT_REDIRECT_URL = reverse_lazy('index')


load_dotenv()
SECRET_KEY = os.getenv('SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS =  ['host']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    
    'apps.noticias',
    'apps.comentarios',
    'apps.contacto',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'Infonomics.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR /'templates'], 
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'Infonomics.wsgi.application'


# Database

load_dotenv()# sino agregamos este llamado no funciona
NAME_DB= os.getenv('NAME_DB')
USER_DB= os.getenv('USER_MYSQL')
PASSWORD_DB= os.getenv('PASSWORD_MYSQL')

DATABASES = {
     'default': {
       'ENGINE': 'django.db.backends.mysql',
        'NAME': NAME_DB, #configuramos para nuestra bd y en mysql
        'USER':USER_DB,
        'PASSWORD': PASSWORD_DB,
        'PORT':'3306',
        "HOST" : 'host'
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'es-ar'

TIME_ZONE = 'America/Argentina/Buenos_Aires'

USE_I18N = True

USE_TZ = True


#-------------------------------------------------------
STATIC_URL = '/static/'
STATICFILES_DIRS= [BASE_DIR / 'static']
STATIC_ROOT = "staticfiles/"

MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'


# -------------------------------------------------------- 
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
