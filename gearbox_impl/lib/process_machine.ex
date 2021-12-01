defmodule ProcessMachine do
  use Gearbox,
  field: :status,
  states: ~w(pending authorized signed identification biometric selfie video completed),
  initiaL: "pending",
  transitions: %{
    "pending" => ~w(authorized),
    "authorized" => ~w(signed),
    "signed" => ~w(identification),
    "identification" => ~w(biometric),
    "biometric" => ~w(selfie),
    "selfie" => ~w(video),
    "video" => ~w(completed)
  }
end
