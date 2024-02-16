from PIL import Image
import os

path = os.getcwd()+'\\images\\'
output = path + "\\output\\"
print(path)
dirs = os.listdir( path )
quality = 80
resample= Image.Resampling.LANCZOS

def resize():
    
    def save(new_height, new_width=None, aspect_ratio=None, appendString=""):

        if new_width is not None:
            new_width = new_width
        else:
            if aspect_ratio is not None:
                new_width = new_height * aspect_ratio
            else: 
                return "Either Specify aspect_ratio or new_width, new_width takes precedence"

        imResize = im.resize((int(new_width),int(new_height)), resample)
        imResize.save(output+os.path.splitext(os.path.basename(filepath))[0] + appendString+".jpg", 'JPEG',  quality=quality)
        return 


    for item in dirs:

        if os.path.isfile(path+item):
            
            im = Image.open(path+item)
            filepath = im.filename
            aspect_ratio = im.width / im.height 
            new_height = 1080
            save(new_height, None, aspect_ratio, "")
            new_height = 500   
            save(new_height, None, aspect_ratio, "_500")
            new_height = 125    
            save(new_height, None, aspect_ratio, "_thumb")

resize()