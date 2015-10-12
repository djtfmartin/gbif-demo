package gbif.demo

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class GbifService {

    def grailsApplication

    def serviceMethod() {}

    def getOccurrenceCount(){
        getCount("occurrence")
    }

    def getDatasetsCount(){
        getCount("dataset")
    }

    def getSpeciesCount(){
        getCount("species")
    }

    def getCountryCounts(){

        log.info("Loading country counts")
        def js = new JsonSlurper()
        def countryJson = js.parse(new URL("${grailsApplication.config.gbifApiUrl}/enumeration/country"))
        def countryCodes = countryJson.collect { it.iso2 }

        def counts = []
        //this is naive, but for demo purposes...
        countryCodes.each {
            counts << [
                    "hc-key": it.toLowerCase(),
                    value: new URL("${grailsApplication.config.gbifApiUrl}/occurrence/count?country=${it}&isGeoreferenced=true&basisOfRecord=OBSERVATION").text.toInteger()
            ]
        }
        counts
    }

    private def getCount(entity){
        def text = new URL("${grailsApplication.config.gbifApiUrl}/${entity}/search?limit=0").text
        def js = new JsonSlurper()
        js.parseText(text).count
    }
}
