Dynamo.under_test(Dynamita.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Dynamita.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
