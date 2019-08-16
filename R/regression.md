Regression Analysis of A/B test
================

## Motivation

It is challenging to to analyze experiments in a unified and flexible
way. For example, click through or sign-up follow binomial distribution,
orders per user per week follow Poisson distribution and the amount of
money spent on Ritual follow Gaussian distribution (after normalization
since it should have negative values). So, it is difficult to choose the
correct statistical test for analysis.

Secondly, it is difficult to measure cohort effect in terms different
sign-up location (metro\_id) and sign-up time(weekly cohort). Running
different test within each group may loose statistical significance or
may run into Simpson’s Paradox in the very end.

In order to solve the problem, I proposed alternative approach,
regression models. That is to say, we may try to use logistic regression
to solve binomial statistical inference, use Poisson regression and
simple linear regression to solve other problems accordingly.

To illustrate my point more, I used the following fake data for
illustration purposes.

## Logistic Regression

I created some fake click data by binomial distribution and run a
logistic regression. Regress city, sign-up channel, tenure and
experiment id on
    click.

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.2.0     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.1
    ## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    ## Parsed with column specification:
    ## cols(
    ##   user_id = col_character(),
    ##   city = col_character(),
    ##   tenure = col_double(),
    ##   channel = col_double(),
    ##   opu_6_week = col_double()
    ## )

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

Observations

</td>

<td style="text-align:right;">

16000

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Dependent variable

</td>

<td style="text-align:right;">

click

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Type

</td>

<td style="text-align:right;">

Generalized linear
model

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Family

</td>

<td style="text-align:right;">

binomial

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Link

</td>

<td style="text-align:right;">

logit

</td>

</tr>

</tbody>

</table>

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

𝛘²(46)

</td>

<td style="text-align:right;">

129.31

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Pseudo-R² (Cragg-Uhler)

</td>

<td style="text-align:right;">

0.03

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Pseudo-R²
(McFadden)

</td>

<td style="text-align:right;">

0.02

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

AIC

</td>

<td style="text-align:right;">

5427.57

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

BIC

</td>

<td style="text-align:right;">

5788.55

</td>

</tr>

</tbody>

</table>

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

Est.

</th>

<th style="text-align:right;">

S.E.

</th>

<th style="text-align:right;">

z val.

</th>

<th style="text-align:right;">

p

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

(Intercept)

</td>

<td style="text-align:right;">

\-3.64

</td>

<td style="text-align:right;">

0.49

</td>

<td style="text-align:right;">

\-7.48

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityBOS

</td>

<td style="text-align:right;">

0.47

</td>

<td style="text-align:right;">

0.50

</td>

<td style="text-align:right;">

0.93

</td>

<td style="text-align:right;">

0.35

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCAL

</td>

<td style="text-align:right;">

0.51

</td>

<td style="text-align:right;">

1.12

</td>

<td style="text-align:right;">

0.45

</td>

<td style="text-align:right;">

0.65

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCHI

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

0.47

</td>

<td style="text-align:right;">

0.33

</td>

<td style="text-align:right;">

0.74

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCLT

</td>

<td style="text-align:right;">

0.50

</td>

<td style="text-align:right;">

0.68

</td>

<td style="text-align:right;">

0.73

</td>

<td style="text-align:right;">

0.46

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCVG

</td>

<td style="text-align:right;">

0.12

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

0.87

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityDAL

</td>

<td style="text-align:right;">

\-0.16

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

\-0.22

</td>

<td style="text-align:right;">

0.83

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityDEN

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

0.68

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:right;">

0.98

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityDET

</td>

<td style="text-align:right;">

\-0.25

</td>

<td style="text-align:right;">

0.68

</td>

<td style="text-align:right;">

\-0.36

</td>

<td style="text-align:right;">

0.72

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityEDM

</td>

<td style="text-align:right;">

\-12.80

</td>

<td style="text-align:right;">

374.46

</td>

<td style="text-align:right;">

\-0.03

</td>

<td style="text-align:right;">

