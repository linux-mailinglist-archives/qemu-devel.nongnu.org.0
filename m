Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F8310040
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:42:18 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7nKL-0000OF-4L
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l7nGS-0006Ev-UB
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:38:18 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l7nGQ-00009p-E1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:38:16 -0500
Received: by mail-lj1-x22d.google.com with SMTP id f19so5417106ljn.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 14:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q8SSLH5M8olERrbosyAxoDgd9ZJSYeXL6DUTpxb5NdQ=;
 b=gnQKu0aTBbwUfhHrxpITBwhTxFDK0s5YkhdP7ZMqoZcPP3dPnS2VLqSuI1Xgk6h+Bw
 T+SbO8fEUQ9EVTl8QhdWJheqkr13d/7dPRFIoil0XVoZkbdzBcvWquqC1tuk0KT0HqfL
 BtrM1SRuZ2eFqyGgCB0mq2HM+9+DCbpiolamq+HTUjcqcgWs/jgvXKWJktMrrMaN31tu
 UXEEPDM9DbMsrbrP2qF3UGjOJF42VzqbMSUZvEXjRZ0C5vrjS28BhIwtbUpmMKgtAn1M
 NuqEAMUMmG86r/5odzJDVAHaefixcA8Uwh9E+VTKyp+LMHFg7VeXAaMGw8RmV8qVkMu7
 3lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8SSLH5M8olERrbosyAxoDgd9ZJSYeXL6DUTpxb5NdQ=;
 b=f4StZJUtdNRz5H/TL32N6JdOHoWce4NLYB+wtlaIo34WU3QQEaiMHOFNLmf4Y2FxGI
 PiQlvEXu2Ta7p9yIDS4prMjUFb/lAMgdYofG5HVEV3RgPbFb0D41Te8RhRZhxqEEsfwO
 /4A3C/YEHSSUUeW+DLyLtaniuRuRag4UVd5kFYOi0U4dGILZSRBF5RN0tIUx50DpwzUI
 LSH3J8/sVNOFrGA4jd1HTtWAGxs4sJbM1yHCoNLAieYtjEcBwNf/JFP40Ht/Snd+DT3X
 q+RqkwqQzC9m/VRDGgUIRHcaAXBqDnhvyKOrZnah0aNDzLVy7EdJ/iN7yNSwtbj4ADrh
 c7AA==
X-Gm-Message-State: AOAM533qYnRrb+3EDZgPHCXCaskcdYch0BucaDd7UpzMoOZvHyx3Ps7p
 H6R9fVIIoID/mdlYrHaGE25f5tyhuKsBvbuchehV8Q==
X-Google-Smtp-Source: ABdhPJyxpnhuro4ld6TFRdimZ+vi/Zsms/dTLcb1lBSoZcALO0VIRz67FjLlcHHWS4ivA1L/0ublXSDLUHxwyyeeD6I=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr833125ljl.467.1612478290371;
 Thu, 04 Feb 2021 14:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-17-peter.maydell@linaro.org>
 <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
In-Reply-To: <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 4 Feb 2021 14:37:58 -0800
Message-ID: <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
Subject: Re: [PULL 16/21] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000b5091d05ba8a5b1c"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5091d05ba8a5b1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't see this error. It could be some error in the clock that the timer
module does not get a correct clock input.
How do you reproduce this?

On Thu, Feb 4, 2021 at 1:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Hi,
>
> On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > From: Hao Wu <wuhaotsh@google.com>
> >
> > This patch makes NPCM7XX Timer to use a the timer clock generated by th=
e
> > CLK module instead of the magic number TIMER_REF_HZ.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > Message-id: 20210108190945.949196-3-wuhaotsh@google.com
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  include/hw/misc/npcm7xx_clk.h    |  6 -----
> >  include/hw/timer/npcm7xx_timer.h |  1 +
> >  hw/arm/npcm7xx.c                 |  5 ++++
> >  hw/timer/npcm7xx_timer.c         | 39 +++++++++++++++-----------------
> >  4 files changed, 24 insertions(+), 27 deletions(-)
>
> Is that a spurious error (building with Clang)?
>
> Running test qtest-arm/npcm7xx_timer-test
> ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
> assertion failed (tim_read(td, TISR) =3D=3D tim_timer_bit(td)): (0x000000=
00
> =3D=3D 0x00000004)
> ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
> 'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
> FAIL 155 qtest-arm/npcm7xx_timer-test
> /arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt
> make: *** [Makefile.mtest:1033: run-test-127] Error 1
>

--000000000000b5091d05ba8a5b1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t see this error. It could be some error in the =
clock that the timer module does not get a correct clock input.<div>How do =
you reproduce this?</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Feb 4, 2021 at 1:39 AM Philippe Mathieu-Da=
ud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@ams=
at.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi,<br>
<br>
On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell &lt;<a href=3D"mailto:peter.m=
aydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;<br>
&gt;<br>
&gt; This patch makes NPCM7XX Timer to use a the timer clock generated by t=
he<br>
&gt; CLK module instead of the magic number TIMER_REF_HZ.<br>
&gt;<br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Message-id: <a href=3D"mailto:20210108190945.949196-3-wuhaotsh@google.=
com" target=3D"_blank">20210108190945.949196-3-wuhaotsh@google.com</a><br>
&gt; Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 |=C2=A0 6 -----<br>
&gt;=C2=A0 include/hw/timer/npcm7xx_timer.h |=C2=A0 1 +<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 ++++<br>
&gt;=C2=A0 hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 +=
++++++++++++++-----------------<br>
&gt;=C2=A0 4 files changed, 24 insertions(+), 27 deletions(-)<br>
<br>
Is that a spurious error (building with Clang)?<br>
<br>
Running test qtest-arm/npcm7xx_timer-test<br>
ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:<br>
assertion failed (tim_read(td, TISR) =3D=3D tim_timer_bit(td)): (0x00000000=
<br>
=3D=3D 0x00000004)<br>
ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:<br>
&#39;qtest_get_irq(global_qtest, tim_timer_irq(td))&#39; should be TRUE<br>
FAIL 155 qtest-arm/npcm7xx_timer-test<br>
/arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt<br>
make: *** [Makefile.mtest:1033: run-test-127] Error 1<br>
</blockquote></div>

--000000000000b5091d05ba8a5b1c--

