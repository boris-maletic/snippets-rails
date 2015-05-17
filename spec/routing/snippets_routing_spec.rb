require 'rails_helper'

describe 'snippets routing', type: :routing do
  describe 'valid routes' do
    specify { expect(get: '/').to route_to(controller: 'snippets', action: 'index') }
    specify { expect(get: '/snippets/new').to route_to(controller: 'snippets', action: 'new') }
    #specify { expect(post: '/snippets').to route_to(controller: 'snippets', action: 'create') }
  end
end

