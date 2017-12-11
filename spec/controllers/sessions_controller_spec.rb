require 'spec_helper'

describe SessionsController do

	describe "GET new" do
		it "renders new template page for un-authenticated users" do
			get :new
			expect(response).to render_template :new
		end

		it "redirects to home page if user is authenticated" do
			session[:user_id] = Fabricate(:user).id
			get :new
			expect(response).to redirect_to home_path
		end
	end

	describe "POST create" do
		context "with valid credentials" do
			it "puts the signed in user id into the session cookie" do
				murphy = Fabricate(:user)
				post :create, email: murphy.email, password: murphy.password
				expect(session[:user_id]).to eq(murphy.id)
			end

			it "redirects to the home page" do
				murphy = Fabricate(:user)
				post :create, email: murphy.email, password: murphy.password
				expect(response).to redirect_to home_path
			end

			it "sets the flash notice" do
				murphy = Fabricate(:user)
				post :create, email: murphy.email, password: murphy.password
				expect(flash[:notice]).to_not be_blank
			end

		end

		context "with invalid credentials" do
			let(:murphy) { Fabricate(:user) }


			it "does not put the user in the session" do
				post :create, email: murphy.email, password: murphy.password + "test"
				expect(session[:user_id]).to be_nil
			end

			it "redirects to sign in page" do
				post :create, email: murphy.email, password: murphy.password + "test"
				expect(response).to redirect_to sign_in_path
			end

			it "redirects to the sign_in page" do
				post :create, email: murphy.email, password: murphy.password + "test"
				expect(flash[:error]).to_not be_blank
			end
		end
	end

	describe "GET destroy" do
		it "clears session cookie id for the user" do
			session[:user_id] = Fabricate(:user).id
			get :destroy
			expect(session[:user_id]).to be_nil
		end

		it "redirects to root path" do
			session[:user_id] = Fabricate(:user).id
			get :destroy
			expect(response).to redirect_to root_path
		end

		it "sets the notice" do
			session[:user_id] = Fabricate(:user).id
			get :destroy
			expect(flash[:notice]).to_not be_blank
		end
	end


end
