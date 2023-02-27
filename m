Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941536A4501
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWebm-0001nB-RB; Mon, 27 Feb 2023 09:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWebg-0001a3-8S; Mon, 27 Feb 2023 09:36:00 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWebd-0006FZ-QQ; Mon, 27 Feb 2023 09:35:59 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id o6so11297458vsq.10;
 Mon, 27 Feb 2023 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uO3jXXgBDxdsdUepZ59d/E2Hs8Hb5rkEd8nQXo9DxNs=;
 b=ac8iGN14KEA3dR8Ngh2N5CECvKDrM9/Rpta2gGjKf87Ryz1MUqw5Rqlu3JYA9LpY7C
 0KIUqwvCcDoPJiJGcF+XZgt1e0VheQfPJkMcjz3JoBO7vUwRegwL/6WB5EZRB/h8oeK4
 fnMvOW2YgGWM4boQYCeX5n7OKJhsoBsfpulF3psw85hV0QhZ3Y1hB6US7IvxgO1RRieK
 nZyvbohgnT5n8Wek90U4u6W+9iEkKIJj6lmww+CQQIOHLMs+sLaPDibTrOHFVNf00hQK
 C4+bV/6xAgwEA5noHQyIzg2UcT8sQCN0PDpbwMAGgXZksSfownxE/oY0vkxU850LpmM1
 g9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uO3jXXgBDxdsdUepZ59d/E2Hs8Hb5rkEd8nQXo9DxNs=;
 b=iS7u/KwlngrIsscRy81bqzsnXVlhcQhlfYtlpWKS97imJQfcr8QG3h86FbIL92j6HT
 gx5ue9/NRaksggrZB0aviSLJ5mVk+60b5sOhFnAAupGpoUyjVjYq6IrHXrI4IBe7SEjN
 BPo/KbIHHCs+bfJ6UZRvXjlUZlyVH2UOg8TtAuGUwW0p9QHtKDlecRWyu72FRmGnfiEZ
 fNbaqqSIPVNzfY3gkzWORnV7czNuP7UQcG4hyKCLoRxybpdnHKjarIlSRlvP4bIU+k61
 HeBPafafKpmq0VRpzQKXP4/a4u9nJs5lbarO+bkUrAs9a/HJ+cRwMxXSRX2t5ea5JJDg
 CYOw==
X-Gm-Message-State: AO0yUKWm0TfRSmVEkaieiXWrHF/dILC1vvSCTuNYWoJ9Uy8lW4B6IqoW
 4rnGbna8xEc7NSs4W7puVUFVI/dmecG95is24mM=
X-Google-Smtp-Source: AK7set8E+XYdX5L8zHLNrw4AD8lprrWEwmSGPYIAyh8PVq8auR048Rpei6jraJ21YNdkkHs6s9BWQY7vmaf0ZXu/q3U=
X-Received: by 2002:a67:fb96:0:b0:411:bf89:685c with SMTP id
 n22-20020a67fb96000000b00411bf89685cmr7451256vsr.6.1677508556105; Mon, 27 Feb
 2023 06:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
In-Reply-To: <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Mon, 27 Feb 2023 15:35:42 +0100
Message-ID: <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009831f105f5af65dd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2b.google.com
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

--0000000000009831f105f5af65dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 2:45=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:

> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> > On Mon, Feb 27, 2023 at 2:00=E2=80=AFPM BALATON Zoltan <balaton@eik.bme=
.hu>
> wrote:
> >
> >> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> >>> On behalve of Zoltan BALATON:
> >>
> >> You don't have to do that and in fact please don't. I'll handle this
> >> series just reply to the one patch that needs update with only the
> changes
> >> that were asked by review.
> >>
> >> Regards,
> >> BALATON Zoltan
> >>
> >
> > Google seems to agree with me by not letting me send your patches :/
> >
> >  Sent [PATCH v4 0/7] Pegasos2 fixes and audio output support
> >  Sent [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster
> operations
> >  Sent [PATCH v4 2/7] hw/display/sm501: Add fallbacks to pixman routines
> >  Sent [PATCH v4 3/7] hw/display/sm501: Add debug property to control
> > pixman usage
> >  4.3.0 Mail server temporarily rejected message.
> > bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222 - gsmtp
> >
> > As said before I don't want to iterate on the changes of this series. I
> > can't test them and from my POV they seem unnecessary to me since all t=
he
> > test cases I can perform still work without the IRQ changes.
>
> Then why do you make me track your series and asking me to check if you
> broke anything in my patches during your rebase that I've asked you not
> to do?


Because I couldn't convince you about the PCI IRQ router changes ;) I've
asked how to proceed and got the suggestion to post an alternative series.


> The series I've submitted (both my original and the one with your
> changes) were tested and made sure it worked with AmigaOS that you say yo=
u
> can't test.
>

