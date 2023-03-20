Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621866C0DB2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:52:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peC9y-0006m9-VG; Mon, 20 Mar 2023 05:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1peC9p-0006ji-PX; Mon, 20 Mar 2023 05:50:26 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1peC9i-00085Q-FK; Mon, 20 Mar 2023 05:50:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id o12so44190849edb.9;
 Mon, 20 Mar 2023 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679305813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lJKLy/RH8jk7LzIm0pkt1OSjL81D87Q9s3BvX/SWYDk=;
 b=j6n72V1NNOD+/QCuX4lkBjNBRxCqrKVAkxZPUSaRX/R3+p3HNP9KLhCSSTcA3ytx61
 Asgmq5myvyfqUV+KCy34qAUewfWInqey5roZ/7f06Zz4Sb55r9aRwLhxrQ/eXhUVy+sS
 rcP/8x7bsZerdJmb+tO15TQOx84x39lUYboCm0DKyWfgMwT6UcXRnjrTu7jDetdx5rfG
 cDtW7HzB6DtCyVGcfbLgmThDdIVBBuHna0FQuXSEUYoUy7tv7Fsn1j16utAEXYbUCgLl
 aYKYdCbschEcWR4kAxIssgJmyRQxrU/xYIFqHfoaS09QT3X4cCyFSMhLDnxbO3xPm38/
 AsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679305813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lJKLy/RH8jk7LzIm0pkt1OSjL81D87Q9s3BvX/SWYDk=;
 b=Pg10JRTH1DvkqKW9QuNLuf6uH+ArNRJMNaBL1+s6ytqjMtpp+AW7QcvfmQn9/7Ifyl
 keWbhqM2F/Rq6TfR8lNp002mYTJoUYmPa/5Jge42iSbzMFRoZhN+q2WquH6jGw1A465P
 agRqdDxPil/0baUinoz1soS1vWIa/1Ku5XP8dH/uBzeFPTY6UGg+7QO0r1yUeWjZYxo0
 OpWLKcfAK74zzhzVcl48EPmu8u6MvZhH63X9I4sxx3oOzSJnmufTOxM5HJ7zQZu0TvGO
 jJOL7kT1tKpNt53W2TFwo7qU4Z7F0GkiSR7IYhgzExB5Z6Df6X0Whv6MXQG3oZ5/0a2+
 EGvA==
X-Gm-Message-State: AO0yUKWDrYzNbcaQJztN8UzmY4ujC41/NWOn0QYIv1EGk5Lb6BRwdfaZ
 ih4MTUyUvJAnW55PfUBBC5E3CiyYYzGkSrghfJI=
X-Google-Smtp-Source: AK7set/fEhfIq0sPa5PXkY+GvMjl/TJ98lmABqsw65+rFk9TTsYRQfZajQtiXdSO5fbUXRZ2YfLDUSi+sP6RW4vrvwU=
X-Received: by 2002:a50:999d:0:b0:4fb:e0e8:5140 with SMTP id
 m29-20020a50999d000000b004fbe0e85140mr6070581edb.6.1679305812851; Mon, 20 Mar
 2023 02:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
 <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
 <7bea1905-139c-bdf6-e160-74b9aa99f9c9@163.com>
In-Reply-To: <7bea1905-139c-bdf6-e160-74b9aa99f9c9@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 20 Mar 2023 10:50:01 +0100
Message-ID: <CABtshVSvWMJgAa8P3Ju53XfrWwbf4Ut1+ZUpjAUY_OXMurYt6w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: qianfan <qianfanguijin@163.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000071bed305f751daac"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52b.google.com
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

--00000000000071bed305f751daac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Could you try maybe running OpenWRT instead of Armbian?

Link to the stable image for M2 Ultra is is
https://downloads.openwrt.org/releases/22.03.3/targets/sunxi/cortexa7/openw=
rt-22.03.3-sunxi-cortexa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img.gz

Best reregards ,
Strahinja



On Mon, Mar 20, 2023, 9:52 AM qianfan <qianfanguijin@163.com> wrote:

