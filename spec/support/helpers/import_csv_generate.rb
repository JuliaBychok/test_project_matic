# frozen_string_literal: true

module ImportHelper
  def import_csv_generate
    csv_table = CSV::Table.new([])

    4.times { csv_table << CSV::Row.new(['First name'], ['Last name'], ['Email']) }

    csv_table['First name'] = %w[Tora Alisa Trudie Eddy]
    csv_table['Last name'] = %w[Volkman Armstrong Dietrich Hettinger]
    csv_table['Email'] =
      %w[krystina@steuberfadelcom pat.kunze@dibbert.ca ione.lueilwitz@davisferry.info fairy_heidenreich@wisoky.com]

    csv_table
  end
end
