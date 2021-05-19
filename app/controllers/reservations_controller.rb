class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def lend
    @posts = current_user.posts
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to root_path
    flash[:notice] = "予約が完了しました"
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @reservation.destroy
    redirect_to("/")
    flash[:notice] = "予約を取り消しました"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :post_id)
  end
end
