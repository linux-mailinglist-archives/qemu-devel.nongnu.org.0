Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788F5BB039
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:30:59 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDIw-0006Ad-1Q
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZDEv-00022w-Lg; Fri, 16 Sep 2022 11:26:52 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZDEt-0008CI-NR; Fri, 16 Sep 2022 11:26:49 -0400
Received: by mail-qt1-x833.google.com with SMTP id g23so11644332qtu.2;
 Fri, 16 Sep 2022 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yhHskut9jZ/vz8JVLdu41iPpCu7Rdg7wRKnjxE1D3DE=;
 b=arkYcnm5nh8bVxJcaJfMofiBCqoNym9c4YUogvwbdvES8eYfcea7bdsybHtvCeHSht
 e6zTGx6rItn+z1Sw5QnE1/6TtgmzwvJtD9RBEy8W1VT23cWRbeUFSns44TJTLWIdnQje
 sM5AKThga5W4aWjEYAwHu+1beHPD9WArfdfPaj/syuhU2XwrorUm9ZUan5zusTps4xZM
 822psRfRChIl8z7Tn9TCzg7lweHTRLwPotXasB0l4bwGdddCN9GpccaK5Ch35Td3s4VF
 3YeXuvzQKWlzXAEwojiRCDxcObyyOFxm0lhIu/pKComVMKvQP0QBY8IjoxkecTgSqFCW
 gTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yhHskut9jZ/vz8JVLdu41iPpCu7Rdg7wRKnjxE1D3DE=;
 b=3B1wc3KU1jNW5DILNiLT7ADPJrBxJAzZZiw/C8jRZHqp9vew5h5Z3v6tj+hFWftYb2
 IUc27vpC3CVGlcnyFXnj1IvshQjEInk+1BEm4Ufkowg9jkDZ94s7DjLK5THFocMWBZ1u
 zg78/GIUb1tCTyIIm6l/oEk5WLAgEvvYN6zLCOQNknjsnX+dTqX1CrPTRarSHO1AD63l
 WkVi1eXc1HB+1QLt9nH9mdRh9R9pqHrgOV86RrwFIw106GzWbOJbbcBaAXNR4wdeCT6j
 L4J1iRil32zU4hF7mcXKcpWLyhzDYipe/7+mXIs/ucQLs6WoOUT2Rus8rW8Knq6UYnse
 3BjQ==
X-Gm-Message-State: ACrzQf2I3w1thVFq1/z+BY5foM1ev35aeTlcyIkKZrk/mK/FvZIDbPUk
 /5vzdwur59DEDs+q9ZFJfD0BFjJutgGpu3liC7A=
X-Google-Smtp-Source: AMsMyM6G5WFl3x01/RKozR0uuPIRNha+cXCUQ1AAT2RYlGM8spuTGZvvJlEysd5ZAwH/ofCMyNtdMMzH3lWRz0cnTgE=
X-Received: by 2002:ac8:5f47:0:b0:35c:cdc8:7e0f with SMTP id
 y7-20020ac85f47000000b0035ccdc87e0fmr3315345qta.543.1663342005835; Fri, 16
 Sep 2022 08:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-12-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-12-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 23:26:34 +0800
Message-ID: <CAEUhbmXroQ7KcG3Cvb73vV0hFm8vsY-9NVCFrx8jZQuu9MY3rg@mail.gmail.com>
Subject: Re: [PATCH 11/11] hw/ppc/e500: Add Freescale eSDHC to e500 boards
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 15, 2022 at 11:30 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Adds missing functionality to emulated e500 SOCs which increases the
> chance of given "real" firmware images to access SD cards.

By "firmware" do you mean U-Boot?

