% Introduction to Data Analysis
% John Myles White

---

\begin{center}
    \bf{Step 1: Get data}
\end{center}

---

Sources:

* Spreadsheets
    * Excel
    * CSV
* Databases
    * MySQL
    * SAS
* System logs

---

\begin{center}
    \bf{Step 2: Translate unstructured data into tabular data}
\end{center}

---

\begin{center}
    \bf{Good data is tabular data}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/tabular_data.pdf}
\end{center}

---

\begin{center}
    \bf{Lots of data is not provided in tabular form}
\end{center}

---

# Social Graphs

\begin{center}
    \includegraphics[scale = 0.5]{diagrams/graph.pdf}
\end{center}

---

Two possible tabular representations:

* Edge list
* Adjacency matrix

---

# Edge List

\begin{center}
    \begin{tabular}{|c|c|}
    \hline
    \bf{Out} & \bf{In}\\
    \hline
    Alice & Carol\\
    \hline
    Bob & Carol\\
    \hline
    \end{tabular}
\end{center}

---

# Adjacency Matrix

\begin{center}
    \begin{tabular}{|c|c|c|c|}
    \hline
    & \bf{Alice} & \bf{Bob} & \bf{Carol}\\
    \hline
    \bf{Alice} & 0 & 0 & 1\\
    \hline
    \bf{Bob} & 0 & 0 & 1\\
    \hline
    \bf{Carol} & 0 & 0 & 0\\
    \hline
    \end{tabular}
\end{center}

---

# Text Corpora

* Document 1: "I am a phrase"
* Document 2: "This is a phrase and that is too"
* Document 3: "This phrase not"

---

Two possible tabular representations:

* Word counts
* Word occurrences

---

# Word counts

\begin{center}
    \begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
    \hline
    \bf{I} & \bf{am} & \bf{a} & \bf{phrase} & \bf{this} & \bf{is} & \bf{and} & \bf{that} & \bf{too} & \bf{not}\\
    \hline
    1 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0\\
    \hline
    0 & 0 & 1 & 1 & 1 & 2 & 1 & 1 & 1 & 0\\
    \hline
    0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0 & 1\\
    \hline
    \end{tabular}
\end{center}

---

# Word occurrences

\begin{center}
    \begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
    \hline
    \bf{I} & \bf{am} & \bf{a} & \bf{phrase} & \bf{this} & \bf{is} & \bf{and} & \bf{that} & \bf{too} & \bf{not}\\
    \hline
    1 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0\\
    \hline
    0 & 0 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0\\
    \hline
    0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0 & 1\\
    \hline
    \end{tabular}
\end{center}

---

# Sounds

\begin{center}
    \includegraphics[scale = 0.4]{images/sound.jpg}
\end{center}

---

# Sounds

    119000x1 Array{Float64,2}:
     0.00451674
     0.00534074
     0.00589007
     ...         
     0.00787378
     0.00787378
     0.00897244

---

# Images

\begin{center}
    \includegraphics[scale = 1.0]{images/image.jpg}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{images/image2.jpg}
\end{center}

---

\begin{center}
    \bf{Step 3: Do something with your tabular data}
\end{center}

---

# Two classes of operations

* Reduce the size of tables
* Fill in tables

---

# Data reductions

* Summary statistics
* Dimensionality reduction
* Clustering

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/summary_statistics.pdf}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/dimensionality_reduction.pdf}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/clustering.pdf}
\end{center}

---

# Filling in data

* Regression
* Classification

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/regression.pdf}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/classification.pdf}
\end{center}

---

\begin{center}
    \bf{Let's dig in to details now}
\end{center}

---

# Summary statistics

Two main categories:

* Summarize the "typical" value
* Summarize variability around typical values

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/summary_statistics.pdf}
\end{center}

---

# Typical value summaries

* Mean
* Median
* Mode
* Midrange

---

\begin{center}
    \bf{The mean of a vector is the average}
\end{center}

---

    x <- c(9, 9, 10, 11, 9, 10, 11)
    
    mean(x) # => 9.857143

    sum(x) / length(x) # => 9.857143

---

\begin{center}
    \bf{The median of a vector is the center of the sorted values}
\end{center}

---

    median(x) # => 10

    sort(x)[ceiling(length(x) / 2)] # => 10

---

\begin{center}
    \bf{The mode of a vector is the most frequently occurring value}
\end{center}

---

    mode <- function(x)
    {
        T <- table(x)
        return(names(T)[which(T == max(T))])
    }
    mode(x)

---

\begin{center}
    \bf{The midrange of a vector lies halfway between its bounds}
