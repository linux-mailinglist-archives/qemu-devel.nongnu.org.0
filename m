Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E16B1357
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:48:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0gy-0004qA-LF; Wed, 08 Mar 2023 15:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pa0gx-0004pr-5r; Wed, 08 Mar 2023 15:47:19 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pa0gu-0000mV-ML; Wed, 08 Mar 2023 15:47:18 -0500
Received: by mail-yb1-xb30.google.com with SMTP id t39so15938766ybi.3;
 Wed, 08 Mar 2023 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678308435;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1JV9rHvhdNcPHoyIUpDY7JoMjgv7bnm2rNU1uVCStf0=;
 b=j/uTd/UNigJrBZ9WwfA3DTIKN4lkdM/szbwPxg7tP1GAxxRWQU39Bb19LGY0zAG3am
 uDL/NPazX0Vmi+penkHthh0FJ5YW8f0wnHZN3PiWcXeO0pHvW0KigMQQ9LozPYA+Wg+a
 vRf2cy204ATvnKz/dw0LE+3KYbaNcxN/3cmAntnSYzlSUYPDPCSJ3Ms4pv3LOQ9I4UkE
 KJBK3wNw3owlwnpalDmylQiH4435exvaHz673gOxNaUbxpsRpg36SaKwVFV7N65c8Zw3
 +cz7/Gn2mfSXxUrHKYgpOfpgbfa+BIi6SC6GFAhj4vUkUA68JCvUbFafBZq6jXRrAqSb
 Ulqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678308435;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1JV9rHvhdNcPHoyIUpDY7JoMjgv7bnm2rNU1uVCStf0=;
 b=YL3g0J88KI508oZi5foXH7O6s3hNuYQIFkWeGfPW0lQEcLr38m/K2hRy9eXQncASSt
 0EmtIEkjSpp+Z73wlfYdSHBSMn1ALpqPYV7jZMEmy/zlO6v41QeCiB+Ix2Wb9VMH9bF8
 gR6WIYTb3kQ9iR9Lz3twJqZli/XErhmubism0fXxhhPePUrjmN3KgVwyKPFWWuLVTFNr
 e05aW7jLYpnZy69Zo8FzupU1FluW3Skhu/+CYVXwS/wSX64ElIPHc2gTxpHpy9F235nO
 Zhzq7bb8f2W9lAUACIAavaS0UPBMOxCfg98y372BqgEssNLxVPNEDL/6G8Sh/U9cjGSu
 Vj2A==
X-Gm-Message-State: AO0yUKVVEUWrFywmMAWuVAOtst6CYUYyII9prOeGmZkvtZj0QHPBI9fn
 NvNecI4l1Aoi8vbCuqBF8Ao8nX0VX1WIkefAenQ=
X-Google-Smtp-Source: AK7set9ztFOjwcymen+/B3bOF4tdcrOSSjixm1aonwrM+WiThdV1Sco5CayoIQgFA67MDo8OA4Mh7SV0Plf6riPtnnc=
X-Received: by 2002:a05:6902:208:b0:a98:bd27:91de with SMTP id
 j8-20020a056902020800b00a98bd2791demr11765922ybs.7.1678308434977; Wed, 08 Mar
 2023 12:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 8 Mar 2023 21:47:04 +0100
Message-ID: <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000017280605f669a297"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000017280605f669a297
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Qianfan Zhao,

Thanks for contributing this work to Qemu! With your contribution, we would
get yet another Allwinner SoC supported, making it three in total
(A10/H3/R40). That's great.
My thoughts are that maybe we should try to re-use commonality between
these SoCs where we can. Ofcourse, that may be difficult as the
internals/peripherals of these SoCs often really are different.

Your patches look good already, and I saw patches 02 and 03 are already
merged too. I did a quick regression test with
avocado for cubieboard/orangepi-pc with your patches applied and that went
OK:

$ ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes
./build/tests/venv/bin/avocado --show=3Dapp,console run -t
machine:orangepi-pc -t machine:cubieboard
tests/avocado/boot_linux_console.py
...
PASS (22.09 s)
RESULTS    : PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 169.73 s

For now, I have only two suggestions for you to consider:
1) You could add a new acceptance test for the new bananapi board to
./tests/avocado/boot_linux_console.py.
This helps in your current work to (re)test your code quickly, and after
the code is merged it helps to keep to board working when other changes are
done.
2) If time permits, it may be interesting to document your board for
example in a new file at ./docs/system/arm/bananapi.rst
   If you do this, it will make the board a lot more valuable for other
people to use, since you can add some basic instructions on how to use the
board with qemu there.
   Additionally, it also helps yourself to store this information
somewhere, since it can be easy to forget all the specific
commands/flags/arguments and links to board specific images.

