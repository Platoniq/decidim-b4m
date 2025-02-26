# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # views
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "ccead2f5f20557ea4db1501de943f82b"
    }
  },
  {
    package: "decidim-accountability",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "152ffcbd90d65823d14632625d493518"
    }
  },
  {
    package: "decidim-admin",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "bc39ff97cc035e2d27a54fe702c558d5"
    }
  },
  {
    package: "decidim-assemblies",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "9458919e748b6cb29f5c814741f76c81"
    }
  },
  {
    package: "decidim-blogs",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "bc15738f3428f1f8d3d305de621c039c"
    }
  },
  {
    package: "decidim-budgets",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "67da89fa0a87ffcf1719f0f0858427e6"
    }
  },
  {
    package: "decidim-comments",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "8b1b3a8eb65c45c8980a631d90180e8f"
    }
  },
  {
    package: "decidim-core",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "469583bb3473d9a4f4b3d09e32395053"
    }
  },
  {
    package: "decidim-debates",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "4648c80b07421d9e00ababa1d353fd1c"
    }
  },
  {
    package: "decidim-dev",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "757e7a8c5b4ce164e9cc58bcdd2d6124"
    }
  },
  {
    package: "decidim-forms",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "4648c80b07421d9e00ababa1d353fd1c"
    }
  },
  {
    package: "decidim-meetings",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "6aba80d17069aa3b654e66a6e0ff6fad"
    }
  },
  {
    package: "decidim-pages",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "4648c80b07421d9e00ababa1d353fd1c"
    }
  },
  {
    package: "decidim-proposals",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "2d62d75779e2825a11fe9fcbd9229427"
    }
  },
  {
    package: "decidim-sortitions",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "4648c80b07421d9e00ababa1d353fd1c"
    }
  },
  {
    package: "decidim-surveys",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "4648c80b07421d9e00ababa1d353fd1c"
    }
  },
  {
    package: "decidim-system",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "1455fe8c075efd5b68d20c415ddf7d01"
    }
  },
  {
    package: "decidim-templates",
    files: {
      # locales
      "/config/locales/sr-CS.yml" => "4648c80b07421d9e00ababa1d353fd1c"
    }
  }
]

describe "Overridden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])
    item[:files].each do |file, signature|
      next unless spec

      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
