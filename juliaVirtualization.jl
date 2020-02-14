#!/usr/bin/julia
using Pkg
Pkg.add("DataFrames")
Pkg.add("CSV")
#CSV file to dataframe
using DataFrames,CSV

least_used_baby_names=CSV.read("/input/file/path")
most_used_baby_names=CSV.read("/input/file/path")

##Virtualization-Plotting
#if GK-Qt freamwork doesnt exist(on Linux) ->
#Pkg.add("GK")
#using GK

Pkg.add("Plots")
Pkg.add("PlotThemes")
theme(:dark)

using Plots
x =: least_used_baby_names[:Year];y =: least_used_baby_names[:Count];
z =: most_used_baby_names[:Year]; t =: most_used_baby_names[:Count];

min_baby=bar(x,y,group =: least_used_baby_names[:Name],title="Least used baby names All around the World", xlabel="Year",ylabel="Usage")
savefig("picture_1.png")
max_baby=bar(z,t,group =: most_used_baby_names[:Name],title="Most used baby names All around the World", xlabel="Year",ylabel="Usage")
savefig("picture_2.png")
