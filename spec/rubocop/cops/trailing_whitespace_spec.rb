# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe TrailingWhitespace do
      let(:tws) { TrailingWhitespace.new }

      it 'registers an offence for a line ending with space' do
        source = ['x = 0 ']
        tws.inspect(source, nil, nil, nil)
        expect(tws.offences.size).to eq(1)
      end

      it 'registers an offence for a line ending with tab' do
        tws.inspect(["x = 0\t"], nil, nil, nil)
        expect(tws.offences.size).to eq(1)
      end

      it 'accepts a line without trailing whitespace' do
        tws.inspect(["x = 0\n"], nil, nil, nil)
        expect(tws.offences).to be_empty
      end
    end
  end
end
