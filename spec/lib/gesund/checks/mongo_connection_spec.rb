require "spec_helper"

describe Gesund::Checks::MongoConnection do
  it "passes when mongo returns {ok} on a ping" do
    Mongo::MongoClient.stub_chain(:new, :ping).and_return({"ok"=>1})
    subject.success.should be_true
    subject.message.should match "Mongo PING = OK"
  end
  it "fails when mongo returns not-{ok} on a ping" do
    Mongo::MongoClient.stub_chain(:new, :ping).and_return({"fail"=>1})
    subject.success.should be_false
    subject.message.should match "Mongo PING != OK"
  end
  it "fails when mongo raises an exception" do
    Mongo::MongoClient.stub(:new).and_raise("something bad")
    subject.success.should be_false
    subject.message.should match "MongoConnection ERROR: RuntimeError: something bad"
  end
end
