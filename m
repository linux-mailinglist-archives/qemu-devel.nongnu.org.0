Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB35701F04
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 20:40:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyGci-0005wu-8K; Sun, 14 May 2023 14:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGcX-0005wQ-BL; Sun, 14 May 2023 14:39:01 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGcR-0007pS-GV; Sun, 14 May 2023 14:39:00 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-559de1d36a9so171625957b3.1; 
 Sun, 14 May 2023 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684089533; x=1686681533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cijoqt9mP/CJp0LL+Z8/tctR8IE5bClZdtGd7vpXAY0=;
 b=RbPzNlJhNTN1Jee7QiBVQooR7ERrInGhabXjfY8NcDIUOv2rmUMP5eHivWS4ec+ZKq
 vpEJgErFcNiAxKOkFuN3RCC+YHTo4I4NR6nHl/QONsgKSgbrS/QY9GKMlfQ+8Nh5YEyd
 ZYnmSn4GYYAmIvlJ6SxMlzxWA2uWAHU55OWX/G6Uu6XMvoWxl/hSqZBvfsXJEG59etX0
 Ku2uSFOrQHPIRtU4/bUNlAPfCvw06r19S65tCZlsIJ8J/+Gb34V7o934Kk6ox/EoCrCS
 6cENlqNibq3wHhz/KOLxkUhWk9EVDd2Mnlbd0nytYPrRcW9MnQiNkTVWMUR3MmEeisJq
 IwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684089533; x=1686681533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cijoqt9mP/CJp0LL+Z8/tctR8IE5bClZdtGd7vpXAY0=;
 b=MeZwK8qEe9luxzdlYaY0hUrB/lwtQ9Py826aOHHi45tuln4PArlAF+Xo7892wYNKOq
 3/5tSPw6zmC48ikEZXvixlSBd2qtyXs6NGQtUUx5SnUPfxQcznkCySOphdkraL2nAdkt
 4FHkcS/78cimM1uEXe48kcftZDADWeEvS26WlByyP7L7acot45EK5Kt/SO7LWDEIbc0/
 9Bc83VeMmEx8gt1HqLxvZiCHHNFbMBs52iGJ1+7tJuvENQYzBrbJnAPbxf/tgjiwMkDm
 Cgue0greY9Y3L6iuuHNh3SDYf+FuCVr+W++5TWq8rmjt98A0MfUNArOdwy9WS0qcIQSt
 0Enw==
X-Gm-Message-State: AC+VfDxTq4dskXqcHFBpopuXIwmoaV+Ol3bmKFr7PGV9o6pmtB+up26c
 gO3sVo3g6kbgkm7AaS/MoOnRwaFokzQUwoHj8T0=
X-Google-Smtp-Source: ACHHUZ43TJL1PXs5FcG0hma/Wgs4XmWDY5pRoMyfNHwIBZFGVqZUCVK2j62rwp5E+Yea+uEPLeFvX7/PwD5YQe1vJF0=
X-Received: by 2002:a81:8348:0:b0:55b:f05b:d68 with SMTP id
 t69-20020a818348000000b0055bf05b0d68mr33853978ywf.20.1684089533469; Sun, 14
 May 2023 11:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230510103004.30015-1-qianfanguijin@163.com>
 <20230510103004.30015-2-qianfanguijin@163.com>
