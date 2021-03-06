# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
# hash a string as mysql's "PASSWORD()" function would do it
require 'digest/md5'

# postgresql_password.rb
# ---- original file header ----
#
# @summary
#       This function returns the postgresql password hash from the clear text username / password
#    @return Returns the postgresql password hash from the clear text username / password.
#
#
Puppet::Functions.create_function(:'postgresql::postgresql_password') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end

  def default_impl(*args)
    if args.size != 2
      raise(Puppet::ParseError, 'postgresql_password(): Wrong number of arguments ' \
        "given (#{args.size} for 2)")
    end

    username = args[0]
    password = args[1]

    'md5' + Digest::MD5.hexdigest(password.to_s + username.to_s)
  end
end
