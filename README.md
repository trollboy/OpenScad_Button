# A simple tutorial on making a button in openscad

So I've been tweeting a lot tonight about OpenScad.  I've talked about how it's different than a lot of other CAD programs because it's 100% code driven.  To me that makes it easier to both use and learn from.  I should probably put my money where my mouth is.

So I tried to pick something simple, and I went with how to make buttons for your shirt.  My button will have 4 holes and be 1cm wide.  You can easily scale this design to whatever size you want.  I'll even talk about how to get one in your hand!!


##  The Problem

What is a button.  The first step in CAD I've found is to reduce objects down to a collection of shapes.  A button, is just a [cylinder](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinder") with smaller [cylinders](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinders") taken out of it.  So let's do that!

## Step 1: A hole

I'm going to start with making a button hole, this is where the thread goes through.  Using the [OpenScad Cheatsheet](https://openscad.org/cheatsheet/ "OpenScad Cheatsheet") I quickly make a 2mm [cylinder](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinder").

[![Step 1, my solitary button hole](https://github.com/trollboy/OpenScad_Button/blob/main/step_1.png?raw=true "Step 1, my solitary button hole")](https://github.com/trollboy/OpenScad_Button/blob/main/step_1.png?raw=true "Step 1, my solitary button hole")

[Step 1 code](https://github.com/trollboy/OpenScad_Button/blob/main/step_1.scad "Step 1 code").

## Step 2: Again, but this time with feeling

Using some delicious CopyPasta I'm going to copy & paste that [cylinder](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinder") 4 times. Here's were we get funky... I'm going to use [translate](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#translate "translate") to move each button around on the x/y axis; 2mm/2mm, -2mm/2mm, 2mm/-2mm, -2mm/-2mm repectively.  Translate is a transformation function, they work to modify other shapes.

[![Step 2, And then there were 4](https://github.com/trollboy/OpenScad_Button/blob/main/step_2.png?raw=true "Step 2, And then there were 4")](https://github.com/trollboy/OpenScad_Button/blob/main/step_2.png?raw=true "Step 2, And then there were 4")

[Step 2 code](http://github.com "Step 2 code").

## Step 3 (a small one)

Note how I keep referring to "the button holes" as if they're 1 thing, but then in my code they're 4 unique things with 4 unique translations on them.  I'm contradicting myself. Am I crazy? Clearly.  So, let's remedy that with the [union](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#union "union") function.   The [union](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#union "union") function is our first boolean type function. The boolean functions are for comparing/contrasting other objects.  So in this case, [union](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#union "union") is going to let us group those button holes together. This will essentially make them one "thing".  (In the extra credit section, I'm gunna show you an even cooler way to keep this going).  Just to keep it exciting, I went ahead and added a -1 instead of 0 to the Z index of the [translate](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#translate "translate"), thus pulling my button holes below the horizon. 
[Step 3 code](https://github.com/trollboy/OpenScad_Button/blob/main/step_3.scad "Step 3 code").

## Step 4: A button

Now that we've got the science of button holes sussed out, let's move on to the button itself.  For this, I'm going to make a  [cylinder](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinder") again, but I'm going to make it MUCH bigger, and I'm not going to  [translate](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#translate "translate") it or move it around at all.  It's just going to stay there.
[![Step 4, Now with more button!](https://github.com/trollboy/OpenScad_Button/blob/main/step_4.png?raw=true "Step 4, Now with more button!")](https://github.com/trollboy/OpenScad_Button/blob/main/step_4.png?raw=true "Step 4, Now with more button!")
[Step 4 code](https://github.com/trollboy/OpenScad_Button/blob/main/step_4.scad "Step 4 code").

## Step 5: What a difference a function makes

At this point, assuming you're still reading and not going glassy eyed whilst bleeding from the ears due to the stroke my blathering has caused, you're beginning to wonder what's going on here.  We have a 4 prong plug where @trollboy promised you a button. What's the deal?  The deal, is the [difference](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#difference "difference") between the button and the holes.  You see, [difference](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#difference "difference") is another boolean function in the same family as [union](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#union "union").  It takes the first object (my huge button [cylinder](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinder")), and then subtracts the second object ( The [union](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/CSG_Modelling#union "union") of my collection of smaller button hole [cylinders](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#cylinder "cylinders")  ).

## Step 6: Getting your damned button

Congrats. You designed a virtual button.  That doesn't really help you put on your shirt now does it? No it does not.  We need to turn this into a real button.  For this, we go up to Design on the menu bar and hit Render [Alternatively hit the F6 key].  This will do all the real hard math to render your code into something printable, as opposed to the light weight preview you have been playing with.  After that's done (it'll play a fun lil noise), you can hit Design again and this time hit 3D Print  [Alternatively hit the F8 key]. 

This will bring up the 3D Print menu.  If you've already ordered a 3D printer and are waiting for it in the mail like a mad man (know dem feels), or simply don't have one at all.. **NEVER FEAR!**  Select [Print-A-Thing](https://printathing.com/ "Print-A-Thing") and they will print your design for you and mail it to you.  If you have a 3d Printer (I'm a fan of the [Creality Ender 3](https://www.creality.com/goods-detail/ender-3-v2-3d-printer "Creality Ender 3"), and @sexycyborg 's [3DPrintMill](https://www.creality.com/goods-detail/creality-3dprintmill-3d-printer "3DPrintMill"), which is also made by Creality) then you can use the [OctoPrint](https://octoprint.org/ "OctoPrint") button to pipe your design into OctoPrint for local printing.  
