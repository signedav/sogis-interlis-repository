# Betriebs- und Nachführungshandbuch

## Einleitung
Die INTERLIS-Modellablage ist ein Docker-Image und wird in OpenShift betrieben. Die Modelle und weitere Dateien werden im Github-Repository gespeichert. Jeder Commit in das Repository löst einen Buildprozess in Travis aus. Das erste Resultat des Buildprozesses ist eine neue, nachgeführte `ilimodels.xml`-Datei. Anschliessend werden ein Docker-Image erstellt, welches die eigentliche INTERLIS-Modellablage repräsentiert, d.h. die Modelle werden immer in das Image gebrannt. Das Image resp. der Container der Testumgebung in OpenShift wird viertelstündlich nachgeführt.

## Betrieb
TODO:
- OpenShift...
- test, int, prod.

## Nachführung

### Struktur der Ablage
Die INTERLIS-Modelle werden gemäss den zuständigen Ämtern abgelegt. Dadurch sieht der Aufbau der Ablage wie folgt aus:  

* models
  - ADA
    - replaced
  - AFU
    - replaced
  - ALW
    - replaced
  - AMB
    - replaced
  - ARP
    - replaced
  - AVT
    - replaced
  - AWA
    - replaced
  - AWJF
    - replaced            
  - Gemeinden
    - replaced

Sämtliche Interlis-Modelle müssen in den “Amts“-Ordnern abgelegt werden. In jedem _Amts_-Ordner gibt es noch einen _replaced_-Ordner. In diesen werden nicht mehr aktuelle Modelle abgespeichert. Z.B. Modelle welche durch eine neuere Modellversion abgelöst wurden. Im Ordner _models_ sind die beiden Files `ilimodels.xml` und `ilisite.xml` vorhanden, welche einerseits das Verzeichnis der Modelle und die Modell-Metadaten und andererseits die Repository-Metadaten enthalten.    

#### Ort
Der Master der Modelle ist das Github-Repository.

#### ilisite.xml
Im `ilisite.xml` sind sämtlichen Metadaten zur vorliegenden Modellablage aufgeführt. Dieses File muss nur dann bearbeitet werden, wenn sich in den Metadaten der Modellablage etwas verändert hat. Es muss **nicht** bearbeitet werden, wenn neue Datenmodelle in der Modellablage integriert werden. 

#### ilimodels.xml
Das File `ilimodels.xml` beinhaltet das Verzeichnis mit allen Datenmodellen inklusive deren Metadaten. Hier werden pro Datenmodell Metainformationen verwaltet. Die Datei ist das eigentlich Herzstück der Modellablage und muss nachgeführt werden, falls neue Modelle entstehen oder alte abgelöst werden werden. Die Datei wird wird bei jedem Commit in das Github-Respository mit einem _GRETL_-Task in Travis neu erstellt. Aufgrund des Automatisationsprozesses werden einige Attribute nicht mehr geführt, da diese nicht im INTERLIS-Modell vorhanden sind. Mit Metaattributen in der Modellen könnte man viele dieser jetzt fehlenden Attribute automatisch nachführen.

### Neue Datenmodell in die Modellablage aufnehmen
Es genügt das Kopieren des Modelles in den _Amts_-Ordner. Alles weitere, inklusive der Prüfung der Modellablage mit _ili2c_, wird im automatischen Buildprozess gemacht.

### Datenmodell bearbeiten
Ein bereits im Repository aufgeführtes Datenmodell darf nicht bearbeitet werden und unter dem gleichen Namen wieder abgespeichert werden. Wird ein schon bestehendes Datenmodell überarbeitet muss dieses mit gleichem Projektnamen aber mit einer neuen Versionsnummer abgespeichert werden. Z. B. `SO_ARP_Nutzungsplanung_20150301.ili` wird bearbeitet und muss anschliessend unter dem neuen Namen z.B. `SO_ARP_Nutzungsplanung_20171118.ili` abgespeichert werden. 

### Datenmodelle löschen 
Datenmodelle sollten prinzipiell nicht gelöscht werden. Sollte dies doch einmal der Fall sein, so ist das entsprechende Datenmodelle aus der Verzeichnisstruktur zu löschen.

### Andere Modellablagen verknüpfen
An die bestehende Modellablage des Kantons Solothurn können weitere Modellablagen wie z.B. das des Bundes geknüpft werden. Dies geschieht im `ilisite.xml`-File, wo im xml-tag `<ilisite09.RepositoryLocation_>` die zusätzlichen Repositories angegeben werden können. Wichtig dabei ist, dass die Repositories, auf welchen die Repositories des Kantons Solothurn basieren (also "Eltern"), im `<parentSite>` aufgeführt werden, während "Kinder" im `<subsidiarySite>` und "Geschwister" im `<peerSite>` aufgelistet werden. 