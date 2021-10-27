Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BFA43C831
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:58:59 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfge2-00049I-Hi
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mfgcg-0003U4-D9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:57:34 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mfgce-0004gU-7y
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:57:34 -0400
Received: by mail-oi1-x22b.google.com with SMTP id g125so2859000oif.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=t2L1AhUs/2jYVAoROeVmvZVNSh7lmftozNlNc+1ioT0=;
 b=VkmbZAU+RWeq+s75uxJMSzL8A+DCztOEoSDqXYMWH4s8m3qX8fAlTsA8/XJNFkKPR0
 2Ki7AmaAMa2sISwVY2C5K91HI1Sb4Wl1GSqyG9JM+GxQUPbOYKmcciMEGrtuUgoDKQNi
 i+7XIMABkwi0gSJQtYL1uyH5Hbtc2iLBG+wE1EoNs4A+A0v2y3V8eoeZeBtJIJ0rx0Os
 PI11wPIxvmTlZ9caFmYJdXFjhKCYmzsY3ryiFggh9u667ta+he4lw6wjIvngdlhPf7bJ
 mZrf6sjL47d5Ecqigh0aCf+B0nbENQ1nh10Z93v5JF4whBfMpllZXEgrX9FGczlqXDq0
 ybXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=t2L1AhUs/2jYVAoROeVmvZVNSh7lmftozNlNc+1ioT0=;
 b=bjx+PSLi4tsGt+9+v+Alcw0uCkOahAuiwo5w1klqhdSzx4Mrvarjs66Upw8azjiE/N
 QnOepYfTLb+hLGNhkj77KxYysdo+osmRpQUEiwLL62O+Kp3Lpt8hWh7mQjPESL2pjDAa
 e+WLUc7oHOAaFpjqpPc33GrpFF71HH6oe+DHPSN9JGcHBKOqDt02dRzkVIFD1m2/xlax
 Lg8quod0JPeYpk3XUUuorgrDxoPmd2LBBWYE61GZk/tL8ci4MC3vCoKLARK9CPngl77H
 uF9N2GMMdlutHsgktEywZK2BaoL1BEcI4a0obJnRG3rYqVqsCP6U6xLjmndCdLAL65CW
 zD+Q==
X-Gm-Message-State: AOAM533rchcrZ4lgxiGP//gbjTN6yewIefEmKy/NLYmL0u0QFAXNfAvh
 vloQn8gsmOMtlwubJEzH5/A6etkV8WkOTq3Sdhwwj6yZv+8WqA==
X-Google-Smtp-Source: ABdhPJwVpPechg0mQZYSI+4BJz3wIz90aUcOSrx+UpPgK5Y6ACtYL9IFF3GSPj7hwmEc7pufA87AqvCg5Lsy6ZaBchk=
X-Received: by 2002:a05:6808:171c:: with SMTP id
 bc28mr3077387oib.18.1635332250216; 
 Wed, 27 Oct 2021 03:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210818180951.132044-1-andrew@daynix.com>
 <CABcq3pHWydBROkHHngqO6n8D3ELdbv0eEuGynBpdfHi7tqHxcA@mail.gmail.com>
 <CACGkMEv5=gd07Qtf8N0bY66d4ZtLNytzei=yHfC_=D_X_43oyQ@mail.gmail.com>
 <CABcq3pHekALcR_vh9nayoyxANBh87Q53vs89eAj9unZQUXBnDA@mail.gmail.com>
 <CACGkMEtCd1A4tTnj_LNHX0zY3ADdopM2AvFchuj15=1v8sKKzg@mail.gmail.com>
In-Reply-To: <CACGkMEtCd1A4tTnj_LNHX0zY3ADdopM2AvFchuj15=1v8sKKzg@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 27 Oct 2021 13:57:19 +0300
Message-ID: <CABcq3pHPcV2YH7KTZ4k-Xz4Do9HmMUw7jgycgbQawosvYwy6JQ@mail.gmail.com>
Subject: Re: [PATCH] e1000e: Added ICR clearing by corresponding IMS bit.
To: Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, qemu-devel@nongnu.org, 
 Alexander Duyck <alexander.duyck@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dd3f7c05cf537576"
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x22b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dd3f7c05cf537576
Content-Type: text/plain; charset="UTF-8"

