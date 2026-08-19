require "test_helper"

class GuestbookTest < ActionDispatch::IntegrationTest
  test "the wall shows the form and seeded messages, newest first" do
    older = GuestbookEntry.create!(name: "older", message: "older message")
    newer = GuestbookEntry.create!(name: "newer", message: "newer message")

    get root_path
    assert_response :success
    assert_select "h1", text: "Sign the guestbook"
    assert_select "form.guestbook-form", count: 1
    assert_select "textarea[name='guestbook_entry[message]']", count: 1
    assert_select ".guestbook-entries .md-card", count: 2
    assert_match(/newer message.*older message/m, response.body)
  end

  test "posting a message adds it to the wall" do
    assert_difference "GuestbookEntry.count", 1 do
      post root_path, params: { guestbook_entry: { name: "Test Signer", message: "hello from the test suite" } }
    end

    assert_redirected_to root_path
    follow_redirect!
    assert_select ".guestbook-entry__text", text: "hello from the test suite"
    assert_select ".guestbook-entry__name", text: /Test Signer/
  end

  test "blank or oversized messages are rejected" do
    assert_no_difference "GuestbookEntry.count" do
      post root_path, params: { guestbook_entry: { name: "", message: "" } }
    end
    assert_response :unprocessable_entity
    assert_select ".md-field--error", minimum: 2

    assert_no_difference "GuestbookEntry.count" do
      post root_path, params: { guestbook_entry: { name: "Long", message: "x" * (GuestbookEntry::MAX_MESSAGE_LENGTH + 1) } }
    end
    assert_response :unprocessable_entity
  end
end
