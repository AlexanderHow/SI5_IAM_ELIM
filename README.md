# SI5_IAM_ELIM

## WIKI
### Merci de se référer à notre wiki pour plus d'informations sur le projet.
### https://github.com/AlexanderHow/SI5_IAM_ELIM/wiki

## Introduction

Ce projet sera réalisé dans le cadre du cours de terminaux mobiles (ELIM) de la majeur IAM. Il consistera à intégrer un terminal mobile dans un contexte embarqué. Ainsi des communications entre capteurs, composants embarqués et avec des services web seront démontrées.


## Membres

- Quentin Moreau
- Olivia Osgart
- Alexandre Howard


## Sujet

Nous désirons développer une application mobile et/ou tablette pour les médecins/aides-soignants.

L'application consistera dans une première partie en la récupération et la gestion des dossiers patient grâce à notre service web. En complément, le service d'agenda de google pourra être utilisé afin d'attacher des évènements aux dossiers patient (exemple : des rappels de prise de médicaments). Notre service web quant à lui servira au stockage et à la mise à jour des dossiers patient mais aussi à l'application d'un algorithme de Clustering (type knn ou équivalent avec un nombre de cluster modulable selon la classification) sur ces derniers. Cela permettra de déterminer à l'avance de quel type de pathologie/maladie le patient est atteint. Ainsi nous proposerons sur l'application des orientations/aides quant au traitements ou soins à prodiguer au patient, en plus des informations sur son dossier. Cette classification permettra aussi de définir un niveau de "gravité" concernant l'état du patient. Ce qui permettra d'envisager un ordre de priorité entre les patients pour les rondes du personnel médical mais aussi des mesures pour réduire le stress du patient causé par l'annonce de la gravité de son état.

La seconde partie de l'application concerne la collecte de mesures médicale en usant de différents capteurs.
En cela nous songeons, dans un premier temps, à utiliser les capteurs du smartphone pour réaliser des mesures sommaires. Ensuite nous envisageons d'étendre l'utilisation de capteurs pour des mesures médicales à un ensemble de systèmes embarqués implémentant notre stack technologique compatible avec notre application. Cette extension restera simple pour le cadre du prototypage de notre application.
Nous voulons utiliser, sur smartphone, les capteurs tels que l'accéléromètre, le gyroscope et le podomètre (pour réaliser des examens d'efforts ou pour mesurer les réflexes ou la stabilité musculaire d'un patient), le capteur de proximité (pour des tests de vision) ou encore la caméra (pour mesurer le rythme cardiaque). Les hautparleurs pourront aussi servir pour des tests d'audition.
Quant à l'extension aux capteurs de systèmes embarqués, la stack technologique que nous pourrons mettre en place permettra une adaptation at runtime de l'application à ces systèmes. Cela consistera en l'implémentation du protocole Simple Sensor Interface et de la communication BLE (bluetooth). Cette implémentation permettra à tout système de se décrire à l'application et donc à cette dernière de s'adapter aux capteurs présentés par les systèmes embarqués (que ce soit en termes d'interaction mais aussi en termes d'affichage des données).

Cette seconde partie de l'application sera bien entendu liée à la première. En effet l'utilisateur (médecin ou aide-soignant entre autres) pourra venir enrichir le dossier du patient avec les mesures qu'il aura effectué via l'application. Les données récoltées serviront alors à mieux affiner la classification du dossier en plus de renforcer les informations concernant l'état du patient. 
 
Les communications misent en œuvre pour augmenter l'intelligence du système sont donc :
- les communications avec l'ensemble des capteurs du terminal mobile
- les communications (et adaptations dynamiques) entre le terminal mobile et les modules embarqués de mesures médicales
- les communications entre le terminal mobile et un ensemble de services web liés au dossier patient et au traitement/classification de ce dossier.

## Architecture

![Architecture](https://github.com/AlexanderHow/SI5_IAM_ELIM/blob/master/docs/arcitecture.jpg)

## Mock ups

![Mock ups]()
