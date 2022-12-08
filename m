Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF8647743
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 21:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3NSa-00006f-H3; Thu, 08 Dec 2022 15:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p3NSY-000067-Mo; Thu, 08 Dec 2022 15:25:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p3NSW-000310-8V; Thu, 08 Dec 2022 15:25:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h7so3069228wrs.6;
 Thu, 08 Dec 2022 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DPFVE7wntVsydH3hHjszCEHgZh1P4e51YHkfPvYG+wQ=;
 b=H+WHq8g5hRceKx91VjwCRbK/jEukDOSvj7cJNMq0Hf6aesOJhstxSNZpQq2dT6jBqq
 xQVggdO5QGo0vFCNVj3yJq2IAOQsUulpj3RH8EoU6nJA1cVDmI7jXfrzCHmin23sWPB6
 0+DE02iGnNUpNCHdmEuIzQyHlX0qF/E1NqHwvd/tfjfL6iJxPSsk7zsCR7SCi99kCQfr
 ORAwvE/XUAlio/0IoirNzLA667qZl2VcV0MRHXuYRWdm9aGagHivkWjlF7Wip+LMLoKo
 UzKzM0RpW9A/FqH7nPmz+83EeksneMGJVCaP5cRbZHmbdmFSoq93xS0WOBJzyiMeEXx3
 kqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPFVE7wntVsydH3hHjszCEHgZh1P4e51YHkfPvYG+wQ=;
 b=UiNKOvn7AoK9DrwL1NkujaFMLBBYHXxzMPVoSKiNjHCjJUJT76v/M4DnKkJYEhUX8a
 u39d7ErNzxkTCrJU66Sz9iKiKuZNmFPzdUJYneUI/9zL1vkAuQyKsbYHIedB2OQHUgc3
 B6oTkzGy5jWJunwZkZ6EuM2Lb1N/XgXBGdv7ilgfcD/aM72cAGFFfDP8sjfg3OIgJIn5
 1fX+uVx6syiGwqAg7Wk75V5HQHfF/Ug8O7BKelABuC6UNOio3yYYgzFtTkXB0OZJaaln
 9GLR+XApxEypgTTQQTX/uoiZ3BtsrcYnNJGjAXU86G1K9jNMyFfiaABiqmNUjjhCUlSw
 5e9Q==
X-Gm-Message-State: ANoB5pksyJoRnigAjnx9ebAd7uIf4ubzdm6pea8AokjsURHXFqSQsS2e
 tLMPCSX9ztgrm2NyT7lCBlbBQQmJJ55KJlMYp6s=
X-Google-Smtp-Source: AA0mqf4CulI6DQSvzAgxbHzswXimpbFNACfvjbHAFls5uqFpHajieEccXfacoj8LBrUT2lELznO/Y2ilsIUQCYe5UWs=
X-Received: by 2002:adf:ea4e:0:b0:242:1d48:e043 with SMTP id
 j14-20020adfea4e000000b002421d48e043mr27563886wrn.498.1670531130099; Thu, 08
 Dec 2022 12:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <CAPan3WoHZXTY4+EAkgwcHdYTice62OtRdLyjW7hdn8oQ-Swa-A@mail.gmail.com>
 <CABtshVTVG=YqWemmG56eOAR5UouDXnTHBtp42Tu6N_w4EgDpUA@mail.gmail.com>
In-Reply-To: <CABtshVTVG=YqWemmG56eOAR5UouDXnTHBtp42Tu6N_w4EgDpUA@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 8 Dec 2022 21:25:18 +0100
Message-ID: <CAPan3WppK=fY1L7k5urN27=tVNSxy9NnSUoZK2W8+Lxm8TTnqg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Enable Cubieboard A10 boot SPL from SD card
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000988d5c05ef56d620"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-wr1-x42b.google.com
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

--000000000000988d5c05ef56d620
Content-Type: text/plain; charset="UTF-8"

Hi Strahinja,

