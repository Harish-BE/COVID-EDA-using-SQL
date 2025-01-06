SELECT location, date, total_cases, new_cases, total_deaths, population
From Portfolio_projectExample..CovidDeaths
order by 1,2;

-- Looking at Total Cases vs Total Deaths

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
From Portfolio_projectExample..CovidDeaths
order by 1,2;

--Shows Percentage of People got the virus

SELECT location,date, total_cases, population, (total_cases/population)*100 AS InfectedPercentage
FROM Portfolio_projectExample..CovidDeaths
ORDER BY 1,2;

--Countries with highest infection rates

SELECT location,date, max(total_cases),  (total_cases/max(population))*100 AS InfectedPercentage
FROM Portfolio_projectExample..CovidDeaths
GROUP BY location, population
ORDER BY 1,2;