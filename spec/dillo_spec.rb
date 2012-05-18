require 'helper'

describe Dillo do

  before(:each) do
    Dillo.app_token = "abc123"
  end

  describe "client_error" do
    it "should throw exception when invalid app_token is provided" do
      stub_request(:get, "http://data.austintexas.gov/api/views?limit=200&page=1").
                   to_return(:status => 403, :body => fixture("invalid_app_token.json"), :headers => {'X-Error-Code' => 'permission_denied', 'X-Error-Message' => 'Invalid app_token specified'
                   })

      lambda{Dillo.views.count}.should raise_error("Invalid app_token specified")
    end
  end

  describe ".views" do
    before do
      stub_request(:get, "http://data.austintexas.gov/api/views?limit=200&page=1").
         to_return(:status => 200, :body => fixture("views.json"), :headers => {})
      stub_request(:get, "http://data.austintexas.gov/api/views?limit=200&page=2").
        to_return(:status => 200, :body => "[]", :headers => {})

    end

    it "should return all the Views" do
      all_views = Dillo.views
      all_views.count.should == 200
    end
  end

  describe ".find_by_id" do
    it "should return the view" do
      fire_stations = Dillo.views.find_by_id("64cq-wf5u")
      fire_stations.should be_a Dillo::View
    end
  end

  describe ".find_by_name" do
    it "should return the view when searching by name" do
      water_quality = Dillo.views.find_by_name("Water Quality Sampling Data")
      water_quality.should be_a Dillo::View
    end
  end

  describe ".rows" do
    before do
      stub_request(:get, "http://data.austintexas.gov/api/views/64cq-wf5u/rows.json").
         to_return(:status => 200, :body => fixture("rows.json"), :headers => {})
    end

    it "should return the rows view" do
      fire_stations = Dillo.views.find_by_id("64cq-wf5u")
      stations = fire_stations.rows
      stations.first[4].should == "400094"
    end
  end

  describe ".columns" do
    it "should return the columns view" do
      fire_stations = Dillo.views.find_by_id("64cq-wf5u")
      stations = fire_stations.rows
      stations.columns.should == ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Name", "Jurisdiction Name", "Y", "X", "Location 1"]
    end
  end

  describe "#find_by_" do
    it "should return the row when searching" do
      fire_stations = Dillo.views.find_by_id("64cq-wf5u")
      stations = fire_stations.rows
      station = stations.find_by_name("FS0001")
      station.jurisdiction_name.should == "AFD"
    end
  end

end
