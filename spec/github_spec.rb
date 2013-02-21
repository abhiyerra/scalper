describe Scalper do
  describe Github do

    describe "#parse" do
      describe "Valid url" do
        subject { Scalper::Github.parse("https://github.com/abhiyerra/github.el/issues/31") }
        its(:id) { should_not be_nil }
        its(:repo) { should == "abhiyerra/github.el" }
        its(:issue_idf) { should ==  31 }
        its(:title) { match(/Show number of comments in list/) }
      end
    end

    [
      "https://github.com/abhiyerra/org-reading/issues/1", # This repo doesn't actually exist.
      "https://github.com/help/this/man",
      "https://github.com/abhiyerra/org-reading/pulls/1",
      "https://example.com/noexistdude"
    ].each do |invalid_url|
      context "invalid url #{invalid_url}" do
        describe "#parse" do
          it "should not parse" do
            lambda { Issue.parse(invalid_url) }.should raise_error RuntimeError
          end
        end
      end
    end
  end
end
