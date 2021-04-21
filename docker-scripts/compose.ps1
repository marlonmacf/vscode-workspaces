Param(
    [switch]$ls = $false,
    [switch]$ps = $false,
    [switch]$sh = $false,
    [switch]$up = $false,
    [switch]$dev = $false,
    [switch]$down = $false,
    [switch]$stop = $false,
    [switch]$clear = $false,
    [switch]$build = $false,
    [switch]$deploy = $false
)

$workspace = "C:\Users\$env:UserName\Documents\Workspace"
$currentPath = Get-Location
$containerPath = $args[0]

if ($containerPath) {
    $containerName = Write-Output $containerPath.split("\")[-1]
}

if ($containerPath) {
    if (Test-Path -Path "$workspace\docker-containers\$containerPath") {
        $containerPath = "$workspace\docker-containers\$containerPath"
    }
    if (Test-Path -Path "$workspace\projects\$containerPath") {
        $containerPath = "$workspace\projects\$containerPath"
    }
}

if ($ls) {

    Write-Output "[INFO] "
    Write-Output "[INFO] docker context ls"
    Write-Output "[INFO] "
    docker context ls
    Write-Output "[INFO] "
    Write-Output "[INFO] docker container ls"
    Write-Output "[INFO] "
    docker container ls
    Write-Output "[INFO] "
    Write-Output "[INFO] docker network ls"
    Write-Output "[INFO] "
    docker network ls
    Write-Output "[INFO] "
    Write-Output "[INFO] docker volume ls"
    Write-Output "[INFO] "
    docker volume ls
    Write-Output "[INFO] "
    Write-Output "[INFO] docker plugin ls"
    Write-Output "[INFO] "
    docker plugin ls
    Write-Output "[INFO] "
    Write-Output "[INFO] docker image ls"
    Write-Output "[INFO] "
    docker image ls
    exit
}

if ($ps) {

    if ($containerName) {

        Write-Output "[INFO] $containerPath"
        Write-Output "[INFO] docker-compose ps --all"

        Set-Location $containerPath
        docker-compose ps --all
        Set-Location $currentPath

    } else {

        Write-Output "[INFO] docker ps --all"
        docker ps --all
    }

    exit
}

if ($stop) {

    if ($containerName) {

        Write-Output "[INFO] $containerPath"
        Write-Output "[INFO] docker-compose ps -a -q; docker-compose down $containerName"

        Set-Location $containerPath
        $runnigContainers = docker-compose ps -a -q

        if ($runnigContainers) {
            docker-compose down $containerName
        } else {
            Write-Output "[WARN] nothing to stop."
        }

        Set-Location $currentPath

    } else {

        Write-Output "[INFO] docker ps -a -q; docker stop"
        $runnigContainers = docker ps -a -q

        if ($runnigContainers) {
            docker stop $runnigContainers
        } else {
            Write-Output "[WARN] nothing to stop."
        }
    }

    exit
}

if ($clear) {

    Write-Output "[INFO] docker ps -a -q; docker stop; docker system prune --volumes --all"
    $runnigContainers = docker ps -a -q

    if ($runnigContainers) {
        docker stop $runnigContainers; docker system prune --volumes --all
    } else {
        docker system prune --volumes --all
    }

    exit
}

if ($containerName -And $containerPath) {

    if ($build) {

        Write-Output "[INFO] $containerPath"
        Write-Output "[INFO] docker build -f Dockerfile.dev ."

        Set-Location $containerPath
        docker build -f Dockerfile.dev .
        Set-Location $currentPath

        exit
    }

    if ($deploy) {

        Write-Output "[INFO] $containerPath"
        Write-Output "[INFO] docker build -f Dockerfile ."

        Set-Location $containerPath
        docker build -f Dockerfile .
        Set-Location $currentPath

        exit
    }

    if ($dev) {

        if (($up -And $sh) -Or (!$down -And !$up -And !$sh)) {

            Write-Output "[INFO] $containerPath"
            Write-Output "[INFO] docker-compose up -d --build; docker-compose exec dev sh"

            Set-Location $containerPath
            docker-compose up -d --build; docker-compose exec dev sh
            Set-Location $currentPath

            exit
        }

        if ($sh -And !$up) {

            Write-Output "[INFO] $containerPath"
            Write-Output "[INFO] docker-compose exec dev sh"

            Set-Location $containerPath
            docker-compose exec dev sh
            Set-Location $currentPath

            exit
        }

        if ($up -And !$sh) {

            Write-Output "[INFO] $containerPath"
            Write-Output "[INFO] docker-compose up -d --build"

            Set-Location $containerPath
            docker-compose up -d --build
            Set-Location $currentPath

            exit
        }

        if ($down) {

            Write-Output "[INFO] $containerPath"
            Write-Output "[INFO] docker-compose down"

            Set-Location $containerPath
            docker-compose down
            Set-Location $currentPath

            exit
        }
    }
}

$containers = (Get-ChildItem -n $workspace\docker-containers\) -split "`n" -join ", "
$projects = (Get-ChildItem -n $workspace\projects\) -split "`n" -join ", "

Write-Output "[INFO] "
Write-Output "[INFO] Docker Compose shortcuts commands:"
Write-Output "[INFO] "
Write-Output "[INFO] listing containers:"
Write-Output "[INFO] compose -ps :: 'docker ps --all'"
Write-Output "[INFO] compose <container-name> -ps :: at container location; 'docker-compose ps --all'"
Write-Output "[INFO] "
Write-Output "[INFO] stopping containers:"
Write-Output "[INFO] compose -stop :: 'docker ps -a -q; docker stop'"
Write-Output "[INFO] compose <container-name> -stop :: at container location; 'docker-compose stop <container-name>'"
Write-Output "[INFO] "
Write-Output "[INFO] removing cached containers, networks, volumes, images and builds:"
Write-Output "[INFO] compose -clear :: 'docker ps -a -q; docker stop; docker system prune --volumes'"
Write-Output "[INFO] "
Write-Output "[INFO] packaging containers (Dockerfile or Dockerfile.dev):"
Write-Output "[INFO] compose <container-name> -deploy :: at container location; 'docker build -f Dockerfile .'"
Write-Output "[INFO] compose <container-name> -build :: at container location; 'docker build -f Dockerfile.dev .'"
Write-Output "[INFO] "
Write-Output "[INFO] packaging containers (developer mode with docker-compose):"
Write-Output "[INFO] compose <container-name> -dev :: at container location; 'docker-compose up -d --build; docker-compose exec -it <container-name> sh'"
Write-Output "[INFO] compose <container-name> -dev -sh :: at container location; 'docker-compose exec <container-name> sh'"
Write-Output "[INFO] compose <container-name> -dev -up :: at container location; 'docker-compose up -d --build'"
Write-Output "[INFO] compose <container-name> -dev -down :: at container location; 'docker-compose down'"
Write-Output "[INFO] "
Write-Output "[INFO] supported container names (generic) :: $containers"
Write-Output "[INFO] supported container names (project) :: $projects"