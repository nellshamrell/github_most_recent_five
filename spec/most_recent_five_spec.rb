require 'spec_helper'

describe MostRecentFive do
  let(:username) { "somegithubuser" }

  let(:most_recent_five) { MostRecentFive.new(username) }

  context "submitting the query" do
    it "queries octokit" do
      expect(Octokit).to receive(:repos).with(
        username,
        type: "all",
        sort: "updated",
        per_page: "5"
      )
      most_recent_five.call
    end
  end

  context "filtering the result" do
    it "returns a hash" do
      VCR.use_cassette "repos_api_response" do
        expect(most_recent_five.call).to be_an_instance_of Hash
      end
    end

    it "displays the username" do
      VCR.use_cassette "repos_api_response" do
        hash = most_recent_five.call
      end
    end
  end
end
