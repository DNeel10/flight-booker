import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  connect() {
    console.log("Hello rails", this.element)
  }
}