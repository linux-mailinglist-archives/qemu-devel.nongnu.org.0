Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A579529CAD6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 21:58:56 +0100 (CET)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXW3T-0006DL-6u
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 16:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXW2L-0005kh-Rs; Tue, 27 Oct 2020 16:57:47 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXW2J-0000Wm-9T; Tue, 27 Oct 2020 16:57:45 -0400
Received: by mail-io1-xd42.google.com with SMTP id p7so3083672ioo.6;
 Tue, 27 Oct 2020 13:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KeYdnezOrHgBJXphbFu45detAVNJku5BxpQAMnEX4Y=;
 b=sdnDprs2mZ+V0Pzs3xy9Svoh3wGWwtmkOw9FZ1y6eg9HoICV9294HW+KPou+UfiY6C
 sI6WKFxZwOWi9pijj2E7TTsHC6q+Crd+XJyAMLnO719MEajCC5ffRgQAAaJi7UzR5ZC2
 clcnpmipvutHbEZLsTEx7gBmeN/BdhTNX236kU4M7wlU0xDhcBnXFh5uAVzNN+v4+CQA
 ScYYUCfK3mxA2Gxb9a+HU85Pthl+PNw1tZoU9XeFLe9mVHYLtyRoWwEtyW5w+9lLgpKs
 R/+RK44mUZiB+FvfzMtJMhWF7Lf3SR1Pm6XUDRDRvUvYdjXdXukc72RuWCI9daqyeaYP
 XdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KeYdnezOrHgBJXphbFu45detAVNJku5BxpQAMnEX4Y=;
 b=WCUbYo65OKKx5cvqm93xeajv2L0DglMAl5pBnkhIuUKzo/6svFoZ8lCZGpKlN5Ka60
 Tc0lc3PsQ++b3+DdmXrtcWeL7+FRpoTYf3S5F/ZfO2hczhrmo2zA7MWO+cfKemxXpr3u
 8CgXGuJtOd4sKhGju4Ww80WKaxuvLUesSXuFVzgKDAJkzt9pYe579KytKSc9GYPk2MhB
 gUu5sVK4wy7VYrqA5Y0pnNDxIrQAAczD3h15PpE/kV3+YUI4R6JGBGeY6/G+BunRvYhh
 isRIF4VTHaNZWTCpDBaRH+hHR36KnWlYgdzOUJGgDLnr7xxutvNoKJhWU7TvlCCifzxS
 g/pw==
X-Gm-Message-State: AOAM532n5zd76bfBQwOd8Sz8+AZV4xuflRgHmmknNjg85uZ8ZLwwuXNV
 osHCUOjGl6PZlyWqynMLwRoNg2tdvi9SaYJXp7Q=
X-Google-Smtp-Source: ABdhPJxXVVs6XaRTkfKH4dZ41y90T8HR7oo+qWuHnCOBqbWwxOU0IUOlMxs4jQrMHfnRuLS34HjpCyKBLW2tEfNchW8=
X-Received: by 2002:a02:c956:: with SMTP id u22mr4062397jao.135.1603832261807; 
 Tue, 27 Oct 2020 13:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
 <20201027141740.18336-2-bmeng.cn@gmail.com>
In-Reply-To: <20201027141740.18336-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 13:45:52 -0700
Message-ID: <CAKmqyKO6h-5Wuxf99+1VckqGFHAd5a=rXXwY_-3K=1kJrrrV6w@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/9] hw/misc: Add Microchip PolarFire SoC DDR
 Memory Controller support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Ivan Griffin <ivan.griffin@emdalo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 7:48 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The PolarFire SoC DDR Memory Controller mainly includes 2 modules,
