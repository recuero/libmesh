#!/bin/bash

#set -x

source $LIBMESH_DIR/examples/run_common.sh

example_name=adjoints_ex1

example_dir=examples/adjoints/$example_name

link_if_needed $LIBMESH_DIR/$example_dir/general.in
link_if_needed $LIBMESH_DIR/$example_dir/l-shaped.in
link_if_needed $LIBMESH_DIR/$example_dir/lshaped.xda

message_running "$example_name" 
run_example "$example_name"
message_done_running "$example_name"

discard_link $LIBMESH_DIR/$example_dir/general.in
discard_link $LIBMESH_DIR/$example_dir/l-shaped.in
discard_link $LIBMESH_DIR/$example_dir/lshaped.xda
