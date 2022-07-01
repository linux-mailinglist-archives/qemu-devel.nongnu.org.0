Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B75630E2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:02:36 +0200 (CEST)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DTs-0008V4-IM
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DQH-0006hT-RR
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:58:50 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7DQF-0005he-LP
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:58:49 -0400
Received: by mail-yb1-xb31.google.com with SMTP id p136so3166142ybg.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GO0JIO1yjmmS9l98olJgRUIaAVK6DuAbvlta72061ck=;
 b=tJHScf8uQ27eB38JxgAsSg1ZBpBxwPvygxNkBvzs5SWE+lFUL0rT/V+7U7KdStT7XO
 0AtoOO99XaNR2fa325XtM2zYQ4MQ8z9f66KupGWo24iM1jytEjLJke0rPAgJsT03/kGF
 iOvFlpq1IF71jb2XkY2AtukwMkLWRIfGoCGJUFFlgFnIVGq18tVTZbq1GP8ZfUzB2iJc
 DlNOG08lsn3scZhExPSBc7q3tEpyRFKcOoiJg8i2q0/37cOZ4+PdZKyRJBOzAVRcrAkO
 TjIbL+jrpnTzm1M17vo5CZNWeyjV6X1eHuhJ/LQjVrVl9sAkwVAVqw43S1PvOEcQTONO
 Airw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GO0JIO1yjmmS9l98olJgRUIaAVK6DuAbvlta72061ck=;
 b=wyxGljrf7GTtNlWp9Mwf17sTfIqV+xzYrewMfRbhiZC3Je2tMRVZNTIRAcEGkbf1n9
 g1jSmArcA54gVn8cDW9yl36heFegZaD/lD2yafgAZZNm/zXkFYTfJy6y+d91efwknX8t
 c2UfMmvFsONs2uM8jDKfAGJ6SBIHGSdwaKJX3RudfRFuwTboUX7DMvUd6QpHNMwEWBdF
 iICA8LtLlN/IxPk+J6AGJ13YYgZwSlMG3/tX0j9gYzOhD0CCFi8vki/qRDCzaO8fpAao
 2nhhi2hulUSPOran7XX6RJTAQlNcNYVYccuYpD1tkZyl0/vQ+2lqHAEblXTnNkuihPog
 o5XA==
X-Gm-Message-State: AJIora8WKcARpFolJbMR+8uA0vS5/7oNrhuUZh0atF36CT0/KHx6GbkB
 FsT2Hdja1W2cJV5b9sb0FV8Gn3ff+TxbUjgW5Ug3ow==
X-Google-Smtp-Source: AGRyM1u1nOaqAZKCxBhrmq9CtwzzS3fJXLBtvSQq89XjKTPFWBvfSs3CPK+qXBawl3oWucoN2yArFdCflOtnJwatAl0=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr13902229ybr.39.1656669526115; Fri, 01
 Jul 2022 02:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
In-Reply-To: <20220625223458.1273408-1-simon.sapin@exyr.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 10:58:08 +0100
Message-ID: <CAFEAcA9BzxW8ke_s5c0G2Zt--rHk82TZP6x1diWXe4XKBL84HA@mail.gmail.com>
Subject: Re: [PATCH] Add some documentation for "dtb" devices tree blobs
To: Simon Sapin <simon.sapin@exyr.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 25 Jun 2022 at 23:39, Simon Sapin <simon.sapin@exyr.org> wrote:
>
> Signed-off-by: Simon Sapin <simon.sapin@exyr.org>
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

Hi; thanks for writing this documentation.

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

Don't leave TODO notes in the docs, please.

Also, the DTB is not necessarily memory-mapped. For instance on
Arm platforms if the user requests a bios/firmware image to be
run, then we put the dtb (like the kernel and initrd) in the
fw_cfg device for the firmware to extract.

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

 to the given file name, then exit QEMU without running the guest.
 This is primarily useful for debugging, as it allows you to see the
 contents of the DTB including all additions and modifications that
 QEMU makes before handing it to the guest.

 This option is ignored on machine types which do not use a DTB.

>  ERST
>
>  DEF("M", HAS_ARG, QEMU_OPTION_M,


thanks
-- PMM

