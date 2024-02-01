import requests
import os

# Function to download an image from a given URL
def download_image(url, folder_path):
    response = requests.get(url, stream=True)
    if response.status_code == 200:
        # Extracting the file name from the URL
        file_name = url.split("/")[-1]
        file_path = os.path.join(folder_path, file_name)

        # Saving the image to the specified folder
        with open(file_path, 'wb') as file:
            for chunk in response.iter_content(chunk_size=128):
                file.write(chunk)
        
        print(f"Downloaded: {file_name}")
    else:
        print(f"Failed to download: {url}")

# List of image URLs
image_urls = [
    "https://www.aquaportail.com/pictures1012/phones/ecostick-purety.jpg",
    "https://www.aquaportail.com/pictures1012/phones/ecostick-purety.jpg",
    "https://5.imimg.com/data5/SELLER/Default/2022/8/BW/DN/OB/10274271/polylactic-acid-pla-in-granules-form-colour-white-capacity-1kg-brand-herenba.jpg",
    "https://www.aquaportail.com/pictures1012/phones/ecostick-purety.jpg",
    "https://www.le-diabete-dans-tous-ses-etats.precidiab.org/wp-content/uploads/sites/5/2022/06/allergie-insuline.png",
    "https://5.imimg.com/data5/SELLER/Default/2023/11/361648774/GO/RB/VC/1051022/rhizobium-fertilizer-500x500.jpg",
    "https://lh3.googleusercontent.com/proxy/Bnjyghm6jN12OsYRsDb2wvAkpsI3wCzu_GEIVTFDeUK6glC_NJFG63uWS64ZKW20LqOzN9TqNKJKwCiCjSqm_8I_krxxtEw84waUQVA6KnkTyMmVn2aCS43Lk2P3i9T7LEqSPVhXVNBwXL6a",
    "https://mycorrhizae.com/wp-content/uploads/2017/03/MycoApply-EndoEcto-Web-20171218.png",
    "https://assets.epicurious.com/photos/5e5fcb4fbbf3d50008162792/4:6/w_1600%2Cc_limit/Hodo-Tofu.jpg",
    # Add the remaining URLs here
]

# Folder path to save the downloaded images
folder_path = "downloaded_images"

# Create the folder if it doesn't exist
if not os.path.exists(folder_path):
    os.makedirs(folder_path)

# Download each image
for index, url in enumerate(image_urls, start=1):
    download_image(url, folder_path)