Unfortunately my patches had changes merged in. This now makes it hard to
show what really changed (spoiler: nothing that affects behavior).

As you probably noticed in the "resend" version of this iteration I split
off a patch introducing the priq properties. It belongs to the sub series
of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't want
to show up in `git blame` as the author of any of these changes. I
attributed it to you because this was really your change which I'm not even
sure is legal.

Let's avoid such complications by keeping our series separate.


> > Looking at the schematics I get the impression that the PCI IRQs actual=
ly
> > work the other way around: Instead of the INTx lines of the 2nd PCI bus
> > triggering both the north and the south bridge IRQ controllers, the two
> PCI
> > buses of the north bridge both trigger the VT82xx PCI IRQ router. I'm
> not a
> > hardware engineer so I could be totally off here. That's why I rather
> leave
> > my hands off of this stuff.
>
> You don't seem to leave your hands off and got involved voluntarily so no=
w
> don't run away :-)
>

I'm happy to comment on it but please don't make me change anything there
for now. Feature freeze is approaching soon after all which in turn raises
the temperature for development.


> I'm no hardware engineer either but in any case pci_set_irq cannot be use=
d
> from a PCIDevice as I explained in the other message so your approach wit=
h
> that is clearly wrong and we need gpios that something else connects to
> the PCI bus. You could only do that if the VIA chip was a north bridge
> that had a PCI bus but it doesn't. In pegasos2 the north bridge is the
> MV64361 but the PCI interrupt lines are connected to its GPP (General
> purpose or multi purpose pins in docs that are just gpio lines, which are
> programmable inputs or outputs). These can generate an interrupt in the
> MV64361 but the VT8231 also has an ability to route PCI IRQs to ISA
> interrupts which some guests use. So I think the way I've modeled it is
> correct by connecting the PCI bus interrupt pins to both of these chips
> and since they are independent models the only place you can do it cleanl=
y
> is the board code. Other boards may connect the VIA PIRQ pins differently
> but this model allows for that now. What is that you still don't like
> about it?
>

On page 13 there is a note saying "Southbridge is INT controller". Another
note says "AGP uses A as first Int for none shared operation". These notes
describe hardware, so should apply to all guests.

Furthermore, I couldn't find any remotely useful documentation for the
MV64361 chip. This turns any discussion into guesswork.

Best regards,
Bernhard

>
> Regards,
> BALATON Zoltan

--0000000000009831f105f5af65dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 27, 2023 at 2:45=E2=80=AF=
PM BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme=
.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, 27 Feb 2023, Bernhard Beschow wrote:<br>
&gt; On Mon, Feb 27, 2023 at 2:00=E2=80=AFPM BALATON Zoltan &lt;<a href=3D"=
mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wro=
te:<br>
&gt;<br>
&gt;&gt; On Mon, 27 Feb 2023, Bernhard Beschow wrote:<br>
&gt;&gt;&gt; On behalve of Zoltan BALATON:<br>
&gt;&gt;<br>
&gt;&gt; You don&#39;t have to do that and in fact please don&#39;t. I&#39;=
ll handle this<br>
&gt;&gt; series just reply to the one patch that needs update with only the=
 changes<br>
