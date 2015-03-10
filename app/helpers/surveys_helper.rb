module SurveysHelper
	def associated_list(list)
		content_tag(:p, raw(list.collect{|associated_area| associated_area_tag(associated_area)}.join(' ')), class: 'associated-areas')
	end

	def associated_area_tag(associated_area)
		content_tag(:span, raw("#{content_tag(:i, '', class: "fa fa-check-circle")} #{associated_area}"), class: 'label label-success')
	end
end
