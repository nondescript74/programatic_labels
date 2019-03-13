# programatic_labels
We often need to be able to create many buttons with attributed text and images.  
This demonstration program does just that using a master button and two subsidiary buttons

A single button action outlet is used to service all three buttons when pushed

An outlet collection is used to decode how many button are and is used with the button pushed to set each button's attributed text and image

I used this to create a custom keyboard layout on a project that changes keyboards programmatically but uses very few action connections for groups of buttons and only one outlet collection servicing all buttons
