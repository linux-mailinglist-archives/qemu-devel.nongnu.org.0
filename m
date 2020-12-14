Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99A2D970E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:10:38 +0100 (CET)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolkT-0001GO-Iq
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1koljL-0000pI-Nu
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:09:27 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1koljJ-000756-69
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:09:27 -0500
Received: by mail-pl1-x644.google.com with SMTP id b8so2476811plx.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lKzKFCJmQoXn3WsO2vrfL1LCefAUjQtwkVVMRIZOa94=;
 b=up3hvw1OgZJG+By3thRM4h6+LwzkjLsG/rJeeQOmSvbvYVzGVJ4EYUzfSuzFlECm17
 OMIXUPEqBedRoNvprKuKkQlEBD+2k4ikmYAtCg9/AMf76jGFORkw3ggEx5P3yUBCh7/Y
 pY6JCGwRtkMjawyUlPsawe+LjnQKhRZ2TtyjkolOSuViFD74fj9GKni/RqW6zuaIDKvl
 DUMg26ErePMcIe/XDMYUggJco/9DFw/fCvwYNiKGdULZFfQBEmk/iYAMwrVY0kl/u2/V
 yOxl4wCU7B+W7fxBMMU2PAL/eZyQOmvfT6YrQLbj7h6QqIceN1zBVggWbgsKJw0+Of2O
 LpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lKzKFCJmQoXn3WsO2vrfL1LCefAUjQtwkVVMRIZOa94=;
 b=JLisA7XxVh2skqxtc0yd9AwA8XW3n0cHxYOaxwsvoGtmpgIBpwd3QhmUaYIzdATfiw
 cea2JQKEkAg+l6wPvDyOkFjK2H5SvzwaSZ9uYNU3CVtpWIb9r6xeHoVNi0BgNY8gP9cZ
 AhbxjDWR44Yi3MhHqovRacNnSQFIsHTijeXv3XZ/M64ZMtXSvIbUDgW3+VsefEVhKv8i
 q+iTU0nSJpsBHxBXUjLFzarsCS343AsCg4ItZlk3xkTaxK6f8dnUYDDU43x/z3FRYd7l
 oYAGTdemNPss+LCDGcKModKtqRX0Cc/Bzq+DMyIlywh7YWaPYGhEUv0kHaYY+hH7Y7En
 qsig==
X-Gm-Message-State: AOAM532nrMtBUGpzzZLVygD97dWjlpQOG4KdUmcdkVieNHb2URvgWoVW
 N1xnuEuHAODRtnYaD9IaY4Ar6h2O7qCR5s2fH7MKBQ==
X-Google-Smtp-Source: ABdhPJz2G1eTPmPpGemXATMiCfbH643z6uHzuDnmsZsx94dh5wBov9FowXdJW7aBq3eAk4y4iAiXrKITfTh/7qFrCw8=
X-Received: by 2002:a17:902:b282:b029:da:fd05:7766 with SMTP id
 u2-20020a170902b282b02900dafd057766mr22254194plr.52.1607944163409; Mon, 14
 Dec 2020 03:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20201203133236.222207-1-andrew@daynix.com>
 <CAKgT0UeoKDcDeMMG7KGMSKXP26txrwNuc73HKFPa57y=Vuo-kg@mail.gmail.com>
In-Reply-To: <CAKgT0UeoKDcDeMMG7KGMSKXP26txrwNuc73HKFPa57y=Vuo-kg@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 14 Dec 2020 13:42:09 +0200
Message-ID: <CABcq3pG78o4ttn8R_a-4hHVaqnx9MXg4CyA0ozS2W9trK4qJPg@mail.gmail.com>
Subject: Re: [PATCH v2] e1000e: Added ICR clearing by corresponding IMS bit.
To: Alexander Duyck <alexander.duyck@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000add4b405b66aac80"
Received-SPF: none client-ip=2607:f8b0:4864:20::644;
 envelope-from=andrew@daynix.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: intel-wired-lan <intel-wired-lan@lists.osuosl.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000add4b405b66aac80
Content-Type: text/plain; charset="UTF-8"

Hi,
The issue is in LSC clearing. So, after "link up"(during initialization),
the next LSC event is masked and can't be processed.
Technically, the event should be 'cleared' during ICR read.
On Windows guest, everything works well, mostly because of different
interrupt routines(ICR clears during register write).
So, I've added ICR clearing during read, according to the note by
section 13.3.27 of the 8257X developers manual.

On Thu, Dec 3, 2020 at 7:57 PM Alexander Duyck <alexander.duyck@gmail.com>
wrote:

