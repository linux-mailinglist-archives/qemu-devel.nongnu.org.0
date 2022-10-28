Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5426116CC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:04:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRqf-0001HK-Iu; Fri, 28 Oct 2022 12:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooRpa-0007wv-DQ; Fri, 28 Oct 2022 12:03:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooRpY-0002mO-1n; Fri, 28 Oct 2022 12:03:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id bs21so7174326wrb.4;
 Fri, 28 Oct 2022 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mN+GTbhuSL4MayUouC/8aeBr83AsyVF3yLcKJl3bYJc=;
 b=GazPm9XydD7ymqLkN+Xen/6U5log3qRBVcJsCw2Cih57Betm8YKEV8j39A6vevyORw
 GApB5cSCT7inDNQTkqM61sfZ6CZ6/fd5f8lw8cS2hBjDUDCStSfMNaM83d7MbcvTM6oi
 yEp9oqQYKq5MNARYFq+dP7oq0xK63fuVXmyq9RNEsuXKWCeB4V8MbqTn4kf3IgD8WFsk
 wRgDlWKF1zb5cJ6w8m7RvtDbqbOWRS//o5gO1liFJNz/dUcz50GeyDjdA7MRnbi0m5Ld
 1+aEKryZLjUvS7QIOpYCANMdqqrtyTgP8JA/yCbM+1ckrbfAFyYtCI9gXgWTQEnPurVp
 Wy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mN+GTbhuSL4MayUouC/8aeBr83AsyVF3yLcKJl3bYJc=;
 b=Q0HVnhdlsjY9JuO2eZLX2VAw4asngwBuX+AukCysa2/0yHefG2OiH8Oy+3izhp94tG
 O8kDPxFGOzkhbIbl6fVfrbwy/X8yu/jpHOXOPGza3Gl4hSdUgPVqn6Ft4qLG8CWQFDm1
 YFAvsOiv8hsVQEo9Clfws6JFB/YcMMRNzxy64X78Z9eIgcms5HCurh1FdmK5H/2rp8pn
 gelbx7pHjQQ9Wrum2PhZzV+emGVjwnAipSQ1MusXIx9FTpS4eBgvZ75n2Q3BxiTOTk0a
 Ojq9+vZx0XcPQ0TrNRxsXZ6fnfuIT6PvziRVnCGc6oM4Kvo0DvopflQHM4scUv/jwl8b
 ON+w==
X-Gm-Message-State: ACrzQf1d1HqQdzKDVJY3T/2PsQI4M8/mLXzFf1R7DdqVHqQgz36tXjNT
 9QmBx1U00CUSgs9Cl3d0ri8=
X-Google-Smtp-Source: AMsMyM4F2/7FppCpt13M6GHVxjflNrj/8DWQouIMqLeNaElQ2I6BHuT5hpnI02abVut303jaM23Cew==
X-Received: by 2002:a5d:64c7:0:b0:22e:43a6:2801 with SMTP id
 f7-20020a5d64c7000000b0022e43a62801mr40811wri.612.1666973013285; 
 Fri, 28 Oct 2022 09:03:33 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200bd2f89c083d9cbe6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:bd2f:89c0:83d9:cbe6])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm8147519wmb.47.2022.10.28.09.03.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Oct 2022 09:03:32 -0700 (PDT)
Date: Fri, 28 Oct 2022 16:03:29 +0000
From: B <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
In-Reply-To: <eea963b8-f6d9-b345-376e-7fd6dad73cd4@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-6-shentey@gmail.com>
 <eea963b8-f6d9-b345-376e-7fd6dad73cd4@gmail.com>
Message-ID: <89D2DB02-17DE-43F0-BA2F-4855E6F6659B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 28=2E Oktober 2022 15:09:50 UTC schrieb Daniel Henrique Barboza <daniel=
hb413@gmail=2Ecom>:
>Bernhard,

Hi Daniel,

