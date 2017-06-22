module CarouselHelper
  def carousel_for(shelves)
    Carousel.new(self, shelves).html
  end

  class Carousel
    def initialize(view, shelves)
      @view = view
      @shelves = Shelf.all
      @uid = SecureRandom.hex(6)
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, class: 'carousel slide')
    end

    private

    attr_accessor :view, :shelves, :uid
    delegate :link_to, :content_tag, :shelf_path, :safe_join, to: :view

    def indicators
      items = shelves.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: {
          target: uid,
          slide_to: index
        }
      }
      content_tag(:li, '', options)
    end

    def slides
      items = shelves.map.with_index { |shelf, index| slide_tag(shelf, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(shelf, is_active)
      options = {
        class: (is_active ? 'item active' : 'item'),
      }

      content_tag(:div, shelf_path(shelf), options)
    end

    def controls
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, nil, class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end