Hi,
Let's make things clear.
At first, I've decided to fix the issue in the linux e1000e driver.
(
https://lists.osuosl.org/pipermail/intel-wired-lan/Week-of-Mon-20200413/019497.html
)
Original driver developers suggest to fix the issue on qemu and assures
that driver works correctly on real hw.
I've added fix according to the note 13.3.28 of the 8257X manual
(
https://www.intel.com/content/dam/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manual.pdf
)
I've reference to 8257X spec which is an apparently a bit different to
82574l-gbe-controller-datasheet.pdf


On Thu, Oct 21, 2021 at 5:16 AM Jason Wang <jasowang@redhat.com> wrote:

> Hi Andrew:
>
> On Thu, Oct 21, 2021 at 6:27 AM Andrew Melnichenko <andrew@daynix.com>
> wrote:
> >
> > Hi,
> > I've used this manual(
> https://www.intel.com/content/dam/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manual.pdf
> )
> > It was provided by Intel when I've tried to research that bug.
> > Although it's a bit newer manual - the article is 13.3.28.
>
> Note that it's not the model that e1000e tries to implement (82574L).
> The device ID in qemu is 0x10D3 which is not listed in the above link
> "4.7.7 Mandatory PCI Configuration Registers".
>
> Thanks
>
> >
> >
> > On Tue, Oct 19, 2021 at 10:56 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On Thu, Oct 14, 2021 at 4:34 PM Andrew Melnichenko <andrew@daynix.com>
> wrote:
> >> >
> >> > Ping
> >> >
> >> > On Wed, Aug 18, 2021 at 9:10 PM Andrew Melnychenko <andrew@daynix.com>
> wrote:
> >> >>
> >> >> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441
> >> >>
> >> >> The issue is in LSC clearing. So, after "link up"(during
> initialization),
> >> >> the next LSC event is masked and can't be processed.
> >> >> Technically, the event should be 'cleared' during ICR read.
> >> >> On Windows guest, everything works well, mostly because of
> >> >> different interrupt routines(ICR clears during register write).
> >> >> So, added ICR clearing during reading, according to the note by
> >> >> section 13.3.27 of the 8257X developers manual.
> >> >>
> >> >> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> >> >> ---
> >> >>  hw/net/e1000e_core.c | 10 ++++++++++
> >> >>  hw/net/trace-events  |  1 +
> >> >>  2 files changed, 11 insertions(+)
> >> >>
> >> >> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> >> >> index b75f2ab8fc..288897a975 100644
> >> >> --- a/hw/net/e1000e_core.c
> >> >> +++ b/hw/net/e1000e_core.c
> >> >> @@ -2617,6 +2617,16 @@ e1000e_mac_icr_read(E1000ECore *core, int
> index)
> >> >>          e1000e_clear_ims_bits(core, core->mac[IAM]);
> >> >>      }
> >> >>
> >> >> +    /*
> >> >> +     * PCIe* GbE Controllers Open Source Software Developer's Manual
> >> >> +     * 13.3.27 Interrupt Cause Read Register
> >>
> >> Per link in the beginning of this file it should be 82574l I guess?
> >>
> >> If yes, I'm using revision 3.4 and it's 13.3.27 is not about ICR.
> >>
> >> What it said are:
> >>
> >> "
> >> In MSI-X mode the bits in this register can be configured to
> >> auto-clear when the MSI-X interrupt message is sent, in order to
> >> minimize driver overhead, and when using MSI-X interrupt signaling. In
> >> systems that do not support MSI-X, reading the ICR register clears
> >> it's bits or writing 1b's clears the corresponding bits in this
> >> register.
> >> "
> >>
> >>
> >> >> +     */
> >> >> +    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
> >> >> +        (core->mac[ICR] & core->mac[IMS])) {
> >> >> +        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR],
> core->mac[IMS]);
> >> >> +        core->mac[ICR] = 0;
> >> >> +    }
> >>
> >> Thanks
> >>
> >> >> +
> >> >>      trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
> >> >>      e1000e_update_interrupt_state(core);
> >> >>      return ret;
> >> >> diff --git a/hw/net/trace-events b/hw/net/trace-events
> >> >> index c28b91ee1a..15fd09aa1c 100644
> >> >> --- a/hw/net/trace-events
> >> >> +++ b/hw/net/trace-events
> >> >> @@ -225,6 +225,7 @@ e1000e_irq_icr_read_entry(uint32_t icr)
> "Starting ICR read. Current ICR: 0x%x"
> >> >>  e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current
> ICR: 0x%x"
> >> >>  e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to
> zero IMS"
> >> >>  e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
> >> >> +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims)
> "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
> >> >>  e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing
> IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
> >> >>  e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing
> ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
> >> >>  e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due
> to IMC write 0x%x"
> >> >> --
> >> >> 2.31.1
> >> >>
> >>
>
>

