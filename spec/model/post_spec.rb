require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(email: "testuser@example.com", password: "password", role: "admin")
  end

  it "is valid with atributes" do
    post = Post.new(title: "pepe grillo", content: "grillo de la suerte", tag: "mar", category: "drama", user_id: 1, status: true)
    expect(post).to be_valid
  end

  it "is invalid without a user associated" do
    post = Post.new(title: "pepe grillo", content: "grillo de la suerte", tag: "mar", category: "drama", status: true)
    expect(post).to_not be_valid
  end
end

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(email: "testuser@example.com", password: "password", role: "admin")
    @post = Post.new(title: "pepe grillo", content: "grillo de la suerte", tag: "mar", category: "drama", user_id: 1, status: true)
  end
  it "is valid with atributes" do
    comment = Comment.new(title: "me gusto", content: "buenisima", post_id: 1)
    expect(comment).to be_valid
  end

  it "is invalid with wrong atributes" do
    comment = Comment.new( content: "buenisima", post_id: 1)
    expect(comment).to_not be_valid
  end

  
end
