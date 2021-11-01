Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BAF442073
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:03:44 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcat-0003DZ-2O
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhbSp-0005QP-9e
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:51:19 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:37702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhbSl-0008Oa-MX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:51:18 -0400
Received: by mail-lj1-x231.google.com with SMTP id y8so2073359ljm.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ayFxAI2Y7O/Ah3lQXNO3jDIkqAePCcMti4ENMHaQ/tQ=;
 b=APVdPfAaJ6WLkbAinQtYq5SFS0bcedGyBFure6RFyqWjK06X4ZMBUhiqccdCOguOeT
 dxjxzf2kecB9EfDfpoJxjxxk4yavNSdbZvgF92lLWBHaqdRdG929h7LbLIyDM7pfLt1j
 YsaFfzKQdXAA7HwoQvtEkSpZKefUHnLGskSaJmPkzhnDQ+OWwjsJGyU9ptbu/6caZtTN
 0zLw32r5L6yBWpDeNbi5lBsF+cnprbTkft+63sG5ukUcesxEhnijcaqqrE5uwS/HP2wG
 fInpaZoNQAQN7PethCYsIj/nOfggx0DkHXWLToVwPbJ4yunuDmmjDVg2do9AEglNpZo5
 TeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ayFxAI2Y7O/Ah3lQXNO3jDIkqAePCcMti4ENMHaQ/tQ=;
 b=7OUsqEwGDen9QHiNotQ9pnIP5ympuO+f0WljW17P5kwdsrtpsI7QXxv4xKPQQHTyGP
 29JzyrGisBH8LJvLKFpG4MWCboeMON1VxBHa6xiY3dI7CVaRkvwtW7cOPP4a/wQ5GfHl
 kq77bXxvXBWQH/mnlE7QVXrJF6iJk6aIZMDui1YaDxWUyxBKvCMCRPmmDcYXpSkzRzom
 cp1aXY2b8zZ88ho+NAuVJSbVPSOYrVWjL/l6CiyCwzLlBLOOe9xQcL7m99nsfWRIVdJZ
 rbk40uUDDIq9fujF63Mj3SmD1bFcOp/0x+HcQP4+tgNJ2ADSkAWjaYhsa9Kkl7eBkws/
 LQ9g==
X-Gm-Message-State: AOAM533IcPZ/MkDHmByt+OaIWWIy6Ce8jP6wuePLYPVMgFtEp+alRHbJ
 WVld96/ECC3uc6uDZpTqRTEZm3JEvUCnM50nf/ir+A==
X-Google-Smtp-Source: ABdhPJzPvLRfeOIUxTqlbVo2ElwEMgzIDLeXn0BEhe9cl+Pa303cuEjssniEJDhjfrNBxHmu1tMj865ZIEWoac/vUv4=
X-Received: by 2002:a05:651c:1181:: with SMTP id
 w1mr32406638ljo.424.1635789073801; 
 Mon, 01 Nov 2021 10:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
In-Reply-To: <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 1 Nov 2021 10:50:52 -0700
Message-ID: <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Avi.Fishman@nuvoton.com, KFTING@nuvoton.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: multipart/alternative; boundary="000000000000ac3fdb05cfbdd271"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac3fdb05cfbdd271
Content-Type: text/plain; charset="UTF-8"

Is this reply to a wrong thread? I thought it was applied a long time ago.

Thanks,

