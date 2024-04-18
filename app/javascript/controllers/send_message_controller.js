import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.source = new EventSource("/events/stream");
    this.source.onmessage = this.handleMessage.bind(this);
  }

  disconnect() {
    this.source.close();
  }

  handleMessage(event) {
    console.log("Received message:", event.data);
  }
}

