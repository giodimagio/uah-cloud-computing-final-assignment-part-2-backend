
<h1 align="center">Máster Universitario en Desarrollo Ágil de Software para la Web</h1>
<h3 align="center">Docker/K8s/Istio - Final Assignment</h3>
<h5 align="center">Cloud Computing y Contenedores</h5>
<h6 align="center">Universidad de Alcalá</h6>
<hr>

<!-- ÍNDICE -->

<details open="open">
  <summary>Índice</summary>
  <ol>
    <li>
      <a href="#el-proyecto">El proyecto</a>
      <ul>
        <li><a href="#stack">Stack</a></li>
      </ul>
    </li>
    <li>
      <a href="#como-empezar">Como empezar</a>
      <ul>
        <li><a href="#requisitos-previos">Requisitos previos</a></li>
        <li><a href="#instalación">Instalación</a></li>
      </ul>
    </li>
    <li><a href="#licenciamiento">Licenciamiento</a></li>
    <li><a href="#contacto">Contacto</a></li>
  </ol>
</details>

<!-- EL PROYECTO -->

## El proyecto

[Trabajo Final - Enunciado](./documentacion/final-assignment.pdf)

La práctica final consiste en...

### Stack

En esta sección se listan las tecnologías, frameworks, librerías y otras herramientas o recursos relevantes usados para la realización del proyecto.

Tecnologías:

* [Python 3.8.10](https://www.python.org/downloads/release/python-3810/)

Frameworks:

* [Flask 2.3.2](https://flask.palletsprojects.com/en/2.3.x/)

Otros recursos:

* [VSCode](https://code.visualstudio.com/)
* [Git](http://git-scm.com/)
* [Github](https://github.com/)
* [Markdown](https://www.markdownguide.org/)

<!-- COMO EMPEZAR -->

## Como empezar

En esta sección se listarán los pasos necesarios para obtener una copia local del proyecto y ejecutarlo en modo desarrollo.

### Requisitos previos

Previamente, debemos tener instalado lo siguiente:

* [**VSCode**](https://code.visualstudio.com/) como editor de código.
* [**Git**](http://git-scm.com/) como DVCS para el control de versiones.
* [**WSL2**](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (Windows Subsystem for Linux 2) con Ubuntu 20.04 LTS.
* [**Docker Desktop**](https://www.docker.com/products/docker-desktop) para la gestión de contenedores.
* [**Kubernetes**](https://docs.docker.com/desktop/kubernetes//) para la gestión de clusters.
* [**Istio**](https://istio.io/latest/docs/setup/getting-started/) instalado en el cluster de Kubernetes.

### Obtener una copia local del repositorio

Si vamos a trabajar desde Windows usando WSL2 pero queremos seguir manteniendo por comodidad el repositorio en el sistema de archivos de Windows, podemos hacer lo siguiente:

1. Creamos o usamos si ya existe, una carpeta del sistema de archivos de Windows donde guardaremos y/o clonaremos los repositorio en los que vayamos a trabajar. Por ejemplo:

    `%USERPROFILE%\gitProjects`.

2. Creamos o usamos si ya existe, una carpeta en el sistema de archivos de WSL2 que será un enlace simbólico a la carpeta creada en el sistema de archivos de Windows:

    `~/gitProjects`.

3. Desde un terminal de WSL2, creamos el enlace simbólico a la carpeta en el sistema de archivos de Windows.

    ```sh
    ln -s /mnt/c/Users/%UserName%/gitProjects/ ~/gitProjects
    ```

4. Clonamos el repositorio en la carpeta creada en el sistema de archivos de Windows desde VSCode con el cliente Git integrado o desde un terminal Bash, vía HTTPS o SSH. [GitHub](https://github.com/giodimagio/uah-cloud-computing-final-assignment-part-2-backend)

- HTTPS
  ```sh
  git clone https://github.com/giodimagio/uah-cloud-computing-final-assignment-part-2-backend.git
  ```
- SSH
  ```sh
  git clone git@github.com:giodimagio/uah-cloud-computing-final-assignment-part-2-backend.git
  ```

5. Nos movemos a la carpeta del proyecto y lo abrimos con VSCode.

    ```sh
    cd ~/gitProjects/uah-cloud-computing-final-assignment-part-2-backend
    code .
    ```

- Ejemplo de link simbólico una vez creado:

  ```sh
  giodimagio@PC-FON:~$ ls -l
  total 4
  lrwxrwxrwx 1 giodimagio giodimagio   33 Jan 14 13:23 gitProjects -> /mnt/c/Users/JROMERO/gitProjects/

  giodimagio@PC-FON:~$ cd gitProjects

  giodimagio@PC-FON:~/gitProjects$ ls -l
  total 0
  drwxrwxrwx 1 giodimagio giodimagio 512 Apr  1 14:11 uah-cloud-computing-final-assignment-part-2-backend
  ``` 

### Configuración inicial

#### Instalar Istio

1. [Descargar Istio desde WSL2 en el directorio `~/istio-1.18.0`](https://istio.io/latest/docs/setup/getting-started/)

### Desinstalación completa

#### Desinstalar Istio

##### **Desinstalar Istio en un cluster de Kubernetes**

1. Eliminar los recursos de Istio:

    ```sh
    kubectl delete -f samples/addons
    ```

2. Desinstalar Istio con istioctl:

    ```sh
    istioctl uninstall -y --purge
    ```

3. Eliminar el namespace `istio-system`:

    ```sh
    kubectl delete namespace istio-system
    ```

4. Eliminar la label `istio-injection` del namespace que ya no vayamos a usar con Istio:

    ```sh
    kubectl label namespace uah-dev istio-injection-
    ```

##### **Eliminar Istio del sistema WSL2**

1. Eliminar Istio de la variable de entorno `PATH` eliminando la entrada en la variable de entorno:

    ```sh
    echo $PATH
    export PATH=$PATH_SIN_ISTIO
    ```

2. Eliminar el directorio de Istio:

    ```sh
    rm -rf ~/istio-1.18.0
    ```





<!-- LICENCIAMIENTO -->

## Licenciamiento

Distribuido bajo la licencia MIT

<!-- CONTACTO -->

## Contacto

Jorge Romero - [jorge.romeroc@edu.uah.es](mailto:jorge.romeroc@edu.uah.es)