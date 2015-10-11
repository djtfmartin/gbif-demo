package gbif.demo

import grails.converters.JSON

class DemoController {

    def gbifService

    def index(){
        [
            species: gbifService.speciesCount,
            datasets: gbifService.datasetsCount,
            occurrences: gbifService.occurrenceCount
        ]
    }

    def countries(){
        render (gbifService.countryCounts as JSON)
    }

    def stats(){
       def stats = [
           species: gbifService.speciesCount,
           datasets: gbifService.datasetsCount,
           occurrences: gbifService.occurrenceCount
       ]
       render stats as JSON
    }
}
