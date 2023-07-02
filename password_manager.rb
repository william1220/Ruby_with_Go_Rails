EMAIL = 'william@example.com'
PASSWORD = '12345'
PASSWORD_VAULT = { aws: {username: 'King Philip', password: '12345'} }

def welcome_message
  puts 'Welcome to the password Manager'
end

def prompt_user_for_e_mail
  puts 'Please sign in to continue'
  print 'Enter email: '
  gets.chomp
end

def verify_user_email(user_email)
  if user_email != EMAIL
    render_try_again_email
    exit
  end
end

def prompt_user_password
  print 'Please enter Password: '
  gets.chomp
end

def verify_user_password(user_password)
  if user_password != PASSWORD
    render_try_again_password
    exit
  end
end

def greet_user(user_email)
  puts "Hello, #{user_email}"
  puts 'What you would like to do?'
end

def menu_options
  puts '1. Add new service credentials'
  puts '2. Retrieve an exiting service credentials'
  puts '3. Exit'
end

def get_user_menu_selection
  gets.chomp
end

def handle_user_selection(user_selection)
  case user_selection
  when '1'
    new_service = set_new_service_name
    set_username_for(new_service)
    set_password_for(new_service)
  when '2'
    requested_service_name = retrieve_service_name
    credentials = retrieve_service_credentials_for(requested_service_name)
    display_service_credentials(requested_service_name, credentials)
  else
    exit_program
  end
end

def set_new_service_name
  print 'Enter the name of the service: '
  new_service = gets.chomp
  PASSWORD_VAULT[new_service.to_sym] = {}
  new_service
end

def set_username_for(service)
  print 'Please enter the username for this new service: '
  new_service_username = gets.chomp
  PASSWORD_VAULT[service.to_sym][:username] = new_service_username
end

def set_password_for(service)
  print 'Please emter the password for this service:'
  new_service_password = gets.chomp
  PASSWORD_VAULT[service.to_sym][:password] = new_service_password
end

def retrieve_service_name
  print 'Please enter the name of the service you wish to acccess credentials for:'
  gets.chomp
end

def retrieve_service_credentials_for(service)
  PASSWORD_VAULT[service.to_sym]
end

def display_service_credentials(service_name, credentials)
  puts "Here are the credentials for #{service_name}"
  credentials.each do |key, val|
    puts "#{key}: #{val}"
  end
end

def example
  puts 'Exiting the program'
  exit
end

private

def render_graphics_art
  puts <<-'EOF'
    _..--"\  `|`""--.._
.-'       \  |        `'-.
/           \_|___...----'`\
|__,,..--""``(_)--..__      |
'\     _.--'`.I._     ''--..'
`''"`,#JGS/_|_\###,.--'`
 ,#'  _.:`___`:-._'#,
#'  ,~'-;(oIo);-'~, '#
#   `~-(  |    )=~`  #
#       | |_  |      #
#       ; ._. ;      #
#  _..-;|\ - /|;-._  #
#-'   /_ \\_// _\  '-#
/`#    ; /__\-'__\;    #`\
;  #\.--|  |O  O   |'-./#  ;
|__#/   \ _;O__O___/   \#__|
| #\    [I_[_]__I]    /# |
\_(#   ;  |O  O   ;   #)_/
     |  |       |
     |  ;       |
     |  |       |
     ;  |       |
     |  |       |
     |  |       ;
     |  |       |
     '-.;____..-'
       |  ||  |
       |__||__|
       [__][__]
     .-'-.||.-'-.
    (___.'  '.___)
EOF
end

def render_try_again_email
  puts <<-'EOF'
  _________        .---"""      """---.
  :______.-':      :  .--------------.  :
  | ______  |      | :                : |
  |:______B:|      | |  Incorrect     | |
  |:______B:|      | |  Email!        | |
  |:______B:|      | |  Try Again     | |
  |         |      | |                | |
  |:_____:  |      | |                | |
  |    ==   |      | :                : |
  |       O |      :  '--------------'  :
  |       o |      :'---...______...---'
  |       o |-._.-i___/'             \._
  |'-.____o_|   '-.   '-...______...-'  `-._
  :_________:      `.____________________   `-.___.-.
                   .'.eeeeeeeeeeeeeeeeee.'.      :___:
      fsc        .'.eeeeeeeeeeeeeeeeeeeeee.'.
                :____________________________:
  EOF
end

def render_try_again_password
  puts <<-'EOF'
  _________        .---"""      """---.
  :______.-':      :  .--------------.  :
  | ______  |      | :                : |
  |:______B:|      | |  Incorrect     | |
  |:______B:|      | |  Password!     | |
  |:______B:|      | |  Try Again     | |
  |         |      | |                | |
  |:_____:  |      | |                | |
  |    ==   |      | :                : |
  |       O |      :  '--------------'  :
  |       o |      :'---...______...---'
  |       o |-._.-i___/'             \._
  |'-.____o_|   '-.   '-...______...-'  `-._
  :_________:      `.____________________   `-.___.-.
                   .'.eeeeeeeeeeeeeeeeee.'.      :___:
      fsc        .'.eeeeeeeeeeeeeeeeeeeeee.'.
                :____________________________:
  EOF
end
render_graphics_art
welcome_message
user_email = prompt_user_for_e_mail
verify_user_email(user_email)
user_password = prompt_user_password
verify_user_password(user_password)
greet_user(user_email)
menu_options
user_selection = get_user_menu_selection
handle_user_selection(user_selection)