In-Reply-To: <20230510103004.30015-2-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 14 May 2023 20:38:42 +0200
Message-ID: <CAPan3Wpyq-NQp6_UG0r+ORwUN2pOjQ6wCdnq+L1osgnVZ5yzRw@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] hw: arm: Add bananapi M2-Ultra and allwinner-r40
 support
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000069999705fbaba663"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000069999705fbaba663
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 12:30=E2=80=AFPM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,
> and a Mali400 MP2 GPU from ARM. It's also known as the Allwinner T3
> for In-Car Entertainment usage, A40i and A40pro are variants that
> differ in applicable temperatures range (industrial and military).
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  hw/arm/Kconfig                 |  10 +
>  hw/arm/allwinner-r40.c         | 418 +++++++++++++++++++++++++++++++++
>  hw/arm/bananapi_m2u.c          | 129 ++++++++++
>  hw/arm/meson.build             |   1 +
>  include/hw/arm/allwinner-r40.h | 110 +++++++++
>  5 files changed, 668 insertions(+)
>  create mode 100644 hw/arm/allwinner-r40.c
>  create mode 100644 hw/arm/bananapi_m2u.c
>  create mode 100644 include/hw/arm/allwinner-r40.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d7c457955..b7a84f6e3f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -374,6 +374,16 @@ config ALLWINNER_H3
>      select USB_EHCI_SYSBUS
>      select SD
>
> +config ALLWINNER_R40
> +    bool
> +    default y if TCG && ARM
> +    select ALLWINNER_A10_PIT
> +    select SERIAL
> +    select ARM_TIMER
> +    select ARM_GIC
> +    select UNIMP
> +    select SD
> +
>  config RASPI
>      bool
>      default y if TCG && ARM
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> new file mode 100644
> index 0000000000..b743d64253
> --- /dev/null
> +++ b/hw/arm/allwinner-r40.c
> @@ -0,0 +1,418 @@
> +/*
> + * Allwinner R40/A40i/T3 System on Chip emulation
> + *
> + * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/bswap.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +#include "hw/qdev-core.h"
> +#include "hw/sysbus.h"
> +#include "hw/char/serial.h"
> +#include "hw/misc/unimp.h"
> +#include "hw/usb/hcd-ehci.h"
> +#include "hw/loader.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/arm/allwinner-r40.h"
> +
> +/* Memory map */
> +const hwaddr allwinner_r40_memmap[] =3D {
> +    [AW_R40_DEV_SRAM_A1]    =3D 0x00000000,
> +    [AW_R40_DEV_SRAM_A2]    =3D 0x00004000,
> +    [AW_R40_DEV_SRAM_A3]    =3D 0x00008000,
> +    [AW_R40_DEV_SRAM_A4]    =3D 0x0000b400,
> +    [AW_R40_DEV_MMC0]       =3D 0x01c0f000,
> +    [AW_R40_DEV_MMC1]       =3D 0x01c10000,
> +    [AW_R40_DEV_MMC2]       =3D 0x01c11000,
> +    [AW_R40_DEV_MMC3]       =3D 0x01c12000,
> +    [AW_R40_DEV_PIT]        =3D 0x01c20c00,
> +    [AW_R40_DEV_UART0]      =3D 0x01c28000,
> +    [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
> +    [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
> +    [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> +    [AW_R40_DEV_GIC_VCPU]   =3D 0x01c86000,
> +    [AW_R40_DEV_SDRAM]      =3D 0x40000000
> +};
> +
> +/* List of unimplemented devices */
> +struct AwR40Unimplemented {
> +    const char *device_name;
> +    hwaddr base;
> +    hwaddr size;
> +};
> +
> +static struct AwR40Unimplemented r40_unimplemented[] =3D {
> +    { "d-engine",   0x01000000, 4 * MiB },
> +    { "d-inter",    0x01400000, 128 * KiB },
> +    { "sram-c",     0x01c00000, 4 * KiB },
> +    { "dma",        0x01c02000, 4 * KiB },
> +    { "nfdc",       0x01c03000, 4 * KiB },
> +    { "ts",         0x01c04000, 4 * KiB },
> +    { "spi0",       0x01c05000, 4 * KiB },
> +    { "spi1",       0x01c06000, 4 * KiB },
> +    { "cs0",        0x01c09000, 4 * KiB },
> +    { "keymem",     0x01c0a000, 4 * KiB },
> +    { "emac",       0x01c0b000, 4 * KiB },
> +    { "usb0-otg",   0x01c13000, 4 * KiB },
> +    { "usb0-host",  0x01c14000, 4 * KiB },
> +    { "crypto",     0x01c15000, 4 * KiB },
> +    { "spi2",       0x01c17000, 4 * KiB },
> +    { "sata",       0x01c18000, 4 * KiB },
> +    { "usb1-host",  0x01c19000, 4 * KiB },
> +    { "sid",        0x01c1b000, 4 * KiB },
> +    { "usb2-host",  0x01c1c000, 4 * KiB },
> +    { "cs1",        0x01c1d000, 4 * KiB },
> +    { "spi3",       0x01c1f000, 4 * KiB },
> +    { "ccu",        0x01c20000, 1 * KiB },
> +    { "rtc",        0x01c20400, 1 * KiB },
> +    { "pio",        0x01c20800, 1 * KiB },
> +    { "owa",        0x01c21000, 1 * KiB },
> +    { "ac97",       0x01c21400, 1 * KiB },
> +    { "cir0",       0x01c21800, 1 * KiB },
> +    { "cir1",       0x01c21c00, 1 * KiB },
> +    { "pcm0",       0x01c22000, 1 * KiB },
> +    { "pcm1",       0x01c22400, 1 * KiB },
> +    { "pcm2",       0x01c22800, 1 * KiB },
> +    { "audio",      0x01c22c00, 1 * KiB },
> +    { "keypad",     0x01c23000, 1 * KiB },
> +    { "pwm",        0x01c23400, 1 * KiB },
> +    { "keyadc",     0x01c24400, 1 * KiB },
> +    { "ths",        0x01c24c00, 1 * KiB },
> +    { "rtp",        0x01c25000, 1 * KiB },
> +    { "pmu",        0x01c25400, 1 * KiB },
> +    { "cpu-cfg",    0x01c25c00, 1 * KiB },
> +    { "uart0",      0x01c28000, 1 * KiB },
> +    { "uart1",      0x01c28400, 1 * KiB },
> +    { "uart2",      0x01c28800, 1 * KiB },
> +    { "uart3",      0x01c28c00, 1 * KiB },
> +    { "uart4",      0x01c29000, 1 * KiB },
> +    { "uart5",      0x01c29400, 1 * KiB },
> +    { "uart6",      0x01c29800, 1 * KiB },
> +    { "uart7",      0x01c29c00, 1 * KiB },
> +    { "ps20",       0x01c2a000, 1 * KiB },
> +    { "ps21",       0x01c2a400, 1 * KiB },
> +    { "twi0",       0x01c2ac00, 1 * KiB },
> +    { "twi1",       0x01c2b000, 1 * KiB },
> +    { "twi2",       0x01c2b400, 1 * KiB },
> +    { "twi3",       0x01c2b800, 1 * KiB },
> +    { "twi4",       0x01c2c000, 1 * KiB },
> +    { "scr",        0x01c2c400, 1 * KiB },
> +    { "tvd-top",    0x01c30000, 4 * KiB },
> +    { "tvd0",       0x01c31000, 4 * KiB },
> +    { "tvd1",       0x01c32000, 4 * KiB },
> +    { "tvd2",       0x01c33000, 4 * KiB },
> +    { "tvd3",       0x01c34000, 4 * KiB },
> +    { "gpu",        0x01c40000, 64 * KiB },
> +    { "gmac",       0x01c50000, 64 * KiB },
> +    { "hstmr",      0x01c60000, 4 * KiB },
> +    { "dram-com",   0x01c62000, 4 * KiB },
> +    { "dram-ctl",   0x01c63000, 4 * KiB },
> +    { "tcon-top",   0x01c70000, 4 * KiB },
> +    { "lcd0",       0x01c71000, 4 * KiB },
> +    { "lcd1",       0x01c72000, 4 * KiB },
> +    { "tv0",        0x01c73000, 4 * KiB },
> +    { "tv1",        0x01c74000, 4 * KiB },
> +    { "tve-top",    0x01c90000, 16 * KiB },
> +    { "tve0",       0x01c94000, 16 * KiB },
> +    { "tve1",       0x01c98000, 16 * KiB },
> +    { "mipi_dsi",   0x01ca0000, 4 * KiB },
> +    { "mipi_dphy",  0x01ca1000, 4 * KiB },
> +    { "ve",         0x01d00000, 1024 * KiB },
> +    { "mp",         0x01e80000, 128 * KiB },
> +    { "hdmi",       0x01ee0000, 128 * KiB },
> +    { "prcm",       0x01f01400, 1 * KiB },
> +    { "debug",      0x3f500000, 64 * KiB },
> +    { "cpubist",    0x3f501000, 4 * KiB },
> +    { "dcu",        0x3fff0000, 64 * KiB },
> +    { "hstmr",      0x01c60000, 4 * KiB },
> +    { "brom",       0xffff0000, 36 * KiB }
> +};
> +
> +/* Per Processor Interrupts */
> +enum {
> +    AW_R40_GIC_PPI_MAINT     =3D  9,
> +    AW_R40_GIC_PPI_HYPTIMER  =3D 10,
> +    AW_R40_GIC_PPI_VIRTTIMER =3D 11,
> +    AW_R40_GIC_PPI_SECTIMER  =3D 13,
> +    AW_R40_GIC_PPI_PHYSTIMER =3D 14
> +};
> +
> +/* Shared Processor Interrupts */
> +enum {
> +    AW_R40_GIC_SPI_UART0     =3D  1,
> +    AW_R40_GIC_SPI_UART1     =3D  2,
> +    AW_R40_GIC_SPI_UART2     =3D  3,
> +    AW_R40_GIC_SPI_UART3     =3D  4,
> +    AW_R40_GIC_SPI_TIMER0    =3D 22,
> +    AW_R40_GIC_SPI_TIMER1    =3D 23,
> +    AW_R40_GIC_SPI_MMC0      =3D 32,
> +    AW_R40_GIC_SPI_MMC1      =3D 33,
> +    AW_R40_GIC_SPI_MMC2      =3D 34,
> +    AW_R40_GIC_SPI_MMC3      =3D 35,
> +};
> +
> +/* Allwinner R40 general constants */
> +enum {
> +    AW_R40_GIC_NUM_SPI       =3D 128
> +};
> +
> +#define BOOT0_MAGIC             "eGON.BT0"
> +
> +/* The low 8-bits of the 'boot_media' field in the SPL header */
> +#define SUNXI_BOOTED_FROM_MMC0  0
> +#define SUNXI_BOOTED_FROM_NAND  1
> +#define SUNXI_BOOTED_FROM_MMC2  2
> +#define SUNXI_BOOTED_FROM_SPI   3
> +
> +struct boot_file_head {
> +    uint32_t            b_instruction;
> +    uint8_t             magic[8];
> +    uint32_t            check_sum;
> +    uint32_t            length;
> +    uint32_t            pub_head_size;
> +    uint32_t            fel_script_address;
> +    uint32_t            fel_uEnv_length;
> +    uint32_t            dt_name_offset;
> +    uint32_t            dram_size;
> +    uint32_t            boot_media;
> +    uint32_t            string_pool[13];
> +};
> +
> +bool allwinner_r40_bootrom_setup(AwR40State *s, BlockBackend *blk, int
> unit)
> +{
> +    const int64_t rom_size =3D 32 * KiB;
> +    g_autofree uint8_t *buffer =3D g_new0(uint8_t, rom_size);
> +    struct boot_file_head *head =3D (struct boot_file_head *)buffer;
> +
> +    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
> +        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
> +                   __func__);
> +        return false;
> +    }
> +
> +    /* we only check the magic string here. */
> +    if (memcmp(head->magic, BOOT0_MAGIC, sizeof(head->magic))) {
> +        return false;
> +    }
> +
> +    /*
> +     * Simulate the behavior of the bootROM, it will change the boot_med=
ia
> +     * flag to indicate where the chip is booting from. R40 can boot fro=
m
> +     * mmc0 or mmc2, the default value of boot_media is zero
> +     * (SUNXI_BOOTED_FROM_MMC0), let's fix this flag when it is booting
> from
> +     * the others.
> +     */
> +    if (unit =3D=3D 2) {
> +        head->boot_media =3D cpu_to_le32(SUNXI_BOOTED_FROM_MMC2);
> +    } else {
> +        head->boot_media =3D cpu_to_le32(SUNXI_BOOTED_FROM_MMC0);
> +    }
> +
> +    rom_add_blob("allwinner-r40.bootrom", buffer, rom_size,
> +                  rom_size, s->memmap[AW_R40_DEV_SRAM_A1],
> +                  NULL, NULL, NULL, NULL, false);
> +    return true;
> +}
> +
> +static void allwinner_r40_init(Object *obj)
> +{
> +    static const char *mmc_names[AW_R40_NUM_MMCS] =3D {
> +        "mmc0", "mmc1", "mmc2", "mmc3"
> +    };
> +    AwR40State *s =3D AW_R40(obj);
> +
> +    s->memmap =3D allwinner_r40_memmap;
> +
> +    for (int i =3D 0; i < AW_R40_NUM_CPUS; i++) {
> +        object_initialize_child(obj, "cpu[*]", &s->cpus[i],
> +                                ARM_CPU_TYPE_NAME("cortex-a7"));
> +    }
> +
> +    object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
> +
> +    object_initialize_child(obj, "timer", &s->timer, TYPE_AW_A10_PIT);
> +    object_property_add_alias(obj, "clk0-freq", OBJECT(&s->timer),
> +                              "clk0-freq");
> +    object_property_add_alias(obj, "clk1-freq", OBJECT(&s->timer),
> +                              "clk1-freq");
> +
> +    for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
> +        object_initialize_child(obj, mmc_names[i], &s->mmc[i],
> +                                TYPE_AW_SDHOST_SUN5I);
> +    }
> +}
> +
> +static void allwinner_r40_realize(DeviceState *dev, Error **errp)
> +{
> +    AwR40State *s =3D AW_R40(dev);
> +    unsigned i;
> +
> +    /* CPUs */
> +    for (i =3D 0; i < AW_R40_NUM_CPUS; i++) {
> +
> +        /*
> +         * Disable secondary CPUs. Guest EL3 firmware will start
> +         * them via CPU reset control registers.
> +         */
> +        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
> +                          i > 0);
> +
> +        /* All exception levels required */
> +        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
> +        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el2", true);
> +
> +        /* Mark realized */
> +        qdev_realize(DEVICE(&s->cpus[i]), NULL, &error_fatal);
> +    }
> +
> +    /* Generic Interrupt Controller */
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", AW_R40_GIC_NUM_SPI =
+
> +                                                     GIC_INTERNAL);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", AW_R40_NUM_CPUS);
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", false)=
;
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-virtualization-extensions",
> true);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->gic), &error_fatal);
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 0,
> s->memmap[AW_R40_DEV_GIC_DIST]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 1,
> s->memmap[AW_R40_DEV_GIC_CPU]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 2,
> s->memmap[AW_R40_DEV_GIC_HYP]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 3,
> s->memmap[AW_R40_DEV_GIC_VCPU]);
> +
> +    /*
> +     * Wire the outputs from each CPU's generic timer and the GICv2
> +     * maintenance interrupt signal to the appropriate GIC PPI inputs,
> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's
> inputs.
> +     */
> +    for (i =3D 0; i < AW_R40_NUM_CPUS; i++) {
> +        DeviceState *cpudev =3D DEVICE(&s->cpus[i]);
> +        int ppibase =3D AW_R40_GIC_NUM_SPI + i * GIC_INTERNAL + GIC_NR_S=
GIS;
> +        int irq;
> +        /*
> +         * Mapping from the output timer irq lines from the CPU to the
> +         * GIC PPI inputs used for this board.
> +         */
> +        const int timer_irq[] =3D {
> +            [GTIMER_PHYS] =3D AW_R40_GIC_PPI_PHYSTIMER,
> +            [GTIMER_VIRT] =3D AW_R40_GIC_PPI_VIRTTIMER,
> +            [GTIMER_HYP]  =3D AW_R40_GIC_PPI_HYPTIMER,
> +            [GTIMER_SEC]  =3D AW_R40_GIC_PPI_SECTIMER,
> +        };
> +
> +        /* Connect CPU timer outputs to GIC PPI inputs */
> +        for (irq =3D 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> +            qdev_connect_gpio_out(cpudev, irq,
> +                                  qdev_get_gpio_in(DEVICE(&s->gic),
> +                                                   ppibase +
> timer_irq[irq]));
> +        }
> +
> +        /* Connect GIC outputs to CPU interrupt inputs */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + AW_R40_NUM_CPUS,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (2 *
> AW_R40_NUM_CPUS),
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (3 *
> AW_R40_NUM_CPUS),
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +
> +        /* GIC maintenance signal */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (4 *
> AW_R40_NUM_CPUS),
> +                           qdev_get_gpio_in(DEVICE(&s->gic),
> +                                            ppibase +
> AW_R40_GIC_PPI_MAINT));
> +    }
> +
> +    /* Timer */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->timer), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0,
> s->memmap[AW_R40_DEV_PIT]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic),
> +                       AW_R40_GIC_SPI_TIMER0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), 1,
> +                       qdev_get_gpio_in(DEVICE(&s->gic),
> +                       AW_R40_GIC_SPI_TIMER1));
> +
> +    /* SRAM */
> +    memory_region_init_ram(&s->sram_a1, OBJECT(dev), "sram A1",
> +                            16 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_a2, OBJECT(dev), "sram A2",
> +                            16 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_a3, OBJECT(dev), "sram A3",
> +                            13 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_a4, OBJECT(dev), "sram A4",
> +                            3 * KiB, &error_abort);
> +    memory_region_add_subregion(get_system_memory(),
> +                                s->memmap[AW_R40_DEV_SRAM_A1],
> &s->sram_a1);
> +    memory_region_add_subregion(get_system_memory(),
> +                                s->memmap[AW_R40_DEV_SRAM_A2],
> &s->sram_a2);
> +    memory_region_add_subregion(get_system_memory(),
> +                                s->memmap[AW_R40_DEV_SRAM_A3],
> &s->sram_a3);
> +    memory_region_add_subregion(get_system_memory(),
> +                                s->memmap[AW_R40_DEV_SRAM_A4],
> &s->sram_a4);
> +
> +    /* SD/MMC */
> +    for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
> +        qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->gic),
> +                                        AW_R40_GIC_SPI_MMC0 + i);
> +        const hwaddr addr =3D s->memmap[AW_R40_DEV_MMC0 + i];
> +
> +        object_property_set_link(OBJECT(&s->mmc[i]), "dma-memory",
> +                                 OBJECT(get_system_memory()),
> &error_fatal);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->mmc[i]), &error_fatal);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc[i]), 0, addr);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc[i]), 0, irq);
> +    }
> +
> +    /* UART0. For future clocktree API: All UARTS are connected to
> APB2_CLK. */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART0], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic),
> AW_R40_GIC_SPI_UART0),
> +                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +
> +    /* Unimplemented devices */
> +    for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
> +        create_unimplemented_device(r40_unimplemented[i].device_name,
> +                                    r40_unimplemented[i].base,
> +                                    r40_unimplemented[i].size);
> +    }
> +}
> +
> +static void allwinner_r40_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D allwinner_r40_realize;
> +    /* Reason: uses serial_hd() in realize function */
> +    dc->user_creatable =3D false;
> +}
> +
> +static const TypeInfo allwinner_r40_type_info =3D {
> +    .name =3D TYPE_AW_R40,
> +    .parent =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(AwR40State),
> +    .instance_init =3D allwinner_r40_init,
> +    .class_init =3D allwinner_r40_class_init,
> +};
> +
> +static void allwinner_r40_register_types(void)
> +{
> +    type_register_static(&allwinner_r40_type_info);
> +}
> +
> +type_init(allwinner_r40_register_types)
> diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
> new file mode 100644
> index 0000000000..1d49a006b5
> --- /dev/null
> +++ b/hw/arm/bananapi_m2u.c
> @@ -0,0 +1,129 @@
> +/*
> + * Bananapi M2U emulation
> + *
> + * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "exec/address-spaces.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/arm/allwinner-r40.h"
> +
> +static struct arm_boot_info bpim2u_binfo;
> +
> +/*
> + * R40 can boot from mmc0 and mmc2, and bpim2u has two mmc interface, on=
e
> is
> + * connected to sdcard and another mount an emmc media.
> + * Attach the mmc driver and try loading bootloader.
> + */
> +static void mmc_attach_drive(AwR40State *s, AwSdHostState *mmc, int unit=
,
> +                             bool load_bootroom, bool *bootroom_loaded)
> +{
> +    DriveInfo *di =3D drive_get(IF_SD, 0, unit);
> +    BlockBackend *blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> +    BusState *bus;
> +    DeviceState *carddev;
> +
> +    bus =3D qdev_get_child_bus(DEVICE(mmc), "sd-bus");
> +    if (bus =3D=3D NULL) {
> +        error_report("No SD bus found in SOC object");
> +        exit(1);
> +    }
> +
> +    carddev =3D qdev_new(TYPE_SD_CARD);
> +    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
> +    qdev_realize_and_unref(carddev, bus, &error_fatal);
> +
> +    if (load_bootroom && blk && blk_is_available(blk)) {
> +        /* Use Boot ROM to copy data from SD card to SRAM */
> +        *bootroom_loaded =3D allwinner_r40_bootrom_setup(s, blk, unit);
> +    }
> +}
> +
> +static void bpim2u_init(MachineState *machine)
> +{
> +    bool bootroom_loaded =3D false;
> +    AwR40State *r40;
> +
> +    /* BIOS is not supported by this board */
> +    if (machine->firmware) {
> +        error_report("BIOS not supported for this machine");
> +        exit(1);
> +    }
> +
> +    /* Only allow Cortex-A7 for this board */
> +    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) !=3D 0=
) {
> +        error_report("This board can only be used with cortex-a7 CPU");
> +        exit(1);
> +    }
> +
> +    r40 =3D AW_R40(object_new(TYPE_AW_R40));
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(r40));
> +    object_unref(OBJECT(r40));
> +
> +    /* Setup timer properties */
> +    object_property_set_int(OBJECT(r40), "clk0-freq", 32768,
> &error_abort);
> +    object_property_set_int(OBJECT(r40), "clk1-freq", 24 * 1000 * 1000,
> +                            &error_abort);
> +
> +    /* Mark R40 object realized */
> +    qdev_realize(DEVICE(r40), NULL, &error_abort);
> +
> +    /*
> +     * Plug in SD card and try load bootrom, R40 has 4 mmc controllers
> but can
> +     * only booting from mmc0 and mmc2.
> +     */
> +    for (int i =3D 0; i < AW_R40_NUM_MMCS; i++) {
> +        switch (i) {
> +        case 0:
> +        case 2:
> +            mmc_attach_drive(r40, &r40->mmc[i], i,
> +                             !machine->kernel_filename &&
> !bootroom_loaded,
> +                             &bootroom_loaded);
> +            break;
> +        default:
> +            mmc_attach_drive(r40, &r40->mmc[i], i, false, NULL);
> +            break;
> +        }
> +    }
> +
> +    /* SDRAM */
> +    memory_region_add_subregion(get_system_memory(),
> +                                r40->memmap[AW_R40_DEV_SDRAM],
> machine->ram);
> +
> +    bpim2u_binfo.loader_start =3D r40->memmap[AW_R40_DEV_SDRAM];
> +    bpim2u_binfo.ram_size =3D machine->ram_size;
> +    bpim2u_binfo.psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;
> +    arm_load_kernel(ARM_CPU(first_cpu), machine, &bpim2u_binfo);
> +}
> +
> +static void bpim2u_machine_init(MachineClass *mc)
> +{
> +    mc->desc =3D "Bananapi M2U (Cortex-A7)";
> +    mc->init =3D bpim2u_init;
> +    mc->min_cpus =3D AW_R40_NUM_CPUS;
> +    mc->max_cpus =3D AW_R40_NUM_CPUS;
> +    mc->default_cpus =3D AW_R40_NUM_CPUS;
> +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7");
> +    mc->default_ram_size =3D 1 * GiB;
> +    mc->default_ram_id =3D "bpim2u.ram";
> +}
> +
> +DEFINE_MACHINE("bpim2u", bpim2u_machine_init)
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index b545ba0e4f..870ec67376 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -37,6 +37,7 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true:
> files('omap1.c', 'omap2.c'))
>  arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
>  arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true:
> files('allwinner-a10.c', 'cubieboard.c'))
>  arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c',
> 'orangepi.c'))
> +arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true:
> files('allwinner-r40.c', 'bananapi_m2u.c'))
>  arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
>  arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true:
> files('stm32f100_soc.c'))
>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true:
> files('stm32f205_soc.c'))
> diff --git a/include/hw/arm/allwinner-r40.h
> b/include/hw/arm/allwinner-r40.h
> new file mode 100644
> index 0000000000..348bf25d6b
> --- /dev/null
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -0,0 +1,110 @@
> +/*
> + * Allwinner R40/A40i/T3 System on Chip emulation
> + *
> + * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_ARM_ALLWINNER_R40_H
> +#define HW_ARM_ALLWINNER_R40_H
> +
> +#include "qom/object.h"
> +#include "hw/arm/boot.h"
> +#include "hw/timer/allwinner-a10-pit.h"
> +#include "hw/intc/arm_gic.h"
> +#include "hw/sd/allwinner-sdhost.h"
> +#include "target/arm/cpu.h"
> +#include "sysemu/block-backend.h"
> +
> +enum {
> +    AW_R40_DEV_SRAM_A1,
> +    AW_R40_DEV_SRAM_A2,
> +    AW_R40_DEV_SRAM_A3,
> +    AW_R40_DEV_SRAM_A4,
> +    AW_R40_DEV_MMC0,
> +    AW_R40_DEV_MMC1,
> +    AW_R40_DEV_MMC2,
> +    AW_R40_DEV_MMC3,
> +    AW_R40_DEV_CCU,
> +    AW_R40_DEV_PIT,
> +    AW_R40_DEV_UART0,
> +    AW_R40_DEV_GIC_DIST,
> +    AW_R40_DEV_GIC_CPU,
> +    AW_R40_DEV_GIC_HYP,
> +    AW_R40_DEV_GIC_VCPU,
> +    AW_R40_DEV_SDRAM
> +};
> +
> +#define AW_R40_NUM_CPUS      (4)
> +
> +/**
> + * Allwinner R40 object model
> + * @{
> + */
> +
> +/** Object type for the Allwinner R40 SoC */
> +#define TYPE_AW_R40 "allwinner-r40"
> +
> +/** Convert input object to Allwinner R40 state object */
> +OBJECT_DECLARE_SIMPLE_TYPE(AwR40State, AW_R40)
> +
> +/** @} */
> +
> +/**
> + * Allwinner R40 object
> + *
> + * This struct contains the state of all the devices
> + * which are currently emulated by the R40 SoC code.
> + */
> +#define AW_R40_NUM_MMCS         4
> +
> +struct AwR40State {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +    /*< public >*/
> +
> +    ARMCPU cpus[AW_R40_NUM_CPUS];
> +    const hwaddr *memmap;
> +    AwA10PITState timer;
> +    AwSdHostState mmc[AW_R40_NUM_MMCS];
> +    GICState gic;
> +    MemoryRegion sram_a1;
> +    MemoryRegion sram_a2;
> +    MemoryRegion sram_a3;
> +    MemoryRegion sram_a4;
> +};
> +
> +/**
> + * Emulate Boot ROM firmware setup functionality.
> + *
> + * A real Allwinner R40 SoC contains a Boot ROM
> + * which is the first code that runs right after
> + * the SoC is powered on. The Boot ROM is responsible
> + * for loading user code (e.g. a bootloader) from any
> + * of the supported external devices and writing the
> + * downloaded code to internal SRAM. After loading the SoC
> + * begins executing the code written to SRAM.
> + *
> + * This function emulates the Boot ROM by copying 32 KiB
> + * of data from the given block device and writes it to
> + * the start of the first internal SRAM memory.
> + *
> + * @s: Allwinner R40 state object pointer
> + * @blk: Block backend device object pointer
> + * @unit: the mmc control's unit
> + */
> +bool allwinner_r40_bootrom_setup(AwR40State *s, BlockBackend *blk, int
> unit);
> +
> +#endif /* HW_ARM_ALLWINNER_R40_H */
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--00000000000069999705fbaba663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 12:30=E2=80=
=AFPM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@163.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" target=3D"_bla=
nk">qianfanguijin@163.com</a>&gt;<br>
<br>
Allwinner R40 (sun8i) SoC features a Quad-Core Cortex-A7 ARM CPU,<br>
and a Mali400 MP2 GPU from ARM. It&#39;s also known as the Allwinner T3<br>
for In-Car Entertainment usage, A40i and A40pro are variants that<br>
differ in applicable temperatures range (industrial and military).<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br></blockquote><div>Reviewed=
-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niekli=
nnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
---<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 10 +<br>
=C2=A0hw/arm/allwinner-r40.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 418 +++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/arm/bananapi_m2u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 129 +++++++=
+++<br>
=C2=A0hw/arm/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/arm/allwinner-r40.h | 110 +++++++++<br>
=C2=A05 files changed, 668 insertions(+)<br>
=C2=A0create mode 100644 hw/arm/allwinner-r40.c<br>
=C2=A0create mode 100644 hw/arm/bananapi_m2u.c<br>
=C2=A0create mode 100644 include/hw/arm/allwinner-r40.h<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 2d7c457955..b7a84f6e3f 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -374,6 +374,16 @@ config ALLWINNER_H3<br>
=C2=A0 =C2=A0 =C2=A0select USB_EHCI_SYSBUS<br>
=C2=A0 =C2=A0 =C2=A0select SD<br>
<br>
+config ALLWINNER_R40<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 default y if TCG &amp;&amp; ARM<br>
+=C2=A0 =C2=A0 select ALLWINNER_A10_PIT<br>
+=C2=A0 =C2=A0 select SERIAL<br>
+=C2=A0 =C2=A0 select ARM_TIMER<br>
+=C2=A0 =C2=A0 select ARM_GIC<br>
+=C2=A0 =C2=A0 select UNIMP<br>
+=C2=A0 =C2=A0 select SD<br>
+<br>
=C2=A0config RASPI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0default y if TCG &amp;&amp; ARM<br>
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c<br>
new file mode 100644<br>
index 0000000000..b743d64253<br>
--- /dev/null<br>
+++ b/hw/arm/allwinner-r40.c<br>
@@ -0,0 +1,418 @@<br>
+/*<br>
+ * Allwinner R40/A40i/T3 System on Chip emulation<br>
+ *<br>
+ * Copyright (C) 2023 qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163=
.com" target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/bswap.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/char/serial.h&quot;<br>
+#include &quot;hw/misc/unimp.h&quot;<br>
+#include &quot;hw/usb/hcd-ehci.h&quot;<br>
+#include &quot;hw/loader.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;hw/arm/allwinner-r40.h&quot;<br>
+<br>
+/* Memory map */<br>
+const hwaddr allwinner_r40_memmap[] =3D {<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_SRAM_A1]=C2=A0 =C2=A0 =3D 0x00000000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_SRAM_A2]=C2=A0 =C2=A0 =3D 0x00004000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_SRAM_A3]=C2=A0 =C2=A0 =3D 0x00008000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_SRAM_A4]=C2=A0 =C2=A0 =3D 0x0000b400,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_MMC0]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c0f000,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_MMC1]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c10000,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_MMC2]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c11000,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_MMC3]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c12000,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_PIT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20c00,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_UART0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_GIC_DIST]=C2=A0 =C2=A0=3D 0x01c81000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_GIC_CPU]=C2=A0 =C2=A0 =3D 0x01c82000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_GIC_HYP]=C2=A0 =C2=A0 =3D 0x01c84000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_GIC_VCPU]=C2=A0 =C2=A0=3D 0x01c86000,<br>
+=C2=A0 =C2=A0 [AW_R40_DEV_SDRAM]=C2=A0 =C2=A0 =C2=A0 =3D 0x40000000<br>
+};<br>
+<br>
+/* List of unimplemented devices */<br>
+struct AwR40Unimplemented {<br>
+=C2=A0 =C2=A0 const char *device_name;<br>
+=C2=A0 =C2=A0 hwaddr base;<br>
+=C2=A0 =C2=A0 hwaddr size;<br>
+};<br>
+<br>
+static struct AwR40Unimplemented r40_unimplemented[] =3D {<br>
+=C2=A0 =C2=A0 { &quot;d-engine&quot;,=C2=A0 =C2=A00x01000000, 4 * MiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;d-inter&quot;,=C2=A0 =C2=A0 0x01400000, 128 * KiB },=
<br>
+=C2=A0 =C2=A0 { &quot;sram-c&quot;,=C2=A0 =C2=A0 =C2=A00x01c00000, 4 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;dma&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c02000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;nfdc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c03000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;ts&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c0400=
0, 4 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;spi0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c05000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;spi1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c06000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;cs0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c09000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;keymem&quot;,=C2=A0 =C2=A0 =C2=A00x01c0a000, 4 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;emac&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c0b000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;usb0-otg&quot;,=C2=A0 =C2=A00x01c13000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;usb0-host&quot;,=C2=A0 0x01c14000, 4 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;crypto&quot;,=C2=A0 =C2=A0 =C2=A00x01c15000, 4 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;spi2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c17000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;sata&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c18000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;usb1-host&quot;,=C2=A0 0x01c19000, 4 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;sid&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c1b000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;usb2-host&quot;,=C2=A0 0x01c1c000, 4 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;cs1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c1d000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;spi3&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c1f000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;ccu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c20000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;rtc&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c20400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;pio&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c20800, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;owa&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c21000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;ac97&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c21400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;cir0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c21800, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;cir1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c21c00, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;pcm0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c22000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;pcm1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c22400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;pcm2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c22800, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;audio&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c22c00, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;keypad&quot;,=C2=A0 =C2=A0 =C2=A00x01c23000, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;pwm&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c23400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;keyadc&quot;,=C2=A0 =C2=A0 =C2=A00x01c24400, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;ths&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c24c00, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;rtp&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c25000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;pmu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c25400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;cpu-cfg&quot;,=C2=A0 =C2=A0 0x01c25c00, 1 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;uart0&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c28000, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart1&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c28400, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart2&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c28800, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart3&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c28c00, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart4&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c29000, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart5&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c29400, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart6&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c29800, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;uart7&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c29c00, 1 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;ps20&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2a000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;ps21&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2a400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;twi0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2ac00, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;twi1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2b000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;twi2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2b400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;twi3&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2b800, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;twi4&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2c000, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;scr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2c400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tvd-top&quot;,=C2=A0 =C2=A0 0x01c30000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;tvd0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c31000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tvd1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c32000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tvd2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c33000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tvd3&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c34000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;gpu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c40000, 64=
 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;gmac&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c50000, 64=
 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;hstmr&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c60000, 4 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;dram-com&quot;,=C2=A0 =C2=A00x01c62000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;dram-ctl&quot;,=C2=A0 =C2=A00x01c63000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;tcon-top&quot;,=C2=A0 =C2=A00x01c70000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;lcd0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c71000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;lcd1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c72000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tv0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c73000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tv1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c74000, 4 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;tve-top&quot;,=C2=A0 =C2=A0 0x01c90000, 16 * KiB },<=
br>
+=C2=A0 =C2=A0 { &quot;tve0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c94000, 16=
 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;tve1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c98000, 16=
 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;mipi_dsi&quot;,=C2=A0 =C2=A00x01ca0000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;mipi_dphy&quot;,=C2=A0 0x01ca1000, 4 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;ve&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01d0000=
0, 1024 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;mp&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01e8000=
0, 128 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;hdmi&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01ee0000, 12=
8 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;prcm&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01f01400, 1 =
* KiB },<br>
+=C2=A0 =C2=A0 { &quot;debug&quot;,=C2=A0 =C2=A0 =C2=A0 0x3f500000, 64 * Ki=
B },<br>
+=C2=A0 =C2=A0 { &quot;cpubist&quot;,=C2=A0 =C2=A0 0x3f501000, 4 * KiB },<b=
r>
+=C2=A0 =C2=A0 { &quot;dcu&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3fff0000, 64=
 * KiB },<br>
+=C2=A0 =C2=A0 { &quot;hstmr&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c60000, 4 * KiB=
 },<br>
+=C2=A0 =C2=A0 { &quot;brom&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xffff0000, 36=
 * KiB }<br>
+};<br>
+<br>
+/* Per Processor Interrupts */<br>
+enum {<br>
+=C2=A0 =C2=A0 AW_R40_GIC_PPI_MAINT=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 9,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_PPI_HYPTIMER=C2=A0 =3D 10,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_PPI_VIRTTIMER =3D 11,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_PPI_SECTIMER=C2=A0 =3D 13,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_PPI_PHYSTIMER =3D 14<br>
+};<br>
+<br>
+/* Shared Processor Interrupts */<br>
+enum {<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART0=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 1,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART1=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 2,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART2=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 3,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_UART3=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 4,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_TIMER0=C2=A0 =C2=A0 =3D 22,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_TIMER1=C2=A0 =C2=A0 =3D 23,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_MMC0=C2=A0 =C2=A0 =C2=A0 =3D 32,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_MMC1=C2=A0 =C2=A0 =C2=A0 =3D 33,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_MMC2=C2=A0 =C2=A0 =C2=A0 =3D 34,<br>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_MMC3=C2=A0 =C2=A0 =C2=A0 =3D 35,<br>
+};<br>
+<br>
+/* Allwinner R40 general constants */<br>
+enum {<br>
+=C2=A0 =C2=A0 AW_R40_GIC_NUM_SPI=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 128<br>
+};<br>
+<br>
+#define BOOT0_MAGIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;e=
GON.BT0&quot;<br>
+<br>
+/* The low 8-bits of the &#39;boot_media&#39; field in the SPL header */<b=
r>
+#define SUNXI_BOOTED_FROM_MMC0=C2=A0 0<br>
+#define SUNXI_BOOTED_FROM_NAND=C2=A0 1<br>
+#define SUNXI_BOOTED_FROM_MMC2=C2=A0 2<br>
+#define SUNXI_BOOTED_FROM_SPI=C2=A0 =C2=A03<br>
+<br>
+struct boot_file_head {<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b_instruct=
ion;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0magic=
[8];<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_sum;=
<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 length;<br=
>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pub_head_s=
ize;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fel_script=
_address;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fel_uEnv_l=
ength;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dt_name_of=
fset;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dram_size;=
<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_media=
;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string_poo=
l[13];<br>
+};<br>
+<br>
+bool allwinner_r40_bootrom_setup(AwR40State *s, BlockBackend *blk, int uni=
t)<br>
+{<br>
+=C2=A0 =C2=A0 const int64_t rom_size =3D 32 * KiB;<br>
+=C2=A0 =C2=A0 g_autofree uint8_t *buffer =3D g_new0(uint8_t, rom_size);<br=
>
+=C2=A0 =C2=A0 struct boot_file_head *head =3D (struct boot_file_head *)buf=
fer;<br>
+<br>
+=C2=A0 =C2=A0 if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) &lt; 0) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;error_fatal, &quot;%s: failed =
to read BlockBackend data&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fun=
c__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* we only check the magic string here. */<br>
+=C2=A0 =C2=A0 if (memcmp(head-&gt;magic, BOOT0_MAGIC, sizeof(head-&gt;magi=
c))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Simulate the behavior of the bootROM, it will change=
 the boot_media<br>
+=C2=A0 =C2=A0 =C2=A0* flag to indicate where the chip is booting from. R40=
 can boot from<br>
+=C2=A0 =C2=A0 =C2=A0* mmc0 or mmc2, the default value of boot_media is zer=
o<br>
+=C2=A0 =C2=A0 =C2=A0* (SUNXI_BOOTED_FROM_MMC0), let&#39;s fix this flag wh=
en it is booting from<br>
+=C2=A0 =C2=A0 =C2=A0* the others.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (unit =3D=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 head-&gt;boot_media =3D cpu_to_le32(SUNXI_BOOT=
ED_FROM_MMC2);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 head-&gt;boot_media =3D cpu_to_le32(SUNXI_BOOT=
ED_FROM_MMC0);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 rom_add_blob(&quot;allwinner-r40.bootrom&quot;, buffer, rom_=
size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_size, s=
-&gt;memmap[AW_R40_DEV_SRAM_A1],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL,=
 NULL, NULL, false);<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
+static void allwinner_r40_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 static const char *mmc_names[AW_R40_NUM_MMCS] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mmc0&quot;, &quot;mmc1&quot;, &quot;mmc2=
&quot;, &quot;mmc3&quot;<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 AwR40State *s =3D AW_R40(obj);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;memmap =3D allwinner_r40_memmap;<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; AW_R40_NUM_CPUS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;cpu[*]&quot=
;, &amp;s-&gt;cpus[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a7&qu=
ot;));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;gic&quot;, &amp;s-&gt;gic=
, TYPE_ARM_GIC);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;timer&quot;, &amp;s-&gt;t=
imer, TYPE_AW_A10_PIT);<br>
+=C2=A0 =C2=A0 object_property_add_alias(obj, &quot;clk0-freq&quot;, OBJECT=
(&amp;s-&gt;timer),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clk0-freq&quot;);<br>
+=C2=A0 =C2=A0 object_property_add_alias(obj, &quot;clk1-freq&quot;, OBJECT=
(&amp;s-&gt;timer),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clk1-freq&quot;);<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; AW_R40_NUM_MMCS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, mmc_names[i], &am=
p;s-&gt;mmc[i],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_AW_SDHOST_SUN5I);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void allwinner_r40_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 AwR40State *s =3D AW_R40(dev);<br>
+=C2=A0 =C2=A0 unsigned i;<br>
+<br>
+=C2=A0 =C2=A0 /* CPUs */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; AW_R40_NUM_CPUS; i++) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Disable secondary CPUs. Guest EL3 firm=
ware will start<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* them via CPU reset control registers.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;s-&gt;cpus[i]), =
&quot;start-powered-off&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 i &gt; 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All exception levels required */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;s-&gt;cpus[i]), =
&quot;has_el3&quot;, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;s-&gt;cpus[i]), =
&quot;has_el2&quot;, true);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mark realized */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_realize(DEVICE(&amp;s-&gt;cpus[i]), NULL,=
 &amp;error_fatal);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Generic Interrupt Controller */<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(DEVICE(&amp;s-&gt;gic), &quot;num-irq&q=
uot;, AW_R40_GIC_NUM_SPI +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIC_INTERNAL);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(DEVICE(&amp;s-&gt;gic), &quot;revision&=
quot;, 2);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(DEVICE(&amp;s-&gt;gic), &quot;num-cpu&q=
uot;, AW_R40_NUM_CPUS);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;s-&gt;gic), &quot;has-security=
-extensions&quot;, false);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;s-&gt;gic), &quot;has-virtuali=
zation-extensions&quot;, true);<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;gic), &amp;error_fa=
tal);<br>
+<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;gic), 0, s-&gt;mem=
map[AW_R40_DEV_GIC_DIST]);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;gic), 1, s-&gt;mem=
map[AW_R40_DEV_GIC_CPU]);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;gic), 2, s-&gt;mem=
map[AW_R40_DEV_GIC_HYP]);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;gic), 3, s-&gt;mem=
map[AW_R40_DEV_GIC_VCPU]);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Wire the outputs from each CPU&#39;s generic timer a=
nd the GICv2<br>
+=C2=A0 =C2=A0 =C2=A0* maintenance interrupt signal to the appropriate GIC =
PPI inputs,<br>
+=C2=A0 =C2=A0 =C2=A0* and the GIC&#39;s IRQ/FIQ/VIRQ/VFIQ interrupt output=
s to the CPU&#39;s inputs.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; AW_R40_NUM_CPUS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *cpudev =3D DEVICE(&amp;s-&gt;cpus=
[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ppibase =3D AW_R40_GIC_NUM_SPI + i * GIC_I=
NTERNAL + GIC_NR_SGIS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Mapping from the output timer irq line=
s from the CPU to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* GIC PPI inputs used for this board.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int timer_irq[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_PHYS] =3D AW_R40_GIC_PPI=
_PHYSTIMER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_VIRT] =3D AW_R40_GIC_PPI=
_VIRTTIMER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_HYP]=C2=A0 =3D AW_R40_GI=
C_PPI_HYPTIMER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_SEC]=C2=A0 =3D AW_R40_GI=
C_PPI_SECTIMER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Connect CPU timer outputs to GIC PPI inputs=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (irq =3D 0; irq &lt; ARRAY_SIZE(timer_irq)=
; irq++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(cpudev, ir=
q,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;=
s-&gt;gic),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppibase + timer_irq[irq]));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Connect GIC outputs to CPU interrupt inputs=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;g=
ic), i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;g=
ic), i + AW_R40_NUM_CPUS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;g=
ic), i + (2 * AW_R40_NUM_CPUS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;g=
ic), i + (3 * AW_R40_NUM_CPUS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* GIC maintenance signal */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;g=
ic), i + (4 * AW_R40_NUM_CPUS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ppibase + AW_R40_GIC_PPI_MAINT));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Timer */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;timer), &amp;error_=
fatal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;timer), 0, s-&gt;m=
emmap[AW_R40_DEV_PIT]);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;timer), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AW_R40_GIC_SPI_TIMER0));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;timer), 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AW_R40_GIC_SPI_TIMER1));<br>
+<br>
+=C2=A0 =C2=A0 /* SRAM */<br>
+=C2=A0 =C2=A0 memory_region_init_ram(&amp;s-&gt;sram_a1, OBJECT(dev), &quo=
t;sram A1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 16 * KiB, &amp;error_abort);<br>
+=C2=A0 =C2=A0 memory_region_init_ram(&amp;s-&gt;sram_a2, OBJECT(dev), &quo=
t;sram A2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 16 * KiB, &amp;error_abort);<br>
+=C2=A0 =C2=A0 memory_region_init_ram(&amp;s-&gt;sram_a3, OBJECT(dev), &quo=
t;sram A3&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 13 * KiB, &amp;error_abort);<br>
+=C2=A0 =C2=A0 memory_region_init_ram(&amp;s-&gt;sram_a4, OBJECT(dev), &quo=
t;sram A4&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 3 * KiB, &amp;error_abort);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memmap[AW_R40_DEV_SRAM_A1], &a=
mp;s-&gt;sram_a1);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memmap[AW_R40_DEV_SRAM_A2], &a=
mp;s-&gt;sram_a2);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memmap[AW_R40_DEV_SRAM_A3], &a=
mp;s-&gt;sram_a3);<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memmap[AW_R40_DEV_SRAM_A4], &a=
mp;s-&gt;sram_a4);<br>
+<br>
+=C2=A0 =C2=A0 /* SD/MMC */<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; AW_R40_NUM_MMCS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&amp;=
s-&gt;gic),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AW_R40_G=
IC_SPI_MMC0 + i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const hwaddr addr =3D s-&gt;memmap[AW_R40_DEV_=
MMC0 + i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_link(OBJECT(&amp;s-&gt;mmc=
[i]), &quot;dma-memory&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OBJECT(get_system_memory()), &=
amp;error_fatal);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;mmc[i=
]), &amp;error_fatal);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;mmc[=
i]), 0, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;m=
mc[i]), 0, irq);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* UART0. For future clocktree API: All UARTS are connected =
to APB2_CLK. */<br>
+=C2=A0 =C2=A0 serial_mm_init(get_system_memory(), s-&gt;memmap[AW_R40_DEV_=
UART0], 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_=
get_gpio_in(DEVICE(&amp;s-&gt;gic), AW_R40_GIC_SPI_UART0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011520=
0, serial_hd(0), DEVICE_NATIVE_ENDIAN);<br>
+<br>
+=C2=A0 =C2=A0 /* Unimplemented devices */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(r40_unimplemented); i++) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_unimplemented_device(r40_unimplemented[=
i].device_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r40_unimplemented[i].b=
ase,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r40_unimplemented[i].s=
ize);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void allwinner_r40_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D allwinner_r40_realize;<br>
+=C2=A0 =C2=A0 /* Reason: uses serial_hd() in realize function */<br>
+=C2=A0 =C2=A0 dc-&gt;user_creatable =3D false;<br>
+}<br>
+<br>
+static const TypeInfo allwinner_r40_type_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_AW_R40,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AwR40State),<br>
+=C2=A0 =C2=A0 .instance_init =3D allwinner_r40_init,<br>
+=C2=A0 =C2=A0 .class_init =3D allwinner_r40_class_init,<br>
+};<br>
+<br>
+static void allwinner_r40_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_r40_type_info);<br>
+}<br>
+<br>
+type_init(allwinner_r40_register_types)<br>
diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c<br>
new file mode 100644<br>
index 0000000000..1d49a006b5<br>
--- /dev/null<br>
+++ b/hw/arm/bananapi_m2u.c<br>
@@ -0,0 +1,129 @@<br>
+/*<br>
+ * Bananapi M2U emulation<br>
+ *<br>
+ * Copyright (C) 2023 qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163=
.com" target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/arm/allwinner-r40.h&quot;<br>
+<br>
+static struct arm_boot_info bpim2u_binfo;<br>
+<br>
+/*<br>
+ * R40 can boot from mmc0 and mmc2, and bpim2u has two mmc interface, one =
is<br>
+ * connected to sdcard and another mount an emmc media.<br>
+ * Attach the mmc driver and try loading bootloader.<br>
+ */<br>
+static void mmc_attach_drive(AwR40State *s, AwSdHostState *mmc, int unit,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool load_bootroom, bool *bootroom_loaded)<b=
r>
+{<br>
+=C2=A0 =C2=A0 DriveInfo *di =3D drive_get(IF_SD, 0, unit);<br>
+=C2=A0 =C2=A0 BlockBackend *blk =3D di ? blk_by_legacy_dinfo(di) : NULL;<b=
r>
+=C2=A0 =C2=A0 BusState *bus;<br>
+=C2=A0 =C2=A0 DeviceState *carddev;<br>
+<br>
+=C2=A0 =C2=A0 bus =3D qdev_get_child_bus(DEVICE(mmc), &quot;sd-bus&quot;);=
<br>
+=C2=A0 =C2=A0 if (bus =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;No SD bus found in SOC obje=
ct&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 carddev =3D qdev_new(TYPE_SD_CARD);<br>
+=C2=A0 =C2=A0 qdev_prop_set_drive_err(carddev, &quot;drive&quot;, blk, &am=
p;error_fatal);<br>
+=C2=A0 =C2=A0 qdev_realize_and_unref(carddev, bus, &amp;error_fatal);<br>
+<br>
+=C2=A0 =C2=A0 if (load_bootroom &amp;&amp; blk &amp;&amp; blk_is_available=
(blk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Use Boot ROM to copy data from SD card to S=
RAM */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *bootroom_loaded =3D allwinner_r40_bootrom_set=
up(s, blk, unit);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void bpim2u_init(MachineState *machine)<br>
+{<br>
+=C2=A0 =C2=A0 bool bootroom_loaded =3D false;<br>
+=C2=A0 =C2=A0 AwR40State *r40;<br>
+<br>
+=C2=A0 =C2=A0 /* BIOS is not supported by this board */<br>
+=C2=A0 =C2=A0 if (machine-&gt;firmware) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;BIOS not supported for this=
 machine&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Only allow Cortex-A7 for this board */<br>
+=C2=A0 =C2=A0 if (strcmp(machine-&gt;cpu_type, ARM_CPU_TYPE_NAME(&quot;cor=
tex-a7&quot;)) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;This board can only be used=
 with cortex-a7 CPU&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 r40 =3D AW_R40(object_new(TYPE_AW_R40));<br>
+=C2=A0 =C2=A0 object_property_add_child(OBJECT(machine), &quot;soc&quot;, =
OBJECT(r40));<br>
+=C2=A0 =C2=A0 object_unref(OBJECT(r40));<br>
+<br>
+=C2=A0 =C2=A0 /* Setup timer properties */<br>
+=C2=A0 =C2=A0 object_property_set_int(OBJECT(r40), &quot;clk0-freq&quot;, =
32768, &amp;error_abort);<br>
+=C2=A0 =C2=A0 object_property_set_int(OBJECT(r40), &quot;clk1-freq&quot;, =
24 * 1000 * 1000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
+<br>
+=C2=A0 =C2=A0 /* Mark R40 object realized */<br>
+=C2=A0 =C2=A0 qdev_realize(DEVICE(r40), NULL, &amp;error_abort);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Plug in SD card and try load bootrom, R40 has 4 mmc =
controllers but can<br>
+=C2=A0 =C2=A0 =C2=A0* only booting from mmc0 and mmc2.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; AW_R40_NUM_MMCS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmc_attach_drive(r40, &amp;r40-&=
gt;mmc[i], i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!machine-&gt;kernel_filename &amp;&amp; !boo=
troom_loaded,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;bootroom_loaded);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmc_attach_drive(r40, &amp;r40-&=
gt;mmc[i], i, false, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* SDRAM */<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r40-&gt;memmap[AW_R40_DEV_SDRAM], ma=
chine-&gt;ram);<br>
+<br>
+=C2=A0 =C2=A0 bpim2u_binfo.loader_start =3D r40-&gt;memmap[AW_R40_DEV_SDRA=
M];<br>
+=C2=A0 =C2=A0 bpim2u_binfo.ram_size =3D machine-&gt;ram_size;<br>
+=C2=A0 =C2=A0 bpim2u_binfo.psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;<br>
+=C2=A0 =C2=A0 arm_load_kernel(ARM_CPU(first_cpu), machine, &amp;bpim2u_bin=
fo);<br>
+}<br>
+<br>
+static void bpim2u_machine_init(MachineClass *mc)<br>
+{<br>
+=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Bananapi M2U (Cortex-A7)&quot;;<br>
+=C2=A0 =C2=A0 mc-&gt;init =3D bpim2u_init;<br>
+=C2=A0 =C2=A0 mc-&gt;min_cpus =3D AW_R40_NUM_CPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;max_cpus =3D AW_R40_NUM_CPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpus =3D AW_R40_NUM_CPUS;<br>
+=C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cortex-a=
7&quot;);<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1 * GiB;<br>
+=C2=A0 =C2=A0 mc-&gt;default_ram_id =3D &quot;bpim2u.ram&quot;;<br>
+}<br>
+<br>
+DEFINE_MACHINE(&quot;bpim2u&quot;, bpim2u_machine_init)<br>
diff --git a/hw/arm/meson.build b/hw/arm/meson.build<br>
index b545ba0e4f..870ec67376 100644<br>
--- a/hw/arm/meson.build<br>
+++ b/hw/arm/meson.build<br>
@@ -37,6 +37,7 @@ arm_ss.add(when: &#39;CONFIG_OMAP&#39;, if_true: files(&#=
39;omap1.c&#39;, &#39;omap2.c&#39;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_STRONGARM&#39;, if_true: files(&#39;stro=
ngarm.c&#39;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_ALLWINNER_A10&#39;, if_true: files(&#39;=
allwinner-a10.c&#39;, &#39;cubieboard.c&#39;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#39;a=
llwinner-h3.c&#39;, &#39;orangepi.c&#39;))<br>
+arm_ss.add(when: &#39;CONFIG_ALLWINNER_R40&#39;, if_true: files(&#39;allwi=
nner-r40.c&#39;, &#39;bananapi_m2u.c&#39;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_RASPI&#39;, if_true: files(&#39;bcm2836.=
c&#39;, &#39;raspi.c&#39;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_STM32F100_SOC&#39;, if_true: files(&#39;=
stm32f100_soc.c&#39;))<br>
=C2=A0arm_ss.add(when: &#39;CONFIG_STM32F205_SOC&#39;, if_true: files(&#39;=
stm32f205_soc.c&#39;))<br>
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.=
h<br>
new file mode 100644<br>
index 0000000000..348bf25d6b<br>
--- /dev/null<br>
+++ b/include/hw/arm/allwinner-r40.h<br>
@@ -0,0 +1,110 @@<br>
+/*<br>
+ * Allwinner R40/A40i/T3 System on Chip emulation<br>
+ *<br>
+ * Copyright (C) 2023 qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163=
.com" target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#ifndef HW_ARM_ALLWINNER_R40_H<br>
+#define HW_ARM_ALLWINNER_R40_H<br>
+<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/arm/boot.h&quot;<br>
+#include &quot;hw/timer/allwinner-a10-pit.h&quot;<br>
+#include &quot;hw/intc/arm_gic.h&quot;<br>
+#include &quot;hw/sd/allwinner-sdhost.h&quot;<br>
+#include &quot;target/arm/cpu.h&quot;<br>
+#include &quot;sysemu/block-backend.h&quot;<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 AW_R40_DEV_SRAM_A1,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_SRAM_A2,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_SRAM_A3,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_SRAM_A4,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_MMC0,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_MMC1,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_MMC2,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_MMC3,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_CCU,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_PIT,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_UART0,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_GIC_DIST,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_GIC_CPU,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_GIC_HYP,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_GIC_VCPU,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_SDRAM<br>
+};<br>
+<br>
+#define AW_R40_NUM_CPUS=C2=A0 =C2=A0 =C2=A0 (4)<br>
+<br>
+/**<br>
+ * Allwinner R40 object model<br>
+ * @{<br>
+ */<br>
+<br>
+/** Object type for the Allwinner R40 SoC */<br>
+#define TYPE_AW_R40 &quot;allwinner-r40&quot;<br>
+<br>
+/** Convert input object to Allwinner R40 state object */<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AwR40State, AW_R40)<br>
+<br>
+/** @} */<br>
+<br>
+/**<br>
+ * Allwinner R40 object<br>
+ *<br>
+ * This struct contains the state of all the devices<br>
+ * which are currently emulated by the R40 SoC code.<br>
+ */<br>
+#define AW_R40_NUM_MMCS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
+<br>
+struct AwR40State {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 DeviceState parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 ARMCPU cpus[AW_R40_NUM_CPUS];<br>
+=C2=A0 =C2=A0 const hwaddr *memmap;<br>
+=C2=A0 =C2=A0 AwA10PITState timer;<br>
+=C2=A0 =C2=A0 AwSdHostState mmc[AW_R40_NUM_MMCS];<br>
+=C2=A0 =C2=A0 GICState gic;<br>
+=C2=A0 =C2=A0 MemoryRegion sram_a1;<br>
+=C2=A0 =C2=A0 MemoryRegion sram_a2;<br>
+=C2=A0 =C2=A0 MemoryRegion sram_a3;<br>
+=C2=A0 =C2=A0 MemoryRegion sram_a4;<br>
+};<br>
+<br>
+/**<br>
+ * Emulate Boot ROM firmware setup functionality.<br>
+ *<br>
+ * A real Allwinner R40 SoC contains a Boot ROM<br>
+ * which is the first code that runs right after<br>
+ * the SoC is powered on. The Boot ROM is responsible<br>
+ * for loading user code (e.g. a bootloader) from any<br>
+ * of the supported external devices and writing the<br>
+ * downloaded code to internal SRAM. After loading the SoC<br>
+ * begins executing the code written to SRAM.<br>
+ *<br>
+ * This function emulates the Boot ROM by copying 32 KiB<br>
+ * of data from the given block device and writes it to<br>
+ * the start of the first internal SRAM memory.<br>
+ *<br>
+ * @s: Allwinner R40 state object pointer<br>
+ * @blk: Block backend device object pointer<br>
+ * @unit: the mmc control&#39;s unit<br>
+ */<br>
+bool allwinner_r40_bootrom_setup(AwR40State *s, BlockBackend *blk, int uni=
t);<br>
+<br>
+#endif /* HW_ARM_ALLWINNER_R40_H */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--00000000000069999705fbaba663--

