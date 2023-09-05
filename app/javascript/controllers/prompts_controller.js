import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "searchForm"]

  connect() {
    console.log("Connected to PromptsController");
  }

  search() {
    this.searchFormTarget.requestSubmit()
  }
}
