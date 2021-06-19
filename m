Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7023AD9E0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 13:51:55 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luZVx-0001V3-P9
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 07:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1luZUo-0000V1-5C; Sat, 19 Jun 2021 07:50:42 -0400
Received: from redisdead.crans.org ([185.230.79.39]:60738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1luZUk-0003zr-2Z; Sat, 19 Jun 2021 07:50:41 -0400
Received: from [IPv6:2a02:8428:4db:b001:6961:b036:7b63:af00]
 (2a02-8428-04db-b001-6961-b036-7b63-af00.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:6961:b036:7b63:af00])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 6B64923D;
 Sat, 19 Jun 2021 13:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1624103432; bh=tWNYSGk+wb5p9b6lPY8ytRmtBbdIVV5Dunpd6OemhSI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BxuSzLQZrjbYGEvjFdqbMfsoSbTQuVXzgg+FM/iA+W1ruXrHGxa2qq0FnBV9N/bYo
 DwZeE3fMt2kXWwskxxr4964EDNK4FNtkThVsb53PpAvZoizXum4OcovYbYLs1N0Kwo
 JTrxKrUuCfJqXrfZKIBD5DUhB9XO6WqDCwjP59qzz6qi93N8wp/PPodX8MTMgpzT/D
 JJ53GIPZ6VIcg5Rtaq+4E4nEd4kLXBp04raJ/aFRs3hChC7Kx5g1YphXSISaitB/8C
 n63k+y3noatcVXlKZL4bPnHSOZqrFMk+A43Wsg2wwYqiK20V4MGlUq9UjmOIeIrEcV
 hNp6JJ9oPIOGVyKzvs/CsZrriXjolhbMnAQHB1c0MOMgKCMQPZ5i7SPblyIODHeMZz
 NB95PkDSAKsJZrUGNTPWlzIDagSNvNvOOjeINq/7qW/QBdkIAemO/4WNgHeJVAJKNk
 LuxaxrevjawScCD5JMuhY2pyfbY7O0dIJKb+Sg6/mD4uUEC0O+vrih+Ea5CqXDqEPq
 vTrv+fk8Y2YtDt3UpFPDooqAkpHquXafajM8z34jMyeUSgM5W+e7lwKDczYTmFnYKV
 KRK6OMswAzbb3RhnsJ3b+b3gQzWTM0d2InX0nIYK7pSjFacXgV5hnYMFmNWao4YHwP
 Zwywpqd3n7OeNmB/C9Da0IA0=
Subject: Re: [PATCH] docs/system: arm: Add nRF boards description
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210619095750.3216150-1-erdnaxe@crans.org>
 <ce559a20-4abc-7810-f76c-1572feaa7e9e@amsat.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <d4a2592d-f349-09d6-fd6b-c5accf69a69a@crans.org>
Date: Sat, 19 Jun 2021 13:50:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <ce559a20-4abc-7810-f76c-1572feaa7e9e@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zlg7kyGCwpm6abCCfGjewWOHGs60z1T03"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Su Hang <suhang16@mails.ucas.ac.cn>,
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 "open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zlg7kyGCwpm6abCCfGjewWOHGs60z1T03
Content-Type: multipart/mixed; boundary="DyA1PKansFPNI3oimHn49rdVYxPd4juJG";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Julia Suvorova <jusual@mail.ru>, =?UTF-8?Q?Steffen_G=c3=b6rtz?=
 <contrib@steffen-goertz.de>, Su Hang <suhang16@mails.ucas.ac.cn>
Message-ID: <d4a2592d-f349-09d6-fd6b-c5accf69a69a@crans.org>
Subject: Re: [PATCH] docs/system: arm: Add nRF boards description
References: <20210619095750.3216150-1-erdnaxe@crans.org>
 <ce559a20-4abc-7810-f76c-1572feaa7e9e@amsat.org>
In-Reply-To: <ce559a20-4abc-7810-f76c-1572feaa7e9e@amsat.org>

