
import pytesseract
from PIL import Image
from io import BytesIO

def data_to_text(data: bytes, args: dict) -> str:

    img = Image.open(BytesIO(data))
    configs = format_url_params(args)
    return pytesseract.image_to_string(img, config=configs['config'], lang=configs['lang'] )

def format_url_params(args) -> dict:
    params = dict()
    params['config'] = ''

    if args.get('psm'):
        params['config'] = f'--psm {args.get("psm")} '

    if args.get('oem'):
        params['config'] += f'--oem {args.get("oem")} '

    if args.get('lang'):
        params['lang'] = f'{args.get("lang")}'
    else:
        params['lang'] = 'eng'

    return params