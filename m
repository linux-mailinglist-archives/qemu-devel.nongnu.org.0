Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7885BAFD0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:03:41 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCsU-00078G-DQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZCpK-0004rx-Kn; Fri, 16 Sep 2022 11:00:22 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:35691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZCpI-0002HD-DR; Fri, 16 Sep 2022 11:00:22 -0400
Received: by mail-qv1-xf34.google.com with SMTP id w4so16829903qvp.2;
 Fri, 16 Sep 2022 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=oWk1c6lWGwEB+0UiMTf/EWiM+TNeZNHVKhDmX3KobuQ=;
 b=L1evIi3oYocSroBKjV8SBLAkGZaBekQL+dPAEMrElvE/p0ndefsBcz5d71t5xh6ff+
 Su2f5/uECxTW5yv9tIzOFu0Z2JuChWCh2WFQNXvhqfLYtHz1dcdDgkR4B6lVe6jlAAcp
 Bf5ZUQzD/YwlMnj3K6pGwcNMslYtyasVq66vWXMgo7kHOzlwisWxGcDNoLigiwQY38uV
 PCtUi7U0qEvxLub1mqc4I5hOMibSc3o69SVPfGPBl+5F163C/6GtcsbF1/4MuK3surg3
 Aj79vMGVi9sFa7ziusimToQBtVd731rygOAFWnXNjMdHxdTaSt/sOCqyW7Pfs6u33I9w
 NVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oWk1c6lWGwEB+0UiMTf/EWiM+TNeZNHVKhDmX3KobuQ=;
 b=l1P1K49E8daa5bkfJaVCI8oz5it5IBg9GjXMBctI4YF9d7q1THaARJLofcA2Sv4LWq
 5jDJ6W2YQia5Du7ARde7uTWYQOSdfbxoIwTC/aMdP99J726T/M63D73JYRIppxo7DzUE
 99mjly27J54me62Vb7EbPADxKfke5RtQTsJgOCwBXyjj+B2D9gikYZt/wNY5lCbevruy
 TKY344J2JSrUvOm5E+5/8/ssERKJr6q2Yla6hlRrzgtLQF+OVT+gAXRHxxR//0XJXsO8
 FsB2Va2qFLZcUULHXyjc49OKjbozrw/KrBVU9HoWeVj8uNYMRFyoVKz4LuoVZ2O+Q1w2
 rKdg==
X-Gm-Message-State: ACrzQf2nDrh/NUWfQtv7La7NorAa8B18DQS/f/XUtGB/VwL3iqxSBisz
 d1p1/EkigmBBdLLQBWroLfiI3BN2nhPsDuv5ZIk=
X-Google-Smtp-Source: AMsMyM4g7rDq68k6l0Q3+mU0LYqq87VfhIaoKFXbrqnu+EOSAuomharmNogS8gcDbMznHEE/H9Yu0vQAQti0fTbT0xU=
X-Received: by 2002:a05:6214:20a8:b0:4ac:b917:ccae with SMTP id
 8-20020a05621420a800b004acb917ccaemr4092413qvd.85.1663340418636; Fri, 16 Sep
 2022 08:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-8-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-8-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 23:00:06 +0800
Message-ID: <CAEUhbmUzss14vX0GeB8GgB1n2YTzai5sKsYno_qzh68fXixqXA@mail.gmail.com>
Subject: Re: [PATCH 07/11] hw/ppc/e500: Implement pflash handling
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
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

On Thu, Sep 15, 2022 at 11:36 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices.
>
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/ppc/ppce500.rst | 12 +++++++++
>  hw/ppc/Kconfig              |  1 +
>  hw/ppc/e500.c               | 54 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index ba6bcb7314..c3f55c6f3d 100644
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
> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \

qemu-system-ppc{64|32}

> +      -display none -serial stdio \
> +      -kernel vmlinux \
> +      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
> +      -append "rootwait root=/dev/mtdblock0"
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
> index 864b6f3d92..7843a4e04b 100644
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
> @@ -267,6 +269,34 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
>      }
>  }
>
> +static void create_devtree_flash(SysBusDevice *sbdev,
> +                                 PlatformDevtreeData *data)
> +{
> +    char *name;

Use g_autofree

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
> +    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 1);

#address-cells and #size-cells are not needed.

> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> +                                 1, flashbase, 1, flashsize);
> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
> +    g_free(name);
> +}
> +
>  static void platform_bus_create_devtree(PPCE500MachineState *pms,
>                                          void *fdt, const char *mpic)
>  {
> @@ -276,6 +306,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>      uint64_t addr = pmc->platform_bus_base;
>      uint64_t size = pmc->platform_bus_size;
>      int irq_start = pmc->platform_bus_first_irq;
> +    SysBusDevice *sbdev;
> +    bool ambiguous;
>
>      /* Create a /platform node that we can put all devices into */
>
> @@ -302,6 +334,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>      /* Loop through all dynamic sysbus devices and create nodes for them */
>      foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
>
> +    sbdev = SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_CFI01,
> +                                                    &ambiguous));

Can this be moved into sysbus_device_create_devtree(), and use the
same logic as the eTSEC device?

> +    if (sbdev) {
> +        assert(!ambiguous);
> +        create_devtree_flash(sbdev, &data);
> +    }
> +
>      g_free(node);
>  }
>
> @@ -856,6 +895,7 @@ void ppce500_init(MachineState *machine)
>      unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
>      IrqLines *irqs;
>      DeviceState *dev, *mpicdev;
> +    DriveInfo *dinfo;
>      CPUPPCState *firstenv = NULL;
>      MemoryRegion *ccsr_addr_space;
>      SysBusDevice *s;
> @@ -1024,6 +1064,20 @@ void ppce500_init(MachineState *machine)
>                                  pmc->platform_bus_base,
>                                  sysbus_mmio_get_region(s, 0));
>
> +    dinfo = drive_get(IF_PFLASH, 0, 0);
> +    if (dinfo) {
> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +        BlockDriverState *bs = blk_bs(blk);
> +        uint64_t size = bdrv_getlength(bs);
> +        if (ctpop64(size) != 1) {
> +            error_report("Size of pflash file must be a power of two.");
> +            exit(1);
> +        }

I think we should also check whether the flash size plus the eTSEC
size exceeds the platform bus mmio window size otherwise it won't work
for both devices present, no?

> +        pflash_cfi01_register(pmc->platform_bus_base, "e500.flash",
> +                              size, blk,
> +                              64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 1);
> +    }
> +
>      /*
>       * Smart firmware defaults ahead!
>       *

Regards,
Bin

