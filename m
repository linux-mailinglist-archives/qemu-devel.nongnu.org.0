Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D295BB17F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 19:09:17 +0200 (CEST)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZEq4-0003MX-7y
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZEmJ-0007wj-TB; Fri, 16 Sep 2022 13:05:23 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZEmH-00017M-G9; Fri, 16 Sep 2022 13:05:23 -0400
Received: by mail-ej1-x630.google.com with SMTP id 13so21883567ejn.3;
 Fri, 16 Sep 2022 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=NNNxBKm9ktI3VGfKxxJaOByeS5lYCWYUpZdGkLZYS+w=;
 b=V30kLheOsTRihJDKtJX+1izkq+hboFDzQA3GcUtE1wmck+f8NyFLJhAesCtKq+aWLN
 NC8oE9zgrWhv5kiRW03FpiAnE3mE6bNzQEopJJgl0pZozjO/8UZ3X+dUOHdp4kKf9tTo
 l0hiPVSxPENANu2kmwDXYbItRe/czmgJXx4XL5EAjIuV+Vf5WtpmDf7C2hAFs6kKuoh4
 YfOPdFecEobzMg2nEnODqyv3fdsmfD1UNHx0xU9cXcTuAKtOX7UmMY2s8tQupdniMHXU
 Rb8DMLUgyXZYQDkxF06eQOT0CqzmvQZzZqNywE1yP0wMvKnvKXNMsLjRE4aC0Y+xKb7E
 5gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NNNxBKm9ktI3VGfKxxJaOByeS5lYCWYUpZdGkLZYS+w=;
 b=BRL3oM9RQ+ux9h6/wsVvNEYX0AYQwmPrKwzbOIMq9fJS4O/LziXAtuP6i9NtyBpvfN
 S0eTRrUnb8ppgLGs5f2ZD6wkjONCRLO6co6ARKAKGLohnCo0xiJCVB+RUleLfjAN3yTw
 2WlX5sci6CpQRvZbhvGt/WhHSJeuGGKMdxebcIvh31dnRW4HJ0R/Lf/QAyaHVFBTuDVm
 jG3xGOulo0cO7iZjN+guLicJCBjIEODSAtTk0VaDGkXkk4m8hOrr3MUUhLqS1y38mvOk
 1q2gNIWX1rReD6UuPtZOC1AZLW1apOBIMnJRXYkfyfLy3vsY374OqjdiIw9foahN8nFy
 CMgg==
X-Gm-Message-State: ACrzQf1vhvd2IkiEJD+3K5eRcR2zoop5ITwP8VnPxqQY47/ELq4fuVig
 moaA/aCGQe+qPKo4UTN36PU=
X-Google-Smtp-Source: AMsMyM5wfdSynhddAKyyDX1fHh1WmNAHhSZtrJPdOH4f83eVZdOeaWbWHvB7ntixadNaIEDWmdCjJQ==
X-Received: by 2002:a17:906:959:b0:741:6f76:546f with SMTP id
 j25-20020a170906095900b007416f76546fmr4410819ejd.32.1663347919095; 
 Fri, 16 Sep 2022 10:05:19 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-154-155.77.191.pool.telefonica.de.
 [77.191.154.155]) by smtp.gmail.com with ESMTPSA id
 q25-20020a17090622d900b00780636a85fasm2378311eja.221.2022.09.16.10.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 10:05:18 -0700 (PDT)
Date: Fri, 16 Sep 2022 17:05:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 07/11] hw/ppc/e500: Implement pflash handling
In-Reply-To: <CAEUhbmUzss14vX0GeB8GgB1n2YTzai5sKsYno_qzh68fXixqXA@mail.gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-8-shentey@gmail.com>
 <CAEUhbmUzss14vX0GeB8GgB1n2YTzai5sKsYno_qzh68fXixqXA@mail.gmail.com>
Message-ID: <056AAA77-0631-43DA-B1B0-7DD73A87BD72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

