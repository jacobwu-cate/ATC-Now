#!/usr/bin/python3
# Framework for Simple http service with JSON reply
# John MacFarlane (2020)

import json
import csv
from http.server import BaseHTTPRequestHandler, HTTPServer


# for a given file, returns the json dump
def get_list(file_in):

    lst = []
    try:
        with open(file_in) as csvFile:
            csvReader = csv.DictReader(csvFile)
            for row in csvReader:
                lst.append(row)

        return json.dumps(lst)

    except IOError as err:
        print('IO Error reading file  ' + file_in + ': '+str(err))



class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        requestPath = self.path
        requestPath = requestPath[requestPath.find('?')+1:]
        try:
            (parm,value) = requestPath.split('=')
            
        except ValueError:
            print("This request handler needs to specify a request or store parameter for a named list.")
            print("URL should be hostname:port?request=AthleteList (or whichever list name you want to retrieve.")
            print("URL should be hostname:port?store=ProgramList ...") # Request = app pulls data; Store = write data
            raise        
        
        #Log to us
        print(f'\n----- GET Request Start ----->\n')
        print(f'Request path: {requestPath}')
        print(f'Request headers:\n')
        for line in self.headers:
            print(f'  > {line}: {self.headers[line]}')
        print(f'\n<----- GET Request End -----\n')

        #Answer 200 => OK Status
        self.send_response(200)

        #Add Headers if any needed
        #self.send_header("Set-Cookie", "cate=true")
        self.end_headers()
        if parm == 'request':
            json_reply = get_list(value+'.csv')
            #Body of reply
            self.wfile.write(json_reply.encode(encoding='utf_8'))
        elif parm=='store':
            write_list(value)

# Listen on Port 88

port = 8080
print('Listening on localhost:%s' % port)
server = HTTPServer(('', port), RequestHandler)
server.serve_forever()


#get_list('AthleteList.csv')
