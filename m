Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198575B0C17
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 20:04:57 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVzPz-0003BR-Fm
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 14:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oVzKw-0008Kw-Hx
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:59:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1oVzKu-0007tp-Pp
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:59:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id k9so21726274wri.0
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Xi+1Lnu03/9r7YuQAReXXc1iOeceaaxps+zWGkhs4pQ=;
 b=g7sbbAyIvIFKUK2uzhbohk8PPVb7UVYV3d5KEYVfb8XYsFzVGJFD60GoeTkiBMEWSZ
 SbqLWKnJ8+IaZviWe9L24VOQyrd+JYWcsVcidSMoiFt3Jy401/POQIas7NLHhkRe90iC
 7qwm9PB4OAz7p38P9uZbGd+kmz0w4J44/wPEpZwP3UFgA++7c6nypnAIGXNPrndlcs5W
 kB5y2dPD/hiG12ibgpCv2zKCto5qtknJvm9XVnU88q3yhe9vImGa/yoncOSzqbX/4YQ5
 Qd0bXEtTZGhEWXBPEMVm8ZupAYxyXMaT0PeBFH7NbcYSxgpe1dNXTPNan4J1PgrRY8xe
 ffMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Xi+1Lnu03/9r7YuQAReXXc1iOeceaaxps+zWGkhs4pQ=;
 b=JBRlE4mbbW3VhGxgc4q4ux249Ag9G9Lsaa+vVCWGxOXGTSJlxTrUCkleyngrNI7Y+L
 2Y1MX873+QLQcxfOOILwxdmwSiM7sum7D3NVxlkaWkmPtBKXecDTAxfPyhWxbeQCtAiR
 ZbWPkJ5HsX63qulTw+OCVV8YUes11oB4ci9fGRwlMe93quWrq+r6xgelCH5bJeH4UDle
 Lqady8nUxRjbIqvjFo33az+sxtcTWLTH3QeaioN1V/x20AruUry+uoWlyeXM8ofmrXI0
 tI5WZ7UGisFm4q0LDXynRZiVhSHxjNDVqNGoX9bD58lApgco0cuRTgEqUtDGayZ+gyuE
 5lZw==
X-Gm-Message-State: ACgBeo2+/gJZfS7J2nuaJ85l0GJ5KB8km0KECZLEyxxhYTcePnHx6hvO
 Up2XdwhFmEil+LcM1665aZhwYuzETLyVIgA6KBU=
X-Google-Smtp-Source: AA6agR7WsKdXfPBFau3it3rJ51Wg1tdeNDmNHBrRjxh+bnwkXDD4e44Kl9wA69GKJ1y09oizERnvkYhbUjn8V5b/Orc=
X-Received: by 2002:a05:6000:144e:b0:225:7fba:3081 with SMTP id
 v14-20020a056000144e00b002257fba3081mr2867585wrx.230.1662573578812; Wed, 07
 Sep 2022 10:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
 <CAFEAcA_sBoNCvUEaTOC26Om5vZKeZvLLJS1edkPM-pbswzQvzA@mail.gmail.com>
 <YuQaN9GScQJ4ZXC+@thinkpad.localdomain>
 <20220817065014-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220817065014-mutt-send-email-mst@kernel.org>
From: Jay Khandkar <jaykhandkar2002@gmail.com>
Date: Wed, 7 Sep 2022 23:29:27 +0530
Message-ID: <CACZoLXF08QcogY5s+JzD=QW-vCv47onZC5HKJqfNewR5q-NKTg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Handle software disabling of APIC correctly
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="0000000000009401fd05e81a1364"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jaykhandkar2002@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009401fd05e81a1364
Content-Type: text/plain; charset="UTF-8"

Have sent in v2.

