import Flatpickr from "stimulus-flatpickr";

// create a new Stimulus controller by extending stimulus-flatpickr wrapper controller
export default class extends Flatpickr {
  initialize() {
    //global options
    this.config = {
    };
  }
}