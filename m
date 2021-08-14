Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F43EC1AB
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:21:35 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEprC-00020M-4u
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpq5-000138-22; Sat, 14 Aug 2021 05:20:25 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:52724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpq2-0008SZ-0w; Sat, 14 Aug 2021 05:20:24 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id B75BE47C;
 Sat, 14 Aug 2021 11:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628932819; bh=Ga108H8ipcwUK0XrdEkzmEMF5DuWWudMS422P+6rwDs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AXJk7+v83KIWUB80iFjtK4ueZkgb4jSWTdg8yBK0ypFRVYrPPlTpVVpE/T2yQAmW8
 vky8nz+4g7ZCVjQt3CJMEyzmuvIe+REqQHIcAcCwBr5gOQCgmkS7Dh30byOaNN7eFP
 sH5Hu9AHG2RDkFLf1lXDFEmp4WgrFuLlkEaod0tNY8i0PCww2mYhA/CsdrbCiI88rh
 4PuK0/JxxFD7OTOlibgvw7ZWAeyGBvGDx3yKf6X5cyNKRY/KJ6v8Dzi+1MDQYCZhn4
 wP4lFP+6+C2NOs1ke4zwItS4IzYCIc2E7j/RIuJQNMhK5urCDbQHTWiaA9/iLhOnew
 UW39wCaPBt8B48Yb3X6kDElxRDPBoYrE4qPq3fraUp14zZ1VB2MzZSgzXc0vaYAkjd
 zAOEUBsF4Z6zC4CUAdk9R6pxnc4VSb51ajEBXD8qNklZMa1FM/aRFD+xAPgKNCahpU
 oXNC6bX4aTltWy/7K3FBDLZlAmZhIkK5dIkVUoQx2SbxbYkHk0LIYr2mAZ2DUzvu0m
 lhaoeWyxEUR01lkLhdBcQ4HBWjh7N5bjHdi8Yufq/V4v0C8VudR+zE55ng1IexKEtc
 kZHiPTpCWuYHCnXnRKFrQzBZJhu2gf5b6xtkzldBY7Uz+GFrUW12PxwFlM6e3izN1T
 Z13jdEzHBWXMZho0WsuDEMHI=
Subject: Re: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-20-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
Date: Sat, 14 Aug 2021 11:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-20-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="niReQVnlmUnk8xVDWQ8RAs8qqwDyQ9Vtn"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
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
--niReQVnlmUnk8xVDWQ8RAs8qqwDyQ9Vtn
Content-Type: multipart/mixed; boundary="J0L9m2lK4JUEF1rI7Ni5Fbv8Ek1llQktv";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
Subject: Re: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-20-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-20-peter.maydell@linaro.org>

