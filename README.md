# Project: Pipelined Ethernet/IPv4/TCP Packet Processor

**Project Summary**: The Pipelined Ethernet/IPv4/TCP Packet Processor is a SystemVerilog hardware datapath that receives raw Ethernet frames over a 64-bit ready/valid streaming interface and processes them through a series of pipelined protocol stages. The design parses Ethernet, IPv4, and TCP headers, extracts packet metadata such as MAC addresses, IP addresses, TCP ports, sequence numbers, and flags, and identifies and forwards the TCP payload. Each stage supports backpressure through ready/valid handshaking, allowing the pipeline to sustain up to one 64-bit beat per clock cycle when unstalled. The complete design is verified using cocotb and Scapy with directed and randomized packet generation, backpressure testing, and scoreboard-based checking, then synthesized and timing-analyzed in Vivado.

## RTL Modules

### network_pkg.sv - Protocol Definitions & Metadata
Defines shared Ethernet, IPv4, and TCP constants along with the packet_metadata_t structure used throughout the design. This keeps protocol definitions centralized and allows parsed metadata to travel cleanly between pipeline stages.

### axis_register.sv - Streaming Pipeline Register
Implements a one-entry registered ready/valid stage that stores data, keep, and last. It provides the fundamental backpressure behavior used by the packet-processing pipeline, ensuring data remains stable when downstream logic stalls.

### ethernet_parser.sv - Ethernet Header Parser
Processes the beginning of each Ethernet frame and extracts the source MAC, destination MAC, and EtherType fields. It determines whether the packet contains IPv4 and passes the packet stream and Ethernet metadata to the next pipeline stage.

### ipv4_parser.sv - IPv4 Header Parser
Parses IPv4 fields including source/destination IP addresses, protocol, total length, and IHL. It uses the variable IPv4 header length to locate the beginning of the transport-layer header and determines whether the packet carries TCP.

### tcp_parser.sv - TCP Header Parser
Extracts the source/destination ports, sequence and acknowledgment numbers, TCP flags, and TCP header length. It uses the TCP data_offset field to locate the payload, allowing variable-length TCP headers rather than assuming a fixed 20-byte header.

### packet_filter.sv - Packet Filtering & Payload Stage
Applies configurable filtering rules, initially using fields such as destination IP address and TCP destination port. Matching packets have their TCP payload forwarded to the output stream, while nonmatching or unsupported packets are dropped without disrupting subsequent packets.

### network_pipelin.sv - Top-Level Datapath
Connects the Ethernet, IPv4, TCP, and filtering stages into the complete streaming packet-processing pipeline. It exposes the external 64-bit streaming input/output interfaces and ensures data, packet boundaries, metadata, and backpressure propagate correctly through the entire design.

## Architecture
64-bit streaming datapath

```text
 Ethernet Frame
      │
      ▼
┌───────────────┐
│ AXIS Register │
└───────┬───────┘
        ▼
┌─────────────────┐
│ Ethernet Parser │ ──► MAC / EtherType
└────────┬────────┘
         ▼
┌─────────────────┐
│  IPv4 Parser    │ ──► IPs / Length / Protocol
└────────┬────────┘
         ▼
┌─────────────────┐
│   TCP Parser    │ ──► Ports / Sequence numbers / Flags
└────────┬────────┘
         ▼
┌─────────────────┐
│  Packet Filter  │
└────────┬────────┘
         ▼
    TCP Payload
```


## Future Directions
