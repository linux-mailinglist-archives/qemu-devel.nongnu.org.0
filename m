Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D6467F9C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 23:02:37 +0100 (CET)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGdY-000783-A7
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 17:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mtGbs-0005to-H2
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 17:00:52 -0500
Received: from [2607:f8b0:4864:20::1029] (port=45990
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mtGbq-0007jN-Cv
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 17:00:52 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so1414319pjq.4
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 14:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y88jSQh0iQonk+9DaDnjF+Nnpxakpvjvk/2NpFKrzNQ=;
 b=GOrRkuiyChCv0jkrj13mLfBT2owIRXeaGqBaOA3QjPWHKciLwp1vjk6Rqe6R+axF8v
 MhanqhDtpGuLxKzxSvMu7EGnGq4qd65NKoRa6sY5pgDA+10rmlBopFa7snHG+/Ml6e74
 cYCCqQG7HTDuWpQI7Cu2GVd5P5yG+o/ukdlnbOcT+TxIPYrnqNigpCe3hIWJuJviwGza
 lc2ICqPcCrkem8VhdVRhcQcbKMYy/e9sKUZGFE0Pv2lizMNPbACpNpxCywRP0hGUxAj7
 CE50HETgd+x0TFrECmNtxRx8Ml0l1+5ZIBxnhJIYQ7qUCiW35GeCIazQ7yEtU8XPInxZ
 TmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y88jSQh0iQonk+9DaDnjF+Nnpxakpvjvk/2NpFKrzNQ=;
 b=gbq1smFVLszADLCfiItga1GVKzMmu543praWkJ/RtMh4tcLSLWVF5hePwAjQGrfQJe
 Z8c8qyRBkLxqFDEt5KAmAtCaXfn7iUntrtPhffFbp1aGgyvZso0j06ZVbOfJWEAvlGtr
 yo5eZrcMup/LoNxo/yl6im7MHkpUtGMpgNyhp+Ujj5/SNLdmpgQMiGwTKuwSYvK4bmSS
 uRvSADMbSpzIPjdeGw1kZm8mOapyfS3gzLa/p0rkG6h2GZqby4HGZl1r+I6CBHTYLZ0x
 rB8eXZylAusJfifhvj24OGtmxPtO28d0X557wl/kN0ybdtJ12ckCzThdA4g7GxKQcbje
 1+Lw==
X-Gm-Message-State: AOAM530+4ELyLbBij4wrBtA6yfOg0cusSLt/2mxo2zUiR9T+WeB8wuna
 oIyP06KTwRx2d2Rt5hUPlmEX/L4DNnQ66fBcCgNgjEEvRZv0kw==
X-Google-Smtp-Source: ABdhPJzJ4p0j14vroy6BDDIUo5zNYiNPbVYbdBV6OTRJSuEThNbuP/EyB1yLlHJx2zMKcN3KD/BB21HM8Wy4bD5zbyM=
X-Received: by 2002:a1f:c9c5:: with SMTP id z188mr26670229vkf.6.1638568508990; 
 Fri, 03 Dec 2021 13:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20211203212714.1714362-1-venture@google.com>
 <288266a6-755c-308b-779a-6bf5d6e41207@amsat.org>
In-Reply-To: <288266a6-755c-308b-779a-6bf5d6e41207@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Fri, 3 Dec 2021 13:54:57 -0800
Message-ID: <CAO=notwF3+b+Ld6vNJMQkD57SvGH3noicoPhA9UPLi3fjBtQhA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc fix missing queue_flush
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 hskinnemoen@google.com, KFTING@nuvoton.com
Content-Type: multipart/alternative; boundary="000000000000eb8bb605d244f5f0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=venture@google.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000eb8bb605d244f5f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 3, 2021 at 1:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 12/3/21 22:27, Patrick Venture wrote:
> > The rx_active boolean change to true should always trigger a try_read
> > call that flushes the queue.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  hw/net/npcm7xx_emc.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> > index 7c892f820f..97522e6388 100644
> > --- a/hw/net/npcm7xx_emc.c
> > +++ b/hw/net/npcm7xx_emc.c
> > @@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc,
> const uint8_t *buf, size_t len1)
> >      return len;
> >  }
> >
> > -static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
> > -{
> > -    if (emc_can_receive(qemu_get_queue(emc->nic))) {
> > -        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
> > -    }
> > -}
>
> What about modifying as emc_flush_rx() or emc_receive_and_flush()
> helper instead?
>
>  static void emc_flush_rx(NPCM7xxEMCState *emc)
>  {
>      emc->rx_active =3D true;
>      qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>  }
>

