#this controller permit get the token to login.
#depend the user (user,admin) the token permit specific routes
#this is posible with Knock::AuthTokenController
class UserTokenController < Knock::AuthTokenController
end
