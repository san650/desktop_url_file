# DesktopUrlFile

Elixir library for generating desktop url files that points to websites. These files are supported by Windows and OSX operating systems.

## Synopsis

```elixir
DesktopUrlFile.make("https://github.com/san650/desktop_url_file#readme")
{:ok,
"""
[InternetShortcut]
URL=https://github.com/desktop_url_file#readme
"""
}
```

## Integrating with Plug

```elixir

def create(conn, _params) do
  conn
  |> send_desktop_url_file("documentation.pdf.url", "https://example.com/documentation.pdf")
end

def send_desktop_url_file(conn, file_name, url) do
  conn
  |> put_resp_content_type(DesktopUrlFile.mime)
  |> put_resp_header("Content-Disposition", "attachment; filename=#{file_name}")
  |> send_resp(200, DesktopUrlFile.make(url))
end
```

## Installation

Add `desktop_url_file` to your `mix.exs` deps:

```elixir
def deps do
  [{:desktop_url_file, "~> 0.1.0"}]
end
```

## License

desktop_url_file is licensed under the MIT license.

See [LICENSE](./LICENSE) for the full license text.
