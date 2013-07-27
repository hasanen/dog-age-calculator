$ ->
  calc = new DogAgeCalculator()
  dateSelector = "#birthdate";
  $(dateSelector).datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'dd.mm.yy'
  })

  $("#counter-form").bind('submit', (event)->
    event.preventDefault()

    dog = new Dog($(dateSelector).datepicker("getDate"))

    age = calc.ageOf(dog)
    setDogAge('#ageNow', age)

    dates = calc.showClassDates(dog)
    setShowClassDates('#results', dates)

    return false
  )

  setDogAge = (selector, dogAge) ->
    $(selector).html("")
    $(selector).append(dogAge.years + "v ") if dogAge.years > 0
    $(selector).append(dogAge.months + "kk ") if dogAge.months > 0
    $(selector).append(dogAge.weeks + "vko ") if dogAge.weeks > 0
    $(selector).append(dogAge.days + "pv ") if dogAge.days > 0

  setShowClassDates = (selector, dates) ->
    result = $(selector)
    table = result.find("table")
    table.find("tbody").html("")

    table.append("<tr><th> Luokka</th><th> Ensimmäinen päivä</th><th> Viimeinen päivä</th></tr>")

    $.each(dates, ->
      cells = "<td>" + @title + "</td>"
      cells += "<td>" + dateToString(@minAgeDate) + "</td>"
      if typeof @maxAgeDate isnt "undefined"
        cells += "<td>" + dateToString(@maxAgeDate) + "</td>"
      table.append("<tr>" + cells + "</tr>")
    )

    result.css("display","block")

  dateToString = (date) ->
    date.getDate() + '.' + (date.getMonth() + 1) + '.' + date.getFullYear()