> On Thu, Dec 3, 2020 at 5:00 AM Andrew Melnychenko <andrew@daynix.com>
> wrote:
> >
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441
>
> So the bugzilla seems to be reporting that the NIC operstate is being
> misreported when qemu has configured the link down. Based on the
> description it isn't clear to me how this patch addresses that. Some
> documentation on how you reproduced the issue, and what was seen
> before and after this patch would be useful.
>
> > Added ICR clearing if there is IMS bit - according to the note by
>
> Should probably be "Add" instead of "Added". Same for the title of the
> patch.
>
> > section 13.3.27 of the 8257X developers manual.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  hw/net/e1000e_core.c | 10 ++++++++++
> >  hw/net/trace-events  |  1 +
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> > index 095c01ebc6..9705f5c52e 100644
> > --- a/hw/net/e1000e_core.c
> > +++ b/hw/net/e1000e_core.c
> > @@ -2624,6 +2624,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
> >          e1000e_clear_ims_bits(core, core->mac[IAM]);
> >      }
> >
> > +    /*
> > +     * PCIe* GbE Controllers Open Source Software Developer's Manual
> > +     * 13.3.27 Interrupt Cause Read Register
> > +     */
> > +    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
> > +        (core->mac[ICR] & core->mac[IMS])) {
> > +        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR],
> core->mac[IMS]);
> > +        core->mac[ICR] = 0;
> > +    }
> > +
> >      trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
> >      e1000e_update_interrupt_state(core);
> >      return ret;
>
> Changes like this have historically been problematic. I am curious
> what testing had been done on this and with what drivers? Keep in mind
> that we have to support several flavors of BSD, Windows, and Linux
> with this.
>
> > diff --git a/hw/net/trace-events b/hw/net/trace-events
> > index 5db45456d9..2c3521a19c 100644
> > --- a/hw/net/trace-events
> > +++ b/hw/net/trace-events
> > @@ -237,6 +237,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting
> ICR read. Current ICR: 0x%x"
> >  e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR:
> 0x%x"
> >  e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero
> IMS"
> >  e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
> > +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing
> ICR on read due corresponding IMS bit: 0x%x & 0x%x"
> >  e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS
> due to EIAME, IAM: 0x%X, cause: 0x%X"
> >  e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR
> bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
> >  e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to
> IMC write 0x%x"
> > --
> > 2.29.2
> >
>

--000000000000add4b405b66aac80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>The issue is in LSC clearing. So, after=
 &quot;link up&quot;(during initialization), the next LSC event is masked a=
nd can&#39;t be processed.</div><div>Technically, the event should be &#39;=
cleared&#39; during ICR read.</div><div>On Windows guest, everything works =
well, mostly because of different interrupt routines(ICR clears during regi=
ster write).</div><div>So, I&#39;ve added ICR clearing during read, accordi=
ng to the note by<br></div><div>
section 13.3.27 of the 8257X developers manual.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 =
at 7:57 PM Alexander Duyck &lt;<a href=3D"mailto:alexander.duyck@gmail.com"=
>alexander.duyck@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Dec 3, 2020 at 5:00 AM Andrew Melnychenko=
 &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_blank">andrew@daynix.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Buglink: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1707=
441" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_=
bug.cgi?id=3D1707441</a><br>
<br>
So the bugzilla seems to be reporting that the NIC operstate is being<br>
misreported when qemu has configured the link down. Based on the<br>
description it isn&#39;t clear to me how this patch addresses that. Some<br=
>
documentation on how you reproduced the issue, and what was seen<br>
before and after this patch would be useful.<br>
<br>
&gt; Added ICR clearing if there is IMS bit - according to the note by<br>
<br>
Should probably be &quot;Add&quot; instead of &quot;Added&quot;. Same for t=
he title of the patch.<br>
<br>
&gt; section 13.3.27 of the 8257X developers manual.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/net/e1000e_core.c | 10 ++++++++++<br>
&gt;=C2=A0 hw/net/trace-events=C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 11 insertions(+)<br>
&gt;<br>
&gt; diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c<br>
&gt; index 095c01ebc6..9705f5c52e 100644<br>
&gt; --- a/hw/net/e1000e_core.c<br>
&gt; +++ b/hw/net/e1000e_core.c<br>
&gt; @@ -2624,6 +2624,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e1000e_clear_ims_bits(core, core-&gt=
;mac[IAM]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* PCIe* GbE Controllers Open Source Software Deve=
loper&#39;s Manual<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* 13.3.27 Interrupt Cause Read Register<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((core-&gt;mac[ICR] &amp; E1000_ICR_ASSERTED) &amp;&=
amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (core-&gt;mac[ICR] &amp; core-&gt;mac[IMS=
])) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_e1000e_irq_icr_clear_icr_bit_ims(co=
re-&gt;mac[ICR], core-&gt;mac[IMS]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 core-&gt;mac[ICR] =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 trace_e1000e_irq_icr_read_exit(core-&gt;mac[ICR]);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 e1000e_update_interrupt_state(core);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
Changes like this have historically been problematic. I am curious<br>
what testing had been done on this and with what drivers? Keep in mind<br>
that we have to support several flavors of BSD, Windows, and Linux<br>
with this.<br>
<br>
&gt; diff --git a/hw/net/trace-events b/hw/net/trace-events<br>
&gt; index 5db45456d9..2c3521a19c 100644<br>
&gt; --- a/hw/net/trace-events<br>
&gt; +++ b/hw/net/trace-events<br>
&gt; @@ -237,6 +237,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) &quot;Star=
ting ICR read. Current ICR: 0x%x&quot;<br>
&gt;=C2=A0 e1000e_irq_icr_read_exit(uint32_t icr) &quot;Ending ICR read. Cu=
rrent ICR: 0x%x&quot;<br>
&gt;=C2=A0 e1000e_irq_icr_clear_zero_ims(void) &quot;Clearing ICR on read d=
ue to zero IMS&quot;<br>
&gt;=C2=A0 e1000e_irq_icr_clear_iame(void) &quot;Clearing ICR on read due t=
o IAME&quot;<br>
&gt; +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) &quot;Cl=
earing ICR on read due corresponding IMS bit: 0x%x &amp; 0x%x&quot;<br>
&gt;=C2=A0 e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) &quot;C=
learing IMS due to EIAME, IAM: 0x%X, cause: 0x%X&quot;<br>
&gt;=C2=A0 e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) &quot;Cle=
aring ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X&quot;<br>
&gt;=C2=A0 e1000e_irq_ims_clear_set_imc(uint32_t val) &quot;Clearing IMS bi=
ts due to IMC write 0x%x&quot;<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
</blockquote></div>

--000000000000add4b405b66aac80--

