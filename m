Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF13650A41
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DRA-0002H7-4O; Mon, 19 Dec 2022 05:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p7DR7-0002Cq-JG; Mon, 19 Dec 2022 05:31:57 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p7DR5-0000fx-PZ; Mon, 19 Dec 2022 05:31:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F155FB80D36;
 Mon, 19 Dec 2022 10:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C40C433EF;
 Mon, 19 Dec 2022 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671445904;
 bh=KjGuT0KHJDNuaASCBUfKVeZF2h8lApa400z5zp7lUsw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=H7jmXSI3KA6T4GcisGRDgWb+VShPfC7rwDJQDD2GSWJ42MUqzDYdTGNTK6U7vmwwo
 Ikgoa+aA479rrbkEmiH1jvBdffmLTsMzdAzhk4sHjrvpiUpfnMxLS+SUVX5x2A3AvF
 /WUqAEq+H+FUC3QUKn0rXRr/TaUuxmPvCvckB0iaxzrwOyc6ZpPAHBNetxfukseFd0
 dywWBlvcEyTmow0iGRZTLIDSBKntb3xrJCeK4iX87qCDcz8MIE/M24pYMy6zt4uDID
 7eZOPSZo/l6wcPph4lB5kWgUhKOy5d/ef0KDggR/YbS8vYH+bggFRXYmxxA+/sBlQR
 fgt9s71lIjstA==
From: Felipe Balbi <balbi@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alistair
 Francis <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] hw/arm/stm32f405: correctly describe the memory layout
In-Reply-To: <00539fb5-9e00-8010-4fe5-2902cee9891b@linaro.org>
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-2-balbi@kernel.org>
 <00539fb5-9e00-8010-4fe5-2902cee9891b@linaro.org>
Date: Mon, 19 Dec 2022 12:31:30 +0200
Message-ID: <87k02nadml.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=balbi@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
> On 18/12/22 08:12, Felipe Balbi wrote:
>> STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
>> Memory) at a different base address. Correctly describe the memory
>> layout to give existing FW images have a chance to run unmodified.
>>=20
>> Signed-off-by: Felipe Balbi <balbi@kernel.org>
>> ---
>>   hw/arm/stm32f405_soc.c         | 8 ++++++++
>>   include/hw/arm/stm32f405_soc.h | 5 ++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
>> index c07947d9f8b1..cef23d7ee41a 100644
>> --- a/hw/arm/stm32f405_soc.c
>> +++ b/hw/arm/stm32f405_soc.c
>> @@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_=
soc, Error **errp)
>>       }
>>       memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->=
sram);
>>=20=20=20
>> +    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,
>
> Including the machine name in the memory description seems a bad
> habit from old days. What do you think about renaming as
> 'core-coupled-memory'?

I don't oppose it, but I was merely following the model from
`netduino2plus'.

>> +                           &err);
>> +    if (err !=3D NULL) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->cc=
m);
>> +
>>       armv7m =3D DEVICE(&s->armv7m);
>>       qdev_prop_set_uint32(armv7m, "num-irq", 96);
>>       qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_s=
oc.h
>> index 5bb0c8d56979..249ab5434ec7 100644
>> --- a/include/hw/arm/stm32f405_soc.h
>> +++ b/include/hw/arm/stm32f405_soc.h
>> @@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_S=
OC)
>>   #define FLASH_BASE_ADDRESS 0x08000000
>>   #define FLASH_SIZE (1024 * 1024)
>>   #define SRAM_BASE_ADDRESS 0x20000000
>> -#define SRAM_SIZE (192 * 1024)
>> +#define SRAM_SIZE (128 * 1024)
>> +#define CCM_BASE_ADDRESS 0x10000000
>> +#define CCM_SIZE (64 * 1024)
>
> Since the CCM_SIZE won't be used elsewhere, we can simply use '64 * KiB'
> in the memory_region_init_ram() in the source file. Up to the maintainer
> :)

Also not opposed. I'll wait a couple days before respinning the patch to
give the rest of the community time to reply.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEEg3wK/NVnD14JZqsmho6y4DXKpEQFAmOgPYIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQho6y4DXKpEScxQ/+Lk+IWoz8TH/i8/lzG7YU3vn+NO5qZuWd
hrXBzcfACvLkLIj+KurzjWNaZA+9yCp6MhUwtpR1WJ9QFhtdkdgOnlv3jS63UaN+
YyOAvB5Rde0q1t7NoArOTTZFCLSSkxqnrMpeT11mkoMndGx7GQHNw7405CTOHpOP
2EUMfPrUWQZwt/55TvUulruDZH/7u23jA77Pb0khv1Caw68sitfZIOPd0XE/cyhU
BwamHtHvO4dKM1Hd22dCh72j9rnoPxTKXEFfCEUDO+6usWHmIyWF+3ZstGKyp8XZ
2l3euZPhw/p1PADuH2D4cVeq64I8lQ7KQPDjBxtBixSnRrRGX8oYqlSP6VYA9N9s
atKX3XuaAfJ7WqU2jhhPGXCKGy0dZmxNKM+pHMWCGDYJ/jBg4Mb0bxgPSZ6A2fP2
J3RbGTud683ZjHFPvgkdYwVlpwb2RcFCCwAkP7K3u0qwbVu5Iq0ZXbZO1n+Q9VaN
+1GZwCUFlWL6P7BSbM18CBfvqgkeuHrNJC9vUihLoU47XXzXk4eSoi64TyHNKbNh
INouCjRs9KxcAR+IJwI6B4lWsnACQwaKHQV1dFK/F2teafNs8PaHTQ25kwiTpt7W
ogl6B1IbWW/mhox0YaSAImH1RPtwAoVTUiS/nbj8vtPsyZBNmXpBE8LJw9H+Esxg
caLEiyh8Ae8=
=43Iv
-----END PGP SIGNATURE-----
--=-=-=--

