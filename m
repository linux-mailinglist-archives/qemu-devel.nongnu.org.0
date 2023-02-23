Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1216A113C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:29:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVICf-0002bI-7H; Thu, 23 Feb 2023 15:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVICc-0002aT-Hp; Thu, 23 Feb 2023 15:28:30 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVICZ-0003hN-6B; Thu, 23 Feb 2023 15:28:30 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id d20so10089632vsf.11;
 Thu, 23 Feb 2023 12:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GXy9abQoNTSDsoF+2RyqNVFrjeZBZFHl4hvN12+Td30=;
 b=O7TL6GZ7GINWpO7deI8WSP0f4y4ecuP280SMFezh+Mo1vSLlttRTq0yiXqJXaNYsdN
 b8JPkn5FqQOrqHEf+XgcfvjmYQWPBWrkOQZrXXF2g3gmYAdsbVNElieVLQd0t16Vlz0z
 LDskY4aCGbk7I9aIYUH+Rij9uaWzshZVCWi7a/UDwXirkeTyemKwhYi+O+fFaOM5/rXc
 HOsXHOl7WckIEssNyb8zaTWvk7gg9kUeRLpF9EEPpmJtDXTpG4UoOATuWzpXMnBDBELC
 Mw3q+mU+Tm4DbSAaQ0jTH75iWoIXazp5RI0rtZr5bkBDWhTZL+2o0RDBx+iR+qaiIQZ9
 ybMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GXy9abQoNTSDsoF+2RyqNVFrjeZBZFHl4hvN12+Td30=;
 b=puFqpR+3OZwqIl+q/d1zBIO+1o0nR5/NOXjwd8dDE0l32eYnYOJVBiTt8mPFshQxDl
 AMFMlkaXZx2buYJhdC7e1F6OMoS7rXqoHg26S0WKCRZBnKnPa1FDfPzCcPngCaEif71P
 0VIIRoEeeFREWnW4R3KLdPhH8xJEfDkm8QYKy7Ik9jH3PyVSTqn8LXsJlGDFjMUcxDfM
 CEnckSmYBqGVDeZ5yQBDS698xQOxUUxzaJ96jnzko8X51tzMHEUEerg6yvEiYa7qhndt
 s7PD25yLQXfpsp7HGGySNpPXyTY4BkqpLQXQN+04gubzvxivPehaIW4n8TZ544gDIPYF
 gNBw==
X-Gm-Message-State: AO0yUKVq8qXF9ZD1A/Onot4/vUTXp/uD7axT8ImbcEk5bA0g8qxhdiGY
 kNFDmQaXU7ha8XIA9UjGL9Kef+xnugElPKUNXv0=
X-Google-Smtp-Source: AK7set8YA8Sb6LO2MrW0hjq3V8PN95jwwU0WWCrodW+z68qsVuPkkxTqzcyazzclDGgI+eQDO+DBECM2BYfABsB/66w=
X-Received: by 2002:ab0:54d5:0:b0:663:e17a:e5f6 with SMTP id
 q21-20020ab054d5000000b00663e17ae5f6mr2782683uaa.2.1677184105024; Thu, 23 Feb
 2023 12:28:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
 <8AA6E5E4-6E9F-427D-9F65-D79D4FEEC1A0@gmail.com>
 <7df4771f-e6ab-af3d-3e82-98cb1c4dfce0@eik.bme.hu>
 <14710BE7-AD6F-452E-A3F5-3E9B08F95FD3@gmail.com>
 <fa7ddd4c-aed0-5fd4-e67c-b5e7e9116c43@eik.bme.hu>
 <CAG4p6K5ux4c_nORQX3dUFKbq_woRVwrC7Fmp+=kft+Bs9tALrQ@mail.gmail.com>
 <d9f8ede9-8a36-75bd-5e4e-60c665fee354@eik.bme.hu>
In-Reply-To: <d9f8ede9-8a36-75bd-5e4e-60c665fee354@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 23 Feb 2023 21:28:10 +0100
Message-ID: <CAG4p6K6OHGAeKCU5=QKGNttXyaf3+h21CcZcHRc0WmNeuudMkw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="000000000000cd960f05f563da09"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2e.google.com
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

