Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2E650A33
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DUV-0005Rk-D4; Mon, 19 Dec 2022 05:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p7DTY-00058B-7B; Mon, 19 Dec 2022 05:34:31 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p7DTU-00011D-Kf; Mon, 19 Dec 2022 05:34:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53BA1B80D36;
 Mon, 19 Dec 2022 10:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB84C433EF;
 Mon, 19 Dec 2022 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671446061;
 bh=Q+h3d3xqZ504RMyr+YZtplfAiE1dymY0A12xr/LlZhQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pYKEQX0vHC04s49oVVysaiYhZhFswVypFP2YTwrcXaYpV4KDQ8b+rca+cbyU2IAcN
 JlrW0RLBK+qsCtlkR82q5sQrOVY2csWJQkopRtf2tES7xyfO2TfsqYx5E/PFkOp8CK
 x+1NAdb38tP4d/4D13jB+dARkSiLMzfJhg1tLtj1gp5QgXsSVV6UAYfN3z77scw0yP
 WoKvTrZiH82pwhBMqv+BCjPGjvtLM+ZlCNR1SX0qX9/u3RRdj0kliJPWu/O3guXup3
 V8jfUN6/vWrkkmAEoOJZc70aI52++LfXtWwmvHVz/Ts3uBbgDxyCFO/w+R7SrBo0/s
 NfCPOs/fn2Qrg==
From: Felipe Balbi <balbi@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alistair
 Francis <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] hw/arm: Add Olimex H405
In-Reply-To: <b9820a50-1ec6-aac6-20fd-a248176fe862@linaro.org>
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-3-balbi@kernel.org>
 <b9820a50-1ec6-aac6-20fd-a248176fe862@linaro.org>
Date: Mon, 19 Dec 2022 12:34:16 +0200
Message-ID: <87h6xradhz.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=145.40.68.75; envelope-from=balbi@kernel.org;
 helo=ams.source.kernel.org
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
>> Olimex makes a series of low-cost STM32 boards. This commit introduces
>> the minimum setup to support SMT32-H405. See [1] for details
>>=20
>> [1] https://www.olimex.com/Products/ARM/ST/STM32-H405/
>>=20
>> Signed-off-by: Felipe Balbi <balbi@kernel.org>
>> ---
>>   MAINTAINERS                             |  6 +++
>>   configs/devices/arm-softmmu/default.mak |  1 +
>>   hw/arm/Kconfig                          |  4 ++
>>   hw/arm/meson.build                      |  1 +
>>   hw/arm/olimex-stm32-h405.c              | 65 +++++++++++++++++++++++++
>>   5 files changed, 77 insertions(+)
>>   create mode 100644 hw/arm/olimex-stm32-h405.c
>
> See also docs/system/arm/stm32.rst

Added an entry, thanks

