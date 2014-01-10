# encoding: utf-8
require 'spec_helper' 

describe DataSources::Yaml do
  context '#fetch' do
    it 'retrieves variables from yaml file' do
      file = create_file('blub.yaml', <<-EOF.strip_heredoc
                         ---
                         MY_NAME: Karl
                         EOF
                        )
      source = DataSources::Yaml.new(file)
      expect(source.fetch('MY_NAME')).to eq('Karl')
    end

    it 'returns nil if variable cannot be found' do
      file = create_file('blub.yaml', <<-EOF.strip_heredoc
                         ---
                         MY_NAME: Karl
                         EOF
                        )
      source = DataSources::Yaml.new(file)
      expect(source.fetch('NOT_MY_NAME')).to be_nil
    end

    it 'returns nil if file cannot be found' do
      source = DataSources::Yaml.new('not valid file')
      expect(source.fetch('NOT_MY_NAME')).to be_nil
    end
  end
end

