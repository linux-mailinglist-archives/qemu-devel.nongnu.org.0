Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4760E639
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:14:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onjwp-0001k9-AC; Wed, 26 Oct 2022 13:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onjwm-0001EX-Uy; Wed, 26 Oct 2022 13:12:08 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onjwk-0006oB-VX; Wed, 26 Oct 2022 13:12:08 -0400
Received: by mail-oi1-x22d.google.com with SMTP id g10so19395813oif.10;
 Wed, 26 Oct 2022 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fX9eiaZ+o1Aq/CgxkkTgBc6zeWa6GdHSZWLHo+VOCm0=;
 b=l+0F1CILWEhRXe8Yh9aftl2hth++h60OR+ToZ94vOEtnLcMBzrC5Vl+e8f0kBCOvEU
 /bcLm4snT/DUdiJ+Wiyq+WEZ0X2j9PL3eEBiT4blNaC/bQl/tIZYFag20jKPvyyEYD2t
 Ya4PKFUYtUtdtApmN2LI6hIuNnDbiYtDF0qCTC03W1rOxB5sSXgEbY5MvvrinJgfJfeD
 8hygP+vPP3kv9Bb1myS0Dgi1qkQSXW/XZeTJAMr+zgQGGYP/laQREqsnhqe+xMITXiFi
 bVmoqnKWU9H+tpRZkP3i4ewll4mrrAprbUuWr40PIAeK5RoT7nkZbM4hOXfO49PJpu/L
 +J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fX9eiaZ+o1Aq/CgxkkTgBc6zeWa6GdHSZWLHo+VOCm0=;
 b=sZtyREl3IrDap1PNMEL2eWQBf1hAFpHkr82ddwCyzPNv2M85bfqv9+OZ/IiDhUrXsR
 XRpIH5M4SHq4Rb28Sb0cr9pKf2f8he2XW/PV9JZhmfw7xkeM6LIqynZM6wwTqCNIHoSJ
 MngFtpzlMCvHwdbY5JfAdrckPwUwI3+CnRSDJ7VYG+2GEiTPWMt2oTeCBxmUXpHVmIHv
 qg8LPO59BaYNXVPSa2C3whro8qtHPe0YZ9LLI5Icq2GAL4iEnT698anlWnzxc6KzJ5e9
 F9sA2rbhrUIYkTPmLw9MNYp/28ufH0ueAWTTRZ9r8W0DGBhnkSHuzaaGDbkHK7mXzGDT
 xQ5Q==
X-Gm-Message-State: ACrzQf3cSp/9SRqVFO4jr/hVx0o5zcwHDeVWzx9VdBNNwhdguow9lMl+
 Bk43V0cN6iqp8RmyhylvUi8=
X-Google-Smtp-Source: AMsMyM6ofh+YyPxnSHli1yWjWWRwTLwr25MUojbsGxUSBaLXlVzRsOibytgPnf7q5XhPWZhlGueVAA==
X-Received: by 2002:a05:6808:3087:b0:354:badb:8238 with SMTP id
 bl7-20020a056808308700b00354badb8238mr2523447oib.90.1666804323647; 
 Wed, 26 Oct 2022 10:12:03 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a056808056b00b00342ded07a75sm2260669oig.18.2022.10.26.10.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 10:12:03 -0700 (PDT)
