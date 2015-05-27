require 'spec_helper'

describe MostRecentFive do
  let(:username) { "somegithubuser" }

  context "submitting the query" do

    let(:most_recent_five) { MostRecentFive.new(username) }

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
    let(:sample_result) do

    end
  end
end
