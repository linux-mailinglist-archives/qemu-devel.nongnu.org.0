Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B225F375D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 22:52:54 +0200 (CEST)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSQn-0001bh-Mf
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 16:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofRP6-0002h1-Qz; Mon, 03 Oct 2022 15:47:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofRP4-0005s6-Mi; Mon, 03 Oct 2022 15:47:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id a2so4321246ejx.10;
 Mon, 03 Oct 2022 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=PF5iir5haeMBTIqyraGuTsPZvt77hIi+cRu3l+Bac2w=;
 b=jV7YUARstJ3hqk8HXz9J2auqfBuZrr8iyO0ksXuV+SrZrQacXelDgNWZHEgZGSf1M2
 YS3spmbNkmRNdSV/fULKnPpyZlSSElOpxGUMwWiOGLTrW3h0wkHhifsw+yKNpDB+H/ax
 6/YjocVQsPw/cRGRLoDsgg60JeKaeX891PDFJBYyVsyW26wZegxSY5iqaEBRWGGGIXC1
 iPB4Zdix9Yjk/GzNyIbNZjlvBoGFkeCIcKSG/BRG8ETN1Q06rcfneM+qUGYhv7mnv6Sc
 3EPFUMi6kemxAiAOeFpNt7A911/xJ2CEebvWtSYU9pwhZZsLAY6o0OuaNoBYtnPlELaH
 mvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PF5iir5haeMBTIqyraGuTsPZvt77hIi+cRu3l+Bac2w=;
 b=PJzTm5bt9DmPA+wdYdzHt0n5aRpJrlRgKEiQTW8uc3RzMWbNL8HIb818PniWos44iT
 xIId0q/3onm3V+VCfMq8uO/YlotW5U92ffQ3IWYHF9pgDF/nxOTs/d6OhG5mhnrDc+so
 IzhwYtdgtbzw1bCZ2ebXY5ICwVlohEwrZInetIwPQu+Z4/9LvP5jwaMXv6uXOhGzXGAZ
 8RakruE/K8655piCpMMPG7sq3gM7GNC5n8/B7TakjzF0362vw+LbIlvBW4KjK1ifU72b
 tkfug8K+hGmpp1HISSGsctWvCt6CyV4fPD5T63GTLF4UC/dX9liT9x/1VFl0MFHFd/sf
 Y21g==
X-Gm-Message-State: ACrzQf3hgX6u/4wkIk+UeZMMA1uj3eTdjOPrCtMBCY85+y254wNCLh9R
 1SUYFgc+W+n6t5BEFt8LhFE=
X-Google-Smtp-Source: AMsMyM75FlR0VwPuLUkYAI8Vg7cDDMx569qUlhEOo1SRmYmbUOY+bdYGQk64TLsjWXwUSCgfIBFHlQ==
X-Received: by 2002:a17:907:8693:b0:783:a776:ce86 with SMTP id
 qa19-20020a170907869300b00783a776ce86mr16064881ejc.243.1664826418599; 
 Mon, 03 Oct 2022 12:46:58 -0700 (PDT)
Received: from [127.0.0.1] ([46.183.103.8]) by smtp.gmail.com with ESMTPSA id
 r5-20020aa7d585000000b00459148fbb3csm145142edq.86.2022.10.03.12.46.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Oct 2022 12:46:58 -0700 (PDT)
Date: Mon, 03 Oct 2022 19:45:16 +0000
From: B <shentey@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 07/11] hw/ppc/e500: Implement pflash handling
In-Reply-To: <056AAA77-0631-43DA-B1B0-7DD73A87BD72@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-8-shentey@gmail.com>
 <CAEUhbmUzss14vX0GeB8GgB1n2YTzai5sKsYno_qzh68fXixqXA@mail.gmail.com>
 <056AAA77-0631-43DA-B1B0-7DD73A87BD72@gmail.com>
Message-ID: <481336C1-6F41-4DDB-95B7-CFD680F38BFE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