--000000000000dd3f7c05cf537576
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>Let&#39;s make things clear.</div><div>=
At first, I&#39;ve decided to fix the issue in the linux e1000e driver.</di=
v><div>(<a href=3D"https://lists.osuosl.org/pipermail/intel-wired-lan/Week-=
of-Mon-20200413/019497.html">https://lists.osuosl.org/pipermail/intel-wired=
-lan/Week-of-Mon-20200413/019497.html</a>)</div><div>Original driver develo=
pers suggest to fix the issue on qemu and assures that driver works correct=
ly on real hw.</div><div>I&#39;ve added fix according to the note 13.3.28 o=
f the 8257X manual</div><div> (<a href=3D"https://www.intel.com/content/dam=
/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manual=
.pdf">https://www.intel.com/content/dam/www/public/us/en/documents/manuals/=
pcie-gbe-controllers-open-source-manual.pdf</a>)</div><div>I&#39;ve referen=
ce to 8257X spec which is an apparently a bit different to 82574l-gbe-contr=
oller-datasheet.pdf</div><div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 21, 2021 at 5:16 AM Jas=
on Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi An=
drew:<br>
<br>
On Thu, Oct 21, 2021 at 6:27 AM Andrew Melnichenko &lt;<a href=3D"mailto:an=
drew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt; I&#39;ve used this manual(<a href=3D"https://www.intel.com/content/dam=
/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manual=
.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.intel.com/content/da=
m/www/public/us/en/documents/manuals/pcie-gbe-controllers-open-source-manua=
l.pdf</a>)<br>
&gt; It was provided by Intel when I&#39;ve tried to research that bug.<br>
&gt; Although it&#39;s a bit newer manual - the article is 13.3.28.<br>
<br>
Note that it&#39;s not the model that e1000e tries to implement (82574L).<b=
r>
The device ID in qemu is 0x10D3 which is not listed in the above link<br>
&quot;4.7.7 Mandatory PCI Configuration Registers&quot;.<br>
<br>
Thanks<br>
<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 19, 2021 at 10:56 AM Jason Wang &lt;<a href=3D"mailto:jaso=
wang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Oct 14, 2021 at 4:34 PM Andrew Melnichenko &lt;<a href=3D"=
mailto:andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt; wrote=
:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ping<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Aug 18, 2021 at 9:10 PM Andrew Melnychenko &lt;<a hre=
f=3D"mailto:andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt; =
wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Buglink: <a href=3D"https://bugzilla.redhat.com/show_bug.=
cgi?id=3D1707441" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.red=
hat.com/show_bug.cgi?id=3D1707441</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The issue is in LSC clearing. So, after &quot;link up&quo=
t;(during initialization),<br>
&gt;&gt; &gt;&gt; the next LSC event is masked and can&#39;t be processed.<=
br>
&gt;&gt; &gt;&gt; Technically, the event should be &#39;cleared&#39; during=
 ICR read.<br>
