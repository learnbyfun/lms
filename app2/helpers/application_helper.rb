module ApplicationHelper
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
    
  def nested_li(objects, &block)
    objects = objects.order(:lft) if objects.is_a? Class

    return '' if objects.size == 0

    output = '<ul><li>'
    path = [nil]
    objects.each_with_index do |o, i|
      
      if o.parent_id != path.last
        # We are on a new level, did we decend or ascend?
        if path.include?(o.parent_id)
          # Remove wrong wrong tailing paths elements
          while path.last != o.parent_id
            path.pop
            output << '</li></ul>' 
          end
          output << '</li><li>'
        else
          path << o.parent_id
          output << '<ul><li>'
        end
      elsif i != 0
        output << '</li><li>'
      end
      output << capture(o, path.size - 1, &block)
    end

    output << '</li></ul>' * path.length
    output.html_safe
  end




  def sorted_nested_li(objects, order, &block)
    nested_li sort_list(objects, order), &block
  end

  private

  def sort_list(objects, order)
    objects = objects.order(:lft) if objects.is_a? Class

   # Partition the results
    children_of = {}
    objects.each do |o|
      children_of[ o.parent_id ] ||= []
      children_of[ o.parent_id ] << o
    end

    # Sort each sub-list individually
    children_of.each_value do |children|
      children.sort_by! &order
    end

    # Re-join them into a single list
    results = []
    recombine_lists(results, children_of, nil)

    results
  end

  def recombine_lists(results, children_of, parent_id)
    if children_of[parent_id]
      children_of[parent_id].each do |o|
        results << o
        recombine_lists(results, children_of, o.id)
      end
    end
  end

   
end