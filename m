Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F343450F4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 21:39:08 +0100 (CET)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lORKM-0004Q6-Sa
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 16:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lORHw-00038l-J3; Mon, 22 Mar 2021 16:36:36 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lORHs-0004tg-V3; Mon, 22 Mar 2021 16:36:36 -0400
Received: by mail-io1-xd34.google.com with SMTP id n21so15377013ioa.7;
 Mon, 22 Mar 2021 13:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdzcd17w02nFW6OSyJ1t3QvINzfm5kR+CItYNa7a2zU=;
 b=e5kEDQ/bM3HXRAc+IME07ofoigQmjY2zDG5kymfxqNUgWwfeFQA1LdwVEW87vlSMUf
 bhjOE8DpjgDCtyXsT7gSET3ssYsE15jlvRcsiNSCoZl6qIPGCqPAv+doiKpcVOagdmt7
 ryb3leMZQR1CkxJ1+AQOuoO1tWCuViOcIrKIXo3biE/6TM1NbbHOmmiBaN4BPE6lLvSC
 32XASJC4x6d6LaW/NOHQ2H0jmEe5LTlqA2RVSwh32uZXMGxURKi0+WU2CGLdjw86OGYF
 xUfJNm28iZe6Nmob+leSFEsEwINMxEblBA3xZ8/ge1Ac0lZdJ2bSlo98oryBBT3h9fk8
 2Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdzcd17w02nFW6OSyJ1t3QvINzfm5kR+CItYNa7a2zU=;
 b=lQ96fS3qGw5MXN5LtaL+yvjQjTcxW6ozxgGSHWdFSPie21owBu1LXvsH2PyiJVTnAT
 e2aIs9fSaTtD8SvmJ8v3JqS5A5vpKzQL6Aa7ok+bb+ug0s9JY1FncaIIEfCDUETDKMFz
 uPgJOCfYk6BwPFDJi24r9eGlMfUw65IFBz2Y5VM1nuS6PZFjjfei+Lr9rYo71ouUycnQ
 5DDYPPLQk3f0jA46gvnPgKrbkWXK4tGeLEtny7732xJZweBRw7Wd8X+jPfw2mup8qtBu
 iL39MMrRc5Z3no6UYLJcHXfXNBgmH5fITuOkkRa77ux0dT7S8muTxbzE2bms3Xlloa11
 qxFg==
X-Gm-Message-State: AOAM531MfRHss6gp9ooAAISpjPvg81sUcXml1Vc8HNmEcsZPnIdF5p6g
 VzwYETuDVsOu3k3BnGR5spfggdD6LpAlM13ywLM=
X-Google-Smtp-Source: ABdhPJyT9aDuYO+E7yNBIR5mspjZAonxm44AKz6mascR/E1yexmfcXrYhzZEfbyh9VG1e36U5VWFCp5Acc/mhDmjFCI=
X-Received: by 2002:a05:6638:224e:: with SMTP id
 m14mr1205943jas.8.1616445391459; 
 Mon, 22 Mar 2021 13:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210322075248.136255-1-bmeng.cn@gmail.com>
 <20210322075248.136255-2-bmeng.cn@gmail.com>
In-Reply-To: <20210322075248.136255-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 16:34:36 -0400
Message-ID: <CAKmqyKNS6mjc4DHNhc5j6YLOP=Z=9cYPgHGvDU5apA-h6CS96g@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system: riscv: Add documentation for
 'microchip-icicle-kit' machine
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 3:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the documentation to describe what is supported for the
> 'microchip-icicle-kit' machine, and how to boot the machine in QEMU.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/microchip-icicle-kit.rst | 89 ++++++++++++++++++++++
>  docs/system/target-riscv.rst               |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 docs/system/riscv/microchip-icicle-kit.rst
>
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> new file mode 100644
> index 0000000000..4fe97bce3f
> --- /dev/null
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -0,0 +1,89 @@
> +Microchip PolarFire SoC Icicle Kit (``microchip-icicle-kit``)
> +=============================================================
> +
> +Microchip PolarFire SoC Icicle Kit integrates a PolarFire SoC, with one
> +SiFive's E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> +
> +For more details about Microchip PolarFire SoC, please see:
> +https://www.microsemi.com/product-directory/soc-fpgas/5498-polarfire-soc-fpga
> +
> +The Icicle Kit board information can be found here:
> +https://www.microsemi.com/existing-parts/parts/152514
> +
> +Supported devices
> +-----------------
> +
> +The ``microchip-icicle-kit`` machine supports the following devices:
> +
> + * 1 E51 core
> + * 4 U54 cores
> + * Core Level Interruptor (CLINT)
> + * Platform-Level Interrupt Controller (PLIC)
> + * L2 Loosely Integrated Memory (L2-LIM)
> + * DDR memory controller
> + * 5 MMUARTs
> + * 1 DMA controller
> + * 2 GEM Ethernet controllers
> + * 1 SDHC storage controller
> +
> +Boot options
> +------------
> +
> +The ``microchip-icicle-kit`` machine can start using the standard -bios
> +functionality for loading its BIOS image, aka Hart Software Services (HSS_).
> +HSS loads the second stage bootloader U-Boot from an SD card. It does not
> +support direct kernel loading via the -kernel option. One has to load kernel
> +from U-Boot.
> +
> +The memory is set to 1537 MiB by default which is the minimum required high
> +memory size by HSS. A sanity check on ram size is performed in the machine
> +init routine to prompt user to increase the RAM size to > 1537 MiB when less
> +than 1537 MiB ram is detected.
> +
> +Boot the machine
> +----------------
> +
> +HSS 2020.12 release is tested at the time of writing. To build an HSS image
> +that can be booted by the ``microchip-icicle-kit`` machine, type the following
> +in the HSS source tree:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=riscv64-linux-
> +  $ cp boards/mpfs-icicle-kit-es/def_config .config
> +  $ make BOARD=mpfs-icicle-kit-es
> +
> +Download the official SD card image released by Microchip and prepare it for
> +QEMU usage:
> +
> +.. code-block:: bash
> +
> +  $ wget ftp://ftpsoc.microsemi.com/outgoing/core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
> +  $ gunzip core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
> +  $ qemu-img resize core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic 4G
> +
> +Then we can boot the machine by:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
> +      -bios path/to/hss.bin -sd path/to/sdcard.img \
> +      -nic user,model=cadence_gem \
> +      -nic tap,ifname=tap,model=cadence_gem,script=no \
> +      -display none -serial stdio \
> +      -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
> +      -serial chardev:serial1
> +
> +With above command line, current terminal session will be used for the first
> +serial port. Open another terminal window, and use `minicom` to connect the
> +second serial port.
> +
> +.. code-block:: bash
> +
> +  $ minicom -D unix\#serial1.sock
> +
> +HSS output is on the first serial port (stdio) and U-Boot outputs on the
> +second serial port. U-Boot will automatically load the Linux kernel from
> +the SD card image.
> +
> +.. _HSS: https://github.com/polarfire-soc/hart-software-services
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 94d99c4c82..8d5946fbbb 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -66,6 +66,7 @@ undocumented; you can get a complete list by running
>  .. toctree::
>     :maxdepth: 1
>
> +   riscv/microchip-icicle-kit
>     riscv/sifive_u
>
>  RISC-V CPU features
> --
> 2.25.1
>
>

