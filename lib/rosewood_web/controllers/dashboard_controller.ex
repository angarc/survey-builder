defmodule RosewoodWeb.DashboardController do
  use RosewoodWeb, :controller
  alias Rosewood.DataCollection

  def index(conn, _params) do
    surveys = DataCollection.list_surveys(Pow.Plug.current_user(conn))

    conn
    |> assign(:surveys, surveys)
    |> render("index.html")
  end
end
