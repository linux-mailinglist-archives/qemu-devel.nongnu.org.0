Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AE5F893D
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 05:41:56 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohNCM-00006S-Ga
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 23:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohNAj-0006ll-Kg; Sat, 08 Oct 2022 23:40:13 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:44771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ohNAh-0000yt-OF; Sat, 08 Oct 2022 23:40:13 -0400
Received: by mail-qt1-x82b.google.com with SMTP id cn9so4907101qtb.11;
 Sat, 08 Oct 2022 20:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+fh8DInve+Oa7yqEdFxuf4mzYk4fjX9XpQ2jx8MeTCo=;
 b=qkWHgjwIUYWaAhJfV5Ai1Z/vPk+6en+HmoztyO/m4qK3AoS87DFjmu/TvQnSYPiG+p
 juJWKUBT5e06QkjsPSC9njpcLI96X5MbAmVruCoKdHKaHNlxBa5zBMWbkxn8Z6oIr+Uu
 thAZl4aFnH86S2H4OMCkF3P7+D4WbX6xmvvM7vMpktaU4vATEVCQPZe7xTX9kN6sseiL
 u9EpzVWAynhS29HCl/wFaIZ/7ag3ltRtIfszn8By5DC/fM3lAcbTkNUulLNh/y0LOaTa
 cc3nRTRZ14kArq+yuwRuL7V0fYormaBkqc12Ln4yRlChK4/s7Ee0RrrmnpGX0W//qmK9
 Vr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+fh8DInve+Oa7yqEdFxuf4mzYk4fjX9XpQ2jx8MeTCo=;
 b=U/ZtMZAgEJI7Z/a6EhkqgV5cD5xhz2tuqSsp1BVXVFi/9/1W++ri2lDZWimfIR1woT
 I7XglnLkzByFbvraMViECYg4Rd2Zjfq49bHcrM+wcwat6l0N5DeshHT7bo0LQlmN05NP
 menQT4pBeRBxyg5PAMh7h49vY3UO/jYeRjniboKn0vAh5scwdZmFN9YuqQqvXktQfOQV
 71RW36Afv/GduVIULFhV1BvFPHV2uytp98ommpc5VfWd/nJn2jaCh8X3yXBk16qgWJSz
 rX86q8CmDkvWz5BCtxWKWUL7GMEjvLLGD9X8Dl95zS/nY1Qz7ekNr9lDJFyQ0kO/jVrf
 B9ig==
X-Gm-Message-State: ACrzQf1ws2AnRp8sBGllBYE5Qf+PThGDRLXmNMAmIrWy9U1pp8XRbFvo
 NzYILIM4gzVczOxoiuQcYXm0vnXRJ+0uEml70Jc=
X-Google-Smtp-Source: AMsMyM7fwJ0uUjrStk0WKMOZdmlDUOBpbS0h5KjYh5PoVS7Elzu3c3YxMDpHVsDrTbd2V5/HUVsa6ovG1VKUaHQef/w=
X-Received: by 2002:ac8:57ca:0:b0:35b:b51f:94fc with SMTP id
 w10-20020ac857ca000000b0035bb51f94fcmr10198859qta.276.1665286809968; Sat, 08
 Oct 2022 20:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-10-shentey@gmail.com>
In-Reply-To: <20221003203142.24355-10-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 9 Oct 2022 11:39:58 +0800
Message-ID: <CAEUhbmUAunQf6bDb=qD+KkmtCQBGxBc7wbO5A3YJFYvTaTn3Dg@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] hw/ppc/e500: Implement pflash handling
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
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

On Tue, Oct 4, 2022 at 5:40 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
>
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/ppc/ppce500.rst | 12 ++++++
>  hw/ppc/Kconfig              |  1 +
>  hw/ppc/e500.c               | 76 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 89 insertions(+)
>
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index ba6bcb7314..1ed6c36599 100644
> --- a/docs/system/ppc/ppce500.rst
> +++ b/docs/system/ppc/ppce500.rst
> @@ -119,6 +119,18 @@ To boot the 32-bit Linux kernel:
>        -initrd /path/to/rootfs.cpio \
>        -append "root=/dev/ram"
>
> +Rather than using a root file system on ram disk, it is possible to have it on
> +emulated flash. Given an ext2 image whose size must be a power of two, it can
> +be used as follows:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
> +      -display none -serial stdio \
> +      -kernel vmlinux \
> +      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
> +      -append "rootwait root=/dev/mtdblock0"

Could we add a separate sub-section "pflash" after the "networking"
part you did before?