0.97

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityGNV

</td>

<td style="text-align:right;">

\-12.87

</td>

<td style="text-align:right;">

1199.75

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

0.99

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityHAL

</td>

<td style="text-align:right;">

0.51

</td>

<td style="text-align:right;">

1.12

</td>

<td style="text-align:right;">

0.46

</td>

<td style="text-align:right;">

0.65

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityHOU

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

0.58

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0.89

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityLAX

</td>

<td style="text-align:right;">

0.36

</td>

<td style="text-align:right;">

0.50

</td>

<td style="text-align:right;">

0.72

</td>

<td style="text-align:right;">

0.47

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityLON

</td>

<td style="text-align:right;">

0.25

</td>

<td style="text-align:right;">

0.47

</td>

<td style="text-align:right;">

0.53

</td>

<td style="text-align:right;">

0.60

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMEL

</td>

<td style="text-align:right;">

\-0.32

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

\-0.44

</td>

<td style="text-align:right;">

0.66

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMES

</td>

<td style="text-align:right;">

0.65

</td>

<td style="text-align:right;">

0.57

</td>

<td style="text-align:right;">

1.15

</td>

<td style="text-align:right;">

0.25

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMIA

</td>

<td style="text-align:right;">

\-12.80

</td>

<td style="text-align:right;">

618.88

</td>

<td style="text-align:right;">

\-0.02

</td>

<td style="text-align:right;">

0.98

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMKE

</td>

<td style="text-align:right;">

0.12

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

0.87

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMSY

</td>

<td style="text-align:right;">

\-0.04

</td>

<td style="text-align:right;">

1.11

</td>

<td style="text-align:right;">

\-0.04

</td>

<td style="text-align:right;">

0.97

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityNYC

</td>

<td style="text-align:right;">

0.23

</td>

<td style="text-align:right;">

0.47

</td>

<td style="text-align:right;">

0.50

</td>

<td style="text-align:right;">

0.62

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityOTT

</td>

<td style="text-align:right;">

0.17

</td>

<td style="text-align:right;">

0.54

</td>

<td style="text-align:right;">

0.32

</td>

<td style="text-align:right;">

0.75

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityPDX

</td>

<td style="text-align:right;">

\-12.81

</td>

<td style="text-align:right;">

282.56

</td>

<td style="text-align:right;">

\-0.05

</td>

<td style="text-align:right;">

0.96

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityPHI

</td>

<td style="text-align:right;">

\-0.14

</td>

<td style="text-align:right;">

0.55

</td>

<td style="text-align:right;">

\-0.25

</td>

<td style="text-align:right;">

0.80

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySAN

</td>

<td style="text-align:right;">

\-12.88

</td>

<td style="text-align:right;">

2399.54

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

1.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySEA

</td>

<td style="text-align:right;">

0.27

</td>

<td style="text-align:right;">

0.55

</td>

<td style="text-align:right;">

0.49

</td>

<td style="text-align:right;">

0.63

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySFO

</td>

<td style="text-align:right;">

\-0.02

</td>

<td style="text-align:right;">

0.53

</td>

<td style="text-align:right;">

\-0.05

</td>

<td style="text-align:right;">

0.96

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySTL

</td>

<td style="text-align:right;">

\-12.83

</td>

<td style="text-align:right;">

452.24

</td>

<td style="text-align:right;">

\-0.03

</td>

<td style="text-align:right;">

0.98

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySYD

</td>

<td style="text-align:right;">

\-0.06

</td>

<td style="text-align:right;">

0.51

</td>

<td style="text-align:right;">

\-0.12

</td>

<td style="text-align:right;">

0.90

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityTOR

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

0.51

</td>

<td style="text-align:right;">

0.13

</td>

<td style="text-align:right;">

0.90

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

tenure

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.21

</td>

<td style="text-align:right;">

0.84

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel10

</td>

<td style="text-align:right;">

\-0.14

</td>

<td style="text-align:right;">