\end{center}

---

    midrange <- function (x)
    {
        return(min(x) + (max(x) - min(x)) / 2)
    }
    midrange(x)

---

\begin{center}
    \bf{Why are these four summaries special?}
\end{center}

---

\begin{center}
    \bf{They minimize different errors when approximating data}
\end{center}

---

    squared.error <- function(s)
    {
        return(sum(abs(x - s)^2))
    }
    grid <- seq(min(x), max(x), by = 0.01)
    plot(grid, sapply(grid, squared.error))

---

\begin{center}
    \includegraphics[scale = 0.4]{images/squared_error.pdf}
\end{center}

---

    absolute.error <- function(s)
    {
        return(sum(abs(x - s)))
    }
    grid <- seq(min(x), max(x), by = 0.01)
    plot(grid, sapply(grid, absolute.error))

---

\begin{center}
    \includegraphics[scale = 0.4]{images/absolute_error.pdf}
\end{center}

---

    zero.one.error <- function(s)
    {
        return(sum(abs(x != s)))
    }
    grid <- seq(min(x), max(x), by = 0.01)
    plot(grid, sapply(grid, zero.one.error))

---

\begin{center}
    \includegraphics[scale = 0.4]{images/zero_one_error.pdf}
\end{center}

---

    max.error <- function(s)
    {
        return(max(abs(x - s)))
    }
    grid <- seq(min(x), max(x), by = 0.01)
    plot(grid, sapply(grid, max.error))

---

\begin{center}
    \includegraphics[scale = 0.4]{images/max_error.pdf}
\end{center}

---

# Summary statistics summarized

* Mean: Minimizes squared error
* Median: Minimizes absolute error
* Mode: Minimizes zero-one error
* Midrange: Minimizes max error

---

# Homework Problems

* Prove the claims made about summary statistics are correct
    * Nested problem: relearn any rusty math
* Make those summary statistics work on huge data sets
    * Compute the mean without storing vector in memory
    * Compute the median without storing vector in memory
    * Compute mode without maintaing list of unique items

---

# Variability summaries

* Range: Min-Max
* Standard Deviation / Variance
* Median Absolute Deviation
* Inter-Quantile Range (IQR)

---

    min(x) # => 9
    max(x) # => 11
    range(x) #=> c(9, 11)

---

    sd(x) # => 0.8997354
    var(x) # => 0.8095238

---

    my.var <- function(x)
    {
        return(sum(abs(x - mean(x))^2) / (length(x) - 1))
    }

---

\begin{center}
    \bf{Why divide by length(x) - 1?}
\end{center}

---

\begin{center}
    \bf{This gives correct result when averaging across data sets}
\end{center}

---

    mad(x) #=> 1.4826

---

    my.mad <- function(x)
    {
        return(1.4826 * median(abs(x - median(x))))
    }

---

\begin{center}
    \bf{1.4826 makes estimate behave like standard deviation}
\end{center}

---

    IQR(x) # => 1.5

---

    my.IQR <- function(x)
    {
        return(diff(quantile(x, c(0.75, 0.25))))
    }

---

\begin{center}
    \bf{Almost everything in data analysis reduces to these ideas}
\end{center}

---

\begin{center}
    \bf{Break for questions}
\end{center}

---

# Dimensionality reduction

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/dimensionality_reduction.pdf}
\end{center}

---

\begin{center}
    \bf{Try to produce a lower-dimensional representation of data}
\end{center}

---

Common forms:

* PCA - Principal Components Analysis
* ICA - Independent Components Analysis
* NMF - Non-Negative Matrix Factorization

---

\begin{center}
    \bf{PCA computes a multivariate ``mean''}
\end{center}

---

    stocks <- read.csv(file.path('data', 'stocks.csv'))

    dates <- stocks[, 1]

    pca <- princomp(stocks[, 2:ncol(stocks)])

---

    market.index <- predict(pca)[, 1]

    dji <- read.csv(file.path('data', 'dji.csv'),
                    stringsAsFactors = FALSE)[, 1]

    comparison <- data.frame(Date = dates,
                             MarketIndex = market.index,
                             DJI = dji)

---

    library(ggplot2)

    ggplot(comparison, aes(x = MarketIndex, y = DJI)) +
      geom_point() +
      geom_smooth(method = 'lm', se = FALSE)

---

    comparison <- transform(comparison,
                            MarketIndex = -1 * MarketIndex)

    ggplot(comparison, aes(x = MarketIndex, y = DJI)) +
      geom_point() +
      geom_smooth(method = 'lm', se = FALSE)

