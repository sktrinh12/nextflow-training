import groovy.json.JsonSlurper

def parseJsonFile(jsonFilePath) {
    def f = file(jsonFilePath)
    def records = new JsonSlurper().parse(f)

    for( def entry : records ) {
      log.info "$entry.patient_id -- $entry.feature"
    }
}