0.20

</td>

<td style="text-align:right;">

\-0.70

</td>

<td style="text-align:right;">

0.49

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel11

</td>

<td style="text-align:right;">

\-13.58

</td>

<td style="text-align:right;">

413.18

</td>

<td style="text-align:right;">

\-0.03

</td>

<td style="text-align:right;">

0.97

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel12

</td>

<td style="text-align:right;">

\-0.49

</td>

<td style="text-align:right;">

0.54

</td>

<td style="text-align:right;">

\-0.91

</td>

<td style="text-align:right;">

0.36

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel13

</td>

<td style="text-align:right;">

0.13

</td>

<td style="text-align:right;">

0.26

</td>

<td style="text-align:right;">

0.51

</td>

<td style="text-align:right;">

0.61

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel14

</td>

<td style="text-align:right;">

\-0.26

</td>

<td style="text-align:right;">

0.25

</td>

<td style="text-align:right;">

\-1.04

</td>

<td style="text-align:right;">

0.30

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel15

</td>

<td style="text-align:right;">

\-0.08

</td>

<td style="text-align:right;">

0.19

</td>

<td style="text-align:right;">

\-0.44

</td>

<td style="text-align:right;">

0.66

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel16

</td>

<td style="text-align:right;">

\-0.03

</td>

<td style="text-align:right;">

1.05

</td>

<td style="text-align:right;">

\-0.03

</td>

<td style="text-align:right;">

0.98

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel2

</td>

<td style="text-align:right;">

\-0.04

</td>

<td style="text-align:right;">

0.22

</td>

<td style="text-align:right;">

\-0.20

</td>

<td style="text-align:right;">

0.84

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel3

</td>

<td style="text-align:right;">

\-13.63

</td>

<td style="text-align:right;">

613.71

</td>

<td style="text-align:right;">

\-0.02

</td>

<td style="text-align:right;">

0.98

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel4

</td>

<td style="text-align:right;">

0.17

</td>

<td style="text-align:right;">

0.64

</td>

<td style="text-align:right;">

0.27

</td>

<td style="text-align:right;">

0.79

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel5

</td>

<td style="text-align:right;">

0.36

</td>

<td style="text-align:right;">

0.34

</td>

<td style="text-align:right;">

1.05

</td>

<td style="text-align:right;">

0.29

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel6

</td>

<td style="text-align:right;">

2.06

</td>

<td style="text-align:right;">

0.84

</td>

<td style="text-align:right;">

2.46

</td>

<td style="text-align:right;">

0.01

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel7

</td>

<td style="text-align:right;">

\-13.94

</td>

<td style="text-align:right;">

2399.54

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

1.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel8

</td>

<td style="text-align:right;">

\-13.93

</td>

<td style="text-align:right;">

1199.56

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

0.99

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel9

</td>

<td style="text-align:right;">

0.41

</td>

<td style="text-align:right;">

0.44

</td>

<td style="text-align:right;">

0.94

</td>

<td style="text-align:right;">

0.35

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

experiment

</td>

<td style="text-align:right;">

0.93

</td>

<td style="text-align:right;">

0.21

</td>

<td style="text-align:right;">

4.44

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

</tbody>

<tfoot>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Standard errors: MLE

</td>

</tr>

</tfoot>

</table>

by noticing experiment’s regression coefficient’s p-value is less than
\(10^{-10}\), we may conclude with high statistical confidence that in
this case, the experiment drastically changed users’ click through
behavior across all metro and channel.

## Linear Regression

To analyze the average opu for a user in the past 6 weeks, we may use
linear regression since the variable should be continuous. Before
running regression, centering and scaling have been applied.

``` r
user$opu_6_week <-  scale(user$opu_6_week)
model2 <- glm(opu_6_week ~ city + tenure + channel + experiment, family = gaussian, data = user)
summ(model2)
```

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

Observations

</td>

<td style="text-align:right;">

16000

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Dependent variable

</td>

<td style="text-align:right;">

opu\_6\_week

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Type

