Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91725314599
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:27:42 +0100 (CET)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Hob-0004ow-MP
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9HnD-0004NJ-2B
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:26:15 -0500
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9Hn8-0000p8-Ey
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:26:14 -0500
Received: by mail-ua1-x92e.google.com with SMTP id 67so5336057uao.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 17:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tTmdnhNVbak74NKWk2JI8r8y/JXlie4HWKkp3p5mJI=;
 b=PFe2HTQTQ1YwnR3Vt9cEhS8VvsWTESWbxSM8DvATXBHS59xeOD3KbNC/JXeMFPQJcI
 mcbd1glZ/lE8aqQETHew2mkWP7fngjx1IyorIzaz2ieTDTqv/lqOlQmqDvsBEuSBfnnO
 7H6x5MQoNk9wTA1MxOZaKS18q0lxSwOZhfAOejPjcNTKWhEzdO24t/WWwMG4tqXvcXlq
 EVSrgeG7xHsTy6302uhQwdK3twhvWjfQnJj2KTcY0YpUVHEIHSTmWRt1xzDErV3Kz3q4
 DIbfWc4cAaGBBOe3ih4hiPQYahQuhjt46dVmovPvuN3kXepzDyOG98qUuLvGt4LiS3fx
 Vt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tTmdnhNVbak74NKWk2JI8r8y/JXlie4HWKkp3p5mJI=;
 b=J7SlAXddjEOtBaloTBYPB3rtRooLa/23tX2A0tc/JGNSvM9/8qXOE2We0kYUdYUaqs
 25oganqTUN01dkG5R4HQEvjuWF83qk5f2y8DYptruFKLy/yK5ajJTeDhPnFMeMD7WyKN
 mKIbJUd8DFLWnBZVgv+hvkNU/0QoX1iH51C6YghgALWeqJZUqpY/crNww/8rbQYKz0SS
 3saSdmwswsjJd4QXx6aHMTufU1CNcEdyrLMyQGf7gp/XFRxZ4rpRfhVMsXO3jGYipqv3
 hTgJ39RAhKr9wa+wU2UZnj+1b5ofH45VlHbfi9722dm8WTR7/4I5gRtLgydeGFniPogg
 AwdA==
X-Gm-Message-State: AOAM5322gVNXhWqjfXbAXGvaVvUfUU09viiKz9pxQDRH0PMH0TBkUsTN
 StbfsuU5+JGkhFYDGNNiCNioCHuM5zxMPy87QgSbbw==
X-Google-Smtp-Source: ABdhPJxfW8HfgW7P5UqqZWPX432tu/r0W0O+O7m+I+mIssV5qplUD+EOuqpN17dyjesq32OFqjAUWCtcCF75hErt8oI=
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr11829668uah.8.1612833968463; 
 Mon, 08 Feb 2021 17:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20210202232838.1641382-1-dje@google.com>
 <20210202232838.1641382-2-dje@google.com>
 <CAFEAcA_O7eNxk2hsDxj2=-zHEXP3K4fdVHs8nWqcH3ZaMMKM3g@mail.gmail.com>
In-Reply-To: <CAFEAcA_O7eNxk2hsDxj2=-zHEXP3K4fdVHs8nWqcH3ZaMMKM3g@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Mon, 8 Feb 2021 17:25:31 -0800
Message-ID: <CADPb22T69j7TahUr8OhmVv4ZQQyJxSvQ1qm1aDm_SpR2nuRr6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: Add npcm7xx emc model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000c628ff05badd2b7c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=dje@google.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--000000000000c628ff05badd2b7c
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 9:17 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 2 Feb 2021 at 23:29, Doug Evans <dje@google.com> wrote:
> >
> > This is a 10/100 ethernet device that has several features.
> > Only the ones needed by the Linux driver have been implemented.
> > See npcm7xx_emc.c for a list of unimplemented features.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >  hw/net/meson.build           |   1 +
> >  hw/net/npcm7xx_emc.c         | 852 +++++++++++++++++++++++++++++++++++
> >  hw/net/trace-events          |  17 +
> >  include/hw/net/npcm7xx_emc.h | 286 ++++++++++++
> >  4 files changed, 1156 insertions(+)
> >  create mode 100644 hw/net/npcm7xx_emc.c
> >  create mode 100644 include/hw/net/npcm7xx_emc.h
>
> > +static void emc_reset(NPCM7xxEMCState *emc)
> > +{
> > +    trace_npcm7xx_emc_reset(emc->emc_num);
> > +
> > +    memset(&emc->regs[0], 0, sizeof(emc->regs));
> > +
> > +    /* These regs have non-zero reset values. */
> > +    emc->regs[REG_TXDLSA] = 0xfffffffc;
> > +    emc->regs[REG_RXDLSA] = 0xfffffffc;
> > +    emc->regs[REG_MIIDA] = 0x00900000;
> > +    emc->regs[REG_FFTCR] = 0x0101;
> > +    emc->regs[REG_DMARFC] = 0x0800;
> > +    emc->regs[REG_MPCNT] = 0x7fff;
> > +
> > +    emc->tx_active = false;
> > +    emc->rx_active = false;
> > +
> > +    qemu_set_irq(emc->tx_irq, 0);
> > +    qemu_set_irq(emc->rx_irq, 0);
> > +}
> > +
> > +static void npcm7xx_emc_reset(DeviceState *dev)
> > +{
> > +    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
> > +    emc_reset(emc);
> > +}
>
> You can't call qemu_set_irq() from a DeviceState::reset method.
> Usually it's OK just not to try to set the outbound IRQs and
> to assume that the device you're connected to has reset to the
> state where its inbound IRQ line is not asserted. If you really
> need to set the irq line then you need to switch to 3-phase
> reset (some of the other npcm7xx devices do this). But I
> suspect that just moving the qemu_set_irq() calls to
> emc_soft_reset() would be enough.
>

