feature 'infrastructure working' do
  scenario 'homepage has content' do
    visit '/'
    expect(page).to have_content('Hello World')
  end
end