Once you have progressed with your patches beyond the RFC stage, I'll try
to find some time for a more detailed review of your patches.

Kind regards,
Niek Linnenbank

On Thu, Mar 2, 2023 at 12:41=E2=80=AFPM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> v1: 2023-03-02
>
> The first three patches try fix allwinner i2c driver and I already send
> them
> as a standalone PR and can read it from:
>
>
> https://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.2534=
8-3-qianfanguijin@163.com/
>
> Hope that patch can merged first before this.
>
> The next patches will add allwinner R40 device support, including ccu,
> mmc, i2c,
> axp221 pmic, sdram controller, emac and gmac. Now the mainline u-boot and
> kernel can work fine (It doesn't support booting allwinner bsp code and
> there
> are no plans to support it now).
>
> qianfan Zhao (12):
>   hw: allwinner-i2c: Make the trace message more readable
>   hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
>   hw: arm: allwinner-h3: Fix and complete H3 i2c devices
>   hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
>   hw/arm/allwinner-r40: add Clock Control Unit
>   hw: allwinner-r40: Complete uart devices
>   hw: arm: allwinner-r40: Add 5 TWI controllers
>   hw/misc: AXP221 PMU Emulation
>   hw/arm/allwinner-r40: add SDRAM controller device
>   hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
>   hw: arm: allwinner-r40: Fix the mmc controller's type
>   hw: arm: allwinner-r40: Add emac and gmac support
>
>  configs/devices/arm-softmmu/default.mak |   1 +
>  hw/arm/Kconfig                          |  10 +
>  hw/arm/allwinner-h3.c                   |  29 +-
>  hw/arm/allwinner-r40.c                  | 555 ++++++++++++++++++++++++
>  hw/arm/bananapi_m2u.c                   | 128 ++++++
>  hw/arm/meson.build                      |   1 +
>  hw/i2c/allwinner-i2c.c                  | 136 +++++-
>  hw/i2c/trace-events                     |   5 +-
>  hw/misc/Kconfig                         |   4 +
>  hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
>  hw/misc/allwinner-r40-dramc.c           | 499 +++++++++++++++++++++
>  hw/misc/axp221.c                        | 196 +++++++++
>  hw/misc/meson.build                     |   3 +
>  hw/misc/trace-events                    |  19 +
>  hw/sd/allwinner-sdhost.c                |  70 ++-
>  include/hw/arm/allwinner-h3.h           |   6 +
>  include/hw/arm/allwinner-r40.h          | 148 +++++++
>  include/hw/i2c/allwinner-i2c.h          |   6 +
>  include/hw/misc/allwinner-r40-ccu.h     |  65 +++
>  include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
>  include/hw/sd/allwinner-sdhost.h        |   9 +
>  21 files changed, 2191 insertions(+), 14 deletions(-)
>  create mode 100644 hw/arm/allwinner-r40.c
>  create mode 100644 hw/arm/bananapi_m2u.c
>  create mode 100644 hw/misc/allwinner-r40-ccu.c
>  create mode 100644 hw/misc/allwinner-r40-dramc.c
>  create mode 100644 hw/misc/axp221.c
>  create mode 100644 include/hw/arm/allwinner-r40.h
>  create mode 100644 include/hw/misc/allwinner-r40-ccu.h
>  create mode 100644 include/hw/misc/allwinner-r40-dramc.h
>
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--00000000000017280605f669a297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Qianfan Zhao,</div><div><br></=
div><div>Thanks for contributing this work to Qemu! With your contribution,=
 we would get yet another Allwinner SoC supported, making it three in total=
 (A10/H3/R40). That&#39;s great.<br></div><div>My thoughts are that maybe w=
e should try to re-use commonality between these SoCs where we can. Ofcours=
e, that may be difficult as the internals/peripherals of these SoCs often r=
eally are different.</div><div><br></div><div>Your patches look good alread=
y, and I saw patches 02 and 03 are already merged too. I did a quick regres=
sion test with</div><div>avocado for cubieboard/orangepi-pc with your patch=
es applied and that went OK:</div><div><br></div><div>$ ARMBIAN_ARTIFACTS_C=
ACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes ./build/tests/venv/bin/avocad=
o --show=3Dapp,console run -t machine:orangepi-pc -t machine:cubieboard tes=
ts/avocado/boot_linux_console.py</div><div>...<br></div><div>PASS (22.09 s)=
<br>RESULTS =C2=A0 =C2=A0: PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | IN=
TERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0 : 169.73 s</div><div><br></div><div=
>For now, I have only two suggestions for you to consider:</div><div>1) You=
 could add a new acceptance test for the new bananapi board to ./tests/avoc=