>
>The 32 builds aren't fancying this patch=2E The issue is down there:
>
>On 10/18/22 18:01, Bernhard Beschow wrote:
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
>>   docs/system/ppc/ppce500=2Erst | 16 ++++++++
>>   hw/ppc/Kconfig              |  1 +
>>   hw/ppc/e500=2Ec               | 79 ++++++++++++++++++++++++++++++++++=
+++
>>   3 files changed, 96 insertions(+)
>>=20
>> diff --git a/docs/system/ppc/ppce500=2Erst b/docs/system/ppc/ppce500=2E=
rst
>> index 7b5eb3c4ee=2E=2E38f8ceb0cf 100644
>> --- a/docs/system/ppc/ppce500=2Erst
>> +++ b/docs/system/ppc/ppce500=2Erst
>> @@ -165,3 +165,19 @@ if =E2=80=9C-device eTSEC=E2=80=9D is given to QEM=
U:
>>   =2E=2E code-block:: bash
>>       -netdev tap,ifname=3Dtap0,script=3Dno,downscript=3Dno,id=3Dnet0 -=
device eTSEC,netdev=3Dnet0
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
>> +  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
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
>>       select ETSEC
>>       select GPIO_MPC8XXX
>>       select OPENPIC
>> +    select PFLASH_CFI01
>>       select PLATFORM_BUS
>>       select PPCE500_PCI
>>       select SERIAL
>> diff --git a/hw/ppc/e500=2Ec b/hw/ppc/e500=2Ec
>> index 3e950ea3ba=2E=2E73198adac8 100644
>> --- a/hw/ppc/e500=2Ec
>> +++ b/hw/ppc/e500=2Ec
>> @@ -23,8 +23,10 @@
>>   #include "e500-ccsr=2Eh"
>>   #include "net/net=2Eh"
>>   #include "qemu/config-file=2Eh"
>> +#include "hw/block/flash=2Eh"
>>   #include "hw/char/serial=2Eh"
>>   #include "hw/pci/pci=2Eh"
>> +#include "sysemu/block-backend-io=2Eh"
>>   #include "sysemu/sysemu=2Eh"
>>   #include "sysemu/kvm=2Eh"
>>   #include "sysemu/reset=2Eh"
>> @@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDev=
ice *sbdev, void *opaque)
>>       }
>>   }
>>   +static void create_devtree_flash(SysBusDevice *sbdev,
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
>>   static void platform_bus_create_devtree(PPCE500MachineState *pms,
>>                                           void *fdt, const char *mpic)
>>   {
>> @@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500Mach=
ineState *pms,
>>       uint64_t addr =3D pmc->platform_bus_base;
>>       uint64_t size =3D pmc->platform_bus_size;
>>       int irq_start =3D pmc->platform_bus_first_irq;
>> +    SysBusDevice *sbdev;
>> +    bool ambiguous;
>>         /* Create a /platform node that we can put all devices into */
>>   @@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500M=
achineState *pms,
>>       /* Loop through all dynamic sysbus devices and create nodes for t=
hem */
>>       foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data=
);
>>   +    sbdev =3D SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLAS=
H_CFI01,
>> +                                                    &ambiguous));
>> +    if (sbdev) {
>> +        assert(!ambiguous);
>> +        create_devtree_flash(sbdev, &data);
>> +    }
>> +
>>       g_free(node);
>>   }
>>   @@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
>>       unsigned int pci_irq_nrs[PCI_NUM_PINS] =3D {1, 2, 3, 4};
>>       IrqLines *irqs;
>>       DeviceState *dev, *mpicdev;
>> +    DriveInfo *dinfo;
>>       CPUPPCState *firstenv =3D NULL;
>>       MemoryRegion *ccsr_addr_space;
>>       SysBusDevice *s;
>> @@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
>>                                   pmc->platform_bus_base,
>>                                   &pms->pbus_dev->mmio);
>>   +    dinfo =3D drive_get(IF_PFLASH, 0, 0);
>> +    if (dinfo) {
>> +        BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
>> +        BlockDriverState *bs =3D blk_bs(blk);
>> +        uint64_t size =3D bdrv_getlength(bs);
>> +        uint64_t mmio_size =3D pms->pbus_dev->mmio=2Esize;
>
>^ here=2E The issue is that on a 32 bit system it is not possible to cast=
 the
>Int128 type to uint64_t:
>
>FAILED: libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_e500=2Ec=2Eo
>3746cc -m32 -Ilibqemu-ppc64-softmmu=2Efa=2Ep -I=2E -I=2E=2E -Itarget/ppc =
-I=2E=2E/target/ppc -I=2E=2E/dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader -I/=
usr/include/pixman-1 -I/usr/include/glib-2=2E0 -I/usr/lib/glib-2=2E0/includ=
e -I/usr/include/sysprof-4 -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -=
Werror -std=3Dgnu11 -O2 -g -isystem /builds/danielhb/qemu/linux-headers -is=
ystem linux-headers -iquote =2E -iquote /builds/danielhb/qemu -iquote /buil=
ds/danielhb/qemu/include -iquote /builds/danielhb/qemu/tcg/i386 -pthread -U=
_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite=
-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wol=
d-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security =
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs=
 -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-miss=
ing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-str=
ong -fPIE -isystem=2E=2E/linux-headers -isystemlinux-headers -DNEED_CPU_H '=
-DCONFIG_TARGET=3D"ppc64-softmmu-config-target=2Eh"' '-DCONFIG_DEVICES=3D"p=
pc64-softmmu-config-devices=2Eh"' -MD -MQ libqemu-ppc64-softmmu=2Efa=2Ep/hw=
_ppc_e500=2Ec=2Eo -MF libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_e500=2Ec=2Eo=2E=
d -o libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_e500=2Ec=2Eo -c =2E=2E/hw/ppc/e5=
00=2Ec
>3747=2E=2E/hw/ppc/e500=2Ec: In function 'ppce500_init':
>3748=2E=2E/hw/ppc/e500=2Ec:1069:30: error: incompatible types when initia=
lizing type 'uint64_t' {aka 'long long unsigned int'} using type 'Int128'
>3749 1069 |         uint64_t mmio_size =3D pms->pbus_dev->mmio=2Esize;
>3750      |                              ^~~
>3751[3207/5331] Compiling C object libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_=
mpc8544_guts=2Ec=2Eo

Whoops=2E
>
>
>What I did to solve the problem is this:
>
>
>+         uint64_t mmio_size =3D int128_get64(pms->pbus_dev->mmio=2Esize)=
;
>
>
>This will get the lower 64 bits and return an uint64_t=2E
>
>Note that this function will assert if mmio=2Esize is bigger than UINT64_=
MAX, but
>since you're doing an error(1) on the "if size > mmio_size" conditional, =
this
>assert() is not introducing a new side effect=2E We'll just fail earlier =
with
>a different error message=2E

Yes, sounds reasonable=2E
>
>
>Let me know if this is acceptable for you=2E

Yes, that's fine with me=2E Thanks for the fix!

Best regards,
Bernhard
>
>
>Daniel
>
>
>
>> +        uint32_t sector_len =3D 64 * KiB;
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
>> +        if (!QEMU_IS_ALIGNED(size, sector_len)) {
>> +            error_report("Size of pflash file must be a multiple of %"=
 PRIu32
>> +                         "=2E", sector_len);
>> +            exit(1);
>> +        }
>> +
>> +        dev =3D qdev_new(TYPE_PFLASH_CFI01);
>> +        qdev_prop_set_drive(dev, "drive", blk);
>> +        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>> +        qdev_prop_set_uint64(dev, "sector-length", sector_len);
>> +        qdev_prop_set_uint8(dev, "width", 2);
>> +        qdev_prop_set_bit(dev, "big-endian", true);
>> +        qdev_prop_set_uint16(dev, "id0", 0x89);
>> +        qdev_prop_set_uint16(dev, "id1", 0x18);
>> +        qdev_prop_set_uint16(dev, "id2", 0x0000);
>> +        qdev_prop_set_uint16(dev, "id3", 0x0);
>> +        qdev_prop_set_string(dev, "name", "e500=2Eflash");
>> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +
>> +        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
>> +                                    pflash_cfi01_get_memory(PFLASH_CFI=
01(dev)));
>> +    }
>> +
>>       /*
>>        * Smart firmware defaults ahead!
>>        *

