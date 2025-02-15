defmodule BirdWeb.PostLive.PostComponent do
  use BirdWeb, :live_component

  def render(assigns) do
    ~L"""
    <div id="post-<%= @post.id %>" class="card mb-3">
    <div class="card-body">
      <!-- Post Header (Avatar and Username) -->
      <div class="d-flex align-items-start">
        <!-- Avatar -->
        <img src="https://avatarfiles.alphacoders.com/103/103373.png"
             alt="<%= @post.username %>"
             class="rounded-circle me-3"
             width="48"
             height="48">
        <!-- Username and Post Body -->
        <div class="flex-grow-1">
          <h6 class="card-title mb-1 fw-bold">@<%= @post.username %></h6>
          <p class="card-text mb-2"><%= @post.body %></p>
        </div>
      </div>

      <!-- Post Actions (Like, Repost, Edit, Delete) -->
      <div class="d-flex justify-content-between align-items-center mt-3">
        <!-- Like Button -->
        <a href="#" class="text-decoration-none text-muted" phx-click="like" phx-target="<%= @myself %>">
          <i class="far fa-heart me-1"></i> <%= @post.likes_count %>
        </a>
        <!-- Repost Button -->
        <a href="#" class="text-decoration-none text-muted" phx-click="repost" phx-target="<%= @myself %>">
          <i class="fas fa-retweet me-1"></i> <%= @post.reposts_count %>
        </a>
        <!-- Edit Button -->
        <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id), class: "text-decoration-none text-muted" do %>
          <i class="far fa-edit me-1"></i>
        <% end %>
        <!-- Delete Button -->
        <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Remover?"], class: "text-decoration-none text-muted" do %>
          <i class="far fa-trash-alt"></i>
        <% end %>
      </div>
    </div>
  </div>
    """
  end

  def handle_event("like", _, socket) do
    Bird.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end
  def handle_event("repost", _, socket) do
    Bird.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end
