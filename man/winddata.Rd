\name{windata}
\alias{windata}
\alias{windStMartin}
\alias{windEchirolles}
\docType{data}

\title{Daily Climatological data between August 2005 and May 2007}

\description{
Daily Climatological data recorded in two French cities: 
Echirolles and St Martin-En-Haut.
Weather stations are located at Echirolles (ELEV: 237m, 
LAT: 45 06' 00" N LONG: 5 42' 00" E) and La Rafiliere (ELEV: 575m, 
LAT: 45 39' 00" N LONG: 4 33' 00" E), respectively.  


}

\usage{
data(windStMartin)
data(windEchirolles)
}
\format{ 
\code{windStMartin} and \code{windEchirolles} are data frames of 15 columns:
\describe{
    \item{\code{YEAR}}{Year.}
    \item{\code{MONTH}}{Month number.}
    \item{\code{DAY}}{Day number.}
    \item{\code{TEMP.MEAN}}{Average temperature (Celsius degree).}
    \item{\code{TEMP.HIGH}}{Maximum temperature.}
    \item{\code{TIME.TH}}{Time of the maximum temperature (hh:mm).}
    \item{\code{TEMP.LOW}}{Minimum temperature.}
    \item{\code{TIME.TL}}{Time of the minimum temperature.}
    \item{\code{HDD}}{Heating Degree Days.}
    \item{\code{CDD}}{Cooling Degree Days.}
    \item{\code{RAIN}}{Rain (mm).}
    \item{\code{WIND.MEAN}}{Wind speed average (km/h).}
    \item{\code{WIND.HIGH}}{Wind speed maximum.}
    \item{\code{WIND.TH}}{Time of the wind speed maximum.}
    \item{\code{DOM.DIR}}{Dominant direction of the wind, a character string 
	where "N" for North, "NE" for North-East, etc... }
}
}

\source{ 
See \url{https://meteo.data.gouv.fr/datasets}
 }
\keyword{datasets}