---

    alt.comparison <- melt(comparison, id.vars = 'Date')

    names(alt.comparison) <- c('Date', 'Index', 'Price')

    ggplot(alt.comparison,
           aes(x = Date,
               y = Price,
               group = Index,
               color = Index)) +
      geom_point() +
      geom_line()

---

    comparison <- transform(comparison,
                            MarketIndex = scale(MarketIndex))
    comparison <- transform(comparison,
                            DJI = scale(DJI))

---

    alt.comparison <- melt(comparison, id.vars = 'Date')

    names(alt.comparison) <- c('Date', 'Index', 'Price')

    ggplot(alt.comparison,
           aes(x = Date, y = Price,
               group = Index, color = Index)) +
      geom_point() +
      geom_line()

---

# Clustering

Replace each row with a category label

---

Common forms:

* k-Means
* Hierarchical clustering
* Spectral clustering

---

    data(iris)

---

    > head(iris)
      Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    1          5.1         3.5          1.4         0.2  setosa
    2          4.9         3.0          1.4         0.2  setosa
    3          4.7         3.2          1.3         0.2  setosa
    4          4.6         3.1          1.5         0.2  setosa
    5          5.0         3.6          1.4         0.2  setosa
    6          5.4         3.9          1.7         0.4  setosa

---

    ggplot(iris,
           aes(x = Petal.Length,
               y = Petal.Width,
               color = Species)) +
      geom_point()

---

\begin{center}
    \includegraphics[scale = 0.4]{images/iris.pdf}
\end{center}

---

    kmeans(iris[, 1:4], 3)

---

    K-means clustering with 3 clusters of sizes 50, 62, 38

    Cluster means:
      Sepal.Length Sepal.Width Petal.Length Petal.Width
    1     5.006000    3.428000     1.462000    0.246000
    2     5.901613    2.748387     4.393548    1.433871
    3     6.850000    3.073684     5.742105    2.071053

    Clustering vector:
      [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
     [38] 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
     [75] 2 2 2 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 2 3 3 3 3 2 3 3 3 3
    [112] 3 3 2 2 3 3 3 3 2 3 2 3 2 3 3 2 2 3 3 3 3 3 2 3 3 3 3 2 3 3 3 2 3 3 3 2 3
    [149] 3 2

---

    library("plyr")
    ddply(iris, "Species",
          function (df) {data.frame(X1 = mean(df[, 1]),
                                    X2 = mean(df[, 2]),
                                    X3 = mean(df[, 3]),
                                    X4 = mean(df[, 4]))})

---

         Species    X1    X2    X3    X4
    1     setosa 5.006 3.428 1.462 0.246
    2 versicolor 5.936 2.770 4.260 1.326
    3  virginica 6.588 2.974 5.552 2.026

---

\begin{center}
    \bf{Break for questions}
\end{center}

---

\begin{center}
    \bf{Switch from summaries to filling in operations}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/regression.pdf}
\end{center}

---

# A toy regression problem

\begin{center}
    \includegraphics[scale = 0.4]{figures/fahrenheit.pdf}
\end{center}

---

# Solve in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyRegression.jpg}
\end{center}

---

# Results in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyRegressionResults.jpg}
\end{center}

---

# Solve variant in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyRegression2.jpg}
\end{center}

---

# Results in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyRegressionResults2.jpg}
\end{center}

---

\begin{center}
    \includegraphics[scale = 0.4]{diagrams/classification.pdf}
\end{center}

---

# A toy classification problem

\begin{center}
    \includegraphics[scale = 0.4]{figures/spam1.pdf}
\end{center}

---

# Convert categories to numbers

\begin{center}
    \includegraphics[scale = 0.4]{figures/spam2.pdf}
\end{center}

---

# Solve in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyClassification.jpg}
\end{center}

---

# Results in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyClassificationResults.jpg}
\end{center}

---

# Solve variant in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyClassification2.jpg}
\end{center}

---

# Results in R

\begin{center}
    \includegraphics[scale = 0.4]{figures/ToyClassificationResults2.jpg}
\end{center}

---

# Richer case study

* Predict web site popularity
* Predict book sales for O'Reilly's books

---

# Web Data

\begin{center}
    \includegraphics[scale = 0.4]{figures/web_ranks1.pdf}
\end{center}

---

# Web Data

\begin{center}
    \includegraphics[scale = 0.4]{figures/web_ranks2.pdf}
\end{center}

---

# Web Data

\begin{center}
    \includegraphics[scale = 0.4]{figures/web_ranks3.pdf}
\end{center}

---

