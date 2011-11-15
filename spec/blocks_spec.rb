require_relative 'spec_helper'


describe "#render_header_and_footer_around" do
  
  context "when no block is given" do
    
    it "should return the header and footer content only" do
      render_header_and_footer_around.should == "[HEADER]\n[FOOTER]"
    end
    
  end
  
  context "when a block is given" do

    it "should render text around the specified block" do
      render_header_and_footer_around { "BODY" }.should == "[HEADER]\n[BODY]\n[FOOTER]"
    end
    
  end
  
end

describe "#map_this" do
  
  context "when given a block" do
    
    it "should perform the operation on every element" do
      
      map_this [1,2,3] {|x| x * 2 }
      
    end
    
  end
  
end

