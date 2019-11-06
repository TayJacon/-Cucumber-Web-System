class SweetAlert
  include Capybara::DSL

  def cancel
    find(".swal2-cancel").click
  end

  def confirm
    find(".swal2-confirm").click
  end
end