On Thu, Dec 8, 2022 at 8:24 PM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> Hi Niek,
>
> On Wed, Dec 7, 2022 at 9:25 PM Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> >
> > Hello Strahinja,
> >
> > Thanks for contribution these patches, and also taking the H3 into
> account :-)
>
> Thank you for looking into these patches and all of the comments. I
> will try to submit V2 of this patch set in the following days.
>
> >
> > I've ran the avocado based acceptance tests for both boards and got
> these results:
> >
> > $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes
> ./build/tests/venv/bin/avocado --show=app,console run -t
> machine:orangepi-pc tests/avocado/boot_linux_console.py
> > ...
> > RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> > JOB TIME   : 114.24 s
> >
> > $ ./build/tests/venv/bin/avocado --show=app,console run -t
> machine:cubieboard tests/avocado/boot_linux_console.py
> > ...
> > RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> > JOB TIME   : 22.79 s
>
> I did not think initially about avocado, but maybe I could also add an
> SPL/SD boot test for the cubieboard, similarly to the way it is run
> for Orange Pi, for V2 of the patch set?
>

Yeah that would be great. It can help to make testing easier when working
on your current code, since its all automated.
And when covering the SPL/SD boot with an acceptance test, it also helps to
ensure it keeps working with future updates to Qemu code too.

One thing to be aware of is to select an image with an URL that is stable.
Once a new test is merged, and the image is subsequently deleted
from the remote server, the test can't run anymore. We've had such a
problem before with the orangepi-pc tests.

Regards,
Niek


>
> Best regards,
> Strahinja
>
>
>
> >
> > So that shows both machines are still running fine. During startup of
> the bionic 20.08 image for orangepi-pc it did show this message:
> >   console: i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
> >   console: sy8106a: probe of 0-0065 failed with error -110
> >
> > The SY8106a appears to be an peripheral attached to the I2C bus on the
> orangepi-pc, and we don't emulate the SY8106a yet, so that's an error to be
> expected:
> >   https://linux-sunxi.org/SY8106A
> >
> > So for the series:
> > Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >
> > I'll try to reply to each patch as well.
> >
> > Kind regards,
> > Niek
> >
> > On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <
> strahinjapjankovic@gmail.com> wrote:
> >>
> >> This patch series adds missing Allwinner A10 modules needed for
> >> successful SPL boot:
> >> - Clock controller module
> >> - DRAM controller
> >> - I2C0 controller (added also for Allwinner H3 since it is the same)
> >> - AXP-209 connected to I2C0 bus
> >>
> >> It also updates Allwinner A10 emulation so SPL is copied from attached
> >> SD card if `-kernel` parameter is not passed when starting QEMU
> >> (approach adapted from Allwinner H3 implementation).
> >>
> >> Boot from SD card has been tested with Cubieboard Armbian SD card image
> and custom
> >> Yocto image built for Cubieboard.
> >> Example usage for Armbian image:
> >> qemu-system-arm -M cubieboard -nographic -sd
> ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img
> >>
> >>
> >> Strahinja Jankovic (6):
> >>   hw/misc: Allwinner-A10 Clock Controller Module Emulation
> >>   hw/misc: Allwinner A10 DRAM Controller Emulation
> >>   hw/i2c: Allwinner TWI/I2C Emulation
> >>   hw/misc: Allwinner AXP-209 Emulation
> >>   hw/arm: Add AXP-209 to Cubieboard
> >>   hw/arm: Allwinner A10 enable SPL load from MMC
> >>
> >>  hw/arm/Kconfig                        |   5 +
> >>  hw/arm/allwinner-a10.c                |  40 +++
> >>  hw/arm/allwinner-h3.c                 |  11 +-
> >>  hw/arm/cubieboard.c                   |  11 +
> >>  hw/i2c/Kconfig                        |   4 +
> >>  hw/i2c/allwinner-i2c.c                | 417 ++++++++++++++++++++++++++
> >>  hw/i2c/meson.build                    |   1 +
> >>  hw/misc/Kconfig                       |  10 +
> >>  hw/misc/allwinner-a10-ccm.c           | 224 ++++++++++++++
> >>  hw/misc/allwinner-a10-dramc.c         | 179 +++++++++++
> >>  hw/misc/allwinner-axp-209.c           | 263 ++++++++++++++++
> >>  hw/misc/meson.build                   |   3 +
> >>  include/hw/arm/allwinner-a10.h        |  27 ++
> >>  include/hw/arm/allwinner-h3.h         |   3 +
> >>  include/hw/i2c/allwinner-i2c.h        | 112 +++++++
> >>  include/hw/misc/allwinner-a10-ccm.h   |  67 +++++
> >>  include/hw/misc/allwinner-a10-dramc.h |  68 +++++
> >>  17 files changed, 1444 insertions(+), 1 deletion(-)
> >>  create mode 100644 hw/i2c/allwinner-i2c.c
> >>  create mode 100644 hw/misc/allwinner-a10-ccm.c
> >>  create mode 100644 hw/misc/allwinner-a10-dramc.c
> >>  create mode 100644 hw/misc/allwinner-axp-209.c
> >>  create mode 100644 include/hw/i2c/allwinner-i2c.h
> >>  create mode 100644 include/hw/misc/allwinner-a10-ccm.h
> >>  create mode 100644 include/hw/misc/allwinner-a10-dramc.h
> >>
> >> --
> >> 2.30.2
> >>
> >
> >
> > --
> > Niek Linnenbank
> >
>


