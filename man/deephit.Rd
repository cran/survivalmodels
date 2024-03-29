% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deephit.R
\name{deephit}
\alias{deephit}
\title{DeepHit Survival Neural Network}
\usage{
deephit(
  formula = NULL,
  data = NULL,
  reverse = FALSE,
  time_variable = "time",
  status_variable = "status",
  x = NULL,
  y = NULL,
  frac = 0,
  cuts = 10,
  cutpoints = NULL,
  scheme = c("equidistant", "quantiles"),
  cut_min = 0,
  activation = "relu",
  custom_net = NULL,
  num_nodes = c(32L, 32L),
  batch_norm = TRUE,
  dropout = NULL,
  device = NULL,
  mod_alpha = 0.2,
  sigma = 0.1,
  early_stopping = FALSE,
  best_weights = FALSE,
  min_delta = 0,
  patience = 10L,
  batch_size = 256L,
  epochs = 1L,
  verbose = FALSE,
  num_workers = 0L,
  shuffle = TRUE,
  ...
)
}
\arguments{
\item{formula}{\code{(formula(1))}\cr
Object specifying the model fit, left-hand-side of formula should describe a \code{\link[survival:Surv]{survival::Surv()}}
object.}

\item{data}{\code{(data.frame(1))}\cr
Training data of \code{data.frame} like object, internally is coerced with \code{\link[stats:model.matrix]{stats::model.matrix()}}.}

\item{reverse}{\code{(logical(1))}\cr
If \code{TRUE} fits estimator on censoring distribution, otherwise (default) survival distribution.}

\item{time_variable}{\code{(character(1))}\cr
Alternative method to call the function. Name of the 'time' variable, required if \code{formula}.
or \code{x} and \code{Y} not given.}

\item{status_variable}{\code{(character(1))}\cr
Alternative method to call the function. Name of the 'status' variable, required if \code{formula}
or \code{x} and \code{Y} not given.}

\item{x}{\code{(data.frame(1))}\cr
Alternative method to call the function. Required if \verb{formula, time_variable} and
\code{status_variable} not given. Data frame like object of features which is internally
coerced with \code{model.matrix}.}

\item{y}{\verb{([survival::Surv()])}\cr
Alternative method to call the function. Required if \verb{formula, time_variable} and
\code{status_variable} not given. Survival outcome of right-censored observations.}

\item{frac}{\code{(numeric(1))} \cr
Fraction of data to use for validation dataset, default is \code{0} and therefore no separate
validation dataset.}

\item{cuts}{\code{(integer(1))}\cr
If \code{discretise} is \code{TRUE} then determines number of cut-points for discretisation.}

\item{cutpoints}{\code{(numeric())} \cr
Alternative to \code{cuts} if \code{discretise} is true, provide exact cutpoints for discretisation.
\code{cuts} is ignored if \code{cutpoints} is non-NULL.}

\item{scheme}{\code{(character(1))}\cr
Method of discretisation, either \code{"equidistant"} (default) or \code{"quantiles"}.
See \code{reticulate::py_help(pycox$models$LogisticHazard$label_transform)} for more detail.}

\item{cut_min}{\code{(integer(1))}\cr
Starting duration for discretisation, see
\code{reticulate::py_help(pycox$models$LogisticHazard$label_transform)} for more detail.}

\item{activation}{\code{(character(1))} \cr
See \link{get_pycox_activation}.}

\item{custom_net}{\code{(torch.nn.modules.module.Module(1))}\cr
Optional custom network built with \link{build_pytorch_net}, otherwise default architecture used.
Note that if building a custom network the number of output channels depends on \code{cuts} or
\code{cutpoints}.}

\item{num_nodes, batch_norm, dropout}{\code{(integer()/logical(1)/numeric(1))} \cr
See \link{build_pytorch_net}.}

\item{device}{\code{(integer(1)|character(1))}\cr
Passed to \code{pycox.models.DeepHitSingle}, specifies device to compute models on.}

\item{mod_alpha}{\code{(numeric(1))}\cr
Weighting in (0,1) for combining likelihood (L1) and rank loss (L2). See reference and
\code{py_help(pycox$models$DeepHitSingle)} for more detail.}

\item{sigma}{\code{(numeric(1))}\cr
From eta in rank loss (L2) of ref. See reference and
\code{py_help(pycox$models$DeepHitSingle)} for more detail.}

\item{early_stopping, best_weights, min_delta, patience}{\verb{(logical(1)/logical(1)/numeric(1)/integer(1)} \cr
See \link{get_pycox_callbacks}.}

\item{batch_size}{\code{(integer(1))}\cr
Passed to \code{pycox.models.DeepHitSingle.fit}, elements in each batch.}

\item{epochs}{\code{(integer(1))}\cr
Passed to \code{pycox.models.DeepHitSingle.fit}, number of epochs.}

\item{verbose}{\code{(logical(1))}\cr
Passed to \code{pycox.models.DeepHitSingle.fit}, should information be displayed during
fitting.}

\item{num_workers}{\code{(integer(1))}\cr
Passed to \code{pycox.models.DeepHitSingle.fit}, number of workers used in the
dataloader.}

\item{shuffle}{\code{(logical(1))}\cr
Passed to \code{pycox.models.DeepHitSingle.fit}, should order of dataset be shuffled?}

\item{...}{\code{ANY} \cr
Passed to \link{get_pycox_optim}.}
}
\value{
An object inheriting from class \code{deephit}.

An object of class \code{survivalmodel}.
}
\description{
DeepHit fits a neural network based on the PMF of a discrete Cox model. This is
the single (non-competing) event implementation.
}
\details{
Implemented from the \code{pycox} Python package via \CRANpkg{reticulate}.
Calls \code{pycox.models.DeepHitSingle}.
}

\references{
Changhee Lee, William R Zame, Jinsung Yoon, and Mihaela van der Schaar.
Deephit: A deep learning approach to survival analysis with competing risks.
In Thirty-Second AAAI Conference on Artificial Intelligence, 2018.
http://medianetlab.ee.ucla.edu/papers/AAAI_2018_DeepHit
}
