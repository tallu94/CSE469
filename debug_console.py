import tinyprog
import usb
import sys

ports = tinyprog.get_ports("1d50:6130")

errors = 0
lastcycle = 0

## Adjust this number to be the number of debug bytes
debugbytes = 8

print(ports)
for port in ports:
    with port:
        wch=0
        while True:

### Just demonstrate how to write stuff back, if you want
            try:
                port.write([wch])
                wch=wch+1
                if (wch > 10):
                    wch = 0
            except:
                errors = errors + 1

            try:
                ch=port.read(1)
                while int(ch[0]) != 255:
#                    sys.stdout.write(hex(ch[0]))
#                    sys.stdout.write("\n")
                    ch=port.read(1)
                i = 1;
                while i < debugbytes:
                    ch=port.read(1)
                    if int(ch[0]) != 255:
                        break
                    i = i + 1;
                if int(ch[0]) == 255:
                    ch=port.read(1)

                thiscycle = ch[0]
                if thiscycle != lastcycle:
                    sys.stdout.write(" ")
                    sys.stdout.write(hex(ch[0]))
                    sys.stdout.write("     ")
                i = 1
                while i < debugbytes:
                    ch=port.read(1)
                    if thiscycle != lastcycle:
                        if (i == 1):
                            sys.stdout.write("ALUCtl: ")
                        elif (i == 2):
                            sys.stdout.write("A: ")
                        elif (i == 3):
                            sys.stdout.write("B: ")
                        elif (i == 4):
                            sys.stdout.write("Cycle: ")
                        elif (i == 5):
                            sys.stdout.write("Rm: ")
                        elif (i == 6):
                            sys.stdout.write("Rn: ")
                        elif (i == 7):
                            sys.stdout.write("Rd: ")


                        sys.stdout.write(hex(ch[0]))
                        sys.stdout.write("     ")
                    i += 1
                if thiscycle != lastcycle:
                    sys.stdout.write("\n")
                lastcycle = thiscycle
            except:
                errors = errors + 1