-- 
Niek Linnenbank

--000000000000988d5c05ef56d620
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Strahinja,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 8=
:24 PM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.co=
m">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Niek,<br>
<br>
On Wed, Dec 7, 2022 at 9:25 PM Niek Linnenbank &lt;<a href=3D"mailto:niekli=
nnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hello Strahinja,<br>
&gt;<br>
&gt; Thanks for contribution these patches, and also taking the H3 into acc=
ount :-)<br>
<br>
Thank you for looking into these patches and all of the comments. I<br>
will try to submit V2 of this patch set in the following days.<br>
<br>
&gt;<br>
&gt; I&#39;ve ran the avocado based acceptance tests for both boards and go=
t these results:<br>
&gt;<br>
&gt; $ ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes ./b=
uild/tests/venv/bin/avocado --show=3Dapp,console run -t machine:orangepi-pc=
 tests/avocado/boot_linux_console.py<br>
&gt; ...<br>
&gt; RESULTS=C2=A0 =C2=A0 : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | I=
NTERRUPT 0 | CANCEL 0<br>
&gt; JOB TIME=C2=A0 =C2=A0: 114.24 s<br>
&gt;<br>
&gt; $ ./build/tests/venv/bin/avocado --show=3Dapp,console run -t machine:c=
ubieboard tests/avocado/boot_linux_console.py<br>
&gt; ...<br>
&gt; RESULTS=C2=A0 =C2=A0 : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | I=
NTERRUPT 0 | CANCEL 0<br>
&gt; JOB TIME=C2=A0 =C2=A0: 22.79 s<br>
<br>
I did not think initially about avocado, but maybe I could also add an<br>
SPL/SD boot test for the cubieboard, similarly to the way it is run<br>
for Orange Pi, for V2 of the patch set?<br></blockquote><div><br></div><div=
>Yeah that would be great. It can help to make testing easier when working =
on your current code, since its all automated.<br></div><div>And when cover=
ing the SPL/SD boot with an acceptance test, it also helps to ensure it kee=
ps working with future updates to Qemu code too.</div><div><br></div><div>O=
ne thing to be aware of is to select an image with an URL that is stable. O=
nce a new test is merged, and the image is subsequently deleted</div><div>f=
rom the remote server, the test can&#39;t run anymore. We&#39;ve had such a=
 problem before with the orangepi-pc tests.</div><div><br></div><div>Regard=
s,</div><div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Best regards,<br>
Strahinja<br>
<br>
<br>
<br>
&gt;<br>
&gt; So that shows both machines are still running fine. During startup of =
the bionic 20.08 image for orangepi-pc it did show this message:<br>
&gt;=C2=A0 =C2=A0console: i2c i2c-0: mv64xxx: I2C bus locked, block: 1, tim=
e_left: 0<br>
&gt;=C2=A0 =C2=A0console: sy8106a: probe of 0-0065 failed with error -110<b=
r>
&gt;<br>
&gt; The SY8106a appears to be an peripheral attached to the I2C bus on the=
 orangepi-pc, and we don&#39;t emulate the SY8106a yet, so that&#39;s an er=