# Load and Check Web Data

    top.1000.sites <- read.csv(file.path('data', 'top_1000_sites.tsv'),
                               sep = '\t',
                               stringsAsFactors = FALSE)
    head(top.1000.sites, n = 4)

---

# Page Views vs Visitors

    ggplot(top.1000.sites, aes(x = PageViews, y = UniqueVisitors)) +
      geom_point()
    ggsave(file.path("images", "page_views_vs_visitors.pdf"))

---

# Page Views vs Visitors

\begin{center}
    \includegraphics[scale = 0.4]{figures/page_views_vs_visitors.pdf}
\end{center}

---

# Log Page Views vs Log Visitors

    ggplot(top.1000.sites, aes(x = log(PageViews),
                               y = log(UniqueVisitors))) +
      geom_point()
    ggsave(file.path("images", "log_page_views_vs_log_visitors.pdf"))

---

# Log Page Views vs Log Visitors

\begin{center}
    \includegraphics[scale = 0.4]{figures/log_page_views_vs_log_visitors.pdf}
\end{center}

---

# Visual Linear Regression

    ggplot(top.1000.sites, aes(x = log(PageViews),
                               y = log(UniqueVisitors))) +
      geom_point() +
      geom_smooth(method = 'lm', se = FALSE)
    ggsave(file.path("images",
                     "log_page_views_vs_log_visitors_with_lm.pdf"))

---

# Visual Linear Regression

\begin{center}
    \includegraphics[scale = 0.4]{figures/log_page_views_vs_log_visitors_with_lm.pdf}
\end{center}

---

# Simple Linear Regression

    lm.fit <- lm(log(PageViews) ~ log(UniqueVisitors),
                 data = top.1000.sites)
    summary(lm.fit)

---

# Simple Linear Regression

    Call:
    lm(formula = log(PageViews) ~ log(UniqueVisitors), data = top.1000.sites)

    Residuals:
    Min 1Q Median 3Q Max
    -2.1825 -0.7986 -0.0741 0.6467 5.1549

    Coefficients:
    Estimate Std. Error t value Pr(>|t|)
    (Intercept) -2.83441 0.75201 -3.769 0.000173 ***
    log(UniqueVisitors) 1.33628 0.04568 29.251 < 2e-16 ***
    ---
    Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    Residual standard error: 1.084 on 998 degrees of freedom
    Multiple R-squared: 0.4616, Adjusted R-squared: 0.4611
    F-statistic: 855.6 on 1 and 998 DF, p-value: < 2.2e-16

---

# Super-Charged Linear Regression

    lm.fit <- lm(log(PageViews) ~ HasAdvertising +
                                  log(UniqueVisitors) +
                                  InEnglish,
                 data = top.1000.sites)
    summary(lm.fit)

---

# Super-Charged Linear Regression

    Call:
    lm(formula = log(PageViews) ~ HasAdvertising + log(UniqueVisitors) +
    InEnglish, data = top.1000.sites)

    Residuals:
    Min 1Q Median 3Q Max
    -2.4283 -0.7685 -0.0632 0.6298 5.4133

    Coefficients:
    Estimate Std. Error t value Pr(>|t|)
    (Intercept) -1.94502 1.14777 -1.695 0.09046 .
    HasAdvertisingYes 0.30595 0.09170 3.336 0.00088 ***
    log(UniqueVisitors) 1.26507 0.07053 17.936 < 2e-16 ***
    InEnglishNo 0.83468 0.20860 4.001 6.77e-05 ***
    InEnglishYes -0.16913 0.20424 -0.828 0.40780
    ---
    Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    Residual standard error: 1.067 on 995 degrees of freedom
    Multiple R-squared: 0.4798, Adjusted R-squared: 0.4777
    F-statistic: 229.4 on 4 and 995 DF, p-value: < 2.2e-16

---

# Measuring Predictive Power

    lm.fit <- lm(log(PageViews) ~ HasAdvertising,
                 data = top.1000.sites)
    summary(lm.fit)$r.squared
    [1] 0.01073766

    lm.fit <- lm(log(PageViews) ~ log(UniqueVisitors),
                 data = top.1000.sites)
    summary(lm.fit)$r.squared
    [1] 0.4615985

    lm.fit <- lm(log(PageViews) ~ InEnglish,
                 data = top.1000.sites)
    summary(lm.fit)$r.squared
    [1] 0.03122206

---
    
# Correlation and Causation

    x <- 1:10
    y <- x^2

    cor(x, y)
    [1] 0.9745586

    coef(lm(scale(y) ~ scale(x)))[2]
    [1] 9.745586e-01

---

* Regularization
* Cross-Validation
* Text Regression
* Optimization
