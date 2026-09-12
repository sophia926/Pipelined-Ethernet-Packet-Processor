# Background
This is the background you need to understand this project.

## Protocols are nested
Suppose your computer wants to send "HELLO" to a TCP server.
The data doesn't travel by itself. Each networking layer adds a header containing information needed by that laeyr

```text
Application data
"HELLO"

        ↓ TCP adds a header

┌──────────────┬─────────┐
│  TCP Header  │ "HELLO" │
└──────────────┴─────────┘

        ↓ IPv4 adds a header

┌─────────────┬──────────────┬─────────┐
│ IPv4 Header │  TCP Header  │ "HELLO" │
└─────────────┴──────────────┴─────────┘

        ↓ Ethernet adds a header

┌─────────────────┬─────────────┬──────────────┬─────────┐
│ Ethernet Header │ IPv4 Header │  TCP Header  │ "HELLO" │
└─────────────────┴─────────────┴──────────────┴─────────┘
```

The final object is essentially what our FPGA receives. We need to reverse that process.

```text
Raw Ethernet frame
       ↓
Read Ethernet header
       ↓
"This contains IPv4"
       ↓
Read IPv4 header
       ↓
"This contains TCP"
       ↓
Read TCP header
       ↓
TCP payload
       ↓
"HELLO"
```

When a message is sent, it is packaged from top to bottom (Layer 7 to Layer 1) through the OSI model, and when it is received, it is unpackaged from bottom to top (Layer 1 to Layer 7).

## What is a header?
A header is a piece of metadata placed before data. For instance, an Ethernet header contains Destination MAC, Source MAC, EtherType. This is information needed to deliver and interpret the message.

## Ethernet
Ethernet is the outermost protocol we're processing. This project will use a simplified Ethernet frame that looks like:

```text
 Byte
  0
  │
  ▼
┌────────────────────────┐
│ Destination MAC        │ 6 bytes
├────────────────────────┤
│ Source MAC             │ 6 bytes
├────────────────────────┤
│ EtherType              │ 2 bytes
├────────────────────────┤
│                        │
│ Payload                │ variable
│                        │
├────────────────────────┤
│ FCS                    │ 4 bytes
└────────────────────────┘
```

For the parser, the important part is the first 14 bytes.

**MAC addresses**: Ethernet uses MAC addresses (48 bits, 6 bytes) to identify network interfaces on a local network.
**EtherType**: EtherType is a 16-bit field that tells you what kind of packet is inside the payload (IPv4, ARP, IPv6, etc.)

## IPv4
IPv4 is a 32-bit number that handles addressing between networks. The minimum IPv4 header is 20 bytes.

```text
┌──────────────────────────────────────────┐
│ Version | IHL | ...                     │
├──────────────────────────────────────────┤
│ Total Length                             │
├──────────────────────────────────────────┤
│ Identification / Fragmentation           │
├──────────────────────────────────────────┤
│ TTL | Protocol | Header Checksum         │
├──────────────────────────────────────────┤
│ Source IP                                │
├──────────────────────────────────────────┤
│ Destination IP                           │
├──────────────────────────────────────────┤
│ Options (possibly)                       │
└──────────────────────────────────────────┘
```

**IHL**: Internet Header Length tells us how long the IPv4 header is. It is measured in 32-bit words. So IHL=5 means 5x4 bytes = 20 bytes. The IPv4 header varies in length because it contains optional fields.
**IPv4 Total Length**: Size of the entire IPv4 packet including IPv4 header + IPv4 payload.
**Protocol**: Tells us what protocol is inside the packet (e.g. TCP, UDP, ICMP).

## TCP

TCP is a transport layer protocol, and its minimum header is 20 bytes.

```text
┌──────────────────────────────────┐
│ Source Port  │ Destination Port  │
├──────────────────────────────────┤
│ Sequence Number                  │
├──────────────────────────────────┤
│ Acknowledgment Number            │
├──────────────────────────────────┤
│ Header Length | Flags | ...      │
├──────────────────────────────────┤
│ Window Size                      │
├──────────────────────────────────┤
│ Checksum | Urgent Pointer        │
├──────────────────────────────────┤
│ Options (possibly)               │
├──────────────────────────────────┤
│                                  │
│ Application Payload              │
│                                  │
└──────────────────────────────────┘
```

**Port numbers**: Virtual number to direct data to the correct application/service on a device (e.g. port 443 is typically HTTPS, port 22 is typically SSH)
**Sequence numbers**: TCP provides a reliable byte stream, so it needs to keep track of where data belongs in that stream.
**TCP flags**: Main ones are SYNC (establish/synchronize a connection), ACK (acknowledgement information is valid), FIN (gracefully close a connection), RST (reset/abort a connection), PSH (request prompt delivery of received data)
**Data Offset**: Measured in 32-bit words. If data offset = 8, then the TCP header is 8x4 = 32-bytes long.
**TCP Payload**: This is the data we're ultimately interested in.