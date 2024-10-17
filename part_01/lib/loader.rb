# frozen_string_literal: true

Dir[File.join(__dir__, '**/*.rb')].each do |file|
  require file unless file == __FILE__
end