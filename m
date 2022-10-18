Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03560265E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 10:04:44 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okhac-0003BK-PP
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 04:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1okhI5-00084p-Vv; Tue, 18 Oct 2022 03:45:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1okhI3-0004Cm-24; Tue, 18 Oct 2022 03:45:32 -0400
Received: by mail-ed1-x52d.google.com with SMTP id q19so19244545edd.10;
 Tue, 18 Oct 2022 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7dedmZBTkSkYa8C3vpwNlpdsjLRKJ+rVanouwDF5xw=;
 b=qTg3pRhgsqVWTCEXcyAqs5vaFZZjkQ1He6XlX5bGsAop9sRnrUrU71ib3Oi0yYeDTl
 MZq23PcnQ/IQ0ctTL9+raVuRAR0rlcIjy+pKKrYe5ZykN2gXV1Qx/QsIJrMO8KyvUVSq
 rxtN7YZ+j90RP3NRJRGRW+k3YYg34JuPy7z5P3pf6NpD3f5pL/KVzH3AlCIjLp5R6xRV
 d8luAXqf7iV6rbY4ApfFaPJdUjsXzFwFeaudsjXhIy+tscnoOKRnmgmc8YGI6NgCCR/D
 ETrCcAtJIMj05VP6TXVZ+OVtyE0EbfK833QM8sfgYVycL+cONBG9RyNbo4NXiXcCmUGJ
 TIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7dedmZBTkSkYa8C3vpwNlpdsjLRKJ+rVanouwDF5xw=;
 b=r1NatEVLJrxyVPCQwVNscIwgVuFEL4DvFvhpE0lnOlwhLwa5dWcAM8bsUIrpWJi8UK
 4vQTqiK0RMMh8kQmkcNZ9XO+O30+kg/0j/1Gm+CNaWZmStoEt3yZAnZ5v0WIB75iV8OV
 54VU4ns7MVRKBy7EqvBgX93ATKSafsN+6o9IBdWs6m5cGqO9hxbn5tk/xBVL4eupUp/u
 D5sLDk1qw3F+aUW2bc1BpcmelU1a2DrRkebadh+G/pKjKv66ZlakIAz6dRI8XDDxtaIr
 jaHLLTSE5K6XD1IfrXz4rx9O01uIqpBhWI1MKTcH2GBidaZnuo6mKK5amn3gacJSzuWF
 qAkA==
X-Gm-Message-State: ACrzQf1zlBDddyIVDS3tt1g+vrdjzHTGzZK0mbTCuzCVw1qFEsKcCB5+
 +yzJOs5Yx0X4gSKPru/7tds=
X-Google-Smtp-Source: AMsMyM4wXCIw8A/EoE9f/O4nBnwe24m3Tgr1F/MmNdMM7RNsAI9lV+fycZCMZos9n2yUd6eqFkpZJg==
X-Received: by 2002:a05:6402:3588:b0:45d:7d14:baf2 with SMTP id
 y8-20020a056402358800b0045d7d14baf2mr1429210edc.1.1666079124560; 
 Tue, 18 Oct 2022 00:45:24 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-012-048.78.54.pool.telefonica.de.
 [78.54.12.48]) by smtp.gmail.com with ESMTPSA id
 gw4-20020a170906f14400b00730979f568fsm7073645ejb.150.2022.10.18.00.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 00:45:24 -0700 (PDT)
Date: Tue, 18 Oct 2022 07:45:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, Bin Meng <bin.meng@windriver.com>
CC: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
In-Reply-To: <2d634687-bdf7-a59b-76e1-60de81142a4a@eik.bme.hu>
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
 <2d634687-bdf7-a59b-76e1-60de81142a4a@eik.bme.hu>
Message-ID: <2C1D5CD8-9EBA-47A4-8AE9-6464BAB6CC68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

Am 16=2E Oktober 2022 14:15:09 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sun, 16 Oct 2022, Bernhard Beschow wrote:
>> Allows e500 boards to have their root file system reside on flash using
>> only builtin devices located in the eLBC memory region=2E
>>=20
>> Note that the flash memory area is only created when a -pflash argument=
 is
>> given, and that the size is determined by the given file=2E The idea is=
 to
>> put users into control=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> docs/system/ppc/ppce500=2Erst | 16 ++++++++++
>> hw/ppc/Kconfig              |  1 +
>> hw/ppc/e500=2Ec               | 62 ++++++++++++++++++++++++++++++++++++=
+
>> 3 files changed, 79 insertions(+)
>>=20
>> diff --git a/docs/system/ppc/ppce500=2Erst b/docs/system/ppc/ppce500=2E=
rst
>> index ba6bcb7314=2E=2E99d2c680d6 100644
>> --- a/docs/system/ppc/ppce500=2Erst
>> +++ b/docs/system/ppc/ppce500=2Erst
>> @@ -165,3 +165,19 @@ if =E2=80=9C-device eTSEC=E2=80=9D is given to QEM=
U:
>> =2E=2E code-block:: bash
>>=20
>>   -netdev tap,ifname=3Dtap0,script=3Dno,downscript=3Dno,id=3Dnet0 -devi=
ce eTSEC,netdev=3Dnet0
>> +
>> +Root file system on flash drive
>> +-------------------------------
>> +
>> +Rather than using a root file system on ram disk, it is possible to ha=
ve it on
>> +CFI flash=2E Given an ext2 image whose size must be a power of two, it=
 can be used
