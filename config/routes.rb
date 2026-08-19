# The wall is the product: visitors read the guestbook and add to it.
root "guestbook#index"
post "/", to: "guestbook#create", as: :guestbook_entries

# Email/password authentication (SPEC M2). Custom controllers add the
# Turnstile check and the legal-assent record on top of stock Devise.
devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations",
  passwords: "users/passwords",
  confirmations: "users/confirmations",
  omniauth_callbacks: "users/omniauth_callbacks"
}
