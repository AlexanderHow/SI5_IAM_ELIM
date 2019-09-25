# SI5_IAM_ELIM

## Introduction

Ce projet sera réalisé dans le cadre du cours de terminaux mobiles (ELIM) de la majeur IAM. Il consistera à intégrer un terminal mobile dans un contexte embarqué. Ainsi des communications entre composants embarqués et avec des services web seront démontrées.

## Sujet

Nous désirons développer une application mobile et/ou tablette pour les médecins/aides soignants. L'application consistera, grâce au scan d'un QRCode (ou puce NFC ou NRFid, c'est encore à décider), de récupérer le dossier d'un patient grâce à un service web. En complément le service d'agenda de google pourra être utilisé afin d'attacher des évènements au dossier patient ou en général pour le médecin. 
En parallèle de cela nous souhaitons réaliser une deuxième partie de l'application liée aux systèmes embarqués présents dans l'environnement du patient (électrocardiogramme et autres capteurs/devices connectés que nous pouvons développer aussi). Un cas d'utilisation intéressant serait,  grâce à des communications (BLE en les régissant par le protocole Simple Sensor Interface), que l'application puisse se connecter et communiquer avec ces systèmes embarqués et s'y adapter dynamiquement. Cela dans le but de récupérer leurs mesures correctement et de pouvoir les exploiter de la bonne manière sans forcement fixer l'environnement embarqué de la chambre du patient (qui peut changer).
Le données du dossier patient, que le médecin peut venir enrichir, ainsi que les données mesurées par les divers systèmes embarqués médicaux consititueront nos jeux de données et feront l'objet de traitements locaux au terminal mobile ainsi que distants via notre service web. En cela nous souhaitons mettre en place un algorithme de clustering grâce à toutes ces données pour aider le médecin à determiner le type de maux dont le patient souffre et ainsi l'orienter vers un type de traitement spécifique. Cela lui simplifiera l'analyse du dossier patient. De plus on pourra aussi catégoriser les dossiers patients selon un niveau de "gravité" ou de stress pour prévoir d'adoucir l'annonce de certaines nouvelles au patient dont la guérisson peut être ralentie en condition de stress. 
Les communications misent en oeuvre pour augmenter l'intelligence du système sont donc :
- les communications (et adaptations dynamiques) entre le terminal mobile et les modules embarqués de mesures médicales
- les communications entre le terminal mobile et un ensemble de services web liés au dossier patient et au traitement du dossier.

## Membres

- Quentin Moreau
- Olivia Osgart
- Alexandre Howard

## Architecture

![Architecture](https://github.com/AlexanderHow/SI5_IAM_ELIM/blob/master/docs/arcitecture.jpg)
