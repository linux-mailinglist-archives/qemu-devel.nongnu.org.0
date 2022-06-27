Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1A55B7BE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 07:27:09 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5hHA-0003nG-8Q
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 01:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5hFk-00035c-Oq
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 01:25:41 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5hFf-0007DZ-0Z
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 01:25:39 -0400
Received: by mail-pg1-x533.google.com with SMTP id q140so8085903pgq.6
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3MA+xy8NjDefcdphVEfP3segevXjm2DfA82pGauQtA=;
 b=QkK03AGGZR8TEDSREoPbNNRogl5CadQ9hb7+Pn6C3wolRXbxfL495v6rzGihjmKjvK
 jGILM4Axf9u2AtfVlfoiLAdQPS8A1KvfK7fVBy/FxV3NNLj+Uo668zeq9ko+IcXVbDJ5
 T+P7lKgJhtPD9BIvRkiVojM6m4D++0aBObT7BiMzhrgAR2imOufialjfiuXLUZMDHGQ3
 y8cVpLa1O5o41jxnjW8Ct2aoDSIUUsfskmJhhKi99bxF/tnkU/oyIOmNFVb1FrS/0DIX
 qp9k2bkM2v7CPiGrX0ZLG4pIX1M+LV3B3RFQVzj4l7fGB/Dut93bY0NkGd3V26qLdahQ
 7p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3MA+xy8NjDefcdphVEfP3segevXjm2DfA82pGauQtA=;
 b=gPbiQ2Xs2PeTgQ7oKqIgJRjqz86gVM6jTNiR5If8PfnPneg9avYh4AHn0u4FmNGOe2
 C2wua4msOPUNs/wgi8haW37+8wh76FhPwM9olRjg3XdKMfES1kTb2NAp/joT6FpuPyUt
 BP0sJYn7b5qPCBm5xOQNAI99nNT3anhQzc4/gsNfJcCsv+/ng4nM5lKr8D3Gssp6xW36
 KKYna+7lPANI9SSOlDblhkFUGfECIHgPXQ/CoQWT0B5Y3QkxeQ/E2cxcB/79PXuUR6dy
 uFLKrp9zANlZRdtJNQs81guj8cuSXp4uODrCYAndi5RS1hJVLK7WZ6yG5oV5cbwfkNog
 WZbA==
X-Gm-Message-State: AJIora+IfWHGkckniOnXdOfD/Ac8FdlOL1a5jUwaPqdKmLorkoSByuCe
 vMWbH7M+XMj6SxNFLkRI6eqKQwSzCmh+3sFDXBnPfrnMaVo=
X-Google-Smtp-Source: AGRyM1uPFTf7/p4w6T7pu9UV7NPfx7L7BGoDnY+F329m3XxxzpqN0Ci2nx/3q4ULhTRDWLAl7Aj3frDtDNcx4W+6VQA=
X-Received: by 2002:a63:4d5:0:b0:40d:77fd:cff8 with SMTP id
 204-20020a6304d5000000b0040d77fdcff8mr11143349pge.361.1656307526773; Sun, 26
 Jun 2022 22:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