> +
>  Running U-Boot
>  --------------
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 791fe78a50..769a1ead1c 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -126,6 +126,7 @@ config E500
>      select ETSEC
>      select GPIO_MPC8XXX
>      select OPENPIC
> +    select PFLASH_CFI01
>      select PLATFORM_BUS
>      select PPCE500_PCI
>      select SERIAL
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 3e950ea3ba..2b1430fca4 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -23,8 +23,10 @@
>  #include "e500-ccsr.h"
>  #include "net/net.h"
>  #include "qemu/config-file.h"
> +#include "hw/block/flash.h"
>  #include "hw/char/serial.h"
>  #include "hw/pci/pci.h"
> +#include "sysemu/block-backend-io.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
> @@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
>      }
>  }
>
> +static void create_devtree_flash(SysBusDevice *sbdev,
> +                                 PlatformDevtreeData *data)
> +{
> +    g_autofree char *name = NULL;
> +    uint64_t num_blocks = object_property_get_uint(OBJECT(sbdev),
> +                                                   "num-blocks",
> +                                                   &error_fatal);
> +    uint64_t sector_length = object_property_get_uint(OBJECT(sbdev),
> +                                                      "sector-length",
> +                                                      &error_fatal);
> +    uint64_t bank_width = object_property_get_uint(OBJECT(sbdev),
> +                                                   "width",
> +                                                   &error_fatal);
> +    hwaddr flashbase = 0;
> +    hwaddr flashsize = num_blocks * sector_length;
> +    void *fdt = data->fdt;
> +
> +    name = g_strdup_printf("%s/nor@%" PRIx64, data->node, flashbase);
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> +                                 1, flashbase, 1, flashsize);
> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
> +}
> +
>  static void platform_bus_create_devtree(PPCE500MachineState *pms,
>                                          void *fdt, const char *mpic)
>  {
> @@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>      uint64_t addr = pmc->platform_bus_base;
>      uint64_t size = pmc->platform_bus_size;
>      int irq_start = pmc->platform_bus_first_irq;
> +    SysBusDevice *sbdev;
> +    bool ambiguous;
>
>      /* Create a /platform node that we can put all devices into */
>
> @@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>      /* Loop through all dynamic sysbus devices and create nodes for them */
>      foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
>
> +    sbdev = SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_CFI01,
> +                                                    &ambiguous));
> +    if (sbdev) {
> +        assert(!ambiguous);
> +        create_devtree_flash(sbdev, &data);
> +    }
> +
>      g_free(node);
>  }
>
> @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>      unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
>      IrqLines *irqs;
>      DeviceState *dev, *mpicdev;
> +    DriveInfo *dinfo;
>      CPUPPCState *firstenv = NULL;
>      MemoryRegion *ccsr_addr_space;
>      SysBusDevice *s;
> @@ -1024,6 +1061,45 @@ void ppce500_init(MachineState *machine)
>                                  pmc->platform_bus_base,
>                                  &pms->pbus_dev->mmio);
>
> +    dinfo = drive_get(IF_PFLASH, 0, 0);
> +    if (dinfo) {
> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +        BlockDriverState *bs = blk_bs(blk);
> +        uint64_t size = bdrv_getlength(bs);
> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
> +        uint32_t sector_len = 64 * KiB;
> +
> +        if (ctpop64(size) != 1) {
> +            error_report("Size of pflash file must be a power of two.");
> +            exit(1);
> +        }
> +
> +        if (size > mmio_size) {
> +            error_report("Size of pflash file must not be bigger than %" PRIu64
> +                         " bytes.", mmio_size);
> +            exit(1);
> +        }
> +
> +        assert(QEMU_IS_ALIGNED(size, sector_len));
> +
> +        dev = qdev_new(TYPE_PFLASH_CFI01);
> +        qdev_prop_set_drive(dev, "drive", blk);
> +        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
> +        qdev_prop_set_uint64(dev, "sector-length", sector_len);
> +        qdev_prop_set_uint8(dev, "width", 2);
> +        qdev_prop_set_bit(dev, "big-endian", true);
> +        qdev_prop_set_uint16(dev, "id0", 0x89);
> +        qdev_prop_set_uint16(dev, "id1", 0x18);
> +        qdev_prop_set_uint16(dev, "id2", 0x0000);
> +        qdev_prop_set_uint16(dev, "id3", 0x0);
> +        qdev_prop_set_string(dev, "name", "e500.flash");
> +        s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +
> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    sysbus_mmio_get_region(s, 0));
> +    }
> +
>      /*
>       * Smart firmware defaults ahead!
>       *

Otherwise LGTM:
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

