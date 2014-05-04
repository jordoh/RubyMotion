describe "Regexps with grouping" do
  it 'support ()' do
    /(a)/.match("a").to_a.should == ["a", "a"]
  end

  it "allow groups to be nested" do
    md = /(hay(st)a)ck/.match('haystack')
    md.to_a.should == ['haystack','haysta', 'st']
  end

=begin
  it "raise a SyntaxError when parentheses aren't balanced" do
   lambda { eval "/(hay(st)ack/" }.should raise_error(SyntaxError)
  end
=end

  it 'supports (?: ) (non-capturing group)' do
    /(?:foo)(bar)/.match("foobar").to_a.should == ["foobar", "bar"]
    # Parsing precedence
    /(?:xdigit:)/.match("xdigit:").to_a.should == ["xdigit:"]
  end
end