Am 16=2E September 2022 17:05:13 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>Am 16=2E September 2022 15:00:06 UTC schrieb Bin Meng <bmeng=2Ecn@gmail=
=2Ecom>:
>>On Thu, Sep 15, 2022 at 11:36 PM Bernhard Beschow <shentey@gmail=2Ecom> =
wrote:
>>>
>>> Allows e500 boards to have their root file system reside on flash usin=
g
>>> only builtin devices=2E
>>>
>>> Note that the flash memory area is only created when a -pflash argumen=
t is
>>> given, and that the size is determined by the given file=2E The idea i=
s to
>>> put users into control=2E
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> ---
>>>  docs/system/ppc/ppce500=2Erst | 12 +++++++++
>>>  hw/ppc/Kconfig              |  1 +
>>>  hw/ppc/e500=2Ec               | 54 ++++++++++++++++++++++++++++++++++=
+++
>>>  3 files changed, 67 insertions(+)
>>>
>>> diff --git a/docs/system/ppc/ppce500=2Erst b/docs/system/ppc/ppce500=
=2Erst
>>> index ba6bcb7314=2E=2Ec3f55c6f3d 100644
>>> --- a/docs/system/ppc/ppce500=2Erst
>>> +++ b/docs/system/ppc/ppce500=2Erst
>>> @@ -119,6 +119,18 @@ To boot the 32-bit Linux kernel:
>>>        -initrd /path/to/rootfs=2Ecpio \
>>>        -append "root=3D/dev/ram"
>>>
>>> +Rather than using a root file system on ram disk, it is possible to h=
ave it on
>>> +emulated flash=2E Given an ext2 image whose size must be a power of t=
wo, it can
>>> +be used as follows:
>>> +
>>> +=2E=2E code-block:: bash
>>> +
>>> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
>>
>>qemu-system-ppc{64|32}
>
>Will fix=2E
>
>>> +      -display none -serial stdio \
>>> +      -kernel vmlinux \
>>> +      -drive if=3Dpflash,file=3D/path/to/rootfs=2Eext2,format=3Draw \
>>> +      -append "rootwait root=3D/dev/mtdblock0"
>>> +
>>>  Running U-Boot
>>>  --------------
>>>
>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>> index 791fe78a50=2E=2E769a1ead1c 100644
>>> --- a/hw/ppc/Kconfig
>>> +++ b/hw/ppc/Kconfig
>>> @@ -126,6 +126,7 @@ config E500
>>>      select ETSEC
>>>      select GPIO_MPC8XXX
>>>      select OPENPIC
>>> +    select PFLASH_CFI01
>>>      select PLATFORM_BUS
>>>      select PPCE500_PCI
>>>      select SERIAL
>>> diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>>> index 864b6f3d92=2E=2E7843a4e04b 100644
>>> --- a/hw/ppc/e500=2Ec
>>> +++ b/hw/ppc/e500=2Ec
>>> @@ -23,8 +23,10 @@
>>>  #include "e500-ccsr=2Eh"
>>>  #include "net/net=2Eh"
>>>  #include "qemu/config-file=2Eh"
>>> +#include "hw/block/flash=2Eh"
>>>  #include "hw/char/serial=2Eh"
>>>  #include "hw/pci/pci=2Eh"
>>> +#include "sysemu/block-backend-io=2Eh"
>>>  #include "sysemu/sysemu=2Eh"
>>>  #include "sysemu/kvm=2Eh"
>>>  #include "sysemu/reset=2Eh"
>>> @@ -267,6 +269,34 @@ static void sysbus_device_create_devtree(SysBusDe=
vice *sbdev, void *opaque)
>>>      }
>>>  }
>>>
>>> +static void create_devtree_flash(SysBusDevice *sbdev,
>>> +                                 PlatformDevtreeData *data)
>>> +{
>>> +    char *name;
>>
>>Use g_autofree
>
>Yes, good idea=2E
>
>>> +    uint64_t num_blocks =3D object_property_get_uint(OBJECT(sbdev),
>>> +                                                   "num-blocks",
>>> +                                                   &error_fatal);
>>> +    uint64_t sector_length =3D object_property_get_uint(OBJECT(sbdev)=
,
>>> +                                                      "sector-length"=
,
>>> +                                                      &error_fatal);
>>> +    uint64_t bank_width =3D object_property_get_uint(OBJECT(sbdev),
>>> +                                                   "width",
>>> +                                                   &error_fatal);
>>> +    hwaddr flashbase =3D 0;
>>> +    hwaddr flashsize =3D num_blocks * sector_length;
>>> +    void *fdt =3D data->fdt;
>>> +
>>> +    name =3D g_strdup_printf("%s/nor@%" PRIx64, data->node, flashbase=
);
>>> +    qemu_fdt_add_subnode(fdt, name);
>>> +    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
>>> +    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 1);
>>
>>#address-cells and #size-cells are not needed=2E
>
>Will remove=2E
>
>>> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
>>> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
>>> +                                 1, flashbase, 1, flashsize);
>>> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
>>> +    g_free(name);
>>> +}
>>> +
>>>  static void platform_bus_create_devtree(PPCE500MachineState *pms,
>>>                                          void *fdt, const char *mpic)
>>>  {
>>> @@ -276,6 +306,8 @@ static void platform_bus_create_devtree(PPCE500Mac=
hineState *pms,
>>>      uint64_t addr =3D pmc->platform_bus_base;
>>>      uint64_t size =3D pmc->platform_bus_size;
>>>      int irq_start =3D pmc->platform_bus_first_irq;
>>> +    SysBusDevice *sbdev;
>>> +    bool ambiguous;
>>>
>>>      /* Create a /platform node that we can put all devices into */
>>>
>>> @@ -302,6 +334,13 @@ static void platform_bus_create_devtree(PPCE500Ma=
chineState *pms,
>>>      /* Loop through all dynamic sysbus devices and create nodes for t=
hem */
>>>      foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data=
);
>>>
>>> +    sbdev =3D SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH=
_CFI01,
>>> +                                                    &ambiguous));
>>
>>Can this be moved into sysbus_device_create_devtree(), and use the
>>same logic as the eTSEC device?
>
>I've tried that, but the logic for eTSEC seems to get triggered for user-=
created devices only=2E Since TYPE_PFLASH_CFI01 isn't user-created we're no=
t triggered I guess=2E
>
>I think that the eTSEC handling could be moved into sysbus-fdt=2Ec but I'=
m not sure whether this is allowed due to poisoning=2E
>
>>> +    if (sbdev) {
>>> +        assert(!ambiguous);
>>> +        create_devtree_flash(sbdev, &data);
>>> +    }
>>> +
>>>      g_free(node);
>>>  }
>>>
>>> @@ -856,6 +895,7 @@ void ppce500_init(MachineState *machine)
>>>      unsigned int pci_irq_nrs[PCI_NUM_PINS] =3D {1, 2, 3, 4};
>>>      IrqLines *irqs;
>>>      DeviceState *dev, *mpicdev;
>>> +    DriveInfo *dinfo;
>>>      CPUPPCState *firstenv =3D NULL;
>>>      MemoryRegion *ccsr_addr_space;
>>>      SysBusDevice *s;
>>> @@ -1024,6 +1064,20 @@ void ppce500_init(MachineState *machine)
>>>                                  pmc->platform_bus_base,
>>>                                  sysbus_mmio_get_region(s, 0));
>>>
>>> +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>>> +    if (dinfo) {
>>> +        BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>>> +        BlockDriverState *bs =3D blk_bs(blk);
>>> +        uint64_t size =3D bdrv_getlength(bs);
>>> +        if (ctpop64(size) !=3D 1) {
>>> +            error_report("Size of pflash file must be a power of two=
=2E");
>>> +            exit(1);
>>> +        }
>>
>>I think we should also check whether the flash size plus the eTSEC
>>size exceeds the platform bus mmio window size otherwise it won't work
>>for both devices present, no?
>
>I could check that the flash fits inside the eLBC memory window=2E
>
>For user-created devices such as eTSEC, however, I'd like to rely on othe=
r parts of QEMU to check this=2E First, I don't know how to get access to a=
ll relevant devices and their memory windows, and second, catching all poss=
ible (future) cases here seems a bit ad-hoc and fragile to me=2E

As it turns out, platform_bus_link_device() already aborts with an error i=
f an eTSEC device doesn't fit in the remaining space=2E So only the pflash =
size remains to be checked=2E
>
>Best regards,
>Bernhard
>>
>>> +        pflash_cfi01_register(pmc->platform_bus_base, "e500=2Eflash",
>>> +                              size, blk,
>>> +                              64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 1=
);
>>> +    }
>>> +
>>>      /*
>>>       * Smart firmware defaults ahead!
>>>       *
>>
>>Regards,
>>Bin
>

