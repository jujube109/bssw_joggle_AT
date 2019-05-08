import requests
def login():
    url = "http://dev.bishuishuiwu.com:9090/auth/login"

    payload = "{\n\t\"username\" :\"15756250542\",\n\t\"password\" :\"lishihan\"\n}"
    headers = {
        'cache-control': "no-cache",
        'postman-token': "e73c1871-08f4-b877-e481-49144836f7c6"
        }

    response = requests.request("POST", url, data=payload, headers=headers)
    s=response.cookies.get_dict()
    return s
def userinfo(s):

    url1 = "http://dev.bishuishuiwu.com:9090/auth/info"
    headers1 = {
        'cache-control': "no-cache",
        'postman-token': "430efa0f-9d09-5ad4-e0b0-e30b4a21d92e"
        }
    cookies2=dict(co_b='d93741f0-4505-4403-9ed9-f900d0c7ce9e')
    response1 = requests.request("POST", url1, headers=headers1,cookies=s)
    print(response1.text)
def logout(s):

    url2 = "http://dev.bishuishuiwu.com:9090/auth/logout"
    headers2= {
        'cache-control': "no-cache",
        'postman-token': "62a06228-2caa-ecc5-3220-2910c5e7954c"
        }
    response2 = requests.request("POST", url2, headers=headers2,cookies=s)
    print(response2.text)

def get_two_code_web(s):

    url3 = "http://dev.bishuishuiwu.com:9090/auth/qrcode"
    headers3 = {
        'cache-control': "no-cache",
        'postman-token': "a6a85532-aa53-5843-d7b7-d4324ae62351"
        }

    response3 = requests.request("POST", url3, headers=headers3,cookies=s)
    print(response3.text)
    a=response3.json()
    return a["data"]

def two_code_scan_app(status):
    url5 = "http://dev.bishuishuiwu.com:9090/auth/qrcode/scan"

    querystring = {"token": "71e8ccba-3387-4d30-989e-04d40f9af72c"}
    querystring["token"]=status

    print(querystring)

    headers = {

        'cache-control': "no-cache",
        'postman-token': "1dc57613-04bf-1e0c-fc3d-52417a2ad6fa"
    }

    response = requests.request("POST", url5, headers=headers, params=querystring,cookies=login())

    print(response.text)


def two_code_status_web(status,s):
    url4 = "http://dev.bishuishuiwu.com:9090/auth/qrcode/status"

    querystring = dict(token=status)
    print(querystring)
    headers4 = {
        'cache-control': "no-cache",
        'postman-token': "0c342ce8-d0ef-ccbf-05cd-01e535ee4ce8"
    }

    response = requests.request("POST", url4, headers=headers4, params=querystring,cookies=s)

    print(response.text)
def two_code_login(status):
    url = "http://dev.bishuishuiwu.com:9090/auth/qrcode/login"
    querystring = dict(token=status)
    headers = {
        'content-type': "application/json",
        'cache-control': "no-cache",
        'postman-token': "4517103a-40dc-4721-f968-31f0fa9a964a"
    }
    response = requests.request("POST", url, headers=headers, params=querystring,cookies=login())
    print(response.text)
