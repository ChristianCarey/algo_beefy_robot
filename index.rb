require './lib/beefy_robot_simulator'

r = BeefyRobotSimulator.new

r.place(1,1,'N')

p r.report

r.left
r.left
r.left

p r.report

r.right
r.right
r.right

p r.report

r.move
r.move
r.move
r.move
r.move

p r.report