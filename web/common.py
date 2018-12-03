
import pytesseract
from PIL import Image
from io import BytesIO

def data_to_text(data: bytes) -> str:

    img = Image.open(BytesIO(data))
    return pytesseract.image_to_string(img, lang='eng')
