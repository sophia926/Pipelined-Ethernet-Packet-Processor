from pathlib import Path
from cocotb_tools.runner import get_runner


def main():

    # ============================================================
    # Project directories
    # ============================================================

    project_root = Path(__file__).resolve().parent.parent # this goes to the general folder (.parent goes to tb folder, .parent again goes to general folder)

    rtl_dir = project_root / "rtl"
    tb_dir = project_root / "tb"
    build_dir = project_root / "sim_build"


    # ============================================================
    # Select simulator
    # ============================================================

    runner = get_runner("icarus")


    # ============================================================
    # Compile RTL
    # ============================================================

    runner.build(
        sources=[
            rtl_dir / "axis_register.sv",
        ],

        hdl_toplevel="axis_register", # top-level SystemVerilog module name

        build_dir=build_dir,

        # Enable SystemVerilog
        build_args=["-g2012"],

        always=True,
    )


    # ============================================================
    # Run cocotb test
    # ============================================================

    runner.test(
        hdl_toplevel="axis_register",

        # This should match your Python test filename
        # axis_register_test.py
        test_module="axis_register_test", # run the Python module axis_register_test.py

        build_dir=build_dir,

        extra_env={
            "PYTHONPATH": str(tb_dir)
        },
    )


if __name__ == "__main__":
    main()