class KbBacklight < Formula
  desc "Control MacBook keyboard backlight with Cmd+F1 and Cmd+F2"
  homepage "https://github.com/bhargav59/mac-keyboard-backlight"
  url "https://github.com/bhargav59/mac-keyboard-backlight/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b200088b3e5cfa19a40b067be3fc5c816deb7d0783adb52e33e01a3e1a0896b5"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      To enable Cmd+F1 / Cmd+F2 background hotkeys on login, install the app bundle & LaunchAgent:
        kb-backlight --install

      For direct Cmd+F1 / Cmd+F2 (without holding Fn), grant Accessibility permission:
        kb-backlight --permissions
      Then toggle ON "Keyboard Backlight Controller" in:
        System Settings > Privacy & Security > Device Control and Data Access
        (labeled "Accessibility" on macOS 15 and earlier)
    EOS
  end

  test do
    assert_match "kb-backlight", shell_output("#{bin}/kb-backlight --help")
  end
end