On Wed, Aug 17, 2022 at 4:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Fri, Jul 29, 2022 at 11:04:47PM +0530, Jay Khandkar wrote:
> > On Fri, Jul 29, 2022 at 06:09:01PM +0100, Peter Maydell wrote:
> > > On Tue, 12 Jul 2022 at 19:38, Jay Khandkar <jaykhandkar2002@gmail.com>
> wrote:
> > > >
> > > > When the local APIC is in a software disabled state, all local
> interrupt
> > > > sources must be masked and all attempts to unmask them should be
> > > > ignored. Currently, we don't do either. Fix this by handling it
> > > > correctly in apic_mem_write().
> > > >
> > > > Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
> > > > ---
> > > >  hw/intc/apic.c | 16 +++++++++++++---
> > > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> > > > index 3df11c34d6..493c70af62 100644
> > > > --- a/hw/intc/apic.c
> > > > +++ b/hw/intc/apic.c
> > > > @@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr
> addr, uint64_t val,
> > > >          s->dest_mode = val >> 28;
> > > >          break;
> > > >      case 0x0f:
> > > > -        s->spurious_vec = val & 0x1ff;
> > > > -        apic_update_irq(s);
> > > > -        break;
> > > > +        {
> > > > +            s->spurious_vec = val & 0x1ff;
> > > > +            if (!(val & APIC_SPURIO_ENABLED)) {
> > > > +                for (int i = 0; i < APIC_LVT_NB; i++) {
> > > > +                    s->lvt[i] |= APIC_LVT_MASKED;
> > > > +                }
> > > > +            }
> > > > +            apic_update_irq(s);
> > > > +            break;
> > > > +        }
> > >
> > > What are the braces for here ? There's no local variable declaration...
> > >
> > > thanks
> > > -- PMM
> > You are right, the braces are unnecessary for that part. I just put them
> in to
> > create a neat visually separate block. Can get rid of them.
> >
> > Thanks,
> > Jay
>
> Did you intend to send v2 of this?
>
> --
> MST
>
>

--0000000000009401fd05e81a1364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Have sent in v2.<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 17, 2022 at 4:20 PM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Ju=
l 29, 2022 at 11:04:47PM +0530, Jay Khandkar wrote:<br>
&gt; On Fri, Jul 29, 2022 at 06:09:01PM +0100, Peter Maydell wrote:<br>
&gt; &gt; On Tue, 12 Jul 2022 at 19:38, Jay Khandkar &lt;<a href=3D"mailto:=
jaykhandkar2002@gmail.com" target=3D"_blank">jaykhandkar2002@gmail.com</a>&=
gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; When the local APIC is in a software disabled state, all loc=
al interrupt<br>
&gt; &gt; &gt; sources must be masked and all attempts to unmask them shoul=
d be<br>
&gt; &gt; &gt; ignored. Currently, we don&#39;t do either. Fix this by hand=
ling it<br>
&gt; &gt; &gt; correctly in apic_mem_write().<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jay Khandkar &lt;<a href=3D"mailto:jaykhandka=
r2002@gmail.com" target=3D"_blank">jaykhandkar2002@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 hw/intc/apic.c | 16 +++++++++++++---<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 13 insertions(+), 3 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/hw/intc/apic.c b/hw/intc/apic.c<br>
&gt; &gt; &gt; index 3df11c34d6..493c70af62 100644<br>
&gt; &gt; &gt; --- a/hw/intc/apic.c<br>
&gt; &gt; &gt; +++ b/hw/intc/apic.c<br>
&gt; &gt; &gt; @@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque=
, hwaddr addr, uint64_t val,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dest_mode =3D val &g=
t;&gt; 28;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 case 0x0f:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;spurious_vec =3D val &amp=
; 0x1ff;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_update_irq(s);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;spurious_ve=
c =3D val &amp; 0x1ff;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(val &amp; A=
PIC_SPURIO_ENABLED)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for=
 (int i =3D 0; i &lt; APIC_LVT_NB; i++) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;lvt[i] |=3D APIC_LVT_MASKED;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_update_irq(s=
);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; What are the braces for here ? There&#39;s no local variable decl=
aration...<br>
&gt; &gt; <br>
&gt; &gt; thanks<br>
&gt; &gt; -- PMM<br>
&gt; You are right, the braces are unnecessary for that part. I just put th=
em in to<br>
&gt; create a neat visually separate block. Can get rid of them.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Jay <br>
<br>
Did you intend to send v2 of this?<br>
<br>
-- <br>
MST<br>
<br>
</blockquote></div>

--0000000000009401fd05e81a1364--

