Rails.application.config.to_prepare do
    Countries       = Gdc.distinct.pluck(:place).sort
    India_states    = Idd.distinct.pluck(:place).sort
    Global_min_date = Gdc.minimum('date')
    Global_max_date = Gdc.maximum('date')
    India_min_date  = Idd.minimum('date')
    India_max_date  = Idd.maximum('date')

    Global_min_date_str = Global_min_date.to_s[0..9]
    Global_max_date_str = Global_max_date.to_s[0..9]
    India_min_date_str  = India_min_date.to_s[0..9]
    India_max_date_str  = India_max_date.to_s[0..9]
end