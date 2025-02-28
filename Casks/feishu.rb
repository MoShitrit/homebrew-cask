cask "feishu" do
  if Hardware::CPU.intel?
    version "4.6.4,ad7f42"
    sha256 "4757c1c562c3444f7116ef4cbb76085d130affd039394b7d440cecec67d62207"

    url "https://sf3-cn.feishucdn.com/obj/ee-appcenter/#{version.after_comma}/Feishu-darwin_x64-#{version.before_comma}-signed.dmg",
        verified: "sf3-cn.feishucdn.com/"

    livecheck do
      url "https://www.feishu.cn/api/downloads"
      strategy :page_match do |page|
        match = page.match(%r{/(\h+)/Feishu-darwin_x64-(\d+(?:\.\d+)*)-signed\.dmg}i)
        "#{match[2]},#{match[1]}"
      end
    end
  else
    version "4.7.7,993db0"
    sha256 "530fc650811731920d7baaedc8a8689a7a29cf4d3a6a956b1d54f457008a55ab"

    url "https://sf3-cn.feishucdn.com/obj/ee-appcenter/#{version.after_comma}/Feishu-darwin_arm64-#{version.before_comma}-signed.dmg",
        verified: "sf3-cn.feishucdn.com/"

    livecheck do
      url "https://www.feishu.cn/api/downloads"
      strategy :page_match do |page|
        match = page.match(%r{/(\h+)/Feishu-darwin_arm64-(\d+(?:\.\d+)*)-signed\.dmg}i)
        "#{match[2]},#{match[1]}"
      end
    end
  end

  name "feishu"
  desc "Project management software"
  homepage "https://www.feishu.cn/"

  auto_updates true

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Lark.app", target: "Feishu.app"

  zap trash: [
    # feishu
    "~/Library/Caches/com.bytedance.lark.helper",
    "~/Library/Preferences/com.bytedance.lark.helper.plist",
    # lark
    "~/Library/Caches/com.electron.lark.helper",
    "~/Library/Preferences/com.electron.lark.helper.plist",
    # both
    "~/Library/Caches/com.electron.lark",
    "~/Library/Saved Application State/com.electron.lark.savedState",
  ]
end