>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/ppc/ppce500.rst | 13 +++++++++++++
>  hw/ppc/Kconfig              |  1 +
>  hw/ppc/e500.c               | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index c3f55c6f3d..50b199c8f3 100644
> --- a/docs/system/ppc/ppce500.rst
> +++ b/docs/system/ppc/ppce500.rst
> @@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
>  * Power-off functionality via one GPIO pin
>  * 1 Freescale MPC8xxx PCI host controller
>  * VirtIO devices via PCI bus
> +* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
>  * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
>
>  Hardware configuration information
> @@ -131,6 +132,18 @@ be used as follows:
>        -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
>        -append "rootwait root=/dev/mtdblock0"
>
> +Alternatively, the root file system can also reside on an emulated SD card
> +whose size must again be a power of two:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \

qemu-system-ppc{64|32}

> +      -display none -serial stdio \
> +      -kernel vmlinux \
> +      -device sd-card,drive=mydrive \
> +      -drive id=mydrive,if=none,file=/path/to/rootfs.ext2,format=raw \
> +      -append "rootwait root=/dev/mmcblk0"
> +
>  Running U-Boot
>  --------------
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 769a1ead1c..6e31f568ba 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -129,6 +129,7 @@ config E500
>      select PFLASH_CFI01
>      select PLATFORM_BUS
>      select PPCE500_PCI
> +    select SDHCI
>      select SERIAL
>      select MPC_I2C
>      select FDT_PPC
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7843a4e04b..87a03fd4a9 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -48,6 +48,7 @@
>  #include "hw/net/fsl_etsec/etsec.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/irq.h"
> +#include "hw/sd/sdhci.h"
>
>  #define EPAPR_MAGIC                (0x45504150)
>  #define DTC_LOAD_PAD               0x1800000
> @@ -66,11 +67,14 @@
>  #define MPC8544_SERIAL1_REGS_OFFSET 0x4600ULL
>  #define MPC8544_PCI_REGS_OFFSET    0x8000ULL
>  #define MPC8544_PCI_REGS_SIZE      0x1000ULL
> +#define MPC85XX_ESDHC_REGS_OFFSET  0x2e000ULL
> +#define MPC85XX_ESDHC_REGS_SIZE    0x1000ULL
>  #define MPC8544_UTIL_OFFSET        0xe0000ULL
>  #define MPC8XXX_GPIO_OFFSET        0x000FF000ULL
>  #define MPC8544_I2C_REGS_OFFSET    0x3000ULL
>  #define MPC8XXX_GPIO_IRQ           47
>  #define MPC8544_I2C_IRQ            43
> +#define MPC85XX_ESDHC_IRQ          72
>  #define RTC_REGS_OFFSET            0x68
>
>  #define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
> @@ -203,6 +207,25 @@ static void dt_i2c_create(void *fdt, const char *soc, const char *mpic,
>      g_free(i2c);
>  }
>
> +static void dt_sdhc_create(void *fdt, const char *parent, const char *mpic)
> +{
> +    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
> +    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
> +    int irq = MPC85XX_ESDHC_IRQ;
> +    char *name;
> +
> +    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
> +    qemu_fdt_add_subnode(fdt, name);
> +    /* qemu_fdt_setprop_cells(fdt, name, "voltage-ranges", 3300, 3300); */

Drop it if it is useless

> +    qemu_fdt_setprop_cells(fdt, name, "clock-frequency", 167000000);

Is this an arbitrary frequency?

> +    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
> +    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
> +    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
> +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
> +    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
> +    g_free(name);
> +}
>
>  typedef struct PlatformDevtreeData {
>      void *fdt;
> @@ -556,6 +579,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>
>      dt_rtc_create(fdt, "i2c", "rtc");
>
> +    /* sdhc */
> +    dt_sdhc_create(fdt, soc, mpic);
>
>      gutil = g_strdup_printf("%s/global-utilities@%llx", soc,
>                              MPC8544_UTIL_OFFSET);
> @@ -996,6 +1021,13 @@ void ppce500_init(MachineState *machine)
>      i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
>
>

nits: use one line for the separation

> +    /* eSDHC */
> +    dev = qdev_new(TYPE_FSL_ESDHC);
> +    s = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
> +
>      /* General Utility device */
>      dev = qdev_new("mpc8544-guts");
>      s = SYS_BUS_DEVICE(dev);
> --

Regards,
Bin

