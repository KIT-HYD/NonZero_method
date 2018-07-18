function [pdf_nonzero] = f_NonZero_method(histogram)
% Returns a discrete pdf from a discrete histogram. In the pdf, all bins have non-zero probabilities
% Method
% - For each bin, its nonzero bin occupation probability is estimated 
%   as the mean of its confidence interval based on the Clopper-Pearson method, which applies the binominal distribution.
%   Reference: Clopper, C. J.; Pearson, E. S., The Use of Confidence or Fiducial Limits Illustrated in the Case of the Binomial. Biometrika 1934, 26, (4), 404-413.
% Input
% - histogram: [1,n] array with bin occupation frequencies. value range [0,oo]
% Output
% - pdf_nonzero: [1,n] array with nonzero bin occupation probability. value range ]0,1]
% Version
% - 2017/11/15: Paul Darscheid and Uwe Ehret (uwe.ehret@kit.edu): initial version

% get the total number of counts in the histogram
num_counts = sum(histogram);

% for each bin separately, use the Matlab function 'binofit' to compute the confidence interval 
% of its bin occuptation probability, provided as upper and lower value of the 95% confidence interval
% based on the Clopper-Pearson method
[~,CI] = binofit(histogram,num_counts); 
% CI: [n, 2] array, where CI(n,1) contains the lower and CI(n,2) the upper
%   limit of the 95% confidence interval of the bin occupation probability 
%   of bin n

% the non-zero bin occupation probability is computed as the mean of the confidence interval
pdf_nonzero_raw = mean(CI,2)';
% pdf_nonzero_raw: [1,n] array, with the mean of the confidence interval of the occupation probability
% for each bin

% it is not guaranteed that sum(pdf_nonzero_raw) == 1. 
% do so by dividing it with its sum of probabilities
pdf_nonzero = pdf_nonzero_raw/sum(pdf_nonzero_raw);       

end