On Mon, Nov 1, 2021 at 10:33 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On Thu, 11 Mar 2021 at 13:11, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > This patch set implements the Tachometer (a.k.a Multi Functional
> Timer/MFT)
> > device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
> > the RPM of PWM fans.
> >
> > To provide the RPM of a certain fan, since RPM = MAX_RPM *
> duty_percentage.
> > We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
> > into the MFT module.
> >
> > The connection of PWM modules and fan modules are derived from their
> specific
> > Linux device trees and coded in hw/arm/npcm7xx_boards.c.
> >
> > We amend the QTest for the PWM module to include verifying the reading
> from
> > the Tachometer is correct.
> >
> > Changes since v1:
> > - Split implementation of device and addition to board file to separate
> patches
> > - Adapt to new Clock API and address conflicts
> > - Use the new clock_ns_to_ticks API to calculate tachometer counts
> >
> > Hao Wu (5):
> >   hw/misc: Add GPIOs for duty in NPCM7xx PWM
> >   hw/misc: Add NPCM7XX MFT Module
> >   hw/arm: Add MFT device to NPCM7xx Soc
> >   hw/arm: Connect PWM fans in NPCM7XX boards
> >   tests/qtest: Test PWM fan RPM using MFT in PWM test
> >
> >  docs/system/arm/nuvoton.rst    |   2 +-
> >  hw/arm/npcm7xx.c               |  45 ++-
> >  hw/arm/npcm7xx_boards.c        |  99 ++++++
> >  hw/misc/meson.build            |   1 +
> >  hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
> >  hw/misc/npcm7xx_pwm.c          |   4 +
> >  hw/misc/trace-events           |   8 +
> >  include/hw/arm/npcm7xx.h       |  13 +-
> >  include/hw/misc/npcm7xx_mft.h  |  70 +++++
> >  include/hw/misc/npcm7xx_pwm.h  |   4 +-
> >  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
> >  11 files changed, 974 insertions(+), 17 deletions(-)
> >  create mode 100644 hw/misc/npcm7xx_mft.c
> >  create mode 100644 include/hw/misc/npcm7xx_mft.h
>
> Thanks, queued to target-arm.next.
>
> r~
>

--000000000000ac3fdb05cfbdd271
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Is this reply to a wrong thread? I though=
t it was applied a long time ago.<div><br></div><div>Thanks,</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, N=
ov 1, 2021 at 10:33 AM Richard Henderson &lt;<a href=3D"mailto:richard.hend=
erson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 11 Mar 2021 at 13:11,=
 Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaot=
sh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch set implements the Tachometer (a.k.a Multi Functional Timer=
/MFT)<br>
&gt; device in NPCM7XX SoC. This device is used by NPCM7XX boards to measur=
e<br>
&gt; the RPM of PWM fans.<br>
&gt;<br>
&gt; To provide the RPM of a certain fan, since RPM =3D MAX_RPM * duty_perc=
entage.<br>
&gt; We convert the duty output in NPCM7XX PWM module into GPIOs and feed t=
hem<br>
&gt; into the MFT module.<br>
&gt;<br>
&gt; The connection of PWM modules and fan modules are derived from their s=
pecific<br>
&gt; Linux device trees and coded in hw/arm/npcm7xx_boards.c.<br>
&gt;<br>
&gt; We amend the QTest for the PWM module to include verifying the reading=
 from<br>
&gt; the Tachometer is correct.<br>
&gt;<br>
&gt; Changes since v1:<br>
&gt; - Split implementation of device and addition to board file to separat=
e patches<br>
&gt; - Adapt to new Clock API and address conflicts<br>
&gt; - Use the new clock_ns_to_ticks API to calculate tachometer counts<br>
&gt;<br>
&gt; Hao Wu (5):<br>
&gt;=C2=A0 =C2=A0hw/misc: Add GPIOs for duty in NPCM7xx PWM<br>
&gt;=C2=A0 =C2=A0hw/misc: Add NPCM7XX MFT Module<br>
&gt;=C2=A0 =C2=A0hw/arm: Add MFT device to NPCM7xx Soc<br>
&gt;=C2=A0 =C2=A0hw/arm: Connect PWM fans in NPCM7XX boards<br>
&gt;=C2=A0 =C2=A0tests/qtest: Test PWM fan RPM using MFT in PWM test<br>
&gt;<br>
&gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 45 ++-<br>
&gt;=C2=A0 hw/arm/npcm7xx_boards.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 99 ++=
++++<br>
&gt;=C2=A0 hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/misc/npcm7xx_mft.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 540 ++=
+++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
&gt;=C2=A0 hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-=
<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_mft.h=C2=A0 |=C2=A0 70 +++++<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_pwm.h=C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-<br>
&gt;=C2=A0 11 files changed, 974 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/misc/npcm7xx_mft.c<br>
&gt;=C2=A0 create mode 100644 include/hw/misc/npcm7xx_mft.h<br>
<br>
Thanks, queued to target-arm.next.<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000ac3fdb05cfbdd271--