</td>

<td style="text-align:right;">

Linear
regression

</td>

</tr>

</tbody>

</table>

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

𝛘²(46)

</td>

<td style="text-align:right;">

927.80

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Pseudo-R² (Cragg-Uhler)

</td>

<td style="text-align:right;">

0.06

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

Pseudo-R²
(McFadden)

</td>

<td style="text-align:right;">

0.02

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

AIC

</td>

<td style="text-align:right;">

44545.18

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

BIC

</td>

<td style="text-align:right;">

44913.84

</td>

</tr>

</tbody>

</table>

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

Est.

</th>

<th style="text-align:right;">

S.E.

</th>

<th style="text-align:right;">

t val.

</th>

<th style="text-align:right;">

p

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

(Intercept)

</td>

<td style="text-align:right;">

\-0.23

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

\-2.99

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityBOS

</td>

<td style="text-align:right;">

\-0.04

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

\-0.47

</td>

<td style="text-align:right;">

0.64

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCAL

</td>

<td style="text-align:right;">

0.72

</td>

<td style="text-align:right;">

0.20

</td>

<td style="text-align:right;">

3.54

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCHI

</td>

<td style="text-align:right;">

0.13

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

1.79

</td>

<td style="text-align:right;">

0.07

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCLT

</td>

<td style="text-align:right;">

0.42

</td>

<td style="text-align:right;">

0.12

</td>

<td style="text-align:right;">

3.66

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityCVG

</td>

<td style="text-align:right;">

0.22

</td>

<td style="text-align:right;">

0.11

</td>

<td style="text-align:right;">

1.97

</td>

<td style="text-align:right;">

0.05

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityDAL

</td>

<td style="text-align:right;">

\-0.10

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

\-1.00

</td>

<td style="text-align:right;">

0.32

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityDEN

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

1.00

</td>

<td style="text-align:right;">

0.32

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityDET

</td>

<td style="text-align:right;">

0.27

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

2.92

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityEDM

</td>

<td style="text-align:right;">

0.40

</td>

<td style="text-align:right;">

0.17

</td>

<td style="text-align:right;">

2.40

</td>

<td style="text-align:right;">

0.02

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityGNV

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

0.49

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

0.88

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityHAL

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

0.20

</td>

<td style="text-align:right;">

0.77

</td>

<td style="text-align:right;">

0.44

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityHOU

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

\-0.16

</td>

<td style="text-align:right;">

0.87

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityLAX

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

0.90

</td>

<td style="text-align:right;">

0.37

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityLON

</td>

<td style="text-align:right;">

\-0.13

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

\-1.79

</td>

<td style="text-align:right;">

0.07

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMEL

</td>

<td style="text-align:right;">

0.57

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

5.73

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMES

</td>

<td style="text-align:right;">

0.04

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

0.47

</td>

<td style="text-align:right;">

0.64

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMIA

</td>

<td style="text-align:right;">

0.36

</td>

<td style="text-align:right;">

0.26

</td>

<td style="text-align:right;">

1.40

</td>

<td style="text-align:right;">

0.16

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMKE

</td>

<td style="text-align:right;">

\-0.17

</td>

<td style="text-align:right;">

0.11

</td>

<td style="text-align:right;">

\-1.51

</td>

<td style="text-align:right;">

0.13

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityMSY

</td>

<td style="text-align:right;">

0.17

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

1.09

</td>

<td style="text-align:right;">

0.28

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityNYC

</td>

<td style="text-align:right;">

0.05

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

0.67

</td>

<td style="text-align:right;">

0.50

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityOTT

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

0.13

</td>

<td style="text-align:right;">

0.89

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityPDX

</td>

<td style="text-align:right;">

0.43

</td>

<td style="text-align:right;">

0.13

</td>

<td style="text-align:right;">

3.25

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityPHI

</td>

<td style="text-align:right;">

0.05

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

0.49

</td>

<td style="text-align:right;">

0.62

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySAN

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