ror to be expected:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://linux-sunxi.org/SY8106A" rel=3D"norefer=
rer" target=3D"_blank">https://linux-sunxi.org/SY8106A</a><br>
&gt;<br>
&gt; So for the series:<br>
&gt; Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.=
com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt;<br>
&gt; I&#39;ll try to reply to each patch as well.<br>
&gt;<br>
&gt; Kind regards,<br>
&gt; Niek<br>
&gt;<br>
&gt; On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic &lt;<a href=3D"mail=
to:strahinjapjankovic@gmail.com" target=3D"_blank">strahinjapjankovic@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This patch series adds missing Allwinner A10 modules needed for<br=
>
&gt;&gt; successful SPL boot:<br>
&gt;&gt; - Clock controller module<br>
&gt;&gt; - DRAM controller<br>
&gt;&gt; - I2C0 controller (added also for Allwinner H3 since it is the sam=
e)<br>
&gt;&gt; - AXP-209 connected to I2C0 bus<br>
&gt;&gt;<br>
&gt;&gt; It also updates Allwinner A10 emulation so SPL is copied from atta=
ched<br>
&gt;&gt; SD card if `-kernel` parameter is not passed when starting QEMU<br=
>
&gt;&gt; (approach adapted from Allwinner H3 implementation).<br>
&gt;&gt;<br>
&gt;&gt; Boot from SD card has been tested with Cubieboard Armbian SD card =
image and custom<br>
&gt;&gt; Yocto image built for Cubieboard.<br>
&gt;&gt; Example usage for Armbian image:<br>
&gt;&gt; qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-tru=
nk_Cubieboard_kinetic_edge_6.0.7.img<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Strahinja Jankovic (6):<br>
&gt;&gt;=C2=A0 =C2=A0hw/misc: Allwinner-A10 Clock Controller Module Emulati=
on<br>
&gt;&gt;=C2=A0 =C2=A0hw/misc: Allwinner A10 DRAM Controller Emulation<br>
&gt;&gt;=C2=A0 =C2=A0hw/i2c: Allwinner TWI/I2C Emulation<br>
&gt;&gt;=C2=A0 =C2=A0hw/misc: Allwinner AXP-209 Emulation<br>
&gt;&gt;=C2=A0 =C2=A0hw/arm: Add AXP-209 to Cubieboard<br>
&gt;&gt;=C2=A0 =C2=A0hw/arm: Allwinner A10 enable SPL load from MMC<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;&gt;=C2=A0 hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 40 +++<br>
&gt;&gt;=C2=A0 hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;&gt;=C2=A0 hw/arm/cubieboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
&gt;&gt;=C2=A0 hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;&gt;=C2=A0 hw/i2c/allwinner-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 417 ++++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
&gt;&gt;=C2=A0 hw/misc/allwinner-a10-ccm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 224 ++++++++++++++<br>
&gt;&gt;=C2=A0 hw/misc/allwinner-a10-dramc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 179 +++++++++++<br>
&gt;&gt;=C2=A0 hw/misc/allwinner-axp-209.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 263 ++++++++++++++++<br>
&gt;&gt;=C2=A0 hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;&gt;=C2=A0 include/hw/arm/allwinner-a10.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 27 ++<br>
&gt;&gt;=C2=A0 include/hw/arm/allwinner-h3.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
&gt;&gt;=C2=A0 include/hw/i2c/allwinner-i2c.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
112 +++++++<br>
&gt;&gt;=C2=A0 include/hw/misc/allwinner-a10-ccm.h=C2=A0 =C2=A0|=C2=A0 67 +=
++++<br>
&gt;&gt;=C2=A0 include/hw/misc/allwinner-a10-dramc.h |=C2=A0 68 +++++<br>
&gt;&gt;=C2=A0 17 files changed, 1444 insertions(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 create mode 100644 hw/i2c/allwinner-i2c.c<br>
&gt;&gt;=C2=A0 create mode 100644 hw/misc/allwinner-a10-ccm.c<br>
&gt;&gt;=C2=A0 create mode 100644 hw/misc/allwinner-a10-dramc.c<br>
&gt;&gt;=C2=A0 create mode 100644 hw/misc/allwinner-axp-209.c<br>
&gt;&gt;=C2=A0 create mode 100644 include/hw/i2c/allwinner-i2c.h<br>
&gt;&gt;=C2=A0 create mode 100644 include/hw/misc/allwinner-a10-ccm.h<br>
&gt;&gt;=C2=A0 create mode 100644 include/hw/misc/allwinner-a10-dramc.h<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.2<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Niek Linnenbank<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000988d5c05ef56d620--