Am 16=2E September 2022 15:00:06 UTC schrieb Bin Meng <bmeng=2Ecn@gmail=2Ec=
om>:
>On Thu, Sep 15, 2022 at 11:36 PM Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>>
>> Allows e500 boards to have their root file system reside on flash using
>> only builtin devices=2E
>>
>> Note that the flash memory area is only created when a -pflash argument=
 is
>> given, and that the size is determined by the given file=2E The idea is=
 to
>> put users into control=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  docs/system/ppc/ppce500=2Erst | 12 +++++++++
>>  hw/ppc/Kconfig              |  1 +
>>  hw/ppc/e500=2Ec               | 54 +++++++++++++++++++++++++++++++++++=
++
>>  3 files changed, 67 insertions(+)
>>
>> diff --git a/docs/system/ppc/ppce500=2Erst b/docs/system/ppc/ppce500=2E=
rst
>> index ba6bcb7314=2E=2Ec3f55c6f3d 100644
>> --- a/docs/system/ppc/ppce500=2Erst
>> +++ b/docs/system/ppc/ppce500=2Erst
>> @@ -119,6 +119,18 @@ To boot the 32-bit Linux kernel:
>>        -initrd /path/to/rootfs=2Ecpio \
>>        -append "root=3D/dev/ram"
>>
>> +Rather than using a root file system on ram disk, it is possible to ha=
ve it on
>> +emulated flash=2E Given an ext2 image whose size must be a power of tw=
o, it can
>> +be used as follows:
>> +
>> +=2E=2E code-block:: bash
>> +
>> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
>
>qemu-system-ppc{64|32}

Will fix=2E

>> +      -display none -serial stdio \
>> +      -kernel vmlinux \
>> +      -drive if=3Dpflash,file=3D/path/to/rootfs=2Eext2,format=3Draw \
>> +      -append "rootwait root=3D/dev/mtdblock0"
>> +
>>  Running U-Boot
>>  --------------
>>
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index 791fe78a50=2E=2E769a1ead1c 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -126,6 +126,7 @@ config E500
>>      select ETSEC
>>      select GPIO_MPC8XXX
>>      select OPENPIC
>> +    select PFLASH_CFI01
>>      select PLATFORM_BUS
>>      select PPCE500_PCI
>>      select SERIAL
>> diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>> index 864b6f3d92=2E=2E7843a4e04b 100644
>> --- a/hw/ppc/e500=2Ec
>> +++ b/hw/ppc/e500=2Ec
>> @@ -23,8 +23,10 @@
>>  #include "e500-ccsr=2Eh"
>>  #include "net/net=2Eh"
>>  #include "qemu/config-file=2Eh"
>> +#include "hw/block/flash=2Eh"
>>  #include "hw/char/serial=2Eh"
>>  #include "hw/pci/pci=2Eh"
>> +#include "sysemu/block-backend-io=2Eh"
>>  #include "sysemu/sysemu=2Eh"
>>  #include "sysemu/kvm=2Eh"
>>  #include "sysemu/reset=2Eh"
>> @@ -267,6 +269,34 @@ static void sysbus_device_create_devtree(SysBusDev=
ice *sbdev, void *opaque)
>>      }
>>  }
>>
>> +static void create_devtree_flash(SysBusDevice *sbdev,
>> +                                 PlatformDevtreeData *data)
>> +{
>> +    char *name;
>
>Use g_autofree

Yes, good idea=2E

>> +    uint64_t num_blocks =3D object_property_get_uint(OBJECT(sbdev),
>> +                                                   "num-blocks",
>> +                                                   &error_fatal);
>> +    uint64_t sector_length =3D object_property_get_uint(OBJECT(sbdev),
>> +                                                      "sector-length",
>> +                                                      &error_fatal);
>> +    uint64_t bank_width =3D object_property_get_uint(OBJECT(sbdev),
>> +                                                   "width",
>> +                                                   &error_fatal);
>> +    hwaddr flashbase =3D 0;
>> +    hwaddr flashsize =3D num_blocks * sector_length;
>> +    void *fdt =3D data->fdt;
>> +
>> +    name =3D g_strdup_printf("%s/nor@%" PRIx64, data->node, flashbase)=
;
>> +    qemu_fdt_add_subnode(fdt, name);
>> +    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
>> +    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 1);
>
>#address-cells and #size-cells are not needed=2E

