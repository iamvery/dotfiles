defmodule Mex do
  def expand_all(n, env) do
    Macro.prewalk(n, &Macro.expand(&1, env))
  end

  defmacro mex(do: block) do
    block
    |> expand_all(__CALLER__)
    |> Macro.to_string
    |> IO.puts
  end
end
