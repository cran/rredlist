# rredlist <img src="man/figures/logo.png" align="right" width="120" />



[![Status at rOpenSci Software Peer Review](https://badges.ropensci.org/663_status.svg)](https://github.com/ropensci/software-review/issues/663)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![cran version](https://www.r-pkg.org/badges/version/rredlist)](https://cran.r-project.org/package=rredlist)
[![R-check](https://github.com/ropensci/rredlist/actions/workflows/R-check.yml/badge.svg)](https://github.com/ropensci/rredlist/actions/workflows/R-check.yml)
[![codecov.io](https://codecov.io/gh/ropensci/rredlist/coverage.svg)](https://app.codecov.io/gh/ropensci/rredlist)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rredlist)](https://github.com/r-hub/cranlogs.app)

`rredlist` is an R client for the IUCN Red List API (https://api.iucnredlist.org). The [IUCN Red List](https://www.iucnredlist.org/) is the world’s most comprehensive information source on the global extinction risk status of animal, fungus, and plant species. This package provides access via R to the various data contained within this database which span range details, population size, habitat and ecology, use and/or trade, threats, and conservation actions. The functions within the package cover all endpoints of the IUCN Red List web API, which are documented [here](https://api.iucnredlist.org/api-docs/index.html).

## Installation

CRAN


``` r
install.packages("rredlist")
```

Development version


``` r
remotes::install_github("ropensci/rredlist")
# OR
install.packages("rredlist", repos = "https://ropensci.r-universe.dev/")
```

## Authentication

Use of this package requires an IUCN API key which can be acquired at https://api.iucnredlist.org/users/sign_up. There is a helper function to help you get the key and store it properly:


``` r
rredlist::rl_use_iucn()
```

**Keep this key private.** You can pass the key in to each function via the key parameter, but it’s better to store the key either as an environment variable (`IUCN_REDLIST_KEY`) or an R option (`iucn_redlist_key`) - we recommend using the former option. Note that there is not a default API key that is used as a fallback, and the package will not function without providing/storing your own API key.

## Example usage

### Loading the package

``` r
library("rredlist")
```

### Search for assessments for a particular species

``` r
rl_species("Gorilla", "gorilla")$assessments
#>    year_published latest possibly_extinct possibly_extinct_in_the_wild sis_taxon_id
#> 1            2016  FALSE            FALSE                        FALSE         9404
#> 2            2018   TRUE            FALSE                        FALSE         9404
#> 3            2016  FALSE            FALSE                        FALSE         9404
#> 4            2008  FALSE            FALSE                        FALSE         9404
#> 5            2007  FALSE            FALSE                        FALSE         9404
#> 6            2000  FALSE            FALSE                        FALSE         9404
#> 7            1996  FALSE            FALSE                        FALSE         9404
#> 8            1994  FALSE            FALSE                        FALSE         9404
#> 9            1990  FALSE            FALSE                        FALSE         9404
...
```

### Search for assessments that recommend particular conservation actions

#### Get a list of all conservation actions

``` r
rl_actions()
#> $conservation_actions
#>                                              en  code
#> 1                         Land/water protection     1
#> 2                          Site/area protection   1_1
#> 3                 Resource & habitat protection   1_2
#> 4                         Land/water management     2
#> 5                          Site/area management   2_1
#> 6          Invasive/problematic species control   2_2
#> 7         Habitat & natural process restoration   2_3
#> 8                            Species management     3
...
```

#### Return assessments with a particular conservation action

``` r
rl_actions("2_2", all = FALSE)$assessments
#>    year_published latest possibly_extinct possibly_extinct_in_the_wild sis_taxon_id
#> 1            2019   TRUE            FALSE                        FALSE    132523146
#> 2            2019   TRUE            FALSE                        FALSE        10767
#> 3            2013   TRUE            FALSE                        FALSE         1078
#> 4            2019   TRUE            FALSE                        FALSE    132521900
#> 5            2020  FALSE            FALSE                        FALSE         1086
#> 6            2019   TRUE            FALSE                        FALSE         1117
#> 7            2019  FALSE            FALSE                        FALSE        11797
#> 8            2021   TRUE            FALSE                        FALSE        12124
#> 9            2025   TRUE            FALSE                        FALSE    232775771
...
```

## Logo

<img src="man/figures/logo.png" align="right" width="120" />

The `rredlist` logo showcases a silhouette of a [Javan rhinoceros](https://www.iucnredlist.org/species/19495/18493900) (_Rhinoceros sondaicus_), one of the most endangered mammal species on the planet. The species has suffered extreme population decline due to habitat loss and poaching, with only ~75 individuals alive in the wild today, all in Ujung Kulon National Park, a [UNESCO World Heritage Site](https://whc.unesco.org/en/list/608) in Java, Indonesia. Despite recent conservation efforts, [poaching continues](https://www.savetherhino.org/asia/indonesia/poaching-gangs-claim-to-have-killed-one-third-of-the-remaining-javan-rhino-population/); further, the small population is extremely susceptible to inbreeding, disease, and further habitat loss due to the rampant spreading of local palm trees. You can read more about the Javan rhino on the [IUCN Red List](https://www.iucnredlist.org/species/19495/18493900), [World Wildlife Fund](https://www.worldwildlife.org/species/javan-rhino), and [International Rhino Foundation](https://rhinos.org/about-rhinos/rhino-species/javan-rhino/).

This work, "rredlist logo", is adapted from ["Javan rhino silhouette"](https://creazilla.com/media/silhouette/64313/javan-rhino) by [Creazilla](https://creazilla.com/), used under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). "rredlist logo" is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) by William Gearty.

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rredlist/issues).
* License: MIT
* Get citation information for `rredlist` in R doing `citation(package = 'rredlist')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.

[![rofooter](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

## Contributors


<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

All contributions to this project are gratefully acknowledged using the [`allcontributors` package](https://github.com/ropensci/allcontributors) following the [allcontributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind are welcome!

### Code

<table>

<tr>
<td align="center">
<a href="https://github.com/sckott">
<img src="https://avatars.githubusercontent.com/u/577668?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/commits?author=sckott">sckott</a>
</td>
<td align="center">
<a href="https://github.com/willgearty">
<img src="https://avatars.githubusercontent.com/u/7232514?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/commits?author=willgearty">willgearty</a>
</td>
<td align="center">
<a href="https://github.com/maelle">
<img src="https://avatars.githubusercontent.com/u/8360597?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/commits?author=maelle">maelle</a>
</td>
<td align="center">
<a href="https://github.com/jeffreyhanson">
<img src="https://avatars.githubusercontent.com/u/3610005?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/commits?author=jeffreyhanson">jeffreyhanson</a>
</td>
<td align="center">
<a href="https://github.com/jeroen">
<img src="https://avatars.githubusercontent.com/u/216319?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/commits?author=jeroen">jeroen</a>
</td>
<td align="center">
<a href="https://github.com/KevCaz">
<img src="https://avatars.githubusercontent.com/u/1583534?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/commits?author=KevCaz">KevCaz</a>
</td>
</tr>

</table>


### Issue Authors

<table>

<tr>
<td align="center">
<a href="https://github.com/stevenpbachman">
<img src="https://avatars.githubusercontent.com/u/8523782?u=b2901ffea809dea3ea9abb6d5456c13a1ebeed0b&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Astevenpbachman">stevenpbachman</a>
</td>
<td align="center">
<a href="https://github.com/FVFaleiro">
<img src="https://avatars.githubusercontent.com/u/5278091?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3AFVFaleiro">FVFaleiro</a>
</td>
<td align="center">
<a href="https://github.com/git-og">
<img src="https://avatars.githubusercontent.com/u/37261897?u=1cdc45771453cd662653c0d5fd55731c9416b51d&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Agit-og">git-og</a>
</td>
<td align="center">
<a href="https://github.com/arw36">
<img src="https://avatars.githubusercontent.com/u/16709317?u=0f83d16890d2ec07ef1d9bab7f9d50d610b5de2a&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Aarw36">arw36</a>
</td>
<td align="center">
<a href="https://github.com/electricquad">
<img src="https://avatars.githubusercontent.com/u/47792441?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Aelectricquad">electricquad</a>
</td>
<td align="center">
<a href="https://github.com/bgerstner90">
<img src="https://avatars.githubusercontent.com/u/34172115?u=4f8a9fad0ab5e1104a4f6683a358cb3315ff1eeb&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Abgerstner90">bgerstner90</a>
</td>
<td align="center">
<a href="https://github.com/lime-n">
<img src="https://avatars.githubusercontent.com/u/68914515?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Alime-n">lime-n</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/marcelxelo">
<img src="https://avatars.githubusercontent.com/u/83825031?u=51ce8fb4dd74e65ebebb84e7021bf0beb1b8b66e&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Amarcelxelo">marcelxelo</a>
</td>
<td align="center">
<a href="https://github.com/cpavloud">
<img src="https://avatars.githubusercontent.com/u/32954293?u=c4b1ed82c4cec63ffcc448a9691991723010d8ef&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Acpavloud">cpavloud</a>
</td>
<td align="center">
<a href="https://github.com/Gopal-Murali">
<img src="https://avatars.githubusercontent.com/u/16218632?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3AGopal-Murali">Gopal-Murali</a>
</td>
<td align="center">
<a href="https://github.com/DanielIAvila">
<img src="https://avatars.githubusercontent.com/u/26021913?u=537bdb63e3f728e112bb3e5ce4fb5c45e8518eea&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3ADanielIAvila">DanielIAvila</a>
</td>
<td align="center">
<a href="https://github.com/michitobler">
<img src="https://avatars.githubusercontent.com/u/28713008?u=50786272806f2a4a98576401a00d346d17e12e4f&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Amichitobler">michitobler</a>
</td>
<td align="center">
<a href="https://github.com/martijnvandepol">
<img src="https://avatars.githubusercontent.com/u/108213692?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Amartijnvandepol">martijnvandepol</a>
</td>
<td align="center">
<a href="https://github.com/XuWeiEvo">
<img src="https://avatars.githubusercontent.com/u/126555867?u=a920a4434b0ffd89f4a7049615cc0bb98aa830d7&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3AXuWeiEvo">XuWeiEvo</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/makosiaaa">
<img src="https://avatars.githubusercontent.com/u/168120118?u=6d6c33c848362a33ec9539450068746c0587a9b3&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Amakosiaaa">makosiaaa</a>
</td>
<td align="center">
<a href="https://github.com/wk-ai">
<img src="https://avatars.githubusercontent.com/u/72534080?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Awk-ai">wk-ai</a>
</td>
<td align="center">
<a href="https://github.com/Lisa-Tedeschi">
<img src="https://avatars.githubusercontent.com/u/126464153?u=e305afad7c7938801d78a8e8da08633cbf171100&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3ALisa-Tedeschi">Lisa-Tedeschi</a>
</td>
<td align="center">
<a href="https://github.com/oldenfish">
<img src="https://avatars.githubusercontent.com/u/46573596?u=00ec35751b436213ad7a0bd51fc0d7c343443b3a&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Aoldenfish">oldenfish</a>
</td>
<td align="center">
<a href="https://github.com/laetitiatremblay">
<img src="https://avatars.githubusercontent.com/u/195579379?u=6d995e1d76cb44425ede7fd60973fb81c12c8e7f&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+author%3Alaetitiatremblay">laetitiatremblay</a>
</td>
</tr>

</table>


### Issue Contributors

<table>

<tr>
<td align="center">
<a href="https://github.com/olliewearn">
<img src="https://avatars.githubusercontent.com/u/22527233?u=1693575e4d6eccb775e4aca208983bdbc254abf5&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Aolliewearn">olliewearn</a>
</td>
<td align="center">
<a href="https://github.com/matthewlewis896">
<img src="https://avatars.githubusercontent.com/u/54063056?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Amatthewlewis896">matthewlewis896</a>
</td>
<td align="center">
<a href="https://github.com/mairindeith">
<img src="https://avatars.githubusercontent.com/u/7770415?u=a3d879dfc6ac65913dab219b05ea68ae69e9b176&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Amairindeith">mairindeith</a>
</td>
<td align="center">
<a href="https://github.com/MirzaCengic">
<img src="https://avatars.githubusercontent.com/u/19353225?u=9f14ce041845ab3395bbc80f51876f06ba375e71&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3AMirzaCengic">MirzaCengic</a>
</td>
<td align="center">
<a href="https://github.com/rdornas">
<img src="https://avatars.githubusercontent.com/u/25906665?u=092efd13ddf08cef90abfe29ea0293cf24a82fde&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Ardornas">rdornas</a>
</td>
<td align="center">
<a href="https://github.com/awpark">
<img src="https://avatars.githubusercontent.com/u/6181375?u=9839305f921edd2dd99e97a2d9ffbf5d107b4936&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Aawpark">awpark</a>
</td>
<td align="center">
<a href="https://github.com/ingomiller">
<img src="https://avatars.githubusercontent.com/u/74630511?u=41ed92c36c79dab4a3a77aaca555b66c733eb893&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Aingomiller">ingomiller</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/yabellini">
<img src="https://avatars.githubusercontent.com/u/2473676?u=2ada2d3ef6403fabc25fa323110791a20031ab85&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Ayabellini">yabellini</a>
</td>
<td align="center">
<a href="https://github.com/benscarlson">
<img src="https://avatars.githubusercontent.com/u/566703?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Abenscarlson">benscarlson</a>
</td>
<td align="center">
<a href="https://github.com/mcauchoix">
<img src="https://avatars.githubusercontent.com/u/727164?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Amcauchoix">mcauchoix</a>
</td>
<td align="center">
<a href="https://github.com/magpiedin">
<img src="https://avatars.githubusercontent.com/u/8563362?u=b72e5ec9689d498dd282717ce70c8b0dd22f5ee8&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Amagpiedin">magpiedin</a>
</td>
<td align="center">
<a href="https://github.com/klausriede">
<img src="https://avatars.githubusercontent.com/u/12816652?u=d3458cfa913d3c322cddcdcf3f9d5d8b61349d7c&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Aklausriede">klausriede</a>
</td>
<td align="center">
<a href="https://github.com/simon-tarr">
<img src="https://avatars.githubusercontent.com/u/27423094?u=a720ad78ed9b2b721cf7c2ee7726b41465bf3c3d&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Asimon-tarr">simon-tarr</a>
</td>
<td align="center">
<a href="https://github.com/ToleranceTrading">
<img src="https://avatars.githubusercontent.com/u/45725570?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3AToleranceTrading">ToleranceTrading</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/omerome83">
<img src="https://avatars.githubusercontent.com/u/46061735?u=8662a93b7adba45420a2b44ff206f55b2e9a2b93&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Aomerome83">omerome83</a>
</td>
<td align="center">
<a href="https://github.com/Crastoman">
<img src="https://avatars.githubusercontent.com/u/92993185?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3ACrastoman">Crastoman</a>
</td>
<td align="center">
<a href="https://github.com/karolazvdo">
<img src="https://avatars.githubusercontent.com/u/101413438?u=66e4beb0a88c6c3aef073da3c59995311447453d&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Akarolazvdo">karolazvdo</a>
</td>
<td align="center">
<a href="https://github.com/Andresmrv3">
<img src="https://avatars.githubusercontent.com/u/136818946?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3AAndresmrv3">Andresmrv3</a>
</td>
<td align="center">
<a href="https://github.com/jzhongwen">
<img src="https://avatars.githubusercontent.com/u/143148014?u=8329a4bad9b98ad78624a877493c286684148c11&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Ajzhongwen">jzhongwen</a>
</td>
<td align="center">
<a href="https://github.com/malmagrok">
<img src="https://avatars.githubusercontent.com/u/153113378?u=f02bc2b5dff277aae35bf8f7d39c3dd813c46c84&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Amalmagrok">malmagrok</a>
</td>
<td align="center">
<a href="https://github.com/nicholasZ16">
<img src="https://avatars.githubusercontent.com/u/180613393?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3AnicholasZ16">nicholasZ16</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/dcuadrac">
<img src="https://avatars.githubusercontent.com/u/182159965?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/rredlist/issues?q=is%3Aissue+commenter%3Adcuadrac">dcuadrac</a>
</td>
</tr>

</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

