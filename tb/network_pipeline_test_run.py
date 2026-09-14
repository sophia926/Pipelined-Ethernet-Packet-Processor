from pathlib import Path
from cocotb_tools.runner import get_runner


def main():

    # ============================================================
    # Project directories
    # ============================================================

    project_root = Path(__file__).resolve().parent.parent

    rtl_dir = project_root / "rtl"
    tb_dir = project_root / "tb"
    build_dir = project_root / "sim_build" / "network"


    # ============================================================
    # Select simulator
    # ============================================================

    runner = get_runner("icarus")


    # ============================================================
    # Compile RTL
    # ============================================================

    runner.build(
        sources=[
            rtl_dir / "network_pkg.sv",
            rtl_dir / "ethernet_parser.sv",
            rtl_dir / "ipv4_parser.sv",
            rtl_dir / "tcp_parser.sv",
            rtl_dir / "network_pipeline.sv",
        ],

        hdl_toplevel="network_pipeline",

        build_dir=build_dir,

        build_args=[
            "-g2012"
        ],

        always=True,
    )


    # ============================================================
    # Run cocotb tests
    # ============================================================

    runner.test(
        hdl_toplevel="network_pipeline",

        test_module="network_pipeline_test",

        build_dir=build_dir,

        extra_env={
            "PYTHONPATH": str(tb_dir)
        },
    )


if __name__ == "__main__":
    main()