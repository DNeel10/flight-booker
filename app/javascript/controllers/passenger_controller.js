import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = [ "passengerFields", "passengerOutput" ]
  static values = { "passengerCount": Number }

  connect() {
    console.log("Hello from passengers")
  }

  add() {
    this.passengerCountValue++
    const temp = this.passengerFieldsTarget
    const clone = temp.content.cloneNode(true)

    this.passengerOutputTarget.appendChild(clone)
  }

  remove() {
    this.passengerCountValue--
  }
}
