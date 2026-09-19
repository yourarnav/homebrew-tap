cask "pdftoimages" do
  version "1.0.0"
  sha256 "7af86453e3ad3346dfd5482baf4809eeb00a2727990a5f049636c4715aba8a31"

  url "https://github.com/yourarnav/PDFtoImages/releases/download/v#{version}/PDFtoImages.dmg"
  name "PDF to Images"
  desc "Ultra-lightweight native Mac app to convert PDFs into numbered PNG folders"
  homepage "https://pdf-to-images.vercel.app"

  depends_on macos: :monterey
  depends_on formula: "poppler"

  app "PDF to Images.app"

  caveats <<~EOS
    PDF to Images is free and ad-hoc signed, so macOS may flag it on first launch.
    Clear the quarantine flag once, then open it normally:
      xattr -dr com.apple.quarantine "/Applications/PDF to Images.app"

    The source code is 100% open at https://github.com/yourarnav/PDFtoImages.
  EOS
end