Message-ID: <6cdd1223-eeaa-ae12-2371-93d73f7c0163@gmail.com>
Date: Wed, 26 Oct 2022 14:11:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 7/7] hw/ppc/e500: Add Freescale eSDHC to e500plat
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-8-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221018210146.193159-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/18/22 18:01, Bernhard Beschow wrote:
> Adds missing functionality to e500plat machine which increases the
> chance of given "real" firmware images to access SD cards.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/system/ppc/ppce500.rst | 12 ++++++++++++
>   hw/ppc/Kconfig              |  1 +
>   hw/ppc/e500.c               | 35 ++++++++++++++++++++++++++++++++++-
>   hw/ppc/e500.h               |  1 +
>   hw/ppc/e500plat.c           |  1 +
>   5 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index 38f8ceb0cf..c9fe0915dc 100644
> --- a/docs/system/ppc/ppce500.rst
> +++ b/docs/system/ppc/ppce500.rst
> @@ -19,6 +19,7 @@ The ``ppce500`` machine supports the following devices:
>   * Power-off functionality via one GPIO pin
>   * 1 Freescale MPC8xxx PCI host controller
>   * VirtIO devices via PCI bus
> +* 1 Freescale Enhanced Secure Digital Host controller (eSDHC)
>   * 1 Freescale Enhanced Triple Speed Ethernet controller (eTSEC)
>   
>   Hardware configuration information
> @@ -181,3 +182,14 @@ as follows:
>         -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
>         -append "rootwait root=/dev/mtdblock0"
>   
> +Alternatively, the root file system can also reside on an emulated SD card
> +whose size must again be a power of two:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
> +      -display none -serial stdio \
> +      -kernel vmlinux \
> +      -device sd-card,drive=mydrive \
> +      -drive id=mydrive,if=none,file=/path/to/rootfs.ext2,format=raw \
> +      -append "rootwait root=/dev/mmcblk0"
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 769a1ead1c..6e31f568ba 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -129,6 +129,7 @@ config E500
>       select PFLASH_CFI01
>       select PLATFORM_BUS
>       select PPCE500_PCI
> +    select SDHCI
>       select SERIAL
>       select MPC_I2C
>       select FDT_PPC
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 73198adac8..15d1f5ea00 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -48,6 +48,7 @@
>   #include "hw/net/fsl_etsec/etsec.h"
>   #include "hw/i2c/i2c.h"
>   #include "hw/irq.h"
> +#include "hw/sd/sdhci.h"
>   
>   #define EPAPR_MAGIC                (0x45504150)
>   #define DTC_LOAD_PAD               0x1800000
> @@ -66,11 +67,14 @@
>   #define MPC8544_SERIAL1_REGS_OFFSET 0x4600ULL
>   #define MPC8544_PCI_REGS_OFFSET    0x8000ULL
>   #define MPC8544_PCI_REGS_SIZE      0x1000ULL
> +#define MPC85XX_ESDHC_REGS_OFFSET  0x2e000ULL
> +#define MPC85XX_ESDHC_REGS_SIZE    0x1000ULL
>   #define MPC8544_UTIL_OFFSET        0xe0000ULL
>   #define MPC8XXX_GPIO_OFFSET        0x000FF000ULL
>   #define MPC8544_I2C_REGS_OFFSET    0x3000ULL
>   #define MPC8XXX_GPIO_IRQ           47
>   #define MPC8544_I2C_IRQ            43
> +#define MPC85XX_ESDHC_IRQ          72
>   #define RTC_REGS_OFFSET            0x68
>   
>   #define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
> @@ -203,6 +207,22 @@ static void dt_i2c_create(void *fdt, const char *soc, const char *mpic,
>       g_free(i2c);
>   }
>   
> +static void dt_sdhc_create(void *fdt, const char *parent, const char *mpic)
> +{
> +    hwaddr mmio = MPC85XX_ESDHC_REGS_OFFSET;
> +    hwaddr size = MPC85XX_ESDHC_REGS_SIZE;
> +    int irq = MPC85XX_ESDHC_IRQ;
> +    g_autofree char *name = NULL;
> +
> +    name = g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
> +    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
> +    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
> +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
> +    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
> +}
>   
>   typedef struct PlatformDevtreeData {
>       void *fdt;
> @@ -553,6 +573,10 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>   
>       dt_rtc_create(fdt, "i2c", "rtc");
>   
> +    /* sdhc */
> +    if (pmc->has_esdhc) {
> +        dt_sdhc_create(fdt, soc, mpic);
> +    }
>   
>       gutil = g_strdup_printf("%s/global-utilities@%llx", soc,
>                               MPC8544_UTIL_OFFSET);
> @@ -982,7 +1006,8 @@ void ppce500_init(MachineState *machine)
>                          0, qdev_get_gpio_in(mpicdev, 42), 399193,
>                          serial_hd(1), DEVICE_BIG_ENDIAN);
>       }
> -        /* I2C */
> +
> +    /* I2C */
>       dev = qdev_new("mpc-i2c");
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
> @@ -992,6 +1017,14 @@ void ppce500_init(MachineState *machine)
>       i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
>       i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
>   
> +    /* eSDHC */
> +    if (pmc->has_esdhc) {
> +        dev = qdev_new(TYPE_FSL_ESDHC);
> +        s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +        sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
> +        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
> +    }
>   
>       /* General Utility device */
>       dev = qdev_new("mpc8544-guts");
> diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
> index 68f754ce50..8c09ef92e4 100644
> --- a/hw/ppc/e500.h
> +++ b/hw/ppc/e500.h
> @@ -27,6 +27,7 @@ struct PPCE500MachineClass {
>   
>       int mpic_version;
>       bool has_mpc8xxx_gpio;
> +    bool has_esdhc;
>       hwaddr platform_bus_base;
>       hwaddr platform_bus_size;
>       int platform_bus_first_irq;
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index 5bb1c603da..44bf874b0f 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -86,6 +86,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
>       pmc->fixup_devtree = e500plat_fixup_devtree;
>       pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_42;
>       pmc->has_mpc8xxx_gpio = true;
> +    pmc->has_esdhc = true;
>       pmc->platform_bus_base = 0xf00000000ULL;
>       pmc->platform_bus_size = 128 * MiB;
>       pmc->platform_bus_first_irq = 5;

