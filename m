Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85223EA42E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:58:11 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9Le-0000Kf-E1
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9KU-0007u1-SF; Thu, 12 Aug 2021 07:56:59 -0400
Received: from redisdead.crans.org ([185.230.79.39]:59786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9KR-00056W-V9; Thu, 12 Aug 2021 07:56:58 -0400
Received: from [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f] (unknown
 [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 01FCD2AB;
 Thu, 12 Aug 2021 13:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628769412; bh=8r70ZV2Q+7/QJ1OgXFRW0VOByghHd7FJ8SRYONyMKL4=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=L1zDmOQ68j1eJYYokg6l3zZTA1vWgpFuv8J/zUwkTM/O58tPo2Yk4EeuVyfIWArcv
 WNYntGcMis2bcCj+45KsjNeqXhH2bBH3gZZvGJ02ZljP7wPBs021FfxVSrfCcpvY3w
 f+nQY0z4HKQia4neGojr05talSOZp/njSDcuQDph1zjjNYO2ZtrW02Y3N2UBX0oT1l
 tc35eETKjFedd4k3zuoRDFVAsHgLbZCCmGh+hmq017wET7EdCyxEOIl6iqttu4rqNh
 ovIpFRvOlbY3my3mXVKR3fS3mDuoPnoVlEvFjK67skZiGD8a2R+5DueohsrWrwOB2K
 KxbeYQUJjwgmpLMmjNz2PWTq2nAcdo0O9sM9taPU5AhdgvVr0DS01rsLmyHCuZXaxp
 Q5LNfAN1aS4RXDCmnCQ4M4B+zyPYNX4dLTMeAx8o8yPnH0Ux/OXd7kKi4h68pyrxMO
 O6oOfwv4hbfKIhMlCEwrZ1H2bj/DqNzBU2Nhs/O2EXXhmlZ0dWXIDOfXHfM1e8cbpF
 jbKagBKrep1FywWQpyIyk0J5S4lH93jO73xvZx1QDmQYOXBqrlMFA85zYTgmnSS8Lf
 Q2BGLCLOOmqJjyY8fJFUQ6CdLetlzrEbQoEustFgIf1MfclGjKi4dDxtam2GMapF8J
 rMbW0jZfJ51RK1RUT3vILm0Q=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-4-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH for-6.2 03/25] arm: Move system PPB container handling to
 armv7m
Message-ID: <1cec6123-9844-8515-38c0-172daea678c3@crans.org>
Date: Thu, 12 Aug 2021 13:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-4-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nzmiXVFpqSdCGmI2AK2l9vzVqT9ulCb6r"
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
--nzmiXVFpqSdCGmI2AK2l9vzVqT9ulCb6r
Content-Type: multipart/mixed; boundary="PPr2rwnIUGzGLG5LgkFuDknIYRRBJ9tU1";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <1cec6123-9844-8515-38c0-172daea678c3@crans.org>
Subject: Re: [PATCH for-6.2 03/25] arm: Move system PPB container handling to
 armv7m
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-4-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-4-peter.maydell@linaro.org>

--PPr2rwnIUGzGLG5LgkFuDknIYRRBJ9tU1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/12/21 11:33 AM, Peter Maydell wrote:
> Instead of having the NVIC device provide a single sysbus memory
> region covering the whole of the "System PPB" space, which implements
> the default behaviour for unimplemented ranges and provides the NS
> alias window to the sysregs as well as the main sysreg MR, move this
> handling to the container armv7m device.  The NVIC now provides a
> single memory region which just implements the system registers.
> This consolidates all the handling of "map various devices in the
> PPB" into the armv7m container where it belongs.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/armv7m.h       |   4 +
>   include/hw/intc/armv7m_nvic.h |   3 -
>   hw/arm/armv7m.c               | 100 ++++++++++++++++++++++-
>   hw/intc/armv7m_nvic.c         | 145 +--------------------------------=
-
>   4 files changed, 107 insertions(+), 145 deletions(-)
>=20
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 360c35c5fb2..fe8b248a6c6 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -77,6 +77,10 @@ struct ARMv7MState {
>        * NS systick device if appropriate.
>        */
>       MemoryRegion systick_ns_mem;
> +    /* Ditto, for the sysregs region provided by the NVIC */
> +    MemoryRegion sysreg_ns_mem;
> +    /* MR providing default PPB behaviour */
> +    MemoryRegion defaultmem;
>  =20
>       /* Properties */
>       char *cpu_type;
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvi=
c.h
> index 6a6a99090c7..0180c7b0ca1 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -80,9 +80,6 @@ struct NVICState {
>       int vectpending_prio; /* group prio of the exeception in vectpend=
ing */
>  =20
>       MemoryRegion sysregmem;
> -    MemoryRegion sysreg_ns_mem;
> -    MemoryRegion container;
> -    MemoryRegion defaultmem;
>  =20
>       uint32_t num_irq;
>       qemu_irq excpout;
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 364ac069702..7e7fb7a3ad3 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -18,6 +18,7 @@
>   #include "sysemu/reset.h"
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
> +#include "qemu/log.h"
>   #include "target/arm/idau.h"
>  =20
>   /* Bitbanded IO.  Each word corresponds to a single bit.  */
> @@ -203,6 +204,43 @@ static const MemoryRegionOps v7m_systick_ops =3D {=

>       .endianness =3D DEVICE_NATIVE_ENDIAN,
>   };
>  =20
> +/*
> + * Unassigned portions of the PPB space are RAZ/WI for privileged
> + * accesses, and fault for non-privileged accesses.
> + */
> +static MemTxResult ppb_default_read(void *opaque, hwaddr addr,
> +                                    uint64_t *data, unsigned size,
> +                                    MemTxAttrs attrs)
> +{
> +    qemu_log_mask(LOG_UNIMP, "Read of unassigned area of PPB: offset 0=
x%x\n",
> +                  (uint32_t)addr);
> +    if (attrs.user) {
> +        return MEMTX_ERROR;
> +    }
> +    *data =3D 0;
> +    return MEMTX_OK;
> +}
> +
> +static MemTxResult ppb_default_write(void *opaque, hwaddr addr,
> +                                     uint64_t value, unsigned size,
> +                                     MemTxAttrs attrs)
> +{
> +    qemu_log_mask(LOG_UNIMP, "Write of unassigned area of PPB: offset =
0x%x\n",
> +                  (uint32_t)addr);
> +    if (attrs.user) {
> +        return MEMTX_ERROR;
> +    }
> +    return MEMTX_OK;
> +}
> +
> +static const MemoryRegionOps ppb_default_ops =3D {
> +    .read_with_attrs =3D ppb_default_read,
> +    .write_with_attrs =3D ppb_default_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size =3D 1,
> +    .valid.max_access_size =3D 8,
> +};
> +
>   static void armv7m_instance_init(Object *obj)
>   {
>       ARMv7MState *s =3D ARMV7M(obj);
> @@ -309,13 +347,73 @@ static void armv7m_realize(DeviceState *dev, Erro=
r **errp)
>       qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
>       qdev_pass_gpios(DEVICE(&s->nvic), dev, "NMI");
>  =20
> +    /*
> +     * We map various devices into the continer MR at their architecte=
d
> +     * addresses. In particular, we map everything corresponding to th=
e
> +     * "System PPB" space. This is the range from 0xe0000000 to 0xe00f=
ffff
> +     * and includes the NVIC, the System Control Space (system registe=
rs),
> +     * the systick timer, and for CPUs with the Security extension an =
NS
> +     * banked version of all of these.

I believe there is a typo: "continer". Is it "container"?

> +     *
> +     * The default behaviour for unimplemented registers/ranges
> +     * (for instance the Data Watchpoint and Trace unit at 0xe0001000)=

> +     * is to RAZ/WI for privileged access and BusFault for non-privile=
ged
> +     * access.
> +     *
> +     * The NVIC and System Control Space (SCS) starts at 0xe000e000
> +     * and looks like this:
> +     *  0x004 - ICTR
> +     *  0x010 - 0xff - systick
> +     *  0x100..0x7ec - NVIC
> +     *  0x7f0..0xcff - Reserved
> +     *  0xd00..0xd3c - SCS registers
> +     *  0xd40..0xeff - Reserved or Not implemented
> +     *  0xf00 - STIR
> +     *
> +     * Some registers within this space are banked between security st=
ates.
> +     * In v8M there is a second range 0xe002e000..0xe002efff which is =
the
> +     * NonSecure alias SCS; secure accesses to this behave like NS acc=
esses
> +     * to the main SCS range, and non-secure accesses (including when
> +     * the security extension is not implemented) are RAZ/WI.
> +     * Note that both the main SCS range and the alias range are defin=
ed
> +     * to be exempt from memory attribution (R_BLJT) and so the memory=

> +     * transaction attribute always matches the current CPU security
> +     * state (attrs.secure =3D=3D env->v7m.secure). In the v7m_sysreg_=
ns_ops
> +     * wrappers we change attrs.secure to indicate the NS access; so
> +     * generally code determining which banked register to use should
> +     * use attrs.secure; code determining actual behaviour of the syst=
em
> +     * should use env->v7m.secure.
> +     *
> +     * Within the PPB space, some MRs overlap, and the priority
> +     * of overlapping regions is:
> +     *  - default region (for RAZ/WI and BusFault) : -1
> +     *  - system register regions (provided by the NVIC) : 0
> +     *  - systick : 1
> +     * This is because the systick device is a small block of register=
s
> +     * in the middle of the other system control registers.
> +     */
> +
> +    memory_region_init_io(&s->defaultmem, OBJECT(s), &ppb_default_ops,=
 s,
> +                          "nvic-default", 0x100000);
> +    memory_region_add_subregion_overlap(&s->container, 0xe0000000,
> +                                        &s->defaultmem, -1);
> +
>       /* Wire the NVIC up to the CPU */
>       sbd =3D SYS_BUS_DEVICE(&s->nvic);
>       sysbus_connect_irq(sbd, 0,
>                          qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ))=
;
>  =20
> -    memory_region_add_subregion(&s->container, 0xe0000000,
> +    memory_region_add_subregion(&s->container, 0xe000e000,
>                                   sysbus_mmio_get_region(sbd, 0));
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
> +        /* Create the NS alias region for the NVIC sysregs */
> +        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
> +                              &v7m_sysreg_ns_ops,
> +                              sysbus_mmio_get_region(sbd, 0),
> +                              "nvic_sysregs_ns", 0x1000);
> +        memory_region_add_subregion(&s->container, 0xe002e000,
> +                                    &s->sysreg_ns_mem);
> +    }
>  =20
>       /* Create and map the systick devices */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp))=
 {
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 2b3e79a3da9..13df002ce4d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2470,90 +2470,6 @@ static const MemoryRegionOps nvic_sysreg_ops =3D=
 {
>       .endianness =3D DEVICE_NATIVE_ENDIAN,
>   };
>  =20
> -static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
> -                                        uint64_t value, unsigned size,=

> -                                        MemTxAttrs attrs)
> -{
> -    MemoryRegion *mr =3D opaque;
> -
> -    if (attrs.secure) {
> -        /* S accesses to the alias act like NS accesses to the real re=
gion */
> -        attrs.secure =3D 0;
> -        return memory_region_dispatch_write(mr, addr, value,
> -                                            size_memop(size) | MO_TE, =
attrs);
> -    } else {
> -        /* NS attrs are RAZ/WI for privileged, and BusFault for user *=
/
> -        if (attrs.user) {
> -            return MEMTX_ERROR;
> -        }
> -        return MEMTX_OK;
> -    }
> -}
> -
> -static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
> -                                       uint64_t *data, unsigned size,
> -                                       MemTxAttrs attrs)
> -{
> -    MemoryRegion *mr =3D opaque;
> -
> -    if (attrs.secure) {
> -        /* S accesses to the alias act like NS accesses to the real re=
gion */
> -        attrs.secure =3D 0;
> -        return memory_region_dispatch_read(mr, addr, data,
> -                                           size_memop(size) | MO_TE, a=
ttrs);
> -    } else {
> -        /* NS attrs are RAZ/WI for privileged, and BusFault for user *=
/
> -        if (attrs.user) {
> -            return MEMTX_ERROR;
> -        }
> -        *data =3D 0;
> -        return MEMTX_OK;
> -    }
> -}
> -
> -static const MemoryRegionOps nvic_sysreg_ns_ops =3D {
> -    .read_with_attrs =3D nvic_sysreg_ns_read,
> -    .write_with_attrs =3D nvic_sysreg_ns_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> -};
> -
> -/*
> - * Unassigned portions of the PPB space are RAZ/WI for privileged
> - * accesses, and fault for non-privileged accesses.
> - */
> -static MemTxResult ppb_default_read(void *opaque, hwaddr addr,
> -                                    uint64_t *data, unsigned size,
> -                                    MemTxAttrs attrs)
> -{
> -    qemu_log_mask(LOG_UNIMP, "Read of unassigned area of PPB: offset 0=
x%x\n",
> -                  (uint32_t)addr);
> -    if (attrs.user) {
> -        return MEMTX_ERROR;
> -    }
> -    *data =3D 0;
> -    return MEMTX_OK;
> -}
> -
> -static MemTxResult ppb_default_write(void *opaque, hwaddr addr,
> -                                     uint64_t value, unsigned size,
> -                                     MemTxAttrs attrs)
> -{
> -    qemu_log_mask(LOG_UNIMP, "Write of unassigned area of PPB: offset =
0x%x\n",
> -                  (uint32_t)addr);
> -    if (attrs.user) {
> -        return MEMTX_ERROR;
> -    }
> -    return MEMTX_OK;
> -}
> -
> -static const MemoryRegionOps ppb_default_ops =3D {
> -    .read_with_attrs =3D ppb_default_read,
> -    .write_with_attrs =3D ppb_default_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid.min_access_size =3D 1,
> -    .valid.max_access_size =3D 8,
> -};
> -
>   static int nvic_post_load(void *opaque, int version_id)
>   {
>       NVICState *s =3D opaque;
> @@ -2770,66 +2686,13 @@ static void armv7m_nvic_realize(DeviceState *de=
v, Error **errp)
>       s->num_prio_bits =3D arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? =
8 : 2;
>  =20
>       /*
> -     * This device provides a single sysbus memory region which
> -     * represents the whole of the "System PPB" space. This is the
> -     * range from 0xe0000000 to 0xe00fffff and includes the NVIC,
> -     * the System Control Space (system registers), the systick timer,=

> -     * and for CPUs with the Security extension an NS banked version
> -     * of all of these.
> -     *
> -     * The default behaviour for unimplemented registers/ranges
> -     * (for instance the Data Watchpoint and Trace unit at 0xe0001000)=

> -     * is to RAZ/WI for privileged access and BusFault for non-privile=
ged
> -     * access.
> -     *
> -     * The NVIC and System Control Space (SCS) starts at 0xe000e000
> -     * and looks like this:
> -     *  0x004 - ICTR
> -     *  0x010 - 0xff - systick
> -     *  0x100..0x7ec - NVIC
> -     *  0x7f0..0xcff - Reserved
> -     *  0xd00..0xd3c - SCS registers
> -     *  0xd40..0xeff - Reserved or Not implemented
> -     *  0xf00 - STIR
> -     *
> -     * Some registers within this space are banked between security st=
ates.
> -     * In v8M there is a second range 0xe002e000..0xe002efff which is =
the
> -     * NonSecure alias SCS; secure accesses to this behave like NS acc=
esses
> -     * to the main SCS range, and non-secure accesses (including when
> -     * the security extension is not implemented) are RAZ/WI.
> -     * Note that both the main SCS range and the alias range are defin=
ed
> -     * to be exempt from memory attribution (R_BLJT) and so the memory=

> -     * transaction attribute always matches the current CPU security
> -     * state (attrs.secure =3D=3D env->v7m.secure). In the nvic_sysreg=
_ns_ops
> -     * wrappers we change attrs.secure to indicate the NS access; so
> -     * generally code determining which banked register to use should
> -     * use attrs.secure; code determining actual behaviour of the syst=
em
> -     * should use env->v7m.secure.
> -     *
> -     * The container covers the whole PPB space. Within it the priorit=
y
> -     * of overlapping regions is:
> -     *  - default region (for RAZ/WI and BusFault) : -1
> -     *  - system register regions : 0
> -     *  - systick : 1
> -     * This is because the systick device is a small block of register=
s
> -     * in the middle of the other system control registers.
> +     * This device provides a single memory region which covers the
> +     * sysreg/NVIC registers from 0xE000E000 .. 0xE000EFFF, with the
> +     * exception of the systick timer registers 0xE000E010 .. 0xE000E0=
FF.
>        */
> -    memory_region_init(&s->container, OBJECT(s), "nvic", 0x100000);
> -    memory_region_init_io(&s->defaultmem, OBJECT(s), &ppb_default_ops,=
 s,
> -                          "nvic-default", 0x100000);
> -    memory_region_add_subregion_overlap(&s->container, 0, &s->defaultm=
em, -1);
>       memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops,=
 s,
>                             "nvic_sysregs", 0x1000);
> -    memory_region_add_subregion(&s->container, 0xe000, &s->sysregmem);=

> -
> -    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
> -        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
> -                              &nvic_sysreg_ns_ops, &s->sysregmem,
> -                              "nvic_sysregs_ns", 0x1000);
> -        memory_region_add_subregion(&s->container, 0x2e000, &s->sysreg=
_ns_mem);
> -    }
> -
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->sysregmem);
>   }
>  =20
>   static void armv7m_nvic_instance_init(Object *obj)
>=20

