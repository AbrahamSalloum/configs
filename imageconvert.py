from PIL import Image
import os, sys

path = os.getcwd()+'\\images\\'
print(path)
dirs = os.listdir( path )
quality = 80
resample= Image.Resampling.LANCZOS

def resize():
    
    def save(new_height, new_width=None, aspect_ratio=None, appendString=""):

        if aspect_ratio is not None:
            new_width = new_height * aspect_ratio
        else:
            if new_width is not None:
                new_width = new_width
            else:
                return "Either Specify aspect_ratio or new_width, new_width takes precedence"
            

        imResize = im.resize((int(new_width),int(new_height)), resample)
        imResize.save(f + appendString+".jpg", 'JPEG',  quality=quality)
        return 


    for item in dirs:

        if os.path.isfile(path+item):
            
            im = Image.open(path+item)
            f, e = os.path.splitext(path+item)
            
            aspect_ratio = im.width / im.height 
            new_height = 1080
            save(new_height, None, aspect_ratio, "_1080")
            new_height = 500   
            save(new_height, None, aspect_ratio, "_500")
            new_height = 125    
            save(new_height, None, aspect_ratio, "_thumb")

resize()