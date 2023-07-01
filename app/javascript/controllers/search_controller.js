import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["list", "input", "form"];
  connect() {
    console.log(this.formTarget);
  }

  send() {
    // console.log(this.inputTarget.value);
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(url, {
      headers: { Accept: "text/plain" },
    })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data;
      });
  }
}
