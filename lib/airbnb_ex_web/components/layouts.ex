defmodule AirbnbExWeb.Layouts do
  use AirbnbExWeb, :html

  import AirbnbExWeb.{
    Flash,
    Header
  }

  embed_templates "layouts/*"
end