--000000000000cd960f05f563da09
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 23, 2023 at 3:23 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Thu, 23 Feb 2023, Bernhard Beschow wrote:
> > On Thu, Feb 23, 2023 at 1:34 PM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >>>>>> I don't get your approach.
> >>>>>
> >>>>> I hope that I could help you get a better understanding. The linked
> >>>>> .pdf is good and comprehensive reading material.
> >>>>
> >>>> I'm not sure the via-ide confirms to that doc but it's also not any
> >>>> more a problem with via-ide now. That was discussed to death back then
> >>>> and "fixed" to work for the cases we want it to work with. We probably
> >>>> never agreed on how this really works but at least what we ended up
> >>>> with works with guests that run on real hardware. I'm OK with also
> >>>> making these cases work that we want now such as network and sound
> card
> >>>> under AmigaOS and sound under MorphOS (as long as you don't use USB)
> on
> >>>> pegasos2. This series does that so unless it breaks something that
> >>>> worked before I condider this moving forward and we can always improve
> >>>> adn fix it later. I'm not saying I'm not interested in your
> >>>> improvements just that let's that not hold this back now as we can fix
> >>>> and improve it later but otherwise users will have to wait until
> >>>> September to be able to use it. I know a few who want this and getting
> >>>> this out as it is would allow more people to test it and report
> >>>> problems so unless there are clearly wrong parts I'm OK with less than
> >>>> perfect but working solution as long as it's not too messy.
> >>>
> >>> Patch 1 really seems like duplicating PCI code that already exists in
> >>> QEMU. This is not needed and we should avoid that.
> >>>
> >>> Moreover, usage of the IRQ line register (0x3c) for interrupt routing
> >>> should be switched to using the 0x55-0x57 regs to be PCI compliant.
> >>
> >> That would not work because then guests were not able to separately
> >> configure IRQs for PCI interrupt lines and internal functions which is
> >> what the datasheet says should be possible. The internal functions' IRQs
> >> are not affeceted by 0x55-0x57 but routed by different registers.
> >
> > How do you know?
>
> The datasheet says so. It says that 0x55-0x57 are controlling what ISA
> interrupts the PIRQA-D pins should raise while internal functions are
> documented to have 0x3c register to select what ISA IRQ they use. It's not
> said internal functions would use PCI interrupts that are separate and
> connected to the PIRQ pins.
>
> > I think
> >> your series only work because pegasos2 firmware progeams everything to
> >> IRQ9 but if a guest decided to change that and route e.g. USB somewhere
> >> else then it would break. My series models that a bit better but may
> still
> >> break if a guest routes a function to an IRQ also controlled by some ISA
> >> device (like serial or ps2 keyboard) which are currently done within
> >> QEMU's ISA model so I can't easily channel those IRQs through the
> >> via-isa.for proper routing but it's unliikely guests would want to do
> that
> >> so in practice my series should work. We may duplicate PCI IRQ routing
> >> here but this chip does that and more so we need to implement it as it
> >> handles more than the 4 PCI interrupts so that implementation is not
> >> enough to handle all sources this chip has. This isn't a complex piece
> of
> >> code though so having a similar implementation is not a problem IMO.
> >>
> >>> Thanks to your great work to make via-ac97 work we can confirm that
> both
> >>> IRQ routing implementations basically work for now. Let's work out a
> >>> solution that relies on existing code, sticks to the standard and
> >>> hopefully works for i386 and MIPS, too.
> >>
> >> I'm still not convinced your implementation is correct
> >
> >
> > It seems that Mark (cc'd), I, the commenter in
> >
> https://community.osr.com/discussion/30399/read-only-pci-interrupt-line-register
> > and the PCI specification agree that the 0x3c regs aren't supposed to be
> > interpreted by hardware.
>
> You could still all be wrong if the PCI spec does not apply to the
> internal functions of the VIA chip which is just an assumption you made
> but the docs and experience never proved that so I don't believe that's a
> valid assumption. According to the datasheet internal functions'
> interrupts are routed independently from PCI interrupts which is what I've
> tried to model.
>
> > I've provided a working example with no functional
> > downsides to the 0x3c approach. I've provided the PCI-IDE reading
> material
> > that Mark suggested for reading in
> >
> https://lore.kernel.org/qemu-devel/b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk/
> > . I'm running out of ideas now on how to proceed.
>
> Please submit an alternative series that we can test and if it works with
> the guests that I want to run like mine we can take that instead even if I
> believe your way is wrong. I don't care about who's right as long as it
> works. But make sure it gets in for 8.0 as I do care that it should work
> in the next release.
>

Here we go:
https://lore.kernel.org/qemu-devel/20230223202053.117050-1-shentey@gmail.com/

Please submit further iterations when audio changes are needed.

Best regards,
Bernhard

>
> Regards,
> BALATON Zoltan
>

--000000000000cd960f05f563da09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 23, 2023 at 3:23 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, 23 Feb 2023, Bernhard Beschow wrote:<br>
&gt; On Thu, Feb 23, 2023 at 1:34 PM BALATON Zoltan &lt;<a href=3D"mailto:b=
alaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; I don&#39;t get your approach.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I hope that I could help you get a better understandin=
g. The linked<br>
&gt;&gt;&gt;&gt;&gt; .pdf is good and comprehensive reading material.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m not sure the via-ide confirms to that doc but it&#=
39;s also not any<br>
&gt;&gt;&gt;&gt; more a problem with via-ide now. That was discussed to dea=
th back then<br>
&gt;&gt;&gt;&gt; and &quot;fixed&quot; to work for the cases we want it to =
work with. We probably<br>
&gt;&gt;&gt;&gt; never agreed on how this really works but at least what we=
 ended up<br>
&gt;&gt;&gt;&gt; with works with guests that run on real hardware. I&#39;m =
OK with also<br>
&gt;&gt;&gt;&gt; making these cases work that we want now such as network a=
nd sound card<br>
&gt;&gt;&gt;&gt; under AmigaOS and sound under MorphOS (as long as you don&=
#39;t use USB) on<br>
&gt;&gt;&gt;&gt; pegasos2. This series does that so unless it breaks someth=
ing that<br>
&gt;&gt;&gt;&gt; worked before I condider this moving forward and we can al=
ways improve<br>
&gt;&gt;&gt;&gt; adn fix it later. I&#39;m not saying I&#39;m not intereste=
d in your<br>
&gt;&gt;&gt;&gt; improvements just that let&#39;s that not hold this back n=
ow as we can fix<br>
&gt;&gt;&gt;&gt; and improve it later but otherwise users will have to wait=
 until<br>
&gt;&gt;&gt;&gt; September to be able to use it. I know a few who want this=
 and getting<br>
&gt;&gt;&gt;&gt; this out as it is would allow more people to test it and r=
eport<br>
&gt;&gt;&gt;&gt; problems so unless there are clearly wrong parts I&#39;m O=
K with less than<br>
&gt;&gt;&gt;&gt; perfect but working solution as long as it&#39;s not too m=
essy.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Patch 1 really seems like duplicating PCI code that already ex=
ists in<br>
&gt;&gt;&gt; QEMU. This is not needed and we should avoid that.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Moreover, usage of the IRQ line register (0x3c) for interrupt =
routing<br>
&gt;&gt;&gt; should be switched to using the 0x55-0x57 regs to be PCI compl=
iant.<br>
&gt;&gt;<br>
&gt;&gt; That would not work because then guests were not able to separatel=
y<br>
&gt;&gt; configure IRQs for PCI interrupt lines and internal functions whic=
h is<br>
&gt;&gt; what the datasheet says should be possible. The internal functions=
&#39; IRQs<br>
&gt;&gt; are not affeceted by 0x55-0x57 but routed by different registers.<=
br>
&gt;<br>
&gt; How do you know?<br>
<br>
The datasheet says so. It says that 0x55-0x57 are controlling what ISA <br>
interrupts the PIRQA-D pins should raise while internal functions are <br>
documented to have 0x3c register to select what ISA IRQ they use. It&#39;s =
not <br>
said internal functions would use PCI interrupts that are separate and <br>
connected to the PIRQ pins.<br>
<br>
&gt; I think<br>
&gt;&gt; your series only work because pegasos2 firmware progeams everythin=
g to<br>
&gt;&gt; IRQ9 but if a guest decided to change that and route e.g. USB some=
where<br>
&gt;&gt; else then it would break. My series models that a bit better but m=
ay still<br>
&gt;&gt; break if a guest routes a function to an IRQ also controlled by so=
me ISA<br>
&gt;&gt; device (like serial or ps2 keyboard) which are currently done with=
in<br>
&gt;&gt; QEMU&#39;s ISA model so I can&#39;t easily channel those IRQs thro=
ugh the<br>
&gt;&gt; via-isa.for proper routing but it&#39;s unliikely guests would wan=
t to do that<br>
&gt;&gt; so in practice my series should work. We may duplicate PCI IRQ rou=
ting<br>
&gt;&gt; here but this chip does that and more so we need to implement it a=
s it<br>
&gt;&gt; handles more than the 4 PCI interrupts so that implementation is n=
ot<br>
&gt;&gt; enough to handle all sources this chip has. This isn&#39;t a compl=
ex piece of<br>
&gt;&gt; code though so having a similar implementation is not a problem IM=
O.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Thanks to your great work to make via-ac97 work we can confirm=
 that both<br>
&gt;&gt;&gt; IRQ routing implementations basically work for now. Let&#39;s =
work out a<br>
&gt;&gt;&gt; solution that relies on existing code, sticks to the standard =
and<br>
&gt;&gt;&gt; hopefully works for i386 and MIPS, too.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m still not convinced your implementation is correct<br>
&gt;<br>
&gt;<br>
&gt; It seems that Mark (cc&#39;d), I, the commenter in<br>
&gt; <a href=3D"https://community.osr.com/discussion/30399/read-only-pci-in=
terrupt-line-register" rel=3D"noreferrer" target=3D"_blank">https://communi=
ty.osr.com/discussion/30399/read-only-pci-interrupt-line-register</a><br>
&gt; and the PCI specification agree that the 0x3c regs aren&#39;t supposed=
 to be<br>
&gt; interpreted by hardware.<br>
<br>
You could still all be wrong if the PCI spec does not apply to the <br>
internal functions of the VIA chip which is just an assumption you made <br=
>
but the docs and experience never proved that so I don&#39;t believe that&#=
39;s a <br>
valid assumption. According to the datasheet internal functions&#39; <br>
interrupts are routed independently from PCI interrupts which is what I&#39=
;ve <br>
tried to model.<br>
<br>
&gt; I&#39;ve provided a working example with no functional<br>
&gt; downsides to the 0x3c approach. I&#39;ve provided the PCI-IDE reading =
material<br>
&gt; that Mark suggested for reading in<br>
&gt; <a href=3D"https://lore.kernel.org/qemu-devel/b38987d5-5530-ecd9-2fd2-=
3a57e1a611dd@ilande.co.uk/" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/qemu-devel/b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk/=
</a><br>
&gt; . I&#39;m running out of ideas now on how to proceed.<br>
<br>
Please submit an alternative series that we can test and if it works with <=
br>
the guests that I want to run like mine we can take that instead even if I =
<br>
believe your way is wrong. I don&#39;t care about who&#39;s right as long a=
s it <br>
works. But make sure it gets in for 8.0 as I do care that it should work <b=
r>
in the next release.<br></blockquote><div><br></div><div>Here we go: <a hre=
f=3D"https://lore.kernel.org/qemu-devel/20230223202053.117050-1-shentey@gma=
il.com/">https://lore.kernel.org/qemu-devel/20230223202053.117050-1-shentey=
@gmail.com/</a></div><div><br></div><div>Please  submit further iterations =
when audio changes are needed.</div><div><br></div><div>Best regards,</div>=
<div>Bernhard<br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--000000000000cd960f05f563da09--

