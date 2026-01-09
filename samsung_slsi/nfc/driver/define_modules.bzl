load("//build/kernel/kleaf:kernel.bzl", "ddk_module")
load("//build/bazel_common_rules/dist:dist.bzl", "copy_to_dist_dir")

def define_modules(target, variant):
    tv = "{}_{}".format(target, variant)
    copts = []
    deps = ["//msm-kernel:all_headers"]

    if target in ["pineapple", "fps"]:
       copts.append("-DCONFIG_SEC_NFC_IF_I2C")
       copts.append("-DCONFIG_SEC_NFC_PRODUCT_N5")
       copts.append("-DCONFIG_SEC_NFC_GPIO_CLK_AWAKE")
       deps += ["//vendor/qcom/opensource/securemsm-kernel:smcinvoke_kernel_headers",
                "//vendor/qcom/opensource/securemsm-kernel:{}_smcinvoke_dlkm".format(tv)
       ]

    ddk_module(
        name = "{}_sec_nfc".format(tv),
        out = "sec_nfc.ko",
        srcs = ["samsung/sec_nfc.c",
                "samsung/sec_nfc.h",
                "samsung/wakelock.h",
               ],
        includes = [".", "linux", "nfc"],
        copts = copts,
        deps = deps,
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"]
    )

    copy_to_dist_dir(
        name = "{}_sec_nfc_dist".format(tv),
        data = [":{}_sec_nfc".format(tv)],
        dist_dir = "out/target/product/{}/dlkm/lib/modules/".format(target),
        flat = True,
        wipe_dist_dir = False,
        allow_duplicate_filenames = False,
        mode_overrides = {"**/*": "644"},
    )