> called SGMII PHY module and the CFG module, as documented in the
> chipset datasheet.
>
> This creates a single file that groups these 2 modules, providing
> the minimum functionalities that make the HSS DDR initialization
> codes happy.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  MAINTAINERS                      |   2 +
>  hw/misc/Kconfig                  |   3 +
>  hw/misc/mchp_pfsoc_dmc.c         | 216 +++++++++++++++++++++++++++++++
>  hw/misc/meson.build              |   1 +
>  include/hw/misc/mchp_pfsoc_dmc.h |  56 ++++++++
>  5 files changed, 278 insertions(+)
>  create mode 100644 hw/misc/mchp_pfsoc_dmc.c
>  create mode 100644 include/hw/misc/mchp_pfsoc_dmc.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef6f5c7399..caacec401c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1326,8 +1326,10 @@ L: qemu-riscv@nongnu.org
>  S: Supported
>  F: hw/riscv/microchip_pfsoc.c
>  F: hw/char/mchp_pfsoc_mmuart.c
> +F: hw/misc/mchp_pfsoc_dmc.c
>  F: include/hw/riscv/microchip_pfsoc.h
>  F: include/hw/char/mchp_pfsoc_mmuart.h
> +F: include/hw/misc/mchp_pfsoc_dmc.h
>
>  RX Machines
>  -----------
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 3185456110..198bb1c6ba 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -134,6 +134,9 @@ config MAC_VIA
>  config AVR_POWER
>      bool
>
> +config MCHP_PFSOC_DMC
> +    bool
> +
>  config SIFIVE_TEST
>      bool
>
> diff --git a/hw/misc/mchp_pfsoc_dmc.c b/hw/misc/mchp_pfsoc_dmc.c
> new file mode 100644
> index 0000000000..15cf3d7725
> --- /dev/null
> +++ b/hw/misc/mchp_pfsoc_dmc.c
> @@ -0,0 +1,216 @@
> +/*
> + * Microchip PolarFire SoC DDR Memory Controller module emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/hw.h"
> +#include "hw/sysbus.h"
> +#include "hw/misc/mchp_pfsoc_dmc.h"
> +
> +/* DDR SGMII PHY module */
> +
> +#define SGMII_PHY_IOC_REG1              0x208
> +#define SGMII_PHY_TRAINING_STATUS       0x814
> +#define SGMII_PHY_DQ_DQS_ERR_DONE       0x834
> +#define SGMII_PHY_DQDQS_STATUS1         0x84c
> +#define SGMII_PHY_PVT_STAT              0xc20
> +
> +static uint64_t mchp_pfsoc_ddr_sgmii_phy_read(void *opaque, hwaddr offset,
> +                                              unsigned size)
> +{
> +    uint32_t val = 0;
> +    static int training_status_bit;
> +
> +    switch (offset) {
> +    case SGMII_PHY_IOC_REG1:
> +        /* See ddr_pvt_calibration() in HSS */
> +        val = BIT(4) | BIT(2);
> +        break;
> +    case SGMII_PHY_TRAINING_STATUS:
> +        /*
> +         * The codes logic emulates the training status change from
> +         * DDR_TRAINING_IP_SM_BCLKSCLK to DDR_TRAINING_IP_SM_DQ_DQS.
> +         *
> +         * See ddr_setup() in mss_ddr.c in the HSS source codes.
> +         */
> +        val = 1 << training_status_bit;
> +        training_status_bit = (training_status_bit + 1) % 5;
> +        break;
> +    case SGMII_PHY_DQ_DQS_ERR_DONE:
> +        /*
> +         * DDR_TRAINING_IP_SM_VERIFY state in ddr_setup(),
> +         * check that DQ/DQS training passed without error.
> +         */
> +        val = 8;
> +        break;
> +    case SGMII_PHY_DQDQS_STATUS1:
> +        /*
> +         * DDR_TRAINING_IP_SM_VERIFY state in ddr_setup(),
> +         * check that DQ/DQS calculated window is above 5 taps.
> +         */
> +        val = 0xff;
> +        break;
> +    case SGMII_PHY_PVT_STAT:
> +        /* See sgmii_channel_setup() in HSS */
> +        val = BIT(14) | BIT(6);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
> +                      "(size %d, offset 0x%" HWADDR_PRIx ")\n",
> +                      __func__, size, offset);
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static void mchp_pfsoc_ddr_sgmii_phy_write(void *opaque, hwaddr offset,
> +                                           uint64_t value, unsigned size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> +                  "(size %d, value 0x%" PRIx64
> +                  ", offset 0x%" HWADDR_PRIx ")\n",
> +                  __func__, size, value, offset);
> +}
> +
> +static const MemoryRegionOps mchp_pfsoc_ddr_sgmii_phy_ops = {
> +    .read = mchp_pfsoc_ddr_sgmii_phy_read,
> +    .write = mchp_pfsoc_ddr_sgmii_phy_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void mchp_pfsoc_ddr_sgmii_phy_realize(DeviceState *dev, Error **errp)
> +{
> +    MchpPfSoCDdrSgmiiPhyState *s = MCHP_PFSOC_DDR_SGMII_PHY(dev);
> +
> +    memory_region_init_io(&s->sgmii_phy, OBJECT(dev),
> +                          &mchp_pfsoc_ddr_sgmii_phy_ops, s,
> +                          "mchp.pfsoc.ddr_sgmii_phy",
> +                          MCHP_PFSOC_DDR_SGMII_PHY_REG_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->sgmii_phy);
> +}
> +
> +static void mchp_pfsoc_ddr_sgmii_phy_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Microchip PolarFire SoC DDR SGMII PHY module";
> +    dc->realize = mchp_pfsoc_ddr_sgmii_phy_realize;
> +}
> +
> +static const TypeInfo mchp_pfsoc_ddr_sgmii_phy_info = {
> +    .name          = TYPE_MCHP_PFSOC_DDR_SGMII_PHY,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MchpPfSoCDdrSgmiiPhyState),
> +    .class_init    = mchp_pfsoc_ddr_sgmii_phy_class_init,
> +};
> +
> +static void mchp_pfsoc_ddr_sgmii_phy_register_types(void)
> +{
> +    type_register_static(&mchp_pfsoc_ddr_sgmii_phy_info);
> +}
> +
> +type_init(mchp_pfsoc_ddr_sgmii_phy_register_types)
> +
> +/* DDR CFG module */
> +
> +#define CFG_MT_DONE_ACK                 0x4428
> +#define CFG_STAT_DFI_INIT_COMPLETE      0x10034
> +#define CFG_STAT_DFI_TRAINING_COMPLETE  0x10038
> +
> +static uint64_t mchp_pfsoc_ddr_cfg_read(void *opaque, hwaddr offset,
> +                                        unsigned size)
> +{
> +    uint32_t val = 0;
> +
> +    switch (offset) {
> +    case CFG_MT_DONE_ACK:
> +        /* memory test in MTC_test() */
> +        val = BIT(0);
> +        break;
> +    case CFG_STAT_DFI_INIT_COMPLETE:
> +        /* DDR_TRAINING_IP_SM_START_CHECK state in ddr_setup() */
> +        val = BIT(0);
> +        break;
> +    case CFG_STAT_DFI_TRAINING_COMPLETE:
> +        /* DDR_TRAINING_IP_SM_VERIFY state in ddr_setup() */
> +        val = BIT(0);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
> +                      "(size %d, offset 0x%" HWADDR_PRIx ")\n",
> +                      __func__, size, offset);
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static void mchp_pfsoc_ddr_cfg_write(void *opaque, hwaddr offset,
> +                                     uint64_t value, unsigned size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> +                  "(size %d, value 0x%" PRIx64
> +                  ", offset 0x%" HWADDR_PRIx ")\n",
> +                  __func__, size, value, offset);
> +}
> +
> +static const MemoryRegionOps mchp_pfsoc_ddr_cfg_ops = {
> +    .read = mchp_pfsoc_ddr_cfg_read,
> +    .write = mchp_pfsoc_ddr_cfg_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void mchp_pfsoc_ddr_cfg_realize(DeviceState *dev, Error **errp)
> +{
> +    MchpPfSoCDdrCfgState *s = MCHP_PFSOC_DDR_CFG(dev);
> +
> +    memory_region_init_io(&s->cfg, OBJECT(dev),
> +                          &mchp_pfsoc_ddr_cfg_ops, s,
> +                          "mchp.pfsoc.ddr_cfg",
> +                          MCHP_PFSOC_DDR_CFG_REG_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->cfg);
> +}
> +
> +static void mchp_pfsoc_ddr_cfg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Microchip PolarFire SoC DDR CFG module";
> +    dc->realize = mchp_pfsoc_ddr_cfg_realize;
> +}
> +
> +static const TypeInfo mchp_pfsoc_ddr_cfg_info = {
> +    .name          = TYPE_MCHP_PFSOC_DDR_CFG,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MchpPfSoCDdrCfgState),
> +    .class_init    = mchp_pfsoc_ddr_cfg_class_init,
> +};
> +
> +static void mchp_pfsoc_ddr_cfg_register_types(void)
> +{
> +    type_register_static(&mchp_pfsoc_ddr_cfg_info);
> +}
> +
> +type_init(mchp_pfsoc_ddr_cfg_register_types)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 793d45b1dc..2d79a657e0 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -22,6 +22,7 @@ softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
>  softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
>
>  # RISC-V devices
> +softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
> diff --git a/include/hw/misc/mchp_pfsoc_dmc.h b/include/hw/misc/mchp_pfsoc_dmc.h
> new file mode 100644
> index 0000000000..2baa1413b0
> --- /dev/null
> +++ b/include/hw/misc/mchp_pfsoc_dmc.h
> @@ -0,0 +1,56 @@
> +/*
> + * Microchip PolarFire SoC DDR Memory Controller module emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef MCHP_PFSOC_DMC_H
> +#define MCHP_PFSOC_DMC_H
> +
> +/* DDR SGMII PHY module */
> +
> +#define MCHP_PFSOC_DDR_SGMII_PHY_REG_SIZE   0x1000
> +
> +typedef struct MchpPfSoCDdrSgmiiPhyState {
> +    SysBusDevice parent;
> +    MemoryRegion sgmii_phy;
> +} MchpPfSoCDdrSgmiiPhyState;
> +
> +#define TYPE_MCHP_PFSOC_DDR_SGMII_PHY "mchp.pfsoc.ddr_sgmii_phy"
> +
> +#define MCHP_PFSOC_DDR_SGMII_PHY(obj) \
> +    OBJECT_CHECK(MchpPfSoCDdrSgmiiPhyState, (obj), \
> +                 TYPE_MCHP_PFSOC_DDR_SGMII_PHY)
> +
> +/* DDR CFG module */
> +
> +#define MCHP_PFSOC_DDR_CFG_REG_SIZE         0x40000
> +
> +typedef struct MchpPfSoCDdrCfgState {
> +    SysBusDevice parent;
> +    MemoryRegion cfg;
> +} MchpPfSoCDdrCfgState;
> +
> +#define TYPE_MCHP_PFSOC_DDR_CFG "mchp.pfsoc.ddr_cfg"
> +
> +#define MCHP_PFSOC_DDR_CFG(obj) \
> +    OBJECT_CHECK(MchpPfSoCDdrCfgState, (obj), \
> +                 TYPE_MCHP_PFSOC_DDR_CFG)
> +
> +#endif /* MCHP_PFSOC_DMC_H */
> --
> 2.25.1
>
>

