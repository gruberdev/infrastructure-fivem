# This project has been archived and will receive no further updates.
> The main reason for that, and why I chose to focus on other games instead of FiveM, is mainly related to their [Terms of Services](https://runtime.fivem.net/fivem-service-agreement-4.pdf).

> They are known for banning other hosting service providers and trying to enforce an IP policy/copyright for monetary purposes. As a modding community, I think this sets a bad example and to continue working on open-source projects that might benefit them is not in the community's best interest (nor mine). I won't be updating this project.

<!-- PROJECT LOGO -->
<table>
<br />
<p align="center">

  <img src="./assets/logo.png" alt="Logo" width="300" height="225">

  <div align="center">

</div>
  <p align="center">
    A series of scripts to manage a server of FiveM using DevOps techniques
    <br />

#### Try our server out, enter FiveM and press F8 and then type:

#### Clone the repository and then run for a quick start:

```sh
git clone https://github.com/gruberdev/infrastructure-fivem.git
cd infrastructure-fivem
# Remember to insert your server token into .example.env
cp .example.env .env
docker-compose up --build -d
```

### Built with

[Terraform](https://www.terraform.io) | [Docker](http://docker.com) | [Drone CI](https://www.drone.io) | [FiveM](https://fivem.net/) | [Kubernetes (Soon)](https://kubernetes.io/)

---

<!-- ABOUT THE PROJECT -->

## About the project

As I researched repositories for fivem, I noticed there was a lack of scripts that made it easier to test and assess quality of the resources deployed using CI/CD. Modern DevOps tools integrate with servers and existing cloud providers to allow developers to avoid surprises when deploying new code and resources to the server.

My goal is to share these tools with the rest of the community, as I built them for my personal use, hoping it helps other fellow members as much it helped me to avoid operations headache and focus on feature development.


<!-- LICENSE -->

## License

Distributed under the MIT License. See [LICENSE](https://github.com/gruberdev/infrastructure-fivem/blob/main/LICENSE) for more information.

<!-- BADGE IMAGES URLs -->

[quality-badge]: https://img.shields.io/codefactor/grade/github/gruberdev/infrastructure-fivem?label=Code%20Quality&color=46bac0&labelColor=1F1F1F&logo=CodeFactor&style=flat-square
[pipeline-badge]: https://img.shields.io/drone/build/gruberdev/infrastructure-fivem?label=Pipeline%20Status&color=46bac0&labelColor=1F1F1F&logo=Drone&style=flat-square&server=https%3A%2F%2Fdrone.gruber.dev.br
[documentation-badge]: https://img.shields.io/badge/project%20docs-onlinedocumentation?style=flat-square&logo=Hack%20Hands&color=46bac0&labelColor=1F1F1F&logo

<!-- PROJECT BADGE HYPERLINKS -->

[pipeline-url]: https://drone.gruber.dev.br/gruberdev/infrastructure-fivem
[quality-url]: https://www.codefactor.io/repository/github/gruberdev/infrastructure-fivem
[documentation-url]: https://documentation.roleplay.gruber.dev.br
