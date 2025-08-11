# 4194304's Monochrome Linux Guide
Your guide to using linux in as monochrome of a way as possible (and using the modern internet!)

The thought of using a modern operating system with only 2 colors may seem like something impossible or even unheard of, but it can work. With my time attempting to make my perfect monochrome setup (or at least the stuff you want), I decided to just compile everything I have here.

## 1. Use bitmap fonts.
If you want to be able to use a 1bit setup without getting a massive headache, using bitmap fonts is a must. For the font you choose, it doesn't exactly matter, but I personally like Misc Fixed. I recommend reading the Arch Wiki on how to enable bitmap fonts as by default they are disabled.

To get Misc Fixed and some other X11 fonts to work, go into /usr/share/fonts/misc. You will find pcf files that have names like 5x7.pcf.gz, or 6x13.pcf.gz. I recommend using FontForge to easily open and save to OTB format (which you can use in GTK and Qt) to your fonts folder (~/.fonts).

The contrast between the font and the background helps quite a lot with visibility, which leads into the next point.

## 2. Try to make elements high contrast.
When you are making a true monochrome setup or even one with dithering, for the best visibility high contrast is key. 

With monochrome, the aspect of color is completely out of the picture so that can't be used. This leaves varying shades of gray as options (including black and white), but the only true color scheme you can use without running into issues is plainly just black and white. 

Without dithering, you will have 2 outcomes, one being that you can read it perfectly fine (as it posterizes to a black and white scheme) or you can't (as it posterizes to 2 of the same colors).

With dithering, you may have a chance at reading gray text, but then again the only fully readable color scheme is black and white. Dithering can help with grays and the like, and can also make games playable, but then again it can take away from the true monochrome experience. It's all your choice here.

## 3. Look into themes or things that work for you, and adapt other things that may not work.
Based on the 2 points above, a high contrast, bitmap font setup is the best for monochrome. There are themes that exist that can help you have an easier time with this sort of setup, and icon themes also exist too (I recommend . I would highly recommend just experimenting and seeing what works for you!

A little plug here from me for a theme I made: A theme that works nicely with monochrome is Athena GTK. It tries to replicate the appearance of Athena applications (like xfontsel) and bring it over to GTK. If you're doing a setup like this, I would absolutely recommend this theme with no hesitation. Link: https://github.com/4194304/athena-gtk.

# Setting up picom
A setup like this will require that your compositor allows GLSL fragment shaders. The only compositor I know of that allows this is picom, so you'll be stuck on X11, on top of that, the shaders are also kinda tied to picom, so things are also stuck there too.

To set up picom.conf for this, simply paste in:
```
backend = "glx";
window-shader-fg = "<path>"
```
This will make it use the OpenGL backend and use the shader. Keep in mind that this is an absolute path, so instead of ~/shader.glsl it would have to be /home/USER/shader.glsl.

In this repository I have 4 shaders that you can just throw into picom (all modified versions of a shader made by PickNicko13, he takes full credit). Two of them are monochrome, and two are colored, but you can change the color depth by going into the shader file and changing the `int colors =` line to whatever depth you want (in bits). Setting it to 1 would be 1bit, 4 would be 4bit, and so on.

I have plans for a monochrome icon theme in the future, so there's that.
