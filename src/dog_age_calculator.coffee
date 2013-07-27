class @DogAgeCalculator

  @_classes: []

  constructor: ->
    DogAgeCalculator._classes = []
    @.addClass(new ShowClass('Vauvaluokka (5 - 7kk)', 5, 7))
    @.addClass(new ShowClass('Pentuluokka (7 - 9kk)', 7, 9))
    @.addClass(new ShowClass('Junioriluokka (9 - 18kk)', 9, 18))
    @.addClass(new ShowClass('Nuortenluokka (15 - 24kk)', 15, 24))
    @.addClass(new ShowClass('Avoinluokka (15kk -)', 15))
    @.addClass(new ShowClass('Käyttöluokka (15kk -)', 15))
    @.addClass(new ShowClass('Valioluokka (15kk -)', 15))
    @.addClass(new ShowClass('Veteraani (8v -)', 96))

  classes: -> DogAgeCalculator._classes

  addClass: (show_class) ->
    DogAgeCalculator._classes.push show_class

  calculate: (dog) ->