0.97

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

0.93

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySEA

</td>

<td style="text-align:right;">

0.04

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

0.45

</td>

<td style="text-align:right;">

0.65

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySFO

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

0.83

</td>

<td style="text-align:right;">

0.41

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySTL

</td>

<td style="text-align:right;">

0.44

</td>

<td style="text-align:right;">

0.20

</td>

<td style="text-align:right;">

2.24

</td>

<td style="text-align:right;">

0.02

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

citySYD

</td>

<td style="text-align:right;">

0.29

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

3.39

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

cityTOR

</td>

<td style="text-align:right;">

0.22

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

2.59

</td>

<td style="text-align:right;">

0.01

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

tenure

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

9.39

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel10

</td>

<td style="text-align:right;">

0.12

</td>

<td style="text-align:right;">

0.04

</td>

<td style="text-align:right;">

2.96

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel11

</td>

<td style="text-align:right;">

0.29

</td>

<td style="text-align:right;">

0.17

</td>

<td style="text-align:right;">

1.67

</td>

<td style="text-align:right;">

0.10

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel12

</td>

<td style="text-align:right;">

\-0.10

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

\-1.13

</td>

<td style="text-align:right;">

0.26

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel13

</td>

<td style="text-align:right;">

0.03

</td>

<td style="text-align:right;">

0.05

</td>

<td style="text-align:right;">

0.61

</td>

<td style="text-align:right;">

0.54

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel14

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

0.05

</td>

<td style="text-align:right;">

2.06

</td>

<td style="text-align:right;">

0.04

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel15

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

0.04

</td>

<td style="text-align:right;">

\-0.27

</td>

<td style="text-align:right;">

0.79

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel16

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

0.25

</td>

<td style="text-align:right;">

0.37

</td>

<td style="text-align:right;">

0.71

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel2

</td>

<td style="text-align:right;">

0.20

</td>

<td style="text-align:right;">

0.04

</td>

<td style="text-align:right;">

4.65

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel3

</td>

<td style="text-align:right;">

4.33

</td>

<td style="text-align:right;">

0.25

</td>

<td style="text-align:right;">

17.05

</td>

<td style="text-align:right;">

0.00

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel4

</td>

<td style="text-align:right;">

0.34

</td>

<td style="text-align:right;">

0.15

</td>

<td style="text-align:right;">

2.23

</td>

<td style="text-align:right;">

0.03

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel5

</td>

<td style="text-align:right;">

\-0.11

</td>

<td style="text-align:right;">

0.08

</td>

<td style="text-align:right;">

\-1.50

</td>

<td style="text-align:right;">

0.13

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel6

</td>

<td style="text-align:right;">

\-0.44

</td>

<td style="text-align:right;">

0.31

</td>

<td style="text-align:right;">

\-1.41

</td>

<td style="text-align:right;">

0.16

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel7

</td>

<td style="text-align:right;">

\-0.67

</td>

<td style="text-align:right;">

0.97

</td>

<td style="text-align:right;">

\-0.69

</td>

<td style="text-align:right;">

0.49

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel8

</td>

<td style="text-align:right;">

\-0.30

</td>

<td style="text-align:right;">

0.49

</td>

<td style="text-align:right;">

\-0.61

</td>

<td style="text-align:right;">

0.54

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

channel9

</td>

<td style="text-align:right;">

0.20

</td>

<td style="text-align:right;">

0.10

</td>

<td style="text-align:right;">

1.92

</td>

<td style="text-align:right;">

0.06

</td>

</tr>

<tr>

<td style="text-align:left;font-weight: bold;">

experiment

</td>

<td style="text-align:right;">

\-0.00

</td>

<td style="text-align:right;">

0.05

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

0.99

</td>

</tr>

</tbody>

<tfoot>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Standard errors: MLE

</td>

</tr>

</tfoot>

</table>

This time, experiment’s coefficient is not significant anymore and we
may conclude that this feature haven’t been changed(deteriorate) by the
experiment.