--J0L9m2lK4JUEF1rI7Ni5Fbv8Ek1llQktv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Instead of passing the MSF2 SoC an integer property specifying the
> CPU clock rate, pass it a Clock instead.  This lets us wire that
> clock up to the armv7m object.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/msf2-soc.h |  3 ++-
>   hw/arm/msf2-soc.c         | 28 +++++++++++++++++-----------
>   hw/arm/msf2-som.c         |  7 ++++++-
>   3 files changed, 25 insertions(+), 13 deletions(-)
>=20
> diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
> index 38e10ce20aa..01f904cec47 100644
> --- a/include/hw/arm/msf2-soc.h
> +++ b/include/hw/arm/msf2-soc.h
> @@ -30,6 +30,7 @@
>   #include "hw/misc/msf2-sysreg.h"
>   #include "hw/ssi/mss-spi.h"
>   #include "hw/net/msf2-emac.h"
> +#include "hw/clock.h"
>   #include "qom/object.h"
>  =20
>   #define TYPE_MSF2_SOC     "msf2-soc"
> @@ -57,7 +58,7 @@ struct MSF2State {
>       uint64_t envm_size;
>       uint64_t esram_size;
>  =20
> -    uint32_t m3clk;
> +    Clock *m3clk;
>       uint8_t apb0div;
>       uint8_t apb1div;
>  =20
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index f36788054b3..0a1e594aee6 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -29,6 +29,7 @@
>   #include "hw/char/serial.h"
>   #include "hw/arm/msf2-soc.h"
>   #include "hw/misc/unimp.h"
> +#include "hw/qdev-clock.h"
>   #include "sysemu/sysemu.h"
>  =20
>   #define MSF2_TIMER_BASE       0x40004000
> @@ -73,6 +74,8 @@ static void m2sxxx_soc_initfn(Object *obj)
>       }
>  =20
>       object_initialize_child(obj, "emac", &s->emac, TYPE_MSS_EMAC);
> +
> +    s->m3clk =3D qdev_init_clock_in(DEVICE(obj), "m3clk", NULL, NULL, =
0);
>   }
>  =20
>   static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -84,6 +87,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>  =20
>       MemoryRegion *system_memory =3D get_system_memory();
>  =20
> +    if (!clock_has_source(s->m3clk)) {
> +        error_setg(errp, "m3clk must be wired up by the board code");
> +        return;
> +    }
> +
>       memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->=
envm_size,
>                              &error_fatal);
>       /*
> @@ -106,19 +114,14 @@ static void m2sxxx_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>       qdev_prop_set_uint32(armv7m, "num-irq", 81);
>       qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>       qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->m3clk);
>       object_property_set_link(OBJECT(&s->armv7m), "memory",
>                                OBJECT(get_system_memory()), &error_abor=
t);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
>           return;
>       }
>  =20
> -    if (!s->m3clk) {
> -        error_setg(errp, "Invalid m3clk value");
> -        error_append_hint(errp, "m3clk can not be zero\n");
> -        return;
> -    }
> -
> -    system_clock_scale =3D NANOSECONDS_PER_SECOND / s->m3clk;
> +    system_clock_scale =3D clock_ticks_to_ns(s->m3clk, 1);
>  =20
>       for (i =3D 0; i < MSF2_NUM_UARTS; i++) {
>           if (serial_hd(i)) {
> @@ -129,8 +132,13 @@ static void m2sxxx_soc_realize(DeviceState *dev_so=
c, Error **errp)
>       }
>  =20
>       dev =3D DEVICE(&s->timer);
> -    /* APB0 clock is the timer input clock */
> -    qdev_prop_set_uint32(dev, "clock-frequency", s->m3clk / s->apb0div=
);
> +    /*
> +     * APB0 clock is the timer input clock.
> +     * TODO: ideally the MSF2 timer device should use a Clock rather t=
han a
> +     * clock-frequency integer property.
> +     */
> +    qdev_prop_set_uint32(dev, "clock-frequency",
> +                         clock_get_hz(s->m3clk) / s->apb0div);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
>           return;
>       }
> @@ -207,8 +215,6 @@ static Property m2sxxx_soc_properties[] =3D {
>       DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_M=
AX_SIZE),
>       DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
>                           MSF2_ESRAM_MAX_SIZE),
> -    /* Libero GUI shows 100Mhz as default for clocks */
> -    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
>       /* default divisors in Libero GUI */
>       DEFINE_PROP_UINT8("apb0div", MSF2State, apb0div, 2),
>       DEFINE_PROP_UINT8("apb1div", MSF2State, apb1div, 2),
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index 343ec977c07..396e8b99138 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -29,6 +29,7 @@
>   #include "hw/boards.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/arm/boot.h"
> +#include "hw/qdev-clock.h"
>   #include "exec/address-spaces.h"
>   #include "hw/arm/msf2-soc.h"
>  =20
> @@ -49,6 +50,7 @@ static void emcraft_sf2_s2s010_init(MachineState *mac=
hine)
>       BusState *spi_bus;
>       MemoryRegion *sysmem =3D get_system_memory();
>       MemoryRegion *ddr =3D g_new(MemoryRegion, 1);
> +    Clock *m3clk;
>  =20
>       if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
>           error_report("This board can only be used with CPU %s",
> @@ -72,7 +74,10 @@ static void emcraft_sf2_s2s010_init(MachineState *ma=
chine)
>        * in Libero. CPU clock is divided by APB0 and APB1 divisors for
>        * peripherals. Emcraft's SoM kit comes with these settings by de=
fault.
>        */
> -    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
> +    /* This clock doesn't need migration because it is fixed-frequency=
 */
> +    m3clk =3D clock_new(OBJECT(machine), "m3clk");
> +    clock_set_hz(m3clk, 142 * 1000000);

Maybe something could be added in the commit message to say that M3_CLK=20
is changed from 100MHz to 142MHz. I do not know the SmartFusion2 but the =

clocking guide seems to agree with 142MHz:
https://www.microsemi.com/document-portal/doc_download/132012-ug0449-smar=
tfusion2-and-igloo2-clocking-resources-user-guide

> +    qdev_connect_clock_in(dev, "m3clk", m3clk);
>       qdev_prop_set_uint32(dev, "apb0div", 2);
>       qdev_prop_set_uint32(dev, "apb1div", 2);
>  =20
>=20

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

Thanks,
-- Alexandre


--J0L9m2lK4JUEF1rI7Ni5Fbv8Ek1llQktv--

--niReQVnlmUnk8xVDWQ8RAs8qqwDyQ9Vtn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXitMFAwAAAAAACgkQbHknjz/NzAIn
sxAAwSdmQfJ0UJWeZRLXNihfryABJbn2d2IfAJ3olBoTlQVfu5OxY8oAZI7SUULOFYdSXrkIv245
1R4I3zBWHhis4CnvSUWUwZsMkTlfwiZdhRnD8XI3YEmufHu/hCcU+1TGJoKmUZJrwwOkPJ7p5hhB
EcJT2gbddY2+HD+1Ptk9jK1aeSx7VOPzNvX9jZuKD4Nu4r7qODJX1Gmneu+zdYPcXHcR2tBE46lF
DvIH6WqAwlbJ7NxWUZl1NdYrBr4x3NrMTM3F7LLWfYQzWB1H8u9MZB3XEFY88KDLFRGE6Bb2khnh
au2zEyzCQP/pjbtMb5Gcjmb8l1k9MLSbTd0sNcaduKDqYQBAF9zFl25l8XcjnKvY/dl2gozsqQx/
xc/ptYHSqoROGLVSZpWlw/8PJ6SBYm3BQlEqaXfMTDOc5w/OCH/A1enyNwgGKlKXiHMrt8bqDj1L
ncgZZjj+KX7vEj/j3c041xNXr/tiZjCSGf90ccWniroqkAoGhkpRNhdaulpkpWLytTHkZr8PXVX3
B4y4ef0JKOpLyVDByKNG3tcHFwzd5a8ukP/810K20TcNUAc90qESwClwKK1S0heemoKy6VVCyhsO
En5/HiWIaI7beHsqzCnV5SSATCtSpmrbTbtvVZ6ypkpnMMoWWRmYd4Iufa4IN9FiiGuyZwSpuVKO
2H4=
=jd04
-----END PGP SIGNATURE-----

--niReQVnlmUnk8xVDWQ8RAs8qqwDyQ9Vtn--

