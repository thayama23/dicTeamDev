class ContactMailer < ApplicationMailer
    # def contact_mail(agenda)
    #     @emails = agenda.team.users
    #     binding.irb
    #     @emails.each do |email|
    #       mail to: email.map(&:email).join(","), subject: "Agenda and articles have been deleted."
    #     end    
    # end

    def contact_mail(email, agenda_title)
      @email = email
      @agenda_title = agenda_title
      mail to: email, subject: "Agenda #{agenda_title} and articles have been deleted."
    end
  end

# @mailto.each do |mailto|
# mail to: @mailto.map(&:email).join(","), subject: "通知メールです。"