defmodule DesktopUrlFile do
  @moduledoc """
  Generate `.url` files for Windows and OSX desktops. These type of files are
  used to create hyperlinks in the desktop to open a web page.
  """

  @doc """
  Return the content of a valid `.url` file

  ## Examples

      iex> DesktopUrlFile.make("https://github.com/desktop_url_file#readme")
      \"\"\"
      [InternetShortcut]
      URL=https://github.com/desktop_url_file#readme
      \"\"\"
  """
  def make(url, opts \\ [icon_file: nil, icon_index: 1]) do
    # Each line terminates with CR and LF characters, and uses ANSI as it’s character set.
    content =
      """
      [InternetShortcut]
      URL=#{url}
      #{icon(opts)}
      """

    {:ok, content}
  end

  @doc """
  Generates new `.url` file.

  ## Examples

      iex> DesktopUrlFile.write("foo/bar.url", "https://github.com/desktop_url_file#readme")
      {:ok, "foo/bar.url"}
  """
  def write(file_path, url, opts \\ [icon_file: nil, icon_index: 1]) do
    {:ok, content} = make(url, opts)

    url_file_path =
      case Path.extname(file_path) do
        ".url" -> file_path
        _ -> "#{file_path}.url"
      end

    case File.write(file_path, content, [:utf8]) do
      :ok -> {:ok, url_file_path}
      error -> error
    end
  end

  @doc """
  Returns a valid mime type for a .url file
  """
  def mime do
    # MIME: wwwserver/redirection, application/internet-shortcut, application/x-url, message/external-body, text/url, text/x-url
    "application/internet-shortcut"
  end

  defp icon(%{icon_file: nil}), do: ""
  defp icon(%{icon_file: icon_file, icon_index: icon_index}) do
    """
    \nIconFile=#{icon_file}
    IconIndex=#{icon_index}

    """
  end
end
