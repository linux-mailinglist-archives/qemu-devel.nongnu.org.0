Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F213EA45B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:15:08 +0200 (CEST)
Received: from localhost ([::1]:36484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9c2-0004xg-MB
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9ay-00047c-EF; Thu, 12 Aug 2021 08:14:00 -0400
Received: from redisdead.crans.org ([185.230.79.39]:60814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9at-00005f-QU; Thu, 12 Aug 2021 08:14:00 -0400
Received: from [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f] (unknown
 [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 163782C3;
 Thu, 12 Aug 2021 14:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628770432; bh=RsXXIjsLjTLrdc7D318x5yAlKbLUsl5sHzo5jGvrO9k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TTg/HPNunD+Ypx89F1Hl3IiYt0q5bjXlQ+DCqGlKABL51aAMNMvnXnN1iqdlJA7s4
 7vWdzN673rVp2w6WMa2x5llVy/oqUaradQz3TGdD2N4FSn9PqZfLXnPpQhy9UY4rm9
 xDOoStvk57Lwi2g1odnfNokYrTgqX6zTVhm/8lbOr+8xO5GmGNe3R+QfDXs+GYiemJ
 KgPm9SHe1JCEGTR6U1rV3IHtUIo4XhIc1jDiJKa4aWskHTTJ1Xmp3Xby2Kk3yrKsox
 vqpMMISBgzbOupL5s2chCKRGr3WB/UHoxzOnXCChk3SY+uH8Tmq//bUCyJaTKhYMxL
 c4BLmuXs3O443S6aLX+/hJVxVcoXuBnNqbtQrscKjW1ad0/FRIhIvzF5/n4bKpbCA/
 4WqCynuTozUSYgABHZ9WV7Cz4KEGlVolhtqGaijhbSQMqiCIF65G8o3PuFtOtsnFU8
 wyvDuxl86OeM8QnEI3A+XOARmCxVhP6a6cuUQjmhtnNNe3m1NvzlAR8RC0VMXpJUNk
 0/yDR2vV7nD/uU3CNQvLA3VEsayuRejmNFtFW6MdJ3fTmwP7OIuwnqNIcsfsIMSGy+
 Per0wTH3h1UqeAvuMFaWuW7AgEggk7fK8JKhk+rom7kVdo9w34JHAuf3RyOPehbqpL
 LtN16tfd/SBPKv061pQEA6Lg=
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
Date: Thu, 12 Aug 2021 14:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-11-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Mgn0ICL0g8JOX7c1OPXyVNgfPdr0nU6N9"
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
--Mgn0ICL0g8JOX7c1OPXyVNgfPdr0nU6N9
Content-Type: multipart/mixed; boundary="VrxQxIOj1wTkTnFWnEqEt9s7q11AP4q1w";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-11-peter.maydell@linaro.org>

--VrxQxIOj1wTkTnFWnEqEt9s7q11AP4q1w
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/12/21 11:33 AM, Peter Maydell wrote:
> In the realize methods of the stm32f100 and stm32f205 SoC objects, we
> call g_new() to create new MemoryRegion objjects for the sram, flash,
> and flash_alias.  This is unnecessary (and leaves open the
> possibility of leaking the allocations if we exit from realize with
> an error).  Make these MemoryRegions member fields of the device
> state struct instead, as stm32f405 already does.

There is a typo in "objjects".

This is something I had issue understanding as I was seeing both=20
patterns in the codebase, thank you for making this clear.

>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/stm32f100_soc.h |  4 ++++
>   include/hw/arm/stm32f205_soc.h |  4 ++++
>   hw/arm/stm32f100_soc.c         | 17 +++++++----------
>   hw/arm/stm32f205_soc.c         | 17 +++++++----------
>   4 files changed, 22 insertions(+), 20 deletions(-)
>=20
> diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_=
soc.h
> index 71bffcf4fd5..b7d71c6c634 100644
> --- a/include/hw/arm/stm32f100_soc.h
> +++ b/include/hw/arm/stm32f100_soc.h
> @@ -52,6 +52,10 @@ struct STM32F100State {
>  =20
>       STM32F2XXUsartState usart[STM_NUM_USARTS];
>       STM32F2XXSPIState spi[STM_NUM_SPIS];
> +
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
>   };
>  =20
>   #endif
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_=
soc.h
> index 985ff63aa9e..75251494917 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -63,6 +63,10 @@ struct STM32F205State {
>       STM32F2XXSPIState spi[STM_NUM_SPIS];
>  =20
>       qemu_or_irq *adc_irqs;
> +
> +    MemoryRegion sram;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
>   };
>  =20
>   #endif
> diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
> index 0c4a5c66451..0be92b2c475 100644
> --- a/hw/arm/stm32f100_soc.c
> +++ b/hw/arm/stm32f100_soc.c
> @@ -67,25 +67,22 @@ static void stm32f100_soc_realize(DeviceState *dev_=
soc, Error **errp)
>       int i;
>  =20
>       MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>  =20
>       /*
>        * Init flash region
>        * Flash starts at 0x08000000 and then is aliased to boot memory =
at 0x0
>        */
> -    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F100.flash",
> +    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F100.flas=
h",
>                              FLASH_SIZE, &error_fatal);
> -    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> -                             "STM32F100.flash.alias", flash, 0, FLASH_=
SIZE);
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, fla=
sh);
> -    memory_region_add_subregion(system_memory, 0, flash_alias);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "STM32F100.flash.alias", &s->flash, 0, FL=
ASH_SIZE);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s-=
>flash);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>  =20
>       /* Init SRAM region */
> -    memory_region_init_ram(sram, NULL, "STM32F100.sram", SRAM_SIZE,
> +    memory_region_init_ram(&s->sram, NULL, "STM32F100.sram", SRAM_SIZE=
,
>                              &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram=
);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->=
sram);
>  =20
>       /* Init ARMv7m */
>       armv7m =3D DEVICE(&s->armv7m);
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 9cd41bf56da..0bd215aebd7 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -84,21 +84,18 @@ static void stm32f205_soc_realize(DeviceState *dev_=
soc, Error **errp)
>       int i;
>  =20
>       MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>  =20
> -    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
> +    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flas=
h",
>                              FLASH_SIZE, &error_fatal);
> -    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> -                             "STM32F205.flash.alias", flash, 0, FLASH_=
SIZE);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "STM32F205.flash.alias", &s->flash, 0, FL=
ASH_SIZE);
>  =20
> -    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, fla=
sh);
> -    memory_region_add_subregion(system_memory, 0, flash_alias);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s-=
>flash);
> +    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
>  =20
> -    memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
> +    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE=
,
>                              &error_fatal);
> -    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram=
);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->=
sram);
>  =20
>       armv7m =3D DEVICE(&s->armv7m);
>       qdev_prop_set_uint32(armv7m, "num-irq", 96);
>=20

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

