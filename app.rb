require 'sinatra'

posts = [
  { id: 1, titulo: 'PHP Unit', conteudo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vitae laoreet justo, sed suscipit tortor. Nullam gravida odio pulvinar metus finibus rhoncus sed elementum risus. Aliquam maximus gravida mi non ultrices. Etiam at felis magna. Nunc eu ipsum bibendum, rhoncus diam non, convallis justo. Suspendisse potenti. Mauris elementum at ex quis imperdiet. Nam suscipit tempus arcu sit amet ullamcorper. Nulla ipsum dui, laoreet et hendrerit pulvinar, egestas non nisl. Maecenas id consequat augue, sed ornare sem. Morbi rutrum diam augue, vel ultrices justo facilisis nec. Nunc ac nisi dictum, varius ligula ac, imperdiet est. Fusce nunc urna, hendrerit at gravida in, mattis non tortor. Integer orci justo, auctor consectetur risus id, consequat lacinia nisl.' },
  { id: 2, titulo: 'Micro MVC', conteudo: 'Mauris malesuada lacus non tellus aliquam, ut dictum ex tincidunt. Nam congue elit et purus eleifend volutpat. Fusce congue velit risus, a tincidunt risus faucibus ac. Nullam porttitor felis lacinia, scelerisque augue sit amet, sagittis ex. Etiam ac libero in quam fermentum convallis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse nec maximus nisl. Curabitur faucibus diam vel orci euismod tristique. Cras sagittis nec lectus quis aliquet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eleifend est libero, eget consequat risus tempus porta. Cras ac massa efficitur, mollis elit vitae, vestibulum ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi pellentesque rutrum erat sed tincidunt. Suspendisse nulla neque, eleifend nec nulla in, semper faucibus velit. Fusce semper enim non odio sagittis, eu tincidunt arcu posuere.' },
  { id: 3, titulo: 'TDD Rails', conteudo: 'Vestibulum volutpat ex nec nulla sollicitudin suscipit. Fusce imperdiet nisl eros, a convallis odio faucibus sodales. Fusce efficitur arcu nec posuere eleifend. Nam lacus nisi, interdum ut arcu eu, interdum consectetur elit. Quisque metus nisl, tristique non dolor sed, dignissim euismod dolor. Quisque in ex in nisl porttitor venenatis ac at leo. Quisque aliquet orci neque, at luctus diam facilisis ac. Vivamus ut tempus lectus. Etiam nec vulputate urna. Praesent feugiat laoreet urna, dapibus tristique quam sollicitudin vitae. Curabitur tellus metus, feugiat a risus vitae, porta auctor velit.' }
]

get '/' do
  erb :index, locals: { posts: posts }
end

# search com o "evitar safadinhos"
post '/search' do
  termo_pesquisa = Rack::Utils.escape_html(params[:termo_pesquisa].downcase)
  resultados = posts.select { |posts| posts[:titulo].downcase.include?(termo_pesquisa) }

  erb :resultados, locals: { resultados: resultados, termo_pesquisa: termo_pesquisa, }
end