I'm ok with that idea, although I'm less fond that it _hides_ the
rx_active=3Dtrue.  There is an emc_halt_rx that hides rx_active=3Dfalse, so=
 one
could argue it's not an issue. Looking at ftgmac100, it mostly just calls
the qemu_flush_queued_packets inline where it needs it.  So given the prior
art, I'm more inclined to leave this as a two-line pair, versus collapsing
it into a method.  Mostly because I don't anticipate this call being made
from any other places, so it's not a "growing" device.  The method
originally was emc_try_receive_next_packet, which didn't do anything more
than a no-op check and the queue_flush.  The new method would move the
rx_active setting from the call that deliberately controls it (the register
change) into a subordinate method...

Beyond all that, I think it's fine either way.  Feel free to push back and
I'll make the change.

>
> >  static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned
> size)
> >  {
> >      NPCM7xxEMCState *emc =3D opaque;
> > @@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr
> offset,
> >          }
> >          if (value & REG_MCMDR_RXON) {
> >              emc->rx_active =3D true;
> > +            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
> >          } else {
> >              emc_halt_rx(emc, 0);
> >          }
> > @@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr
> offset,
> >      case REG_RSDR:
> >          if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
> >              emc->rx_active =3D true;
> > -            emc_try_receive_next_packet(emc);
> > +            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
> >          }
> >          break;
> >      case REG_MIIDA:
> >
>
>

--000000000000eb8bb605d244f5f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 1:42 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 12/3/21 22:27, Patrick Venture wrote:<br>
&gt; The rx_active boolean change to true should always trigger a try_read<=
br>
&gt; call that flushes the queue.<br>
&gt; <br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/net/npcm7xx_emc.c | 10 ++--------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c<br>
&gt; index 7c892f820f..97522e6388 100644<br>
&gt; --- a/hw/net/npcm7xx_emc.c<br>
&gt; +++ b/hw/net/npcm7xx_emc.c<br>
&gt; @@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc, co=
nst uint8_t *buf, size_t len1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return len;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 if (emc_can_receive(qemu_get_queue(emc-&gt;nic))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(qemu_get_queue(=
emc-&gt;nic));<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -}<br>
<br>
What about modifying as emc_flush_rx() or emc_receive_and_flush()<br>
helper instead?<br>
<br>
=C2=A0static void emc_flush_rx(NPCM7xxEMCState *emc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0emc-&gt;rx_active =3D true;<br>
=C2=A0 =C2=A0 =C2=A0qemu_flush_queued_packets(qemu_get_queue(emc-&gt;nic));=
<br>
=C2=A0}<br></blockquote><div><br></div><div>I&#39;m ok with that idea, alth=
ough I&#39;m less fond that it _hides_ the rx_active=3Dtrue.=C2=A0 There is=
 an emc_halt_rx that hides rx_active=3Dfalse, so one could argue it&#39;s n=
ot an issue. Looking at ftgmac100, it mostly just calls the qemu_flush_queu=
ed_packets inline where it needs it.=C2=A0 So given the prior art, I&#39;m =
more inclined to leave this as a two-line pair, versus collapsing it into a=
 method.=C2=A0 Mostly because I don&#39;t anticipate this call being made f=
rom any other places, so it&#39;s not a &quot;growing&quot; device.=C2=A0 T=
he method originally was emc_try_receive_next_packet, which didn&#39;t do a=
nything more than a no-op check and the queue_flush.=C2=A0 The new method w=
ould move the rx_active setting from the call that deliberately controls it=
 (the register change) into a subordinate method...</div><div><br></div><di=
v>Beyond all that, I think it&#39;s fine either way.=C2=A0 Feel free to pus=
h back and I&#39;ll make the change.</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt;=C2=A0 static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, un=
signed size)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NPCM7xxEMCState *emc =3D opaque;<br>
&gt; @@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr=
 offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; REG_MCMDR_RXON) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc-&gt;rx_active =3D =
true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(q=
emu_get_queue(emc-&gt;nic));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc_halt_rx(emc, 0);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr=
 offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case REG_RSDR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (emc-&gt;regs[REG_MCMDR] &amp; RE=
G_MCMDR_RXON) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc-&gt;rx_active =3D =
true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc_try_receive_next_packet=
(emc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(q=
emu_get_queue(emc-&gt;nic));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case REG_MIIDA:<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000eb8bb605d244f5f0--

