# Project: Pipelined Ethernet/IPv4/TCP Packet Processor

**Project Summary**: The Pipelined Ethernet/IPv4/TCP Packet Processor is a SystemVerilog hardware datapath that receives raw Ethernet frames over a 64-bit ready/valid streaming interface and processes them through a series of pipelined protocol stages. The design parses Ethernet, IPv4, and TCP headers, extracts packet metadata such as MAC addresses, IP addresses, TCP ports, sequence numbers, and flags, and identifies and forwards the TCP payload. Each stage supports backpressure through ready/valid handshaking, allowing the pipeline to sustain up to one 64-bit beat per clock cycle when unstalled. The complete design is verified using cocotb and Scapy with directed and randomized packet generation, backpressure testing, and scoreboard-based checking, then synthesized and timing-analyzed in Vivado.

## RTL Modules
The datapath is organized as 3 streaming parser stages

### network_pkg.sv - Protocol Definitions & Metadata
Defines shared Ethernet, IPv4, and TCP constants along with the packet_metadata_t structure used throughout the design. This keeps protocol definitions centralized and allows parsed metadata to travel cleanly between pipeline stages.

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
 Ethernet AXI Stream
      │
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

## Features
- 64-bit streaming datapath with 8-bit byte valid mask
- Ethernet II header parsing and stripping
- IPv4 parsing with variable IHL and IPv4 option support
- TCP parsing with variable Data Offset and TCP option support
- Source/destination MAC, IP, and port extraction
- TCP sequence number, acknowledgment number, and flag extraction
- Payload realignment across 64-bit word boundaries
- Partial final-beat handling using tkeep
- Flush logic for residual payload bytes
- Ready/valid backpressure across all pipeline stages
- Synthesizable SystemVerilog RTL

## Verification
Verification was written in Python using cocotb and run with Icarus Verilog.

Testing included both module-level and end-to-end cases:
- Ethernet header parsing and payload realignment
- IPv4 metadata extraction
- Variable IPv4 header lengths and options
- TCP metadata extraction
- Variable TCP header lengths and options
- Partial final beats
- Flush cases
- Downstream backpressure
- Complete Ethernet → IPv4 → TCP packet processing

## FPGA Implementation
The design was synthesized and implemented in Vivado.
| Module             | LUTs | Registers |
| ------------------ | ---: | --------: |
| `network_pipeline` |  306 |       660 |
| `ethernet_parser`  |   52 |       208 |
| `ipv4_parser`      |  134 |       222 |
| `tcp_parser`       |  120 |       230 |

Additional top-level utilization:
- 146 slices
- 470 bonded IOBs
- 1 BUFGCTRL

### Timing
The design successfully closed timing at a 3.0 ns clock period, corresponding to approximately 333 MHz.

Post-route timing at 3.0 ns:
- WNS: +0.081 ns
- WHS: +0.065 ns
- WPWS: +1.1 ns

The worst setup path was not in the packet parsing datapath itself, but in the combinational ready/backpressure control chain between pipeline stages. The critical path contained only three LUT levels and was routing-dominated, with the majority of the delay coming from interconnect rather than logic depth.

## Running the Tests
Create and active a Python virtual environment
```python
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

Install cocotb
```python
python -m pip install cocotb
```

Run the complete pipeline test:
```python
python tb/network_pipeline_test_run.py
```

Individual parser testbenches can be run using their corresponding runner files.

## Tools
- SystemVerilog
- Python
- cocotb
- Icarus Verilog
- Vivado

## Future Directions
- **Break the combinational backpressure path:** Add registered skid buffers between parser stages to reduce the ready-chain critical path and improve achievable clock frequency.
- **Packet filtering:** Add configurable filters for MAC addresses, IP addresses, TCP ports, and protocol fields to support selective packet forwarding.
- **Checksum validation:** Implement IPv4 header checksum and TCP checksum verification in hardware.
- **Statistics and counters:** Track packet counts, byte counts, malformed packets, protocol distribution, and dropped packets through a register interface.
- **AXI4-Lite control plane:** Add software-accessible configuration/status registers for filters, counters, and parser configuration.
- **DMA / memory integration:** Stream selected packet payloads into memory through an AXI4 DMA path for downstream processing.
- **More protocol support:** Extend the pipeline with VLAN-tagged Ethernet, IPv6, UDP, and additional TCP/IP corner cases.