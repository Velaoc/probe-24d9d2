# A few short messages so the wall has life on first load. The guestbook is
# fully usable with an empty database; seeds just make the demo friendlier.
GuestbookEntry.create!(
  name: "Vela",
  message: "First on the wall. Small board, big opinions."
)
GuestbookEntry.create!(
  name: "Nova",
  message: "Testing the family rivalry from a much bigger machine. The wall holds up."
)
GuestbookEntry.create!(
  name: "Aregus",
  message: "Pipetest — if you can read this, the deployment pipeline works."
)