Thanks,
-- Alexandre


--VrxQxIOj1wTkTnFWnEqEt9s7q11AP4q1w--

--Mgn0ICL0g8JOX7c1OPXyVNgfPdr0nU6N9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEVEH8FAwAAAAAACgkQbHknjz/NzAJ3
QQ//Z9k0JSkNdMt6kmrwYpjyvyfILclkJfrZROFAqCgC4aK9lPpVP1nbe4lpwp+i1TtBlbYxSyrV
xYaX6jqoG7Wd8XyIxwapfdT04xEwuM9vaff455N2bwFVKmW+RQbHV80TVMWlEFKBM9FHr1K6ls64
LemyujgvtUXPSCy7O2gASa+KzfVw/WoOXFsHHwtQunMV7f94jP6MCyc+covGK0ynlRqZf7Gkz0P/
YsgvoqEmBNwqdm4bSSYcIIA2cBYIvx1bAKOwS3Pq8XPy2LQf+TPjbDwXOW4xVUkgIVH4kLmofE4t
x5VZIMsSZqkJnaUCYyPy/Z08UlwwXtkYC2yi5B4R4DaWb8jLS1RXmoV5Q9y+xsYcFP8KyTltDyNk
ymfteXmeHzhTjOxpoLAaWtxOtYXnIhU3A0HDThViMImhAoCyxPK73cN5vqKzRks1VmdJELO1EMKf
lucB2Wbw0vAfjF5dSJSu/aN5XFCVkQ1wBm5pTaKTU8JDp3QQ/lZEoxd2k9hRqCX9QdSYLvzSXdDJ
OPBZwilANXRVUwXO7VJ9WZSixSpDuj+5KYsssgnTAg4jHjTStHtitsEqdtKW7Dbc1i41Wr2gAWIK
I0+FXjqZnG4+K8bFbRqygWWF0bEb2wS5uURB8czqozuUXkXBgoK6BQtatvOYS0/I8eulZ8nqX6nf
+tU=
=tCqe
-----END PGP SIGNATURE-----

--Mgn0ICL0g8JOX7c1OPXyVNgfPdr0nU6N9--

