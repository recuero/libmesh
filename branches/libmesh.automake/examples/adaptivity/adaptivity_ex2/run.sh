#!/bin/bash

#set -x

source $LIBMESH_DIR/examples/run_common.sh

example_name=adaptivity_ex2
example_dir=examples/adaptivity/$example_name

link_if_needed $LIBMESH_DIR/$example_dir/mesh.xda

# Specify the number of timesteps to do
n_timesteps=25

# Specify the amount of initial uniform refinement to do
n_refinements=5

# Specify how often to write output files
output_freq=10

options=" \[-read_solution\] -n_timesteps $n_timesteps -n_refinements $n_refinements -init_timestep \[0\|$n_timesteps\]"
message_running "$example_name" "$options"

options="-n_timesteps $n_timesteps -n_refinements $n_refinements -output_freq $output_freq -init_timestep 0"
run_example "$example_name" "$options"

echo " "
echo "***** Finished first" $n_timesteps "steps, now read in" \
    "saved solution and continue *****"
echo " "

options="-read_solution -n_timesteps $n_timesteps -output_freq $output_freq -init_timestep $n_timesteps"
run_example "$example_name" "$options"

options=" \[-read_solution\] -n_timesteps $n_timesteps -n_refinements $n_refinements -init_timestep \[0\|$n_timesteps\]"
message_done_running "$example_name" "$options"

discard_link $LIBMESH_DIR/$example_dir/mesh.xda
