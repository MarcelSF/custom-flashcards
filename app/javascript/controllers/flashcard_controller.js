import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flashcard"
export default class extends Controller {
  static targets = ["front", "back"]

  flip() {
    this.frontTarget.classList.toggle("blurry-text")
    this.backTarget.classList.toggle("blurry-text")
  }
}
