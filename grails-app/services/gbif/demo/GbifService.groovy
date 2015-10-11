package gbif.demo

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class GbifService {

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

        def js = new JsonSlurper()
        def countryJson = js.parse(new URL("http://api.gbif.org/v1/enumeration/country"))
        def countryCodes = countryJson.collect { it.iso2 }

        def counts = []
        //this is naive, but for demo purposes...
        countryCodes.each {
            counts << [
                    "hc-key": it.toLowerCase(),
                    value: new URL("http://api.gbif.org/v1/occurrence/count?country=${it}&isGeoreferenced=true&basisOfRecord=OBSERVATION").text.toInteger()
            ]
        }
        counts
    }

    private def getCount(entity){
        def text = new URL("http://api.gbif.org/v1/${entity}/search?limit=0").text
        def js = new JsonSlurper()
        js.parseText(text).count
    }
}
