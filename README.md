<!-- PROJECT LOGO -->
<table>
<br />
<p align="center">

  <img src="./assets/logo.png" alt="Logo" width="300" height="225">

  <div align="center">

<a href='https://drone.gruber.dev.br/gruberdev/infrastructure-fivem' target='_blank'>![pipeline-badge]</a>
<a href='https://www.codefactor.io/repository/github/gruberdev/infrastructure-fivem' target='_blank'>![quality-badge]</a>
<a href='https://documentation.roleplay.gruber.dev.br' target='_blank'>![documentation-badge]</a>

</div>

  <p align="center">
    A series of scripts to manage a server of FiveM using DevOps techniques
    <br />

#### Clone the repository and then run for a quick start (You'll need to create a new key, **even if it is on the same IP address**):

```sh
export SERVER_KEY=your_server_key
docker run -p "30110:30110" -p " 30110:30110/udp" -p "30120:30120" -p "30120:30120/udp" -e SERVER_KEY=$SERVER_KEY ghcr.io/gruberdev/basic-fivem-server
```

### Built with:

[Terraform](https://www.terraform.io) | [Docker](http://docker.com) | [Drone CI](https://www.drone.io) | [FiveM](https://fivem.net/) | [Kubernetes (Soon)](https://kubernetes.io/)

---

<!-- ABOUT THE PROJECT -->

## About the project

As I researched repositories for fivem, I noticed there was a lack of scripts that made it easier to test and assess quality of the resources deployed using CI/CD. Modern DevOps tools integrate with servers and existing cloud providers to allow developers to avoid surprises when deploying new code and resources to the server.

My goal is to share these tools with the rest of the community, as I built them for my personal use, hoping it helps other fellow members as much it helped me to avoid operations headache and focus on feature development.

There'll be a more in-depth documentation deployed through this repository as part of the pipeline soon.

Feel free to open issues with questions or suggestions.

<!-- CONTRIBUTING -->

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some YourFeature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a pull request

<!-- LICENSE -->

## License

Distributed under the GNU License. See [LICENSE](https://raw.githubusercontent.com/gruberdev/infrastructure-fivem/license_update/LICENSE) for more information.

<!-- BADGE IMAGES URLs -->

[quality-badge]: https://img.shields.io/codefactor/grade/github/gruberdev/infrastructure-fivem?label=Code%20Quality&color=46bac0&labelColor=1F1F1F&logo=CodeFactor&style=flat-square
[pipeline-badge]: https://img.shields.io/drone/build/gruberdev/infrastructure-fivem?label=Pipeline%20Status&color=46bac0&labelColor=1F1F1F&logo=Drone&style=flat-square&server=https%3A%2F%2Fdrone.gruber.dev.br
[documentation-badge]: https://img.shields.io/badge/project%20docs-onlinedocumentation?style=flat-square&logo=Hack%20Hands&color=46bac0&labelColor=1F1F1F&logo

<!-- PROJECT BADGE HYPERLINKS -->

[pipeline-url]: https://drone.gruber.dev.br/gruberdev/infrastructure-fivem
[quality-url]: https://www.codefactor.io/repository/github/gruberdev/infrastructure-fivem
[documentation-url]: https://documentation.roleplay.gruber.dev.br
