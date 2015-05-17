require 'rails_helper'

describe 'snippets routing', type: :routing do
  describe 'valid routes' do
    specify { expect(get: '/').to route_to(controller: 'snippets', action: 'index') }
    specify { expect(get: '/snippets/new').to route_to(controller: 'snippets', action: 'new') }
    specify { expect(get: '/snippets/mine').to route_to(controller: 'snippets', action: 'mine') }
    specify { expect(get: '/snippets/42/edit').to route_to(controller: 'snippets', action: 'edit', id: '42') }
    specify { expect(post: '/snippets').to route_to(controller: 'snippets', action: 'create') }
    specify { expect(put: '/snippets/42').to route_to(controller: 'snippets', action: 'update', id: '42') }
    specify { expect(patch: '/snippets/42').to route_to(controller: 'snippets', action: 'update', id: '42') }
  end
end

