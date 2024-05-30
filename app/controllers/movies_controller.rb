class MoviesController < ApplicationController
  def index
    # SINGLE SEARCH
    @movies = Movie.all

    if params[:query].present?
      @movies = @movies.search_by_title_and_synopsis(params[:query])
    end

    # MULTI SEARCH
    # @results = []

    # if params[:query].present?
    #   @results = PgSearch.multisearch(params[:query])
    # end

  end
end

# MULTISEARCH (HOW TO SHOW RESULTS IN VIEWS):

# <div id="results">
# <% if @results.any? %>
#   <% @results.each do |result| %>
#     <h4><%= result.searchable.title %></h4>
#     <p><%= result.searchable.synopsis %></p>
#     <% if result.searchable_type == "Movie" %>
#       <h5>Director:</h5>
#       <p><%= result.searchable.director.first_name %> <%= result.searchable.director.last_name %></p>
#     <% end %>
#   <% end %>
# <% else %>
#   <em>Sorry, no movies found.</em>
# <% end %>
# </div>