In-Reply-To: <20220625223458.1273408-1-simon.sapin@exyr.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 15:25:00 +1000
Message-ID: <CAKmqyKOtnwVJE1+Gmkb+qNjhzqm4roxAf1e-16Mrk1-_ZXuaXQ@mail.gmail.com>
Subject: Re: [PATCH] Add some documentation for "dtb" devices tree blobs
To: Simon Sapin <simon.sapin@exyr.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 26, 2022 at 8:40 AM Simon Sapin <simon.sapin@exyr.org> wrote:
>
> Signed-off-by: Simon Sapin <simon.sapin@exyr.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/specs/device-trees.rst                | 57 ++++++++++++++++++++++
>  docs/specs/index.rst                       |  1 +
>  docs/system/arm/virt.rst                   |  5 +-
>  docs/system/arm/xlnx-versal-virt.rst       |  3 +-
>  docs/system/ppc/ppce500.rst                |  3 +-
>  docs/system/riscv/microchip-icicle-kit.rst |  3 +-
>  docs/system/riscv/sifive_u.rst             |  3 +-
>  docs/system/riscv/virt.rst                 |  3 +-
>  qemu-options.hx                            |  5 ++
>  9 files changed, 77 insertions(+), 6 deletions(-)
>  create mode 100644 docs/specs/device-trees.rst
>
> diff --git docs/specs/device-trees.rst docs/specs/device-trees.rst
> new file mode 100644
> index 0000000000..8160342124
> --- /dev/null
> +++ docs/specs/device-trees.rst
> @@ -0,0 +1,57 @@
> +============
> +Device Trees
> +============
> +
> +On some targets, guests can find out what devices are emulated and how to access them
> +through a *Device Tree Blob* (dtb), also called *Flattened Device Tree* (fdt).
> +The dtb can be passed by the user through the ``-dtb file`` command-line options,
> +or automatically generated by QEMU.
> +
> +Host: dumping the dtb
> +=====================
> +
> +The (possibly generated) dtb can be written to a file with
> +the ``dumpdtb`` property of the ``machine`` command-line option.
> +Then `dtc <Device Tree Compiler_>`_ can convert it to Device Tree Source text "dts" format
> +For example::
> +
> +    qemu-system-riscv32 -machine virt,dumpdtb=rv32-virt.dtb
> +    dtc -q rv32-virt.dtb -o rv32-virt.dts
> +    head -n 7 rv32-virt.dts
> +
> +::
> +
> +    qemu-system-riscv32: info: dtb dumped to rv32-virt.dtb. Exiting.
> +    /dts-v1/;
> +
> +    / {
> +        #address-cells = <0x02>;
> +        #size-cells = <0x02>;
> +        compatible = "riscv-virtio";
> +        model = "riscv-virtio,qemu";
> +
> +Guest: finding the dtb
> +======================
> +
> +On startup, the dtb is memory-mapped and its address is passed to the guest
> +in a target-specific way:
> +
> +* Arm: :ref:`arm-baremetal`
> +* **TODO**: document other targets
> +
> +Resources
> +=========
> +
> +* `Devicetree Specification <https://www.devicetree.org/specifications/>`_.
> +
> +* Embedded Linux Wiki:
> +
> +  - `Device Tree: What It Is <https://elinux.org/Device_Tree_What_It_Is>`_
> +  - `Device Tree Usage <https://elinux.org/Device_Tree_Usage>`_
> +
> +* `Device Tree Compiler <https://git.kernel.org/pub/scm/utils/dtc/dtc.git>`_:
> +
> +  - ``dtc`` CLI tool (package name might be ``device-tree-compiler``)
> +  - ``libfdt`` C library
> +
> +* ``fdt`` `Rust library <https://crates.io/crates/fdt>`_
> diff --git docs/specs/index.rst docs/specs/index.rst
> index a58d9311cb..3bd69305e2 100644
> --- docs/specs/index.rst
> +++ docs/specs/index.rst
> @@ -8,6 +8,7 @@ guest hardware that is specific to QEMU.
>  .. toctree::
>     :maxdepth: 2
>
> +   device-trees
>     ppc-xive
>     ppc-spapr-xive
>     ppc-spapr-numa
> diff --git docs/system/arm/virt.rst docs/system/arm/virt.rst
> index 3d1058a80c..04a90df613 100644
> --- docs/system/arm/virt.rst
> +++ docs/system/arm/virt.rst
> @@ -153,10 +153,13 @@ need::
>    CONFIG_DRM=y
>    CONFIG_DRM_VIRTIO_GPU=y
>
> +.. _arm-baremetal:
> +
>  Hardware configuration information for bare-metal programming
>  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
>
> -The ``virt`` board automatically generates a device tree blob ("dtb")
> +The ``virt`` board automatically generates a
> +:doc:`device tree blob ("dtb") </specs/device-trees>`
>  which it passes to the guest. This provides information about the
>  addresses, interrupt lines and other configuration of the various devices
>  in the system. Guest code can rely on and hard-code the following
> diff --git docs/system/arm/xlnx-versal-virt.rst docs/system/arm/xlnx-versal-virt.rst
> index 92ad10d2da..3387c74bfa 100644
> --- docs/system/arm/xlnx-versal-virt.rst
> +++ docs/system/arm/xlnx-versal-virt.rst
> @@ -53,7 +53,8 @@ to use the ``-kernel`` command line option.
>
>  Users can load firmware or boot-loaders with the ``-device loader`` options.
>
> -When loading an OS, QEMU generates a DTB and selects an appropriate address
> +When loading an OS, QEMU generates a :doc:`DTB </specs/device-trees>`
> +and selects an appropriate address
>  where it gets loaded. This DTB will be passed to the kernel in register x0.
>
>  If there's no ``-kernel`` option, we generate a DTB and place it at 0x1000
> diff --git docs/system/ppc/ppce500.rst docs/system/ppc/ppce500.rst
> index 9beef39171..24fd91a084 100644
> --- docs/system/ppc/ppce500.rst
> +++ docs/system/ppc/ppce500.rst
> @@ -24,7 +24,8 @@ The ``ppce500`` machine supports the following devices:
>  Hardware configuration information
>  ----------------------------------
>
> -The ``ppce500`` machine automatically generates a device tree blob ("dtb")
> +The ``ppce500`` machine automatically generates a
> +:doc:`device tree blob ("dtb") </specs/device-trees>`
>  which it passes to the guest, if there is no ``-dtb`` option. This provides
>  information about the addresses, interrupt lines and other configuration of
>  the various devices in the system.
> diff --git docs/system/riscv/microchip-icicle-kit.rst docs/system/riscv/microchip-icicle-kit.rst
> index 40798b1aae..a6c8b46263 100644
> --- docs/system/riscv/microchip-icicle-kit.rst
> +++ docs/system/riscv/microchip-icicle-kit.rst
> @@ -37,7 +37,8 @@ can be loaded from U-Boot. It also supports direct kernel booting via the
>  boot is used, the OpenSBI fw_dynamic BIOS image is used to boot a payload
>  like U-Boot or OS kernel directly.
>
> -The user provided DTB should have the following requirements:
> +The user provided :doc:`DTB </specs/device-trees>`
> +should have the following requirements:
>
>  * The /cpus node should contain at least one subnode for E51 and the number
>    of subnodes should match QEMU's ``-smp`` option
> diff --git docs/system/riscv/sifive_u.rst docs/system/riscv/sifive_u.rst
> index 7b166567f9..fd70ee8278 100644
> --- docs/system/riscv/sifive_u.rst
> +++ docs/system/riscv/sifive_u.rst
> @@ -36,7 +36,8 @@ testing of 32-bit guest software.
>  Hardware configuration information
>  ----------------------------------
>
> -The ``sifive_u`` machine automatically generates a device tree blob ("dtb")
> +The ``sifive_u`` machine automatically generates a
> +:doc:`device tree blob ("dtb") </specs/device-trees>`
>  which it passes to the guest, if there is no ``-dtb`` option. This provides
>  information about the addresses, interrupt lines and other configuration of
>  the various devices in the system. Guest software should discover the devices
> diff --git docs/system/riscv/virt.rst docs/system/riscv/virt.rst
> index f8ecec95f3..81ea53eb20 100644
> --- docs/system/riscv/virt.rst
> +++ docs/system/riscv/virt.rst
> @@ -30,7 +30,8 @@ declaring.
>  Hardware configuration information
>  ----------------------------------
>
> -The ``virt`` machine automatically generates a device tree blob ("dtb")
> +The ``virt`` machine automatically generates a
> +:doc:`device tree blob ("dtb") </specs/device-trees>`
>  which it passes to the guest, if there is no ``-dtb`` option. This provides
>  information about the addresses, interrupt lines and other configuration of
>  the various devices in the system. Guest software should discover the devices
> diff --git qemu-options.hx qemu-options.hx
> index 377d22fbd8..eea75ddb37 100644
> --- qemu-options.hx
> +++ qemu-options.hx
> @@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                hmat=on|off controls ACPI HMAT support (default=off)\n"
>      "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
>      "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
> +    "                dumpdtb=file dump current device tree blob to a file and quit\n"
>      QEMU_ARCH_ALL)
>  SRST
>  ``-machine [type=]name[,prop=value[,...]]``
> @@ -157,6 +158,10 @@ SRST
>          ::
>
>              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
> +
> +    ``dumpdtb=file``
> +        Dump the current :doc:`Device Tree Blob </specs/device-trees>`
> +        to the give file name, then exit.
>  ERST
>
>  DEF("M", HAS_ARG, QEMU_OPTION_M,
> --
> 2.36.1
>
>

