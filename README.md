# Combo system (godot).

<img width="2638" height="2129" alt="Combo_System_DOC" src="https://github.com/user-attachments/assets/2f40767e-6b9a-4a7c-b6a2-a73d33bddd45" />

This is a animation manager for combos in godot. It allows you to play a animation after another. The System is made based in those principles:

- The combo will end if an animation is finished.
- You can only go to the next animation if you are in the current animation.
- You can only go to the next animation if you pressed the correct key.
- You can only go to the next animation if your current animation has passed the zone percent. For example, if your zone is 0.8, you can only go to the next animation once your current animation has already passed 80%.
- You can only combo if the flag cmb is "1", if its set to zero then the combo dies. Set the cmb_ = 0 when a attack is the end of a combo loop.

# How to SetUP

First Create a Node, add a script and paste the code.

<img width="1698" height="788" alt="image" src="https://github.com/user-attachments/assets/065f9686-5779-4926-ae51-8158f01c4964" />

Then add the "Animation Player" that you want to use in your combos.


<img width="1888" height="484" alt="image" src="https://github.com/user-attachments/assets/890033ab-de9b-4f0f-b640-f956a3441974" />


My animation player has these animations:

<img width="1485" height="703" alt="image" src="https://github.com/user-attachments/assets/095e8ba0-66f0-4364-8779-9fa42ed8727c" />

Now, set up the animation flow in the code:

<img width="851" height="152" alt="image" src="https://github.com/user-attachments/assets/054cd33f-4876-42be-8435-674207b283e4" />

Final Result:

![docShowCase](https://github.com/user-attachments/assets/da9daf6f-e047-4d87-81b2-40a5630b0271)





