import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {

  static targets = [ "passengerFields", "passengerOutput", "passengerInfo" ]
  static values = { passengerCount: Number }

  connect() {
    console.log(this.passengerCountValue)
  }

  add(e) {
    e.preventDefault;

    this.passengerCountValue++
    const content = this.passengerFieldsTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime().toString())
    this.passengerOutputTarget.insertAdjacentHTML('beforeend', content)
    
  }

  delete() {
    if (this.passengerCountValue > 1) {
      this.passengerCountValue--;
      this.passengerInfoTarget.remove();
    }
  }
}