Ah. Fixed in v3.

Don't put local variable declarations in the middle of functions,
> please. Coding style says they should be at the start of a
> block (so, here, the start of the function). It looks like you've
> got middle-of-function declarations in several places in other
> functions too, so could you fix them all up please?
>

Fixed in v3.
Maybe now's a good time though to revisit this rule.
QEMU uses C99, and mixed decls/statements is an easy improvement to the
coding standards.
I'm guessing this is an uncontroversial request. Is there just inertia
behind not making the change thus far?


> Optional, but you might consider using g_autofree for
> malloced_buf, which would let the compiler deal with
> g_free()ing it for you on all the function exit paths.
>

Done in v3.

Thanks.

--000000000000c628ff05badd2b7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Mon, Feb 8, 2021 at 9:17 AM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, 2 Feb 2021 at 23:29, Doug Evans &lt;<a href=3D"mailto=
:dje@google.com" target=3D"_blank">dje@google.com</a>&gt; wrote:<br>
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
&gt;=C2=A0 hw/net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/net/npcm7xx_emc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 852 ++++=
+++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/net/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17=
 +<br>
&gt;=C2=A0 include/hw/net/npcm7xx_emc.h | 286 ++++++++++++<br>
&gt;=C2=A0 4 files changed, 1156 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/net/npcm7xx_emc.c<br>
&gt;=C2=A0 create mode 100644 include/hw/net/npcm7xx_emc.h<br>
<br>
&gt; +static void emc_reset(NPCM7xxEMCState *emc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 trace_npcm7xx_emc_reset(emc-&gt;emc_num);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memset(&amp;emc-&gt;regs[0], 0, sizeof(emc-&gt;regs));<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* These regs have non-zero reset values. */<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;regs[REG_TXDLSA] =3D 0xfffffffc;<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;regs[REG_RXDLSA] =3D 0xfffffffc;<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;regs[REG_MIIDA] =3D 0x00900000;<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;regs[REG_FFTCR] =3D 0x0101;<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;regs[REG_DMARFC] =3D 0x0800;<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;regs[REG_MPCNT] =3D 0x7fff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;tx_active =3D false;<br>
&gt; +=C2=A0 =C2=A0 emc-&gt;rx_active =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(emc-&gt;tx_irq, 0);<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(emc-&gt;rx_irq, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_emc_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxEMCState *emc =3D NPCM7XX_EMC(dev);<br>
&gt; +=C2=A0 =C2=A0 emc_reset(emc);<br>
&gt; +}<br>
<br>
You can&#39;t call qemu_set_irq() from a DeviceState::reset method.<br>
Usually it&#39;s OK just not to try to set the outbound IRQs and<br>
to assume that the device you&#39;re connected to has reset to the<br>
state where its inbound IRQ line is not asserted. If you really<br>
need to set the irq line then you need to switch to 3-phase<br>
reset (some of the other npcm7xx devices do this). But I<br>
suspect that just moving the qemu_set_irq() calls to<br>
emc_soft_reset() would be enough.<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Ah. Fixed in v3.</div></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Don&#39;t put local variable declarations in the middle of functions,<br>
please. Coding style says they should be at the start of a<br>
block (so, here, the start of the function). It looks like you&#39;ve<br>
got middle-of-function declarations in several places in other<br>
functions too, so could you fix them all up please?<br></blockquote><div><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Fixed in v3.=
</div><div class=3D"gmail_default" style=3D"font-size:small">Maybe now&#39;=
s a good time though to revisit this rule.</div><div class=3D"gmail_default=
" style=3D"font-size:small">QEMU uses C99, and mixed decls/statements is an=
 easy improvement to the coding standards.</div><div class=3D"gmail_default=
" style=3D"font-size:small">I&#39;m guessing this is an uncontroversial req=
uest. Is there just inertia behind not making the change thus far?</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
Optional, but you might consider using g_autofree for<br>
malloced_buf, which would let the compiler deal with<br>
g_free()ing it for you on all the function exit paths.<br></blockquote><div=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Done in v=
3.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Thanks.</div></div></d=
iv>

--000000000000c628ff05badd2b7c--