My review is week because I am new to this codebase.

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

Thanks,
-- Alexandre


--PPr2rwnIUGzGLG5LgkFuDknIYRRBJ9tU1--

--nzmiXVFpqSdCGmI2AK2l9vzVqT9ulCb6r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEVDIMFAwAAAAAACgkQbHknjz/NzAKm
7A//e2MD0jAYnVM4II+KtwfrivjrtEpokkaGjkt2Dw5R6EQ7KYh134+5W9Rh6NQIkNUF1NsYcPa+
acDDtQi127CIG0fWWwIBtN+l4NuWzuHpr2MzhDbz0fzUp+hZ9iK3QP0FzFfOJ+ZPDLznrOR/TRR9
H7bIh88aHHfQcAGETtmk3Cz9xe1+tHvm/gRlAZuROtsnt27KF4CZpOGFY1VFAm0IJfez0xwkyDFv
qAo7EqH613EyJ4fRsjpEx5rD+MHQjLpJmJFhHDO5Mdlz6+0sHWGdcmF7yshhtVltAmL8r9FQWTx9
xeL8nNT0TKxH24nV053kn7773P4VJSFHiPAYF+5ehUemX6JFzp4y861TRLu5GnlyCWcEO5vUVT4L
Yb7YzvB06hNS9n2yKrRFpFctcjueJ0e5nSJ3F42JzrS0svKElqRSQH5aQcmhN5ATnG8NFvLnjK7p
P2XL5cnpolyMaDKyIAGYKE8kqU46DThc4MwA1Mgk4ToPp555+PEnpYN8NrsEoc/pjE8LdX2uP052
J0DxxHimmdZf8jqjaKIboUMIn9Cv+oLQxduATj2EV0tBUB47pSHAKxm/GFpw9vsYfho+zOaJHIZY
gnAWwpMMu11nMUqJnjy1JzqWvzGFM9zGj/QvocGRz+KNbNQYyRiRorgSz7k6Es5jetjonpWK7Lp9
a8Y=
=MAIq
-----END PGP SIGNATURE-----

--nzmiXVFpqSdCGmI2AK2l9vzVqT9ulCb6r--

