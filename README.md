# Combo system (godot).

<img width="2638" height="2129" alt="Combo_System_DOC" src="https://github.com/user-attachments/assets/2f40767e-6b9a-4a7c-b6a2-a73d33bddd45" />

This is a animation manager for combos in godot. It allows you to play a animation after another. The System is made based in those principles:

- The combo will end if an animation that is not part of the combo finishes.
- You can only go to the next animation if you are in the current animation.
- You can only go to the next animation if you pressed the correct key.
- You can only go to the next animation if your current animation has passed the zone percent. For example, if your zone is 0.8, you can only go to the next animation once your current animation has already passed 80%.
- You can only combo if the flag cmb is "1", if its set to zero then the combo dies. Set the cmb_ = 0 when a attack is the end of a combo loop.

