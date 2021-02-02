Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE1C30CFE6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:34:20 +0100 (CET)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l75Bb-00044P-Nk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l75AK-0003Er-2I
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:33:00 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l75AI-000203-7T
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:32:59 -0500
Received: by mail-vs1-xe30.google.com with SMTP id x201so4449969vsc.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 15:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izo0vhy8TU19fStDNwnDbndFfgRuGLcimiC+4WsLJa4=;
 b=e+k6AMaXsUwtxyusAge8gV1dF4P9DwCj5jbqVTmUEMMmyrcnDJ2P4glWhVKhPqX9DP
 BRWU/spNWnTlPPp8Adb2gDKTr3QLoAl7n2ZvLDfcMjT/i9Pz3LIeqU7LxtLB7bcwbCIy
 0QbBaukAdEtmlT8o4puviK8MJqX90UEqbw9eli+ChK/L3N7hHxdm2aZWEw5RlFVkyF5b
 SJEuSaX1GZIlx0QC4re+WDeTGl0v2B0gIqYz+0CeBO/K7ANPnS3aJ1A674VpCaX+EoHw
 edzb+6hfV927+iw7Nlbd3j002MUFUBp+87OOBElPdTZMYKWmBUGWMfPR2j+M7SQzLS0D
 /26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izo0vhy8TU19fStDNwnDbndFfgRuGLcimiC+4WsLJa4=;
 b=sJs4K7DmVYPGBuu0k0Ai0REgbnk+drY1MWXi3JY+cN7dDC5sV+Bpjg/UsIn+fbWIDd
 n6Yd5rcHszN6vi8606Y1TGpvwd7r1DFvYR4f34NKzP4JO+iJRQ+p7+I8A+IbWyKosoig
 EsxYbsqLm9I+q721x8ORFBwJEhCgKN4QVT9CpUkgB2RbSLT/V2huVsGiDxtkyTuwxD4q
 BdKuYa2q0oznsTeFmr8E8WgqI//mN3bLgSWDL2dFaJcDktGnzvv44r0yoG/bEOZLVNnr
 d9wGnaWT2hpouNunWanEBlnwBtSylGAl7DQc6i7nbD8kOAXdUgq7AMmeBWxo/VaYYAbL
 cCBQ==
X-Gm-Message-State: AOAM532B77Rr9nhNdAsiMFIOzCJeW04JNanAGJMyDYlLzEIPwloNHcUP
 wrwHKiIqAZISWtEpirJDamvW5Q7B0/lTX4ZMnj1cGg==
X-Google-Smtp-Source: ABdhPJyXdsn1URPYYp7/UERiqZ7v58Ntdyzn+ewjQwVC5c6axLaSDZHcdS/BOCh/1tRFnwsoOX793M8nNM5y926/Qng=
X-Received: by 2002:a67:ea05:: with SMTP id g5mr122233vso.47.1612308775489;
 Tue, 02 Feb 2021 15:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20210122003226.824488-1-dje@google.com>
 <CAFEAcA-YHn=SUM5X1ziB03iOw_YMi8BidF9kCU5crYf14zq1Aw@mail.gmail.com>
In-Reply-To: <CAFEAcA-YHn=SUM5X1ziB03iOw_YMi8BidF9kCU5crYf14zq1Aw@mail.gmail.com>
Date: Tue, 2 Feb 2021 15:32:18 -0800
Message-ID: <CADPb22TRcZv3f1rG3hvvXpvaEGYp9YsCSc+hBoB=T68iHYkLCA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Add npcm7xx emc model
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5aa7f05ba62e34c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=dje@google.com; helo=mail-vs1-xe30.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

--000000000000d5aa7f05ba62e34c
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 9:11 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 22 Jan 2021 at 00:34, dje--- via <qemu-devel@nongnu.org> wrote:
> >
> > This is a 10/100 ethernet device that has several features.
> > Only the ones needed by the Linux driver have been implemented.
> > See npcm7xx_emc.c for a list of unimplemented features.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >  docs/system/arm/nuvoton.rst    |   3 +-
> >  hw/arm/npcm7xx.c               |  50 +-
> >  hw/net/meson.build             |   1 +
> >  hw/net/npcm7xx_emc.c           | 852 +++++++++++++++++++++++++++++++++
> >  hw/net/trace-events            |  17 +
> >  include/hw/arm/npcm7xx.h       |   2 +
> >  include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
> >  tests/qtest/meson.build        |   1 +
> >  tests/qtest/npcm7xx_emc-test.c | 793 ++++++++++++++++++++++++++++++
> >  9 files changed, 2002 insertions(+), 3 deletions(-)
> >  create mode 100644 hw/net/npcm7xx_emc.c
> >  create mode 100644 include/hw/net/npcm7xx_emc.h
> >  create mode 100644 tests/qtest/npcm7xx_emc-test.c
>
> Hi; could you split this into a multi-patch series so it's
> a bit more digestible to review, please ?
>  patch 1: new device
>  patch 2: add new device to the npcm7xx board
>  patch 3: device test case
>
> thanks
> -- PMM
>


Done, thx.
https://lists.nongnu.org/archive/html/qemu-devel/2021-02/msg00804.html

--000000000000d5aa7f05ba62e34c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Mon, Feb 1, 2021 at 9:11 AM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, 22 Jan 2021 at 00:34, dje--- via &lt;<a href=3D"mailt=
o:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; This is a 10/100 ethernet device that has several features.<br>
&gt; Only the ones needed by the Linux driver have been implemented.<br>
&gt; See npcm7xx_emc.c for a list of unimplemented features.<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Avi Fishman &lt;<a href=3D"mailto:avi.fishman@nuvoton.com=
" target=3D"_blank">avi.fishman@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 50 +-<br>
&gt;=C2=A0 hw/net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/net/npcm7xx_emc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8=
52 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/net/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 17 +<br>
&gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 include/hw/net/npcm7xx_emc.h=C2=A0 =C2=A0| 286 +++++++++++<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 tests/qtest/npcm7xx_emc-test.c | 793 +++++++++++++++++++++++++++=
+++<br>
&gt;=C2=A0 9 files changed, 2002 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/net/npcm7xx_emc.c<br>
&gt;=C2=A0 create mode 100644 include/hw/net/npcm7xx_emc.h<br>
&gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_emc-test.c<br>
<br>
Hi; could you split this into a multi-patch series so it&#39;s<br>
a bit more digestible to review, please ?<br>
=C2=A0patch 1: new device<br>
=C2=A0patch 2: add new device to the npcm7xx board<br>
=C2=A0patch 3: device test case<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Done, thx.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><a href=3D"https://lists.nongnu.org/archive/ht=
ml/qemu-devel/2021-02/msg00804.html">https://lists.nongnu.org/archive/html/=
qemu-devel/2021-02/msg00804.html</a></div></div></div>

--000000000000d5aa7f05ba62e34c--

