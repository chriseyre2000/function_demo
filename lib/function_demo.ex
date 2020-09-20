defmodule FunctionDemo do
  @moduledoc """
  Documentation for `FunctionDemo`.
  """

  @doc """
  fact - calcualtes factorial using if as a statement.

  ## Examples

      iex> FunctionDemo.fact(3)
      6

      iex> FunctionDemo.fact(4)
      24

  """
  def fact(n) do
    if (n == 1) do
      n
    else
      n * fact(n - 1)
    end  
  end

  @doc """
  fact2 - calcuates factorial using a case statement

  ## Examples

    iex> FunctionDemo.fact2(3)
    6
  """
  def fact2(n) do
    case n do
      1 -> 1
      _ -> n * fact2(n - 1)
    end  
  end
  
  @doc """
  fact 3 - calculates factorial using a cond statement
  
  ## Examples

    iex> FunctionDemo.fact3(3)
    6
  """
  def fact3(n) do
    cond do
      n == 1 -> 1
      true -> n * fact3(n - 1)
    end   
  end
  
  @doc """
  fact4 - calculates factorial using function clauses and short form functions

  ## Examples

    iex> FunctionDemo.fact4(3)
    6
  """
  def fact4(1), do: 1
  def fact4(n), do: n * fact4(n - 1)

  @doc """
  fact5 - calculates factorial using range, pipelines Enum.reduce and shorthand anon function.

  ## Examples

    iex> FunctionDemo.fact5(3)
    6

  """
  def fact5(n) do
    1..n 
    |> Enum.reduce(1, &(&1 * &2))
  end

  @doc """
  fact6 - calculates factorial using range, Enum.reduce and conventional anon function.
  
  ## Examples

    iex> FunctionDemo.fact6(3)
    6

  """
  def fact6(n) do
    1..n 
    |> Enum.reduce(1, fn acc, value -> acc * value end)
  end

  defp multiply(first, second), do: first * second

  @doc """
  fact7 - calculates factorial using range, Enum.reduce and a captured function.
  
  ## Examples

    iex> FunctionDemo.fact7(3)
    6

  """
  def fact7(n) do
    1..n 
    |> Enum.reduce(1, &multiply/2)
  end
  
  defguard is_greater_than_zero(n) when is_integer(n) and n > 0

  @doc """
  fact8 - calculates a factorial with a guard clause in a case.
  
  ## Examples

    iex> FunctionDemo.fact8(3)
    6
  
  """
  def fact8(n) do
    case n do
      1 -> 1
      n when is_greater_than_zero(n) -> n * fact8(n - 1)
    end  
  end

  @doc """
  fact9 - calculates a factorial with a protective guard clause.

  ## Examples

    iex> FunctionDemo.fact9(3)
    6
  """
  def fact9(1), do: 1
  def fact9(n) when is_greater_than_zero(n), do: n * fact9(n - 1)

end