>
>
> =E5=9C=A8 2023/3/9 4:47, Niek Linnenbank =E5=86=99=E9=81=93:
> > Hello Qianfan Zhao,
> >
> > Thanks for contributing this work to Qemu! With your contribution, we
> > would get yet another Allwinner SoC supported, making it three in
> > total (A10/H3/R40). That's great.
> > My thoughts are that maybe we should try to re-use commonality between
> > these SoCs where we can. Ofcourse, that may be difficult as the
> > internals/peripherals of these SoCs often really are different.
> >
> > Your patches look good already, and I saw patches 02 and 03 are
> > already merged too. I did a quick regression test with
> > avocado for cubieboard/orangepi-pc with your patches applied and that
> > went OK:
> >
> > $ ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes
> > ./build/tests/venv/bin/avocado --show=3Dapp,console run -t
> > machine:orangepi-pc -t machine:cubieboard
> > tests/avocado/boot_linux_console.py
> > ...
> > PASS (22.09 s)
> > RESULTS    : PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
> > | CANCEL 0
> > JOB TIME   : 169.73 s
> >
> > For now, I have only two suggestions for you to consider:
> > 1) You could add a new acceptance test for the new bananapi board to
> > ./tests/avocado/boot_linux_console.py.
> > This helps in your current work to (re)test your code quickly, and
> > after the code is merged it helps to keep to board working when other
> > changes are done.
> > 2) If time permits, it may be interesting to document your board for
> > example in a new file at ./docs/system/arm/bananapi.rst
> >    If you do this, it will make the board a lot more valuable for
> > other people to use, since you can add some basic instructions on how
> > to use the board with qemu there.
> >    Additionally, it also helps yourself to store this information
> > somewhere, since it can be easy to forget all the specific
> > commands/flags/arguments and links to board specific images.
> >
> > Once you have progressed with your patches beyond the RFC stage, I'll
> > try to find some time for a more detailed review of your patches.
> Hi:
>
> Thanks for yours guide. avocado test case and documents will be
> introduced later.
>
> My work are stucked when I am writting avocado test case due to the
> armbian image with
> linux 6.1 can't boot, the kernel paniced when loading hdmi driver:
>
> [    0.925906] sun8i-dw-hdmi 1ee0000.hdmi: supply hvcc not found, using
> dummy regulator
> Invalid read at addr 0x1EF002C, size 4, region '(null)', reason: rejected
> [    0.927444] 8<--- cut here ---
> [    0.927780] Unhandled fault: external abort on non-linefetch (0x008)
> at 0xe091002c
> [    0.928250] [e091002c] *pgd=3D4100a811, *pte=3D01ef0653, *ppte=3D01ef0=
453
> [    0.929441] Internal error: : 8 [#1] SMP ARM
> [    0.929925] Modules linked in:
> [    0.930332] CPU: 3 PID: 52 Comm: kworker/u8:2 Not tainted
> 6.3.0-rc3-ge8d018dd0257 #217
> [    0.931082] Hardware name: Allwinner sun8i Family
> [    0.931630] Workqueue: events_unbound deferred_probe_work_func
> [    0.932443] PC is at regmap_mmio_read32le+0x8/0x14
> [    0.932888] LR is at regmap_mmio_read+0x38/0x54
>
> All my work are based on linux 5.15 in the previous days, I will take
> many times to solve this.
>
> >
> > Kind regards,
> > Niek Linnenbank
> >
> > On Thu, Mar 2, 2023 at 12:41=E2=80=AFPM <qianfanguijin@163.com> wrote:
> >
> >     From: qianfan Zhao <qianfanguijin@163.com>
> >
> >     v1: 2023-03-02
> >
> >     The first three patches try fix allwinner i2c driver and I already
> >     send them
> >     as a standalone PR and can read it from:
> >
> >
> https://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.2534=
8-3-qianfanguijin@163.com/
> >
> >     Hope that patch can merged first before this.
> >
> >     The next patches will add allwinner R40 device support, including
> >     ccu, mmc, i2c,
> >     axp221 pmic, sdram controller, emac and gmac. Now the mainline
> >     u-boot and
> >     kernel can work fine (It doesn't support booting allwinner bsp
> >     code and there
> >     are no plans to support it now).
> >
> >     qianfan Zhao (12):
> >       hw: allwinner-i2c: Make the trace message more readable
> >       hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
> >       hw: arm: allwinner-h3: Fix and complete H3 i2c devices
> >       hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
> >       hw/arm/allwinner-r40: add Clock Control Unit
> >       hw: allwinner-r40: Complete uart devices
> >       hw: arm: allwinner-r40: Add 5 TWI controllers
> >       hw/misc: AXP221 PMU Emulation
> >       hw/arm/allwinner-r40: add SDRAM controller device
> >       hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
> >       hw: arm: allwinner-r40: Fix the mmc controller's type
> >       hw: arm: allwinner-r40: Add emac and gmac support
> >
> >      configs/devices/arm-softmmu/default.mak |   1 +
> >      hw/arm/Kconfig                          |  10 +
> >      hw/arm/allwinner-h3.c                   |  29 +-
> >      hw/arm/allwinner-r40.c                  | 555
> >     ++++++++++++++++++++++++
> >      hw/arm/bananapi_m2u.c                   | 128 ++++++
> >      hw/arm/meson.build                      |   1 +
> >      hw/i2c/allwinner-i2c.c                  | 136 +++++-
> >      hw/i2c/trace-events                     |   5 +-
> >      hw/misc/Kconfig                         |   4 +
> >      hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
> >      hw/misc/allwinner-r40-dramc.c           | 499 ++++++++++++++++++++=
+
> >      hw/misc/axp221.c                        | 196 +++++++++
> >      hw/misc/meson.build                     |   3 +
> >      hw/misc/trace-events                    |  19 +
> >      hw/sd/allwinner-sdhost.c                |  70 ++-
> >      include/hw/arm/allwinner-h3.h           |   6 +
> >      include/hw/arm/allwinner-r40.h          | 148 +++++++
> >      include/hw/i2c/allwinner-i2c.h          |   6 +
> >      include/hw/misc/allwinner-r40-ccu.h     |  65 +++
> >      include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
> >      include/hw/sd/allwinner-sdhost.h        |   9 +
> >      21 files changed, 2191 insertions(+), 14 deletions(-)
> >      create mode 100644 hw/arm/allwinner-r40.c
> >      create mode 100644 hw/arm/bananapi_m2u.c
> >      create mode 100644 hw/misc/allwinner-r40-ccu.c
> >      create mode 100644 hw/misc/allwinner-r40-dramc.c
> >      create mode 100644 hw/misc/axp221.c
> >      create mode 100644 include/hw/arm/allwinner-r40.h
> >      create mode 100644 include/hw/misc/allwinner-r40-ccu.h
> >      create mode 100644 include/hw/misc/allwinner-r40-dramc.h
> >
> >     --
> >     2.25.1
> >
> >
> >
> > --
> > Niek Linnenbank
> >
>
>

--00000000000071bed305f751daac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div>Could you try maybe runnin=
g OpenWRT instead of Armbian?<div dir=3D"auto"><br></div><div dir=3D"auto">=
Link to the stable image for M2 Ultra is is <a href=3D"https://downloads.op=
enwrt.org/releases/22.03.3/targets/sunxi/cortexa7/openwrt-22.03.3-sunxi-cor=
texa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img.gz">https://downloads.open=
wrt.org/releases/22.03.3/targets/sunxi/cortexa7/openwrt-22.03.3-sunxi-corte=
xa7-sinovoip_bananapi-m2-ultra-ext4-sdcard.img.gz</a></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Best reregards ,</div><div dir=3D"auto">Strah=
inja</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><div dir=3D"aut=
o"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Mar 20, 2023, 9:52 AM qianfan &lt;<a href=3D"mailto:qianf=
anguijin@163.com">qianfanguijin@163.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
<br>
=E5=9C=A8 2023/3/9 4:47, Niek Linnenbank =E5=86=99=E9=81=93:<br>
&gt; Hello Qianfan Zhao,<br>
&gt;<br>
&gt; Thanks for contributing this work to Qemu! With your contribution, we =
<br>
&gt; would get yet another Allwinner SoC supported, making it three in <br>
&gt; total (A10/H3/R40). That&#39;s great.<br>
&gt; My thoughts are that maybe we should try to re-use commonality between=
 <br>
&gt; these SoCs where we can. Ofcourse, that may be difficult as the <br>
&gt; internals/peripherals of these SoCs often really are different.<br>
&gt;<br>
&gt; Your patches look good already, and I saw patches 02 and 03 are <br>
&gt; already merged too. I did a quick regression test with<br>
&gt; avocado for cubieboard/orangepi-pc with your patches applied and that =
<br>
&gt; went OK:<br>
&gt;<br>
&gt; $ ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes <br=
>
&gt; ./build/tests/venv/bin/avocado --show=3Dapp,console run -t <br>
&gt; machine:orangepi-pc -t machine:cubieboard <br>
&gt; tests/avocado/boot_linux_console.py<br>
&gt; ...<br>
&gt; PASS (22.09 s)<br>
&gt; RESULTS =C2=A0 =C2=A0: PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | I=
NTERRUPT 0 <br>
&gt; | CANCEL 0<br>
&gt; JOB TIME =C2=A0 : 169.73 s<br>
&gt;<br>
&gt; For now, I have only two suggestions for you to consider:<br>
&gt; 1) You could add a new acceptance test for the new bananapi board to <=
br>
&gt; ./tests/avocado/boot_linux_console.py.<br>
&gt; This helps in your current work to (re)test your code quickly, and <br=
>
&gt; after the code is merged it helps to keep to board working when other =
<br>
&gt; changes are done.<br>
&gt; 2) If time permits, it may be interesting to document your board for <=
br>
&gt; example in a new file at ./docs/system/arm/bananapi.rst<br>
&gt; =C2=A0=C2=A0 If you do this, it will make the board a lot more valuabl=
e for <br>
&gt; other people to use, since you can add some basic instructions on how =
<br>
&gt; to use the board with qemu there.<br>
&gt; =C2=A0=C2=A0 Additionally, it also helps yourself to store this inform=
ation <br>
&gt; somewhere, since it can be easy to forget all the specific <br>
&gt; commands/flags/arguments and links to board specific images.<br>
&gt;<br>
&gt; Once you have progressed with your patches beyond the RFC stage, I&#39=
;ll <br>
&gt; try to find some time for a more detailed review of your patches.<br>
Hi:<br>
<br>
Thanks for yours guide. avocado test case and documents will be <br>
introduced later.<br>
<br>
My work are stucked when I am writting avocado test case due to the <br>
armbian image with<br>
linux 6.1 can&#39;t boot, the kernel paniced when loading hdmi driver:<br>
<br>
[=C2=A0=C2=A0=C2=A0 0.925906] sun8i-dw-hdmi 1ee0000.hdmi: supply hvcc not f=
ound, using <br>
dummy regulator<br>
Invalid read at addr 0x1EF002C, size 4, region &#39;(null)&#39;, reason: re=
jected<br>
[=C2=A0=C2=A0=C2=A0 0.927444] 8&lt;--- cut here ---<br>
[=C2=A0=C2=A0=C2=A0 0.927780] Unhandled fault: external abort on non-linefe=
tch (0x008) <br>
at 0xe091002c<br>
[=C2=A0=C2=A0=C2=A0 0.928250] [e091002c] *pgd=3D4100a811, *pte=3D01ef0653, =
*ppte=3D01ef0453<br>
[=C2=A0=C2=A0=C2=A0 0.929441] Internal error: : 8 [#1] SMP ARM<br>
[=C2=A0=C2=A0=C2=A0 0.929925] Modules linked in:<br>
[=C2=A0=C2=A0=C2=A0 0.930332] CPU: 3 PID: 52 Comm: kworker/u8:2 Not tainted=
 <br>
6.3.0-rc3-ge8d018dd0257 #217<br>
[=C2=A0=C2=A0=C2=A0 0.931082] Hardware name: Allwinner sun8i Family<br>
[=C2=A0=C2=A0=C2=A0 0.931630] Workqueue: events_unbound deferred_probe_work=
_func<br>
[=C2=A0=C2=A0=C2=A0 0.932443] PC is at regmap_mmio_read32le+0x8/0x14<br>
[=C2=A0=C2=A0=C2=A0 0.932888] LR is at regmap_mmio_read+0x38/0x54<br>
<br>
All my work are based on linux 5.15 in the previous days, I will take <br>
many times to solve this.<br><br>
&gt;<br>
&gt; Kind regards,<br>
&gt; Niek Linnenbank<br>
&gt;<br>
&gt; On Thu, Mar 2, 2023 at 12:41=E2=80=AFPM &lt;<a href=3D"mailto:qianfang=
uijin@163.com" target=3D"_blank" rel=3D"noreferrer">qianfanguijin@163.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0From: qianfan Zhao &lt;<a href=3D"mailto:qianfangui=
jin@163.com" target=3D"_blank" rel=3D"noreferrer">qianfanguijin@163.com</a>=
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0v1: 2023-03-02<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The first three patches try fix allwinner i2c drive=
r and I already<br>
&gt;=C2=A0 =C2=A0 =C2=A0send them<br>
&gt;=C2=A0 =C2=A0 =C2=A0as a standalone PR and can read it from:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchwork.kernel.org/project/qem=
u-devel/patch/20230220081252.25348-3-qianfanguijin@163.com/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://patchwork.kernel.org/project/qemu=
-devel/patch/20230220081252.25348-3-qianfanguijin@163.com/</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hope that patch can merged first before this.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The next patches will add allwinner R40 device supp=
ort, including<br>
&gt;=C2=A0 =C2=A0 =C2=A0ccu, mmc, i2c,<br>
&gt;=C2=A0 =C2=A0 =C2=A0axp221 pmic, sdram controller, emac and gmac. Now t=
he mainline<br>
&gt;=C2=A0 =C2=A0 =C2=A0u-boot and<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel can work fine (It doesn&#39;t support bootin=
g allwinner bsp<br>
&gt;=C2=A0 =C2=A0 =C2=A0code and there<br>
&gt;=C2=A0 =C2=A0 =C2=A0are no plans to support it now).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qianfan Zhao (12):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: allwinner-i2c: Make the trace message mo=
re readable<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on =
SUN6i SoCs<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: arm: allwinner-h3: Fix and complete H3 i=
2c devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: arm: Add bananapi M2-Ultra and allwinner=
-r40 support<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/arm/allwinner-r40: add Clock Control Unit=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: allwinner-r40: Complete uart devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: arm: allwinner-r40: Add 5 TWI controller=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/misc: AXP221 PMU Emulation<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw/arm/allwinner-r40: add SDRAM controller d=
evice<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: sd: allwinner-sdhost: Add sun50i-a64 SoC=
 support<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: arm: allwinner-r40: Fix the mmc controll=
er&#39;s type<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 hw: arm: allwinner-r40: Add emac and gmac su=
pport<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0configs/devices/arm-softmmu/default.mak |=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 29 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/arm/allwinner-r40.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 555<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/arm/bananapi_m2u.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 128 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/arm/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/i2c/allwinner-i2c.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 136 +++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/i2c/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/misc/allwinner-r40-ccu.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 207 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/misc/allwinner-r40-dramc.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 499 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/misc/axp221.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 196 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0hw/sd/allwinner-sdhost.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 70 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/arm/allwinner-h3.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/arm/allwinner-r40.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 148 +++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/i2c/allwinner-i2c.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/misc/allwinner-r40-ccu.h=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 65 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/misc/allwinner-r40-dramc.h=C2=A0 =
=C2=A0| 108 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/sd/allwinner-sdhost.h=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A021 files changed, 2191 insertions(+), 14 dele=
tions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/arm/allwinner-r40.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/arm/bananapi_m2u.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/misc/allwinner-r40-ccu.=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/misc/allwinner-r40-dram=
c.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/misc/axp221.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 include/hw/arm/allwinner-r=
40.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 include/hw/misc/allwinner-=
r40-ccu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 include/hw/misc/allwinner-=
r40-dramc.h<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.25.1<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; Niek Linnenbank<br>
&gt;<br>
<br>
</blockquote></div></div></div></div>

--00000000000071bed305f751daac--

