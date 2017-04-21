require_relative 'graph'
require 'byebug'

# O(|V|**2 + |E|).
def dijkstra1(vertex)
  shortest_paths = {}
  possible_paths = {
    vertex => { last_edge: nil, cost: 0 }
  }

  until possible_paths.empty?
    # Select a path
    min_vertex, min_data = possible_paths.min_by { |_, v| v[:cost] }
    # Add lowest cost vertex to shortest paths
    shortest_paths[min_vertex] = min_data
    # Remove it from 'possible_paths'
    possible_paths.delete(min_vertex)

    # Add out_edges to possible paths
    min_vertex.out_edges.each do |edge|
      source_vertex = edge.from_vertex
      total_cost = min_data[:cost] + edge.cost

      possible_paths[edge.to_vertex] = {
        last_edge: current_vertex,
        cost: Float::Infinity
      }
    end
    # Make sure min was treated correctly
  end

  shortest_paths
end
