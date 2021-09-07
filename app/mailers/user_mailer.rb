class UserMailer < ApplicationMailer
    def user_mailer(user)
        @contact = user
        mail to: "emile.gbenonchi@gmail.com", subject: "Post publié avec Succès"
    end
end