>> +as follows:
>> +
>> +=2E=2E code-block:: bash
>> +
>> +  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
>
>We have qemu-system-ppc and qemu-system-ppc64 not qemu-system-ppc32 so ma=
ybe qemu-system-ppc[64] even though that looks odd so maybe just qemu-syste=
m-ppc and then people should know that ppc64 includes ppc config as well=2E

True=2E This naming is used elsewhere in this document, so we kept it cons=
istent=2E I think that users will get it either way=2E

@Bin: Any thoughts?

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> +      -display none -serial stdio \
>> +      -kernel vmlinux \
>> +      -drive if=3Dpflash,file=3D/path/to/rootfs=2Eext2,format=3Draw \
>> +      -append "rootwait root=3D/dev/mtdblock0"
>> +
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index 791fe78a50=2E=2E769a1ead1c 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -126,6 +126,7 @@ config E500
>>     select ETSEC
>>     select GPIO_MPC8XXX
>>     select OPENPIC
>> +    select PFLASH_CFI01
>>     select PLATFORM_BUS
>>     select PPCE500_PCI
>>     select SERIAL
>> diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>> index 3e950ea3ba=2E=2E23d2c3451a 100644
>> --- a/hw/ppc/e500=2Ec
>> +++ b/hw/ppc/e500=2Ec
>> @@ -23,8 +23,10 @@
>> #include "e500-ccsr=2Eh"
>> #include "net/net=2Eh"
>> #include "qemu/config-file=2Eh"
>> +#include "hw/block/flash=2Eh"
>> #include "hw/char/serial=2Eh"
>> #include "hw/pci/pci=2Eh"
>> +#include "sysemu/block-backend-io=2Eh"
>> #include "sysemu/sysemu=2Eh"
>> #include "sysemu/kvm=2Eh"
>> #include "sysemu/reset=2Eh"
>> @@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDev=
ice *sbdev, void *opaque)
>>     }
>> }
>>=20
>> +static void create_devtree_flash(SysBusDevice *sbdev,
>> +                                 PlatformDevtreeData *data)
>> +{
>> +    g_autofree char *name =3D NULL;
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
>> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
>> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
>> +                                 1, flashbase, 1, flashsize);
>> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
>> +}
>> +
>> static void platform_bus_create_devtree(PPCE500MachineState *pms,
>>                                         void *fdt, const char *mpic)
>> {
>> @@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500Mach=
ineState *pms,
>>     uint64_t addr =3D pmc->platform_bus_base;
>>     uint64_t size =3D pmc->platform_bus_size;
>>     int irq_start =3D pmc->platform_bus_first_irq;
>> +    SysBusDevice *sbdev;
>> +    bool ambiguous;
>>=20
>>     /* Create a /platform node that we can put all devices into */
>>=20
>> @@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500Mac=
hineState *pms,
>>     /* Loop through all dynamic sysbus devices and create nodes for the=
m */
>>     foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
>>=20
>> +    sbdev =3D SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_=
CFI01,
>> +                                                    &ambiguous));
>> +    if (sbdev) {
>> +        assert(!ambiguous);
>> +        create_devtree_flash(sbdev, &data);
>> +    }
>> +
>>     g_free(node);
>> }
>>=20
>> @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>>     unsigned int pci_irq_nrs[PCI_NUM_PINS] =3D {1, 2, 3, 4};
>>     IrqLines *irqs;
>>     DeviceState *dev, *mpicdev;
>> +    DriveInfo *dinfo;
>>     CPUPPCState *firstenv =3D NULL;
>>     MemoryRegion *ccsr_addr_space;
>>     SysBusDevice *s;
>> @@ -1024,6 +1061,31 @@ void ppce500_init(MachineState *machine)
>>                                 pmc->platform_bus_base,
>>                                 &pms->pbus_dev->mmio);
>>=20
>> +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>> +    if (dinfo) {
>> +        BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>> +        BlockDriverState *bs =3D blk_bs(blk);
>> +        uint64_t size =3D bdrv_getlength(bs);
>> +        uint64_t mmio_size =3D pms->pbus_dev->mmio=2Esize;
>> +        PFlashCFI01 *pfl;
>> +
>> +        if (!is_power_of_2(size)) {
>> +            error_report("Size of pflash file must be a power of two=
=2E");
>> +            exit(1);
>> +        }
>> +
>> +        if (size > mmio_size) {
>> +            error_report("Size of pflash file must not be bigger than =
%" PRIu64
>> +                         " bytes=2E", mmio_size);
>> +            exit(1);
>> +        }
>> +
>> +        pfl =3D pflash_cfi01_register("e500=2Eflash", size, blk, 64 * =
KiB, 2,
>> +                                    0x89, 0x18, 0x0000, 0x0, 1);
>> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
>> +                                    pflash_cfi01_get_memory(pfl));
>> +    }
>> +
>>     /*
>>      * Smart firmware defaults ahead!
>>      *
>>=20

