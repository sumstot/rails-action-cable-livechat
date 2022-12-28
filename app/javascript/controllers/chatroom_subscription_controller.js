import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)

    createConsumer().subscriptions.create(
    { channel: "ChatroomChannel", id: this.chatroomIdValue },
    { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  resetForm(e) {
    e.target.reset()
  }

  disconnect(){
    console.log('Unsubscirbed from the chatroom')
    this.channel.unsubscribe()
  }

  // private
  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  };
}
