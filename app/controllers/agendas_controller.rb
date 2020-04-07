class AgendasController < ApplicationController
  # before_action :set_agenda, only: %i[destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(title: params[:title])
    @agenda.team = Team.friendly.find(params[:team_id])
    current_user.keep_team_id = @agenda.team.id
    if current_user.save && @agenda.save
      redirect_to dashboard_url, notice: I18n.t('views.messages.create_agenda') 
    else
      render :new
    end
  end

  def destroy
    @agenda = Agenda.find(params[:id])
    @users = @agenda.team.users #user 全員

    if current_user.id ==  @agenda.user_id || current_user.id == @agenda.team.owner_id
      @agenda.destroy

      @users.each do |user|
        ContactMailer.contact_mail(user.email, @agenda.title).deliver
      end
      redirect_to dashboard_url, notice: 'Agenda is deleted.'
    else
      redirect_to dashboard_url, notice: 'You are not authorized to perform such task.'
    end
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[title description]
  end
end
