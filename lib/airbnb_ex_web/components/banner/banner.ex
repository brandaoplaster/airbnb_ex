defmodule Components.Banner do
  use Phoenix.Component

  attr :class, :string, default: nil
  attr :src, :string, default: nil

  def banner(assigns) do
    ~H"""
    <div class="grid grid-cols-2 gap-1 ml-10 mr-10">
      <!-- Primeira coluna -->
      <div class="bg-gray-200 p-0 h-[480px]">
        <div class="group cursor-pointer">
          <img
            src="https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw1fHxuYXR1cmV8ZW58MHwwfHx8MTY5NDA5OTcyOXww&ixlib=rb-4.0.3&q=80&w=1080"
            alt="Image 1"
            class="w-full h-full object-cover rounded-lg transition-transform transform scale-100 group-hover:scale-102"
          />
        </div>
      </div>
      <!-- Segunda coluna com grid 2x2 -->
      <div class="grid grid-cols-2 gap-1 bg-gray-100 p-1 m-0">
        <div class="bg-blue-200 p-0 m-0">
          <div class="group cursor-pointer">
            <img
              src="https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw1fHxuYXR1cmV8ZW58MHwwfHx8MTY5NDA5OTcyOXww&ixlib=rb-4.0.3&q=80&w=1080"
              alt="Image 1"
              class="w-full h-full object-cover rounded-lg transition-transform transform scale-100 group-hover:scale-105"
            />
          </div>
        </div>
        <div class="bg-blue-200 p-0 m-0">
          <div class="group cursor-pointer">
            <img
              src="https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw1fHxuYXR1cmV8ZW58MHwwfHx8MTY5NDA5OTcyOXww&ixlib=rb-4.0.3&q=80&w=1080"
              alt="Image 1"
              class="w-full h-full object-cover rounded-lg transition-transform transform scale-100 group-hover:scale-105"
            />
          </div>
        </div>
        <div class="bg-blue-200 p-0 m-0">
          <div class="group cursor-pointer">
            <img
              src="https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw1fHxuYXR1cmV8ZW58MHwwfHx8MTY5NDA5OTcyOXww&ixlib=rb-4.0.3&q=80&w=1080"
              alt="Image 1"
              class="w-full h-full object-cover rounded-lg transition-transform transform scale-100 group-hover:scale-105"
            />
          </div>
        </div>
        <div class="bg-blue-200 p-0 m-0">
          <div class="group cursor-pointer">
            <img
              src="https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw1fHxuYXR1cmV8ZW58MHwwfHx8MTY5NDA5OTcyOXww&ixlib=rb-4.0.3&q=80&w=1080"
              alt="Image 1"
              class="w-full h-full object-cover rounded-lg transition-transform transform scale-100 group-hover:scale-105"
            />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