Will remove=2E

>> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
>> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
>> +                                 1, flashbase, 1, flashsize);
>> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
>> +    g_free(name);
>> +}
>> +
>>  static void platform_bus_create_devtree(PPCE500MachineState *pms,
>>                                          void *fdt, const char *mpic)
>>  {
>> @@ -276,6 +306,8 @@ static void platform_bus_create_devtree(PPCE500Mach=
ineState *pms,
>>      uint64_t addr =3D pmc->platform_bus_base;
>>      uint64_t size =3D pmc->platform_bus_size;
>>      int irq_start =3D pmc->platform_bus_first_irq;
>> +    SysBusDevice *sbdev;
>> +    bool ambiguous;
>>
>>      /* Create a /platform node that we can put all devices into */
>>
>> @@ -302,6 +334,13 @@ static void platform_bus_create_devtree(PPCE500Mac=
hineState *pms,
>>      /* Loop through all dynamic sysbus devices and create nodes for th=
em */
>>      foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data)=
;
>>
>> +    sbdev =3D SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_=
CFI01,
>> +                                                    &ambiguous));
>
>Can this be moved into sysbus_device_create_devtree(), and use the
>same logic as the eTSEC device?

I've tried that, but the logic for eTSEC seems to get triggered for user-c=
reated devices only=2E Since TYPE_PFLASH_CFI01 isn't user-created we're not=
 triggered I guess=2E

I think that the eTSEC handling could be moved into sysbus-fdt=2Ec but I'm=
 not sure whether this is allowed due to poisoning=2E

>> +    if (sbdev) {
>> +        assert(!ambiguous);
>> +        create_devtree_flash(sbdev, &data);
>> +    }
>> +
>>      g_free(node);
>>  }
>>
>> @@ -856,6 +895,7 @@ void ppce500_init(MachineState *machine)
>>      unsigned int pci_irq_nrs[PCI_NUM_PINS] =3D {1, 2, 3, 4};
>>      IrqLines *irqs;
>>      DeviceState *dev, *mpicdev;
>> +    DriveInfo *dinfo;
>>      CPUPPCState *firstenv =3D NULL;
>>      MemoryRegion *ccsr_addr_space;
>>      SysBusDevice *s;
>> @@ -1024,6 +1064,20 @@ void ppce500_init(MachineState *machine)
>>                                  pmc->platform_bus_base,
>>                                  sysbus_mmio_get_region(s, 0));
>>
>> +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>> +    if (dinfo) {
>> +        BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>> +        BlockDriverState *bs =3D blk_bs(blk);
>> +        uint64_t size =3D bdrv_getlength(bs);
>> +        if (ctpop64(size) !=3D 1) {
>> +            error_report("Size of pflash file must be a power of two=
=2E");
>> +            exit(1);
>> +        }
>
>I think we should also check whether the flash size plus the eTSEC
>size exceeds the platform bus mmio window size otherwise it won't work
>for both devices present, no?

I could check that the flash fits inside the eLBC memory window=2E

For user-created devices such as eTSEC, however, I'd like to rely on other=
 parts of QEMU to check this=2E First, I don't know how to get access to al=
l relevant devices and their memory windows, and second, catching all possi=
ble (future) cases here seems a bit ad-hoc and fragile to me=2E

Best regards,
Bernhard
>
>> +        pflash_cfi01_register(pmc->platform_bus_base, "e500=2Eflash",
>> +                              size, blk,
>> +                              64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 1)=
;
>> +    }
>> +
>>      /*
>>       * Smart firmware defaults ahead!
>>       *
>
>Regards,
>Bin


