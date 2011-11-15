require_relative 'spec_helper'


describe "#render_around" do
  
  context "when no block is given" do
    
    it "should return the header and footer content only" do
      render_around.should == "[HEADER]\n[FOOTER]"
    end
    
  end
  
  context "when a block is given" do

    it "should render text around the specified block" do
      rendered_results = render_around do 
        "BODY"
      end
      rendered_results.should == "[HEADER]\n[BODY]\n[FOOTER]"
    end
    
  end
  
end