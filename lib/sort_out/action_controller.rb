module SortOut
  module ActionController
    def self.included(base)

      base.instance_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      def store_sortable(options = {})
        SortOut.action_controller_options = options.reverse_merge get: :get_sortable, set: :set_sortable

        define_method :store_sortable_before_action do
          if SortOut.sort.present? || SortOut.direction.present?
            send SortOut.action_controller_options[:set], { sort: SortOut.sort, direction: SortOut.direction }
          end
        end

        before_action :get_sort_and_direction, only: [ :index ]
        before_action :store_sortable_before_action, only: [ :index ]
      end

      def set_localize_sortable(*actions)
        skip_before_action :get_sort_and_direction, :store_sortable_before_action
        before_action :get_sort_and_direction, only: actions.flatten
        before_action :store_sortable_before_action, only: actions.flatten
      end
    end

    def sortable_params
      get_sortable = if SortOut.action_controller_options.any? and respond_to? SortOut.action_controller_options[:get]
        send SortOut.action_controller_options[:get]
      end

      (get_sortable || {}).reverse_merge(sort: nil, direction: nil)
    end

    def get_sort_and_direction
      if params[:sort].present?
        SortOut.sort = params[:sort]
        SortOut.direction = params[:direction]
      else
        SortOut.sort = sortable_params[:sort]
        SortOut.direction = sortable_params[:direction]
      end
    end
  end
end

