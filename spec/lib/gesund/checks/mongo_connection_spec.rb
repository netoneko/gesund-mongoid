require "spec_helper"

describe Gesund::Checks::MongoidConnection do
  before(:each) { Mongoid.stub!(:load!) }

  it "passes when mongo returns {ok} on a ping" do
    Mongoid.stub_chain(:default_session, :command).and_return({"ok" => 1})
    subject.success.should be_true
    subject.message.should match "Mongo PING = OK"
  end

  it "fails when mongo returns not-{ok} on a ping" do
    Mongoid.stub_chain(:default_session, :command).and_return({"fail" => 1})
    subject.success.should be_false
    subject.message.should match "Mongo PING != OK"
  end

  it "fails when mongo raises an exception" do
    Mongoid.stub_chain(:default_session, :command).and_raise("something bad")
    subject.success.should be_false
    subject.message.should match "MongoidConnection ERROR: RuntimeError: something bad"
  end
end
