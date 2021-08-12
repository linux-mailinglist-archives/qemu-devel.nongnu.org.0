Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D93EA34E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:09:40 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8ah-0005AJ-RJ
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE8ZQ-0003iC-1Y; Thu, 12 Aug 2021 07:08:20 -0400
Received: from redisdead.crans.org ([185.230.79.39]:57656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE8ZN-0004f2-3x; Thu, 12 Aug 2021 07:08:19 -0400
Received: from [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f] (unknown
 [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id D80A5251;
 Thu, 12 Aug 2021 13:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628766487; bh=NWjZaSD65qWn59Gs3uGCGufl2goQf8IHo7OT/zm4g3E=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=o8XNUxh6nRy7lV9vfnhPnPji1ABSfI/qiCEJTJx33wt2u3Q7pIt804rs+Fk73xGlk
 BYUq+AHQCV8A0C8tu1eHPQGSIzd4uN3e2wzZTEjHJ+ewxuJPzgD8LfLExS1SJq2Whb
 5vvDx8RhuYyRxQ2BLwMuybt5c8jrsYK9N0dQ8FwtldRLQRIZ2ndonMvDNfI2nTQEyu
 5SjjGA2zMwl7w1Rd2PhxZjwb1Tw6qd6RlNLP45dzESV95nwq3OkSKmpmwbhQGg4DTF
 Ij8XFkmZhMiH6Jszc+QDVOeOu9UuXIrjKJi19dlVGq/FpACi2dhjbqblJ16rqZpYZw
 dze+UK/Gi3kNdJIGM9AktZv+yfngvxCHxSHqY9tWLebQ+2UvvfivjBEDtLHfaBpO07
 p8BqhwYZshZidnIMp+bodZxa5weinK1bRSnWP3s6L3lmnCAUk1nEAB1IlE1GPahpSo
 hyRDviJO7HOtb6HvsdYOUouXTlYsrJN1Pdn2jSIbu+dMJkt7dE/cmU6bpq/8SSPeCS
 JBzSdaaOg6+Pl+8JFdDyT4gEWCdib5tUimo3xpzITTKGID5hOIo1QFupiR8Whhpz0L
 A3U8uR0cSAdypW7jaPTwiROia4kJED0mmNgE17FLgbSia7mUWbcCDZIGbKU19Onc7e
 9nFexcPf+xqx6IYwmMeUMP6Q=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
Message-ID: <d712c8dc-1976-c197-2ecb-75cf35ac1f29@crans.org>
Date: Thu, 12 Aug 2021 13:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-2-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ypbc5Ge5R1P3ij04zDzqjmMtHCudHT73h"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ypbc5Ge5R1P3ij04zDzqjmMtHCudHT73h
Content-Type: multipart/mixed; boundary="IGga0ErnbAeZGPRXW46CxdSoeL5XTP6A8";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <d712c8dc-1976-c197-2ecb-75cf35ac1f29@crans.org>
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-2-peter.maydell@linaro.org>

--IGga0ErnbAeZGPRXW46CxdSoeL5XTP6A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/12/21 11:33 AM, Peter Maydell wrote:
> Currently we implement the RAS register block within the NVIC device.
> It isn't really very tightly coupled with the NVIC proper, so instead
> move it out into a sysbus device of its own and have the top level
> ARMv7M container create it and map it into memory at the right
> address.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/armv7m.h       |  2 +
>   include/hw/intc/armv7m_nvic.h |  1 -
>   include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
>   hw/arm/armv7m.c               | 12 +++++
>   hw/intc/armv7m_nvic.c         | 56 ---------------------
>   hw/misc/armv7m_ras.c          | 93 ++++++++++++++++++++++++++++++++++=
+
>   MAINTAINERS                   |  2 +
>   hw/misc/meson.build           |  2 +
>   8 files changed, 148 insertions(+), 57 deletions(-)
>   create mode 100644 include/hw/misc/armv7m_ras.h
>   create mode 100644 hw/misc/armv7m_ras.c
>=20
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index bc6733c5184..4cae0d7eeaa 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -12,6 +12,7 @@
>  =20
>   #include "hw/sysbus.h"
>   #include "hw/intc/armv7m_nvic.h"
> +#include "hw/misc/armv7m_ras.h"
>   #include "target/arm/idau.h"
>   #include "qom/object.h"
>  =20
> @@ -58,6 +59,7 @@ struct ARMv7MState {
>       NVICState nvic;
>       BitBandState bitband[ARMV7M_NUM_BITBANDS];
>       ARMCPU *cpu;
> +    ARMv7MRAS ras;
>  =20
>       /* MemoryRegion we pass to the CPU, with our devices layered on
>        * top of the ones the board provides in board_memory.
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvi=
c.h
> index 39c71e15936..33b6d8810c7 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -83,7 +83,6 @@ struct NVICState {
>       MemoryRegion sysreg_ns_mem;
>       MemoryRegion systickmem;
>       MemoryRegion systick_ns_mem;
> -    MemoryRegion ras_mem;
>       MemoryRegion container;
>       MemoryRegion defaultmem;
>  =20
> diff --git a/include/hw/misc/armv7m_ras.h b/include/hw/misc/armv7m_ras.=
h
> new file mode 100644
> index 00000000000..f8773e65b14
> --- /dev/null
> +++ b/include/hw/misc/armv7m_ras.h
> @@ -0,0 +1,37 @@
> +/*
> + * Arm M-profile RAS block
> + *
> + * Copyright (c) 2021 Linaro Limited
> + *
> + *  This program is free software; you can redistribute it and/or modi=
fy
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */

Maybe it would be a good idea here to change to "Arm M-profile RAS=20
(Reliability, Availability, and Serviceability) block" to define the=20
acronym at least once in the device code?

> +
> +/*
> + * This is a model of the RAS register block of an M-profile CPU
> + * (the registers starting at 0xE0005000 with ERRFRn).
> + *
> + * QEMU interface:
> + *  + sysbus MMIO region 0: the register bank
> + *
> + * The QEMU implementation currently provides "minimal RAS" only.
> + */
> +
> +#ifndef HW_MISC_ARMV7M_RAS_H
> +#define HW_MISC_ARMV7M_RAS_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_ARMV7M_RAS "armv7m-ras"
> +OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MRAS, ARMV7M_RAS)
> +
> +struct ARMv7MRAS {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +};
> +
> +#endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 9ce5c30cd5c..8964730d153 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -231,6 +231,18 @@ static void armv7m_realize(DeviceState *dev, Error=
 **errp)
>       memory_region_add_subregion(&s->container, 0xe0000000,
>                                   sysbus_mmio_get_region(sbd, 0));
>  =20
> +    /* If the CPU has RAS support, create the RAS register block */
> +    if (cpu_isar_feature(aa32_ras, s->cpu)) {
> +        object_initialize_child(OBJECT(dev), "armv7m-ras",
> +                                &s->ras, TYPE_ARMV7M_RAS);
> +        sbd =3D SYS_BUS_DEVICE(&s->ras);
> +        if (!sysbus_realize(sbd, errp)) {
> +            return;
> +        }
> +        memory_region_add_subregion_overlap(&s->container, 0xe0005000,=

> +                                            sysbus_mmio_get_region(sbd=
, 0), 1);
> +    }
> +
>       for (i =3D 0; i < ARRAY_SIZE(s->bitband); i++) {
>           if (s->enable_bitband) {
>               Object *obj =3D OBJECT(&s->bitband[i]);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 1e7ddcb94cb..a5975592dfa 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2549,56 +2549,6 @@ static const MemoryRegionOps nvic_systick_ops =3D=
 {
>       .endianness =3D DEVICE_NATIVE_ENDIAN,
>   };
>  =20
> -
> -static MemTxResult ras_read(void *opaque, hwaddr addr,
> -                            uint64_t *data, unsigned size,
> -                            MemTxAttrs attrs)
> -{
> -    if (attrs.user) {
> -        return MEMTX_ERROR;
> -    }
> -
> -    switch (addr) {
> -    case 0xe10: /* ERRIIDR */
> -        /* architect field =3D Arm; product/variant/revision 0 */
> -        *data =3D 0x43b;
> -        break;
> -    case 0xfc8: /* ERRDEVID */
> -        /* Minimal RAS: we implement 0 error record indexes */
> -        *data =3D 0;
> -        break;
> -    default:
> -        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
> -                      (uint32_t)addr);
> -        *data =3D 0;
> -        break;
> -    }
> -    return MEMTX_OK;
> -}
> -
> -static MemTxResult ras_write(void *opaque, hwaddr addr,
> -                             uint64_t value, unsigned size,
> -                             MemTxAttrs attrs)
> -{
> -    if (attrs.user) {
> -        return MEMTX_ERROR;
> -    }
> -
> -    switch (addr) {
> -    default:
> -        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n"=
,
> -                      (uint32_t)addr);
> -        break;
> -    }
> -    return MEMTX_OK;
> -}
> -
> -static const MemoryRegionOps ras_ops =3D {
> -    .read_with_attrs =3D ras_read,
> -    .write_with_attrs =3D ras_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> -};
> -
>   /*
>    * Unassigned portions of the PPB space are RAZ/WI for privileged
>    * accesses, and fault for non-privileged accesses.
> @@ -2946,12 +2896,6 @@ static void armv7m_nvic_realize(DeviceState *dev=
, Error **errp)
>                                               &s->systick_ns_mem, 1);
>       }
>  =20
> -    if (cpu_isar_feature(aa32_ras, s->cpu)) {
> -        memory_region_init_io(&s->ras_mem, OBJECT(s),
> -                              &ras_ops, s, "nvic_ras", 0x1000);
> -        memory_region_add_subregion(&s->container, 0x5000, &s->ras_mem=
);
> -    }
> -
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
>   }
>  =20
> diff --git a/hw/misc/armv7m_ras.c b/hw/misc/armv7m_ras.c
> new file mode 100644
> index 00000000000..a2b4f4b8dc8
> --- /dev/null
> +++ b/hw/misc/armv7m_ras.c
> @@ -0,0 +1,93 @@
> +/*
> + * Arm M-profile RAS block
> + *
> + * Copyright (c) 2021 Linaro Limited
> + *
> + *  This program is free software; you can redistribute it and/or modi=
fy
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/armv7m_ras.h"
> +#include "qemu/log.h"
> +
> +static MemTxResult ras_read(void *opaque, hwaddr addr,
> +                            uint64_t *data, unsigned size,
> +                            MemTxAttrs attrs)
> +{
> +    if (attrs.user) {
> +        return MEMTX_ERROR;
> +    }
> +
> +    switch (addr) {
> +    case 0xe10: /* ERRIIDR */
> +        /* architect field =3D Arm; product/variant/revision 0 */
> +        *data =3D 0x43b;
> +        break;
> +    case 0xfc8: /* ERRDEVID */
> +        /* Minimal RAS: we implement 0 error record indexes */
> +        *data =3D 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
> +                      (uint32_t)addr);
> +        *data =3D 0;
> +        break;
> +    }
> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult ras_write(void *opaque, hwaddr addr,
> +                             uint64_t value, unsigned size,
> +                             MemTxAttrs attrs)
> +{
> +    if (attrs.user) {
> +        return MEMTX_ERROR;
> +    }
> +
> +    switch (addr) {
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n"=
,
> +                      (uint32_t)addr);
> +        break;
> +    }
> +    return MEMTX_OK;
> +}
> +
> +static const MemoryRegionOps ras_ops =3D {
> +    .read_with_attrs =3D ras_read,
> +    .write_with_attrs =3D ras_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +
> +static void armv7m_ras_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    ARMv7MRAS *s =3D ARMV7M_RAS(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &ras_ops,
> +                          s, "armv7m-ras", 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static void armv7m_ras_class_init(ObjectClass *klass, void *data)
> +{
> +    /* This device has no state: no need for vmstate or reset */
> +}
> +
> +static const TypeInfo armv7m_ras_info =3D {
> +    .name =3D TYPE_ARMV7M_RAS,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(ARMv7MRAS),
> +    .instance_init =3D armv7m_ras_init,
> +    .class_init =3D armv7m_ras_class_init,
> +};

Pure curiosity: is `.class_init` defined because it needs to be defined=20
or is it only a good practise in QEMU code to always define it?

> +
> +static void armv7m_ras_register_types(void)
> +{
> +    type_register_static(&armv7m_ras_info);
> +}
> +
> +type_init(armv7m_ras_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e4428..3cac393bb48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -617,6 +617,7 @@ F: hw/intc/gic_internal.h
>   F: hw/misc/a9scu.c
>   F: hw/misc/arm11scu.c
>   F: hw/misc/arm_l2x0.c
> +F: hw/misc/armv7m_ras.c
>   F: hw/timer/a9gtimer*
>   F: hw/timer/arm*
>   F: include/hw/arm/arm*.h
> @@ -626,6 +627,7 @@ F: include/hw/misc/arm11scu.h
>   F: include/hw/timer/a9gtimer.h
>   F: include/hw/timer/arm_mptimer.h
>   F: include/hw/timer/armv7m_systick.h
> +F: include/hw/misc/armv7m_ras.h
>   F: tests/qtest/test-arm-mptimer.c
>  =20
>   Exynos
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index a53b849a5a0..3f41a3a5b27 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -17,6 +17,8 @@ softmmu_ss.add(when: 'CONFIG_INTEGRATOR_DEBUG', if_tr=
ue: files('arm_integrator_d
>   softmmu_ss.add(when: 'CONFIG_A9SCU', if_true: files('a9scu.c'))
>   softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))=

>  =20
> +softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_ras.c'))=

> +
>   # Mac devices
>   softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
>  =20
>=20

Looks good to me! My review is weak because I am still new to QEMU codeba=
se.

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--IGga0ErnbAeZGPRXW46CxdSoeL5XTP6A8--

--ypbc5Ge5R1P3ij04zDzqjmMtHCudHT73h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEVARYFAwAAAAAACgkQbHknjz/NzALq
Hg//QCG5rLDkXRbqVoYCnO8Kd0354QFfbXVRKBPRW5vHW5E5KG2WXY6JqtTNkI/2CXGCJdKQBThG
6fOWPsLC983ZwwwLMFkeUoNi6jBvorH1lRx2HVg7wEkrJ1nmYNtyhMSGAMKAAUm89nDmWRaXjzNA
y/wUWz0MYLEjTRUpjq8ByuFlJTrU3fiuXVNJeBUB1FOfBXIUHBKfG10gd4b0O4xmEJbz8TigFt5I
Kh1lcCbypKhyS+8e2/W+1yKHm52SO7NQ/HCkWkePVB/tuvXHENkecdzTir/WpZGfczcT6lRGZ0ia
PZJ8nVZlvSNzx5v75SZdaKxD5hXdl8N0SYu2uiorH47l0Phctw1n2muk+TS2xwAEx1lIEOPkH2yP
7CdmXKQWCf5hpnocl6legpVZA45novJLBg3Y31ox5zgoxrCMJbdnGzN3aZ2TFSL9exNPlUY0+teg
HIoth5WDYEq3qMS+uPJi11z2cpm25yex6Zf10vzfFiqFm/uPm+LbyOYkE2/QtAcTEEGFMWcVQPrS
GdsbbfpAS8UZp5eNVWDUBuLpPXMU0kRuP2axNbmh2PurBpMzSE7uanluZVga2tZSUvlaNIsCPhYd
DnTXvA49TRV1QK1kKx7TTZgpONsGv/sPmtXu1yH2X+VVIhuI7MPZi1wMkwRdGJRMXqA7WlT+avIC
cXk=
=Yy3O
-----END PGP SIGNATURE-----

--ypbc5Ge5R1P3ij04zDzqjmMtHCudHT73h--