&gt;&gt; &gt;&gt; On Windows guest, everything works well, mostly because o=
f<br>
&gt;&gt; &gt;&gt; different interrupt routines(ICR clears during register w=
rite).<br>
&gt;&gt; &gt;&gt; So, added ICR clearing during reading, according to the n=
ote by<br>
&gt;&gt; &gt;&gt; section 13.3.27 of the 8257X developers manual.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:a=
ndrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 hw/net/e1000e_core.c | 10 ++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 hw/net/trace-events=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 2 files changed, 11 insertions(+)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c<=
br>
&gt;&gt; &gt;&gt; index b75f2ab8fc..288897a975 100644<br>
&gt;&gt; &gt;&gt; --- a/hw/net/e1000e_core.c<br>
&gt;&gt; &gt;&gt; +++ b/hw/net/e1000e_core.c<br>
&gt;&gt; &gt;&gt; @@ -2617,6 +2617,16 @@ e1000e_mac_icr_read(E1000ECore *co=
re, int index)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e1000e_clear_ims_bits(c=
ore, core-&gt;mac[IAM]);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* PCIe* GbE Controllers Open Source =
Software Developer&#39;s Manual<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* 13.3.27 Interrupt Cause Read Regis=
ter<br>
&gt;&gt;<br>
&gt;&gt; Per link in the beginning of this file it should be 82574l I guess=
?<br>
&gt;&gt;<br>
&gt;&gt; If yes, I&#39;m using revision 3.4 and it&#39;s 13.3.27 is not abo=
ut ICR.<br>
&gt;&gt;<br>
&gt;&gt; What it said are:<br>
&gt;&gt;<br>
&gt;&gt; &quot;<br>
&gt;&gt; In MSI-X mode the bits in this register can be configured to<br>
&gt;&gt; auto-clear when the MSI-X interrupt message is sent, in order to<b=
r>
&gt;&gt; minimize driver overhead, and when using MSI-X interrupt signaling=
. In<br>
&gt;&gt; systems that do not support MSI-X, reading the ICR register clears=
<br>
&gt;&gt; it&#39;s bits or writing 1b&#39;s clears the corresponding bits in=
 this<br>
&gt;&gt; register.<br>
&gt;&gt; &quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((core-&gt;mac[ICR] &amp; E1000_ICR_ASS=
ERTED) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (core-&gt;mac[ICR] &amp; cor=
e-&gt;mac[IMS])) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_e1000e_irq_icr_clear_i=
cr_bit_ims(core-&gt;mac[ICR], core-&gt;mac[IMS]);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 core-&gt;mac[ICR] =3D 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 trace_e1000e_irq_icr_read_exit(core-&=
gt;mac[ICR]);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 e1000e_update_interrupt_state(core);<=
br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt;&gt; diff --git a/hw/net/trace-events b/hw/net/trace-events<br=
>
&gt;&gt; &gt;&gt; index c28b91ee1a..15fd09aa1c 100644<br>
&gt;&gt; &gt;&gt; --- a/hw/net/trace-events<br>
&gt;&gt; &gt;&gt; +++ b/hw/net/trace-events<br>
&gt;&gt; &gt;&gt; @@ -225,6 +225,7 @@ e1000e_irq_icr_read_entry(uint32_t ic=
r) &quot;Starting ICR read. Current ICR: 0x%x&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 e1000e_irq_icr_read_exit(uint32_t icr) &quot;Ending=
 ICR read. Current ICR: 0x%x&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 e1000e_irq_icr_clear_zero_ims(void) &quot;Clearing =
ICR on read due to zero IMS&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 e1000e_irq_icr_clear_iame(void) &quot;Clearing ICR =
on read due to IAME&quot;<br>
&gt;&gt; &gt;&gt; +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t =
ims) &quot;Clearing ICR on read due corresponding IMS bit: 0x%x &amp; 0x%x&=
quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t c=
ause) &quot;Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t ei=
ac) &quot;Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 e1000e_irq_ims_clear_set_imc(uint32_t val) &quot;Cl=
earing IMS bits due to IMC write 0x%x&quot;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.31.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div>

--000000000000dd3f7c05cf537576--

