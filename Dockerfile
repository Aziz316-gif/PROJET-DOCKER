# Utilisation de l'image python 3.9-buster
FROM python:3.8-buster
# Creation de notre container
LABEL maintainer="ulrich MONJI" email="toto@admin.fr"
# Installation des differentes paquage necessaires au demarrage de notre application
RUN apt update -y && apt install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0
# Copier le code source dans notre conteneur racine
COPY student_age.py /
# creation de la volume Data
VOLUME /data
# exposition du port 500
EXPOSE 5000
# Commande pour le lancement de l'appli Flask
CMD [ "python", "./student_age.py" ]