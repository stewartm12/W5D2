# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    nb_physics.yr
  FROM (
    SELECT
      *
    FROM
      nobels
    WHERE
      subject = 'Physics'
  ) AS nb_physics
  LEFT OUTER JOIN (
    SELECT
      *
    FROM
      nobels
    WHERE
      subject = 'Chemistry'
  ) AS nb_Chemistry ON nb_physics = nb_Chemistry
  WHERE
    nb_Chemistry.yr ISNULL
  SQL
end
