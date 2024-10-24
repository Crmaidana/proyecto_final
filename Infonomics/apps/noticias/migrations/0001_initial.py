# Generated by Django 5.1.1 on 2024-10-16 03:18

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Noticia',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=20)),
                ('autor', models.CharField(max_length=20)),
                ('nota', models.TextField()),
                ('fecha_agregado', models.DateTimeField(auto_now_add=True)),
                ('imagen', models.ImageField(blank=True, default='noticias/noticia_default.jpg', null=True, upload_to='noticias')),
                ('categoria', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='noticias.categoria')),
            ],
        ),
    ]
