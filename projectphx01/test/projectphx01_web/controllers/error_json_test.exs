defmodule Projectphx01Web.ErrorJSONTest do
  use Projectphx01Web.ConnCase, async: true

  test "renders 404" do
    assert Projectphx01Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Projectphx01Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
