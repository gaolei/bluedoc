# Adds draw method into Rails routing
# It allows us to keep routing split into files
ActionDispatch::Routing::Mapper.prepend BookLab::ActionDispatch::DrawRoute
