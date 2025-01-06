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
SELECT location,population, max(total_cases) as HighestInfection,  max(total_cases/(population))*100 AS InfectedPercentage
FROM Portfolio_projectExample..CovidDeaths
GROUP BY location, population
ORDER BY 1,2;


--Countries with Highest Death Count
SELECT location, max(total_deaths) TotalDeathCount
FROM Portfolio_projectExample..CovidDeaths
where continent is not null
group by location
order by 2 desc;

--Continents with Highest Death Count
SELECT location, max(total_deaths) TotalDeathCount
FROM Portfolio_projectExample..CovidDeaths
where continent is null
group by location
order by 2 desc;

--Global Death Percentage by Date
SELECT date, sum(cast(new_cases AS float)) AS NewCases, sum(cast(new_deaths AS float)) AS Deaths, sum(cast(new_deaths AS float))/sum(cast(new_cases AS float))*100 AS DeathPercentage
FROM Portfolio_projectExample..CovidDeaths
WHERE continent is not null
GROUP BY date
order by 1,2 ;

--Total Amount of People who are Vaccinated
SELECT vac.location, vac.date, vac.new_vaccinations, sum(convert(int,vac.new_vaccinations)) over(partition by vac.location order by vac.location, vac.date) AS rolling_total
FROM Portfolio_projectExample..CovidDeaths dea
Join Portfolio_projectExample..CovidVaccinations vac
ON dea.date=vac.date and dea.location=vac.location
where dea.continent is not null
order by 1,2;