--DyA1PKansFPNI3oimHn49rdVYxPd4juJG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/19/21 12:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> +Julia / Su / Steffen
>=20
> On 6/19/21 11:57 AM, Alexandre Iooss wrote:
>> This adds the target guide for BBC Micro:bit.
>>
>> Information is taken from https://wiki.qemu.org/Features/MicroBit
>> and from hw/arm/nrf51_soc.c.
>=20
> Great idea :)
>=20
>>
>> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
>> ---
>>   MAINTAINERS                |  1 +
>>   docs/system/arm/nrf.rst    | 49 ++++++++++++++++++++++++++++++++++++=
++
>>   docs/system/target-arm.rst |  1 +
>>   3 files changed, 51 insertions(+)
>>   create mode 100644 docs/system/arm/nrf.rst
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 636bf2f536..7c54611cc2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1031,6 +1031,7 @@ F: hw/*/microbit*.c
>>   F: include/hw/*/nrf51*.h
>>   F: include/hw/*/microbit*.h
>>   F: tests/qtest/microbit-test.c
>> +F: docs/system/arm/nrf.rst
>>  =20
>>   AVR Machines
>>   -------------
>> diff --git a/docs/system/arm/nrf.rst b/docs/system/arm/nrf.rst
>> new file mode 100644
>> index 0000000000..e30aba8b06
>> --- /dev/null
>> +++ b/docs/system/arm/nrf.rst
>> @@ -0,0 +1,49 @@
>> +Nordic nRF boards (``microbit``)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that=

>> +are designed to be used for low-power and short-range wireless soluti=
ons.
>> +
>> +.. _Nordic nRF: https://www.nordicsemi.com/Products
>> +
>> +The nRF51 series is the first series for short range wireless applica=
tions.
>> +It is superseded by the nRF51 series.

Just noticed a typo here, it's "superseded by the nRF52 series". I will=20
fix this in next version of this patch.

>> +The following machines are based on this chip :
>> +
>> +- ``microbit``       BBC micro:bit board with nRF51822 SoC
>> +
>> +There are other series such as nRF52, nRF53 and nRF91 which are curre=
ntly not
>> +supported by QEMU.
>> +
>> +Supported devices
>> +-----------------
>> +
>> + * ARM Cortex-M0 (ARMv6-M)
>> + * Serial ports (UART)
>> + * Clock controller
>> + * Timers
>> + * Random Number Generator (RNG)
>> + * GPIO controller
>> + * NVMC
>> + * SWI
>> +
>> +Missing devices
>> +---------------
>> +
>> + * Watchdog
>> + * Real-Time Clock (RTC) controller
>> + * TWI (i2c)
>> + * SPI controller
>> + * Analog to Digital Converter (ADC)
>> + * Quadrature decoder
>> + * Radio
>> +
>> +Boot options
>> +------------
>> +
>> +The Micro:bit machine can be started using the ``-device`` option to =
load a
>> +firmware in hexadecimal format. Example:
>=20
> I'd use "ihex format" instead of "hexadecimal format", see
>=20
> https://en.wikipedia.org/wiki/Intel_HEX
>=20
> and also commit e4a25ed91947af1ec87f23725de4ac86a3353b48:
>=20
>      loader: Implement .hex file loader
>=20
>      This patch adds Intel Hexadecimal Object File format support to th=
e
>      generic loader device.  The file format specification is available=

>      here: http://www.piclist.com/techref/fileext/hex/intel.htm
>=20
>      This file format is often used with microcontrollers such as the
>      micro:bit, Arduino, STM32, etc.  Users expect to be able to run .h=
ex
>      files directly with without first converting them to ELF.  Most
>      micro:bit code is developed in web-based IDEs without direct user
>      access to binutils so it is important for QEMU to handle this file=

>      format natively.
>=20
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20

I was not aware of the name of the format. I will apply the change and=20
add a link to the Wikipedia page of Intel HEX.

>> +
>> +.. code-block:: bash
>> +
>> +  $ qemu-system-arm -M microbit -device loader,file=3Dtest.hex
>> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
>> index edd013c7bb..5277ac0242 100644
>> --- a/docs/system/target-arm.rst
>> +++ b/docs/system/target-arm.rst
>> @@ -87,6 +87,7 @@ undocumented; you can get a complete list by running=

>>      arm/digic
>>      arm/musicpal
>>      arm/gumstix
>> +   arm/nrf
>>      arm/nseries
>>      arm/nuvoton
>>      arm/orangepi
>>
>=20

Thanks,
-- Alexandre


--DyA1PKansFPNI3oimHn49rdVYxPd4juJG--

--zlg7kyGCwpm6abCCfGjewWOHGs60z1T03
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDN2gQFAwAAAAAACgkQbHknjz/NzAKK
LQ/+I3b4X8SD7rHUI5GwK/SPd1fNsyg+MNCdjfklAv+q4hX/3cGx/DaJNh/5mHOdcwh7b8vu5fgh
8JZFhOmDjX8f+aVCt/fOv1VnihGr6FyVy4+Womt6uQEZgjGd9PT0KndZ0h3wNGYS6Zpci34y8acT
m94zupAiwsr8DMMfqrv6KAKqszk2+iRYMcea/B9f8Oua2jEnbpxwAOYuIuy4sZ1Bn/EwFpfhnVV1
PH2t8BuomRAg7tpt6DZCDdDzVVl5QVdia+dCNLSVCi4iP0O3eQ1M9FVCNFhniVEo7vTPgVHMu6SQ
mnZrDrEy4VzAj/3IO/qFG9mfaZ87+Rhxv+okRlx3IE/B6/tDC4tQrFfMhAIgTPGMhALHtfqRgbS0
Uaki2pnbUIRIqFQozs7pfJku7+AoY8tYOlFYWV2ZVkIb6in1J83tqnY0U5Mh6JJ1h60kEFJlZi6q
MH2C1wBtzW2XuxKDqx2QKL1df1ofs6OLdJufKpdQDG6QF8fIgyL+quUlboctKjhDLqA6a4rKxilu
tT3ia5iO9K4UZbAgPmlw9DCqRb/ppsfwvCR+w7IoVc8fb8EnTBNrljtpu2+MLLxHoTRdsYp1Avgc
6icgTVeStoKwJulxPfCOdAgmgs3C4mwMZizoc6gKtnBt5JjFGPecUaShe5cGBrkHsSCIuCDUIHD/
eog=
=Xzo4
-----END PGP SIGNATURE-----

--zlg7kyGCwpm6abCCfGjewWOHGs60z1T03--

