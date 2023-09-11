import { Controller } from "@hotwired/stimulus";
import { useDebounce } from 'stimulus-use'

export default class extends Controller {
  static debounces = [{
    name: 'search',
    wait: 500
  }]
  static targets = ["input", "searchForm"]

  connect() {
    useDebounce(this)
  }

  search() {
    this.searchFormTarget.requestSubmit()
  }
}