ado/boot_linux_console.py.</div><div>This helps in your current work to (re=
)test your code quickly, and after the code is merged it helps to keep to b=
oard working when other changes are done.</div><div>2) If time permits, it =
may be interesting to document your board for example in a new file at ./do=
cs/system/arm/bananapi.rst</div><div>=C2=A0=C2=A0 If you do this, it will m=
ake the board a lot more valuable for other people to use, since you can ad=
d some basic instructions on how to use the board with qemu there.</div><di=
v>=C2=A0=C2=A0 Additionally, it also helps yourself to store this informati=
on somewhere, since it can be easy to forget all the specific commands/flag=
s/arguments and links to board specific images.</div><div><br></div><div>On=
ce you have progressed with your patches beyond the RFC stage, I&#39;ll try=
 to find some time for a more detailed review of your patches.</div><div><b=
r></div><div>Kind regards,</div><div>Niek Linnenbank<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 2=
, 2023 at 12:41=E2=80=AFPM &lt;<a href=3D"mailto:qianfanguijin@163.com">qia=
nfanguijin@163.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@16=
3.com" target=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
<br>
v1: 2023-03-02<br>
<br>
The first three patches try fix allwinner i2c driver and I already send the=
m<br>
as a standalone PR and can read it from: <br>
<br>
<a href=3D"https://patchwork.kernel.org/project/qemu-devel/patch/2023022008=
1252.25348-3-qianfanguijin@163.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.25348-3=
-qianfanguijin@163.com/</a><br>
<br>
Hope that patch can merged first before this.<br>
<br>
The next patches will add allwinner R40 device support, including ccu, mmc,=
 i2c,<br>
axp221 pmic, sdram controller, emac and gmac. Now the mainline u-boot and<b=
r>
kernel can work fine (It doesn&#39;t support booting allwinner bsp code and=
 there<br>
are no plans to support it now).<br>
<br>
qianfan Zhao (12):<br>
=C2=A0 hw: allwinner-i2c: Make the trace message more readable<br>
=C2=A0 hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs<br>
=C2=A0 hw: arm: allwinner-h3: Fix and complete H3 i2c devices<br>
=C2=A0 hw: arm: Add bananapi M2-Ultra and allwinner-r40 support<br>
=C2=A0 hw/arm/allwinner-r40: add Clock Control Unit<br>
=C2=A0 hw: allwinner-r40: Complete uart devices<br>
=C2=A0 hw: arm: allwinner-r40: Add 5 TWI controllers<br>
=C2=A0 hw/misc: AXP221 PMU Emulation<br>
=C2=A0 hw/arm/allwinner-r40: add SDRAM controller device<br>
=C2=A0 hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support<br>
=C2=A0 hw: arm: allwinner-r40: Fix the mmc controller&#39;s type<br>
=C2=A0 hw: arm: allwinner-r40: Add emac and gmac support<br>
<br>
=C2=A0configs/devices/arm-softmmu/default.mak |=C2=A0 =C2=A01 +<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 29 +-<br>
=C2=A0hw/arm/allwinner-r40.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 555 ++++++++++++++++++++++++<br>
=C2=A0hw/arm/bananapi_m2u.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 128 ++++++<br>
=C2=A0hw/arm/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/allwinner-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 136 +++++-<br>
=C2=A0hw/i2c/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0hw/misc/allwinner-r40-ccu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 207 +++++++++<br>
=C2=A0hw/misc/allwinner-r40-dramc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 499 +++++++++++++++++++++<br>
=C2=A0hw/misc/axp221.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 196 +++++++++<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +<br>
=C2=A0hw/sd/allwinner-sdhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 70 ++-<br>
=C2=A0include/hw/arm/allwinner-h3.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +<br>
=C2=A0include/hw/arm/allwinner-r40.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14=
8 +++++++<br>
=C2=A0include/hw/i2c/allwinner-i2c.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A06 +<br>
=C2=A0include/hw/misc/allwinner-r40-ccu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 65 +++=
<br>
=C2=A0include/hw/misc/allwinner-r40-dramc.h=C2=A0 =C2=A0| 108 +++++<br>
=C2=A0include/hw/sd/allwinner-sdhost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +<br>
=C2=A021 files changed, 2191 insertions(+), 14 deletions(-)<br>
=C2=A0create mode 100644 hw/arm/allwinner-r40.c<br>
=C2=A0create mode 100644 hw/arm/bananapi_m2u.c<br>
=C2=A0create mode 100644 hw/misc/allwinner-r40-ccu.c<br>
=C2=A0create mode 100644 hw/misc/allwinner-r40-dramc.c<br>
=C2=A0create mode 100644 hw/misc/axp221.c<br>
=C2=A0create mode 100644 include/hw/arm/allwinner-r40.h<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-r40-ccu.h<br>
=C2=A0create mode 100644 include/hw/misc/allwinner-r40-dramc.h<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--00000000000017280605f669a297--

