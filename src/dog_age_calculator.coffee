class @DogAgeCalculator

  @_classes: []

  constructor: ->
    DogAgeCalculator._classes = []
    @addClass(new ShowClass('Vauvaluokka (5 - 7kk)', 5, 7))
    @addClass(new ShowClass('Pentuluokka (7 - 9kk)', 7, 9))
    @addClass(new ShowClass('Junioriluokka (9 - 18kk)', 9, 18))
    @addClass(new ShowClass('Nuortenluokka (15 - 24kk)', 15, 24))
    @addClass(new ShowClass('Avoinluokka (15kk -)', 15))
    @addClass(new ShowClass('Käyttöluokka (15kk -)', 15))
    @addClass(new ShowClass('Valioluokka (15kk -)', 15))
    @addClass(new ShowClass('Veteraani (8v -)', 96))

  classes: -> DogAgeCalculator._classes

  addClass: (show_class) ->
    DogAgeCalculator._classes.push show_class

  ageOf: (dog) ->
    today = new Date()
    dogage = {}
    if today > dog.birthDate
      dateDogAge = today - dog.birthDate
      yearAsMS = 1000 * 60 * 60 * 24 * 365
      monthAsMS = 1000 * 60 * 60 * 24 * 30
      weekAsMS = 1000 * 60 * 60 * 24 * 7
      dayAsMS = 1000 * 60 * 60 * 24
      dogage.years = parseInt(dateDogAge / yearAsMS, 10)
      if dogage.years > 0
        dateDogAge = dateDogAge - (dogage.years * yearAsMS)

      dogage.months = parseInt(dateDogAge / monthAsMS, 10)
      if dogage.months > 0
        dateDogAge = dateDogAge - (dogage.months * monthAsMS)

      dogage.weeks = parseInt(dateDogAge / weekAsMS, 10)
      if dogage.weeks > 0
        dateDogAge = dateDogAge - (dogage.weeks * weekAsMS)

      dogage.days = parseInt(dateDogAge / dayAsMS, 10)
    dogage

  showClassDates: (dog) ->
    dates = []
    dateArray = [dog.birthDate.getDate(), dog.birthDate.getMonth(), dog.birthDate.getFullYear()]
    calc = @
    $.each(@.classes(), (index) ->
      showClassDates = {}
      showClassDates.title = @title
      if @minAge > 0
        newMinMonths = parseInt(dateArray[1], 10) + (@minAge - 1)
        showClassDates.minAgeDate = calc.calculateNewDate(dateArray[0],newMinMonths, dateArray[2])

      if @maxAge > 0
        newMaxMonths = parseInt(dateArray[1], 10) + (@maxAge - 1)
        newMaxdays = parseInt(dateArray[0], 10) - 1
        showClassDates.maxAgeDate = calc.calculateNewDate(newMaxdays, newMaxMonths, dateArray[2])

      dates.push showClassDates
    )
    dates

  calculateNewDate: (day, month, year) ->
    new Date(year, month, day)