>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index 92f9f6e000ea..76d4d650e42e 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -12,6 +12,7 @@ arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('mi=
crobit.c'))
>>   arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
>>   arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
>>   arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2=
.c'))
>> +arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm=
32-h405.c'))
>>   arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7x=
x_boards.c'))
>>   arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
>>   arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
>> diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
>> new file mode 100644
>> index 000000000000..5171a66074bb
>> --- /dev/null
>> +++ b/hw/arm/olimex-stm32-h405.c
>> @@ -0,0 +1,65 @@
>> +/*
>> + * ST STM32VLDISCOVERY machine
>> + * Olimex STM32-H405 machine
>> + *
>> + * Copyright (c) 2022 Felipe Balbi <balbi@kernel.org>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>> + * of this software and associated documentation files (the "Software")=
, to deal
>> + * in the Software without restriction, including without limitation th=
e rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or=
 sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inclu=
ded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/boards.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/qdev-clock.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/arm/stm32f405_soc.h"
>> +#include "hw/arm/boot.h"
>> +
>> +/* olimex-stm32-h405 implementation is derived from netduinoplus2 */
>> +
>> +/* Main SYSCLK frequency in Hz (168MHz) */
>> +#define SYSCLK_FRQ 168000000ULL
>
> No need to comment if named MAIN_SYSCLK_FREQ_HZ.

Heh, came verbatim from netduino2plus.

>> +static void olimex_stm32_h405_init(MachineState *machine)
>> +{
>> +    DeviceState *dev;
>> +    Clock *sysclk;
>
> I like the simplicity, but wonder if we shouldn't add checks such
> the MPS2 machines, in case one use different -cpu / -m values:
>
>         if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
>             error_report("This board can only be used with CPU %s",
>                          mc->default_cpu_type);
>             exit(1);
>         }
>
>         if (machine->ram_size !=3D mc->default_ram_size) {
>             g_autofree char *sz =3D size_to_str(mc->default_ram_size);
>             error_report("Invalid RAM size, should be %s", sz);
>             exit(1);
>         }

yeah, I see where you're coming from, but leaving those flexible might
be useful in case e.g. Olimex wants to respin the board with a slightly
different SoC and would like to very, before building HW, that their SW
is still valid.

I don't have a strong opinion either way, though.

> Or maybe better would be to refactor that since this pattern is common
> to SoC/SoM.

refactoring should be done as a separate patchset, IMHO.

>> +    /* This clock doesn't need migration because it is fixed-frequency =
*/
>> +    sysclk =3D clock_new(OBJECT(machine), "SYSCLK");
>> +    clock_set_hz(sysclk, SYSCLK_FRQ);
>> +
>> +    dev =3D qdev_new(TYPE_STM32F405_SOC);
>> +    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"=
));
>> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +
>> +    armv7m_load_kernel(ARM_CPU(first_cpu),
>> +                       machine->kernel_filename,
>> +                       0, FLASH_SIZE);
>> +}
>> +
>> +static void olimex_stm32_h405_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc =3D "Olimex STM32-H405 (Cortex-M4)";
>> +    mc->init =3D olimex_stm32_h405_init;
>
> Per previous comment:
>
>         mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m4");
>         mc->default_ram_size =3D 0; /* SRAM already allocated in SoC */

I can add these, no problem.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEEg3wK/NVnD14JZqsmho6y4DXKpEQFAmOgPigRHGJhbGJpQGtl
cm5lbC5vcmcACgkQho6y4DXKpESXWQ/6Aw/+ggNbQl7AKlYNShzPTFPJpcrf9Nqe
uhGnBXU2nLpmALKtaxcG0gv/nTM9X5ZILaup6s8qtXT1KKkJjLV7vrJLEOjJin8u
0rHxq6C6HtPkZHXAdpsUHFy+NGEBRD5FZt7x84MJgkNzEAfqanJfOyWQ9jbLYsRj
Tvyw22cWWuKTGLPWPHNrEU/vPl+xE9YqUJbg5TGuXE3ue7tqBa3emJRCBE2aAbqy
K+86ZY722AOyTXnCa0Pyg2I8N4vNIZVuzpJzIHu7Y2LD8IHK/bcysnkEBX1vyIsp
KshPlEtfLaerrwPBDCroOc//BTkZiL8v+jC01bJXygShxvu9QugMfAzUlJWwSLvN
WoQrlh5b7y/VsrcBHGzdMqwygXLSyFoxcdcgRHsEKtuSDdXsGP/vr34PlR/hEjOx
3gD2yAqMy2P2CF6qcLEezuU4XYb6i/MAK8GqCW/2HM79gAoFUi4fElISA9Yj7Hzy
TNZ8VJwBVackIUS8FWzpvgHFdzqKAxC0nJ0QYC3e8tHLQdlAGtY1m9abAB7nfx1N
5KSIXfb/DEbryc81C3UrbKDCSPxpHUOtIwuwGaIEvGruKhaMf5tX+2awtpUfSqc9
ZriTyiVG/fW7Lm3L41tea/ayeV9lud7ZV8h9N+E8+ijnTcBm1/QRC1rWsLfepkcm
AcgFpWD224E=
=Hkbn
-----END PGP SIGNATURE-----
--=-=-=--

