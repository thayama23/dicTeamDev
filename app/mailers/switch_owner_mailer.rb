class SwichOwnerMailer < ApplicationMailer
  def switch_owner_mail(team)
    @team = team
    mail to: @team.owner.email, subject: 'Teamオーナー変更の通知'
  end

  # def contact_mail(agenda)
  #     @emails = agenda.team.users
  #     binding.irb
  #     @emails.each do |email|
  #       mail to: email.map(&:email).join(","), subject: "Agenda and articles have been deleted."
  #     end    
  # end

  # def contact_mail(email, agenda_title)
  #   @email = email
  #   @agenda_title = agenda_title
  #   mail to: email, subject: "Agenda #{agenda_title} と articles は削除されました。."
  # end
end