&gt;&gt; that were asked by review.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; BALATON Zoltan<br>
&gt;&gt;<br>
&gt;<br>
&gt; Google seems to agree with me by not letting me send your patches :/<b=
r>
&gt;<br>
&gt;=C2=A0 Sent [PATCH v4 0/7] Pegasos2 fixes and audio output support<br>
&gt;=C2=A0 Sent [PATCH v4 1/7] hw/display/sm501: Implement more 2D raster o=
perations<br>
&gt;=C2=A0 Sent [PATCH v4 2/7] hw/display/sm501: Add fallbacks to pixman ro=
utines<br>
&gt;=C2=A0 Sent [PATCH v4 3/7] hw/display/sm501: Add debug property to cont=
rol<br>
&gt; pixman usage<br>
&gt;=C2=A0 4.3.0 Mail server temporarily rejected message.<br>
&gt; bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222 - gsmtp<br>
&gt;<br>
&gt; As said before I don&#39;t want to iterate on the changes of this seri=
es. I<br>
&gt; can&#39;t test them and from my POV they seem unnecessary to me since =
all the<br>
&gt; test cases I can perform still work without the IRQ changes.<br>
<br>
Then why do you make me track your series and asking me to check if you <br=
>
broke anything in my patches during your rebase that I&#39;ve asked you not=
 <br>
to do?</blockquote><div><br></div><div>Because I couldn&#39;t convince you =
about the PCI IRQ router changes ;) I&#39;ve asked how to proceed and got t=
he suggestion to post an alternative series.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The series I&#39;ve submitted=
 (both my original and the one with your <br>
changes) were tested and made sure it worked with AmigaOS that you say you =
<br>
can&#39;t test.<br></blockquote><div><br></div><div>Unfortunately my patche=
s had changes merged in. This now makes it hard to show what really changed=
 (spoiler: nothing that affects behavior).</div><div><br></div>As you proba=
bly noticed in the &quot;resend&quot; version of this iteration I split off=
 a patch  introducing the priq properties. It belongs to the sub series of =
the Pegasos2 IRQ fixes which appear unnecessary to me, so I don&#39;t want =
to show up in `git blame` as the author of any of these changes. I attribut=
ed it to you because this was really your change which I&#39;m not even sur=
e is legal.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_q=
uote">Let&#39;s avoid such complications by keeping our series separate.<br=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Looking at the schematics I get the impression that the PCI IRQs actua=
lly<br>
&gt; work the other way around: Instead of the INTx lines of the 2nd PCI bu=
s<br>
&gt; triggering both the north and the south bridge IRQ controllers, the tw=
o PCI<br>
&gt; buses of the north bridge both trigger the VT82xx PCI IRQ router. I&#3=
9;m not a<br>
&gt; hardware engineer so I could be totally off here. That&#39;s why I rat=
her leave<br>
&gt; my hands off of this stuff.<br>
<br>
You don&#39;t seem to leave your hands off and got involved voluntarily so =
now <br>
don&#39;t run away :-)<br></blockquote><div><br></div><div>I&#39;m happy to=
 comment on it but please don&#39;t make me change anything there for now. =
Feature freeze is approaching soon after all which in turn raises the tempe=
rature for development.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
I&#39;m no hardware engineer either but in any case pci_set_irq cannot be u=
sed <br>
from a PCIDevice as I explained in the other message so your approach with =
<br>
that is clearly wrong and we need gpios that something else connects to <br=
>
the PCI bus. You could only do that if the VIA chip was a north bridge <br>
that had a PCI bus but it doesn&#39;t. In pegasos2 the north bridge is the =
<br>
MV64361 but the PCI interrupt lines are connected to its GPP (General <br>
purpose or multi purpose pins in docs that are just gpio lines, which are <=
br>
programmable inputs or outputs). These can generate an interrupt in the <br=
>
MV64361 but the VT8231 also has an ability to route PCI IRQs to ISA <br>
interrupts which some guests use. So I think the way I&#39;ve modeled it is=
 <br>
correct by connecting the PCI bus interrupt pins to both of these chips <br=
>
and since they are independent models the only place you can do it cleanly =
<br>
is the board code. Other boards may connect the VIA PIRQ pins differently <=
br>
but this model allows for that now. What is that you still don&#39;t like <=
br>
about it?<br></blockquote><div><br></div><div>On page 13 there is a note sa=
ying &quot;Southbridge is INT controller&quot;. Another note says &quot;AGP=
 uses A as first Int for none shared operation&quot;. These notes describe =
hardware, so should apply to all guests.</div><div><br></div><div>Furthermo=
re, I couldn&#39;t find any remotely useful documentation for the MV64361 c=
hip. This turns any discussion into guesswork.</div><div><br></div><div>Bes=
t regards,</div><div>Bernhard<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Regards,<br>
BALATON Zoltan</blockquote></div></div>

--0000000000009831f105f5af65dd--

