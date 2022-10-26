Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84560E629
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:07:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onjoU-00065Z-Fb; Wed, 26 Oct 2022 13:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onjoT-00065A-8B; Wed, 26 Oct 2022 13:03:33 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onjoR-0005OC-Ac; Wed, 26 Oct 2022 13:03:33 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so12308485fac.1; 
 Wed, 26 Oct 2022 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9OfcjC5UD9xsctY0vEe81KqHTHGeVu/1OEKOzD3d3c=;
 b=c6+jCF57oInS0wpqCOIHtp+iUac24zoELSRi6Xd5LzqfJUNLfe2SIczCw5QPjrZKjP
 MVZknFOJmAttvNULZHDPNzKoWH1quvqv9VOoU34YkkGhaqFdWpi5xmZ8PSi5vwLo9QWb
 SzXsCmdBSYfev2og9OacPK4XxVrU2/VgH8s/OxLwe2mPPZ4EfV1gvmRcK733AGh2XRXU
 PiKpbs5nryMSkR6Qxg/t2CUHLJwdrAKbSbLALFaCkxuflE5Q1hV7bzUMXI755cToWfqI
 flvfZUKUGkkjCrlvebedlhpWKeNTNSRGEFf36/Pi25HOqgEYe2GiMFGhiEP2VqDHLgMj
 E1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9OfcjC5UD9xsctY0vEe81KqHTHGeVu/1OEKOzD3d3c=;
 b=xcCre2JRJCsY6FDl7FR09tEMXNnnfi+xKENEOASUWfdvN00SwYKQuiTV9xGUjB+Cuv
 9Nx0pU/d2ftKriEv5CgKbbkaGUqIYCCs8Vt+x7KNxxLNjTO2pJjVMVFfn+hGK8gCYqNN
 kw3kWsMm26GaDecdcvH8ONkQrvKhSD5uZIXM1Ct6L7AqsH6CXeD3Yxj/7PElCmDahCNL
 8WpWNxRYTFH0q37cU60uFPqkj4Zh0j9VoogLTxVBNe0L9OesK97jautlkprqySczYRvX
 qETiBtEbdsAzldAUNgMwRf7w4KJhCGEGDkeiB/gQ+QjdR6E+aU00r/9WEmF3MeRpp25h
 QXCw==
X-Gm-Message-State: ACrzQf0CMMdv6JTSSjdmYo0mPV1COmQ+Pn1PDV8Q+FpCzLcO/+9d4T9i
 f9FdKpAxZ2A2kU8n7OPsMIk=
X-Google-Smtp-Source: AMsMyM6RagxXiKiyemNCKHsoBeL+j/om1Tc+sFeOWGW6tlEJXfIrOo9Ow/BfM+iVapIZuB5jk+mbkQ==
X-Received: by 2002:a05:6870:7387:b0:13b:6a54:362b with SMTP id
 z7-20020a056870738700b0013b6a54362bmr2776364oam.32.1666803808255; 
 Wed, 26 Oct 2022 10:03:28 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a4ad356000000b004805e9e9f3dsm2359918oos.1.2022.10.26.10.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 10:03:27 -0700 (PDT)
Message-ID: <110e1d45-d516-44f6-67bf-5996f66ae096@gmail.com>
Date: Wed, 26 Oct 2022 14:03:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
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
 <20221018210146.193159-6-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221018210146.193159-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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
> Allows e500 boards to have their root file system reside on flash using
> only builtin devices located in the eLBC memory region.
> 
> Note that the flash memory area is only created when a -pflash argument is
> given, and that the size is determined by the given file. The idea is to
> put users into control.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/system/ppc/ppce500.rst | 16 ++++++++
>   hw/ppc/Kconfig              |  1 +
>   hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 96 insertions(+)
> 
> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> index 7b5eb3c4ee..38f8ceb0cf 100644
> --- a/docs/system/ppc/ppce500.rst
> +++ b/docs/system/ppc/ppce500.rst
> @@ -165,3 +165,19 @@ if “-device eTSEC” is given to QEMU:
>   .. code-block:: bash
>   
>     -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
> +
> +Root file system on flash drive
> +-------------------------------
> +
> +Rather than using a root file system on ram disk, it is possible to have it on
> +CFI flash. Given an ext2 image whose size must be a power of two, it can be used
> +as follows:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
> +      -display none -serial stdio \
> +      -kernel vmlinux \
> +      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
> +      -append "rootwait root=/dev/mtdblock0"
> +
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 791fe78a50..769a1ead1c 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -126,6 +126,7 @@ config E500
>       select ETSEC
>       select GPIO_MPC8XXX
>       select OPENPIC
> +    select PFLASH_CFI01
>       select PLATFORM_BUS
>       select PPCE500_PCI
>       select SERIAL
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 3e950ea3ba..73198adac8 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -23,8 +23,10 @@
>   #include "e500-ccsr.h"
>   #include "net/net.h"
>   #include "qemu/config-file.h"
> +#include "hw/block/flash.h"
>   #include "hw/char/serial.h"
>   #include "hw/pci/pci.h"
> +#include "sysemu/block-backend-io.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/reset.h"
> @@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
>       }
>   }
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
>   static void platform_bus_create_devtree(PPCE500MachineState *pms,
>                                           void *fdt, const char *mpic)
>   {
> @@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>       uint64_t addr = pmc->platform_bus_base;
>       uint64_t size = pmc->platform_bus_size;
>       int irq_start = pmc->platform_bus_first_irq;
> +    SysBusDevice *sbdev;
> +    bool ambiguous;
>   
>       /* Create a /platform node that we can put all devices into */
>   
> @@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
>       /* Loop through all dynamic sysbus devices and create nodes for them */
>       foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
>   
> +    sbdev = SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_CFI01,
> +                                                    &ambiguous));
> +    if (sbdev) {
> +        assert(!ambiguous);
> +        create_devtree_flash(sbdev, &data);
> +    }
> +
>       g_free(node);
>   }
>   
> @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>       unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
>       IrqLines *irqs;
>       DeviceState *dev, *mpicdev;
> +    DriveInfo *dinfo;
>       CPUPPCState *firstenv = NULL;
>       MemoryRegion *ccsr_addr_space;
>       SysBusDevice *s;
> @@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
>                                   pmc->platform_bus_base,
>                                   &pms->pbus_dev->mmio);
>   
> +    dinfo = drive_get(IF_PFLASH, 0, 0);
> +    if (dinfo) {
> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +        BlockDriverState *bs = blk_bs(blk);
> +        uint64_t size = bdrv_getlength(bs);
> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
> +        uint32_t sector_len = 64 * KiB;
> +
> +        if (!is_power_of_2(size)) {
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
> +        if (!QEMU_IS_ALIGNED(size, sector_len)) {
> +            error_report("Size of pflash file must be a multiple of %" PRIu32
> +                         ".", sector_len);
> +            exit(1);
> +        }
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
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
> +                                    pflash_cfi01_get_memory(PFLASH_CFI01(dev)));
> +    }
> +
>       /*
>        * Smart firmware defaults ahead!
>        *

