% Script to test the function f_nonZero_method
% Variables
% - histogram: [1,n] array with bin occupation frequencies. value range [0,oo]
% - pdf_nonzero: [1,n] array with nonzero bin occupation probability. value range ]0,1]
% Version
% - 2017/11/15: Paul Darscheid and Uwe Ehret (uwe.ehret@kit.edu): initial version

histogram_1 = [1, 0, 0, 0, 0, 0];
pdf_nonzero_1 = f_NonZero_method(histogram_1);

histogram_2 = [100, 0, 0, 10];
pdf_nonzero_2 = f_NonZero_method(histogram_2);



