PyOpenOCR makes it simple to host your own OCR REST API.

The heavy lifting OCR work is handled by [Tesseract 4 OCR](https://code.google.com/p/tesseract-ocr/).

Run the service in your own computer or use [Docker](http://www.docker.io) to containerize.

# Features

* Scalable as a stateless app.
* Platform independence via Docker containers.
* TODO: Kubernetes
* HTTPS out of the box
* Supports 31 languages in addition to English 
* Pass arguments to Tesseract such as character whitelist and page segment mode.
* [REST API docs](http://docs.openocr.apiary.io/)


# Launching PyOpenOCR in Docker

 * [Install docker](https://docs.docker.com/installation/)
 * `git clone https://github.com/gabrielpsilva/pyopenocr.git`
 * `cd pyopenocr`
 * Type ```./run_docker.sh ``` (in case you don't have execute right type ```sudo chmod +x run.sh```
 
 
 # Launching PyOpenOCR locally (Centos, RedHat or Fedora)

 * `git clone https://github.com/gabrielpsilva/pyopenocr.git`
 * `cd pyopenocr`
 * Type ```./run_native.sh ``` (in case you don't have execute right type ```sudo chmod +x run.sh```



In Tesseract 4.00 The memory usage is light. It is less fast than tesseract 3 and more costly in term of size (an simple aws instance with 1GB of ram is sufficient but with an EBS of 16GB of storage). Result are really better compared to version 3.04.
To see a comparative you can have a look to the [official page of tesseract](https://github.com/tesseract-ocr/tesseract/wiki/4.0-Accuracy-and-Performance)

You are now ready to decode images → text via your REST API.



**Request with image base64**

```bash
#convert image to base 64
$ base64 image_test.png > /tmp/image_test.png.txt
$ curl -k -X POST https://localhost:443/ocr-base64 \
  -H "Content-Type: text/plain" \
  -d "@/tmp/image_test.png.txt"
  ```
 
 
**Request with image URL**

```shell
$curl -k -X POST https://localhost:443/ocr-url \
  -H "Content-Type: text/plain" \
  -d "https://github.com/gabrielpsilva/pyopenocr/blob/master/image_test.png"
```


**Passing parameters to Tesseract**

You can pass parameters using in the url request:
$curl -k -X POST https://localhost:443/ocr-base64?psm=2&oem=3&lang=eng \
  -H "Content-Type: text/plain" \
  -d "https://github.com/gabrielpsilva/pyopenocr/blob/master/image_test.png"



# License

PyOpenOCR is Open Source and available under the Apache 2 License.
