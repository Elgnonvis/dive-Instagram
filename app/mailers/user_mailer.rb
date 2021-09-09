class UserMailer < ApplicationMailer
    def user_mailer(user)
        @contact = user
        mail to: user.email, subject: "Post publié avec Succès"
    end
end
