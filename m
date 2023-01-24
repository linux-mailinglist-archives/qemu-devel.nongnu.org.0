Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED2679CD9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 16:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKon-0001bJ-3D; Tue, 24 Jan 2023 10:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pKKoX-0001VT-NQ; Tue, 24 Jan 2023 10:02:29 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pKKoS-0000ed-5C; Tue, 24 Jan 2023 10:02:18 -0500
Received: by mail-ej1-x629.google.com with SMTP id hw16so39682076ejc.10;
 Tue, 24 Jan 2023 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O6nA1VsnMF+qpGodYE82KTKhckA4UylOXicnAiSJbEs=;
 b=mrWqhodIfrty56LaWGNFtYGWBLq4eKKsIQ9sUZqj+hQv1aSO9CqHcHkz3lv2KUp5JN
 czbgNwYJipCGY9wUJ3dSw4E7yEmv/GC0Jldpe71EG449LG5tbsAFPb7wr8MhyU5G6fKf
 ojM5HkoTUqtGABtCDYtGDWMAWBluwdw5pY0T7fJbRcilasKzZds3UOzSa89TSw7a4Wju
 dQYqQjGpWu3Bb0ewo9aSfDgaOobdkH2EMHFnEj/ILtzbkbRnF2+ZSAl5O1BdSLv95y6v
 LrjV0dzbwBz3ms7HwCbeNlW0Yohfg5X9BN+9VMvHq3z3g6qqjDp+CQomISNnsCJmdSgg
 fgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6nA1VsnMF+qpGodYE82KTKhckA4UylOXicnAiSJbEs=;
 b=dtlMAIE1FDTz1ii7rhd4wkp+MB2VJZK9DcpeYLZEy2obBVRxz9CCHB7s+WBhoI0Rdk
 ekROtyOIk0QVXUaPu+QLeSMS8aI63wnuq7MXXTx1SlS5OgmnT5W9QYiZaHfS7buu/A+F
 /JrLTh1SlhFEY6zt84zMcCqEx0BH2aYAu+PPPJyZd4HuyzcP4v1t3xX1I0aQ9UhrMgsb
 Vm34kP17uiXYab9sQhRVLxhI3U0/ONBcrkbxD3RqWmZ9Rr5Z4MhlmaWW25aWymLiJoiZ
 UvmZEdV17815a9hNm93FXYw59jdBbUBjt8oM0V97m+v4erTH+ptSadYhFZw9Sea8svqV
 Rw2Q==
X-Gm-Message-State: AFqh2krhhQuu9RRUcYlwDG7fNO4oU32yXR7iQuwghvRKOuhZf2ldwyWg
 B/PirJBgm6H+6T2olfwY3XLN1tXVe7Zz9/2+KyE=
X-Google-Smtp-Source: AMrXdXt+uxURM9w+kqwKA90kGx3JLzxTkf2FqyHv9dTkNmegrh9/vxTlAADuHuN0e70JllYx6svHCxix49EDmxunUlc=
X-Received: by 2002:a17:906:b788:b0:871:3103:a6aa with SMTP id
 dt8-20020a170906b78800b008713103a6aamr2810492ejb.88.1674572533965; Tue, 24
 Jan 2023 07:02:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
 <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
 <CABLmASGc6fybw7mL5JHUCukwoB6KjGaaWHct5mi20A2vXZhtaA@mail.gmail.com>
 <8e6f46fb-5e1b-8016-c595-85e8e83ace47@eik.bme.hu>
 <CABLmASEJ_MKr5gP=C7_AXg2UbYmJyDMHtm77AXoyQnsa+f2HHA@mail.gmail.com>
 <123b1c96-febb-ebc8-2d05-3c7379fbec27@eik.bme.hu>
In-Reply-To: <123b1c96-febb-ebc8-2d05-3c7379fbec27@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 24 Jan 2023 16:02:02 +0100
Message-ID: <CABLmASHotQcPDRQxhMdL729wGHNkT0gfYt2GH8U5e190eOTCQQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000009aa1305f303cd72"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000009aa1305f303cd72
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 3:15 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 24 Jan 2023, Howard Spoelstra wrote:
> > On Tue, Jan 24, 2023 at 2:49 AM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >> On Tue, 24 Jan 2023, Howard Spoelstra wrote:
> >>> From a Mac OS guest perspective, via=cuda is needed for Mac OS 9.0.4
> due
> >> to
> >>> the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my guess would
> be
> >>> that these suffer the same usb issue)
> >>> The real powermac3,1 AGP has no adb.
> >>
> >> And do these OSes run on real PowerMac3,1? If so then we likely have a
> bug
> >> in USB emulation so maybe that could be fixed? In any case my patch does
> >> not change mac99 and this should continue to work.
> >>
> >>> via=cuda supports Mac OS 9.0.4 up to OS X 10.4. via=pmu is strictly
> only
> >>> needed for Mac OS X 10.5 guest (for which the speed reported was hacked
> >> to
> >>> 900Mhz to fool the installer), but should support all Mac OS/OS X that
> >> are
> >>> now supported.
> >>
> >> Since via=pmu is what should be a real machine does it run OS X >=10.2
> >> already?
> >>
> >
> > A real powermac3,1 (G4 400Mhz/AGP) runs 8.6 up to10.4.11
> >
> > qemu-system-ppc status:
> > 8.6 will not boot from CD or HD.
> > 9.0.4* with via=pmu only supports mouse, not kbd. Needs via=cuda due to 2
> > usb device problem
> > 9.1 and 9.2 with via=pmu
> > 10.0 and 10.1 with via=pmu: no mouse and kdb. Needs via=cuda. (so also
> with
> > an usb problem)
> > 10.2 with via=pmu (but has serious graphics speed problem, also with
> > via=cuda)
> > 10.3 and 10.4 with via=pmu
> > 10.5 only with via=pmu (but needs the 900Mhz speed hack).
> >
> > *9.0.4 will only run with Mac OS Rom version 5.2.1 and above.
>
> I thought MacOS 8 needed old world ROM but looks like it can also load it
> from disk on new world machines. Then what version of the ROM it has?
> It seems there was some change at ROM 5.2.1 then which solves the problem
> with usb and older versions may have done something differently and
> expect it to work unlike it's emulated now.
>
> The rom on the 8.6 Cd is version ....
The disk utility on the CD cannot initialise a hard disk (something we had
with some 9.0.4 versions too)


> So it seems versions before 10.2 have a problem (except 9,1 and 9.2 which
> may have a newer usb driver maybe? also 9.0.4 with ROM 5.2.1 and I assume
> later 9.x versions have at least this or newer Toolbox ROM) I think it's
> esasier to debug with OS X because it's easier to get logs and the drivers
> may also be open source so easier to check what's happening so let's just
> forget about MacOS9 for now and try to find out what changed between 10.1
> and 10.2 in usb handling.
>
> > It seems via=pmu provides usb mouse first, usb kbd second.
> > With Mac OS 9.0.4 the second device will not work.
> > With 10.0 / 10.1 both usb mouse and kbd do not work.
>
> These are added here:
>
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/mac_newworld.c#L435
>
> you could change the order but it does not matter if both needs to work.
> If it makes the first one work then maybe the older USB drivers only
> handle one port per bus? But then the problem in OS X may be different.
>
> > Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by
> default I
> > only see one bus: USB 0 into which both mouse and kdb are plugged.
> > On the real G4 the mouse and kbd are each plugged into another bus, so I
> > see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.
> >
> > With -M mac99,via=cuda one USB bus is always created. It has id "usb-bus"
> > We can add a second USB bus with e.g. -device pci-ohci,id=usb1  (this is
> > the Apple USB controller).
> >
> > Then add mouse and kbd to different buses with:
> > -device usb-mouse,bus=usb-bus.0    (attaches to first and default bus)
> > -device usb-kbd,bus=usb1.0 (attaches to second bus).
> >
> > This then mimics what I see on real hardware. Should qemu-system-ppc by
> > default provide the same?
>
> Does this solve the problem you have?


No.


> (You talk about via=cude above but I
> think it should be via=pmu. Is that a typo?)


No, even with via-cuda the first usb bus is created:
dev: pci-ohci, id ""
        masterbus = ""
        num-ports = 3 (0x3)
        firstport = 0 (0x0)
        addr = 0d.0
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = false
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class USB controller, addr 00:0d.0, pci id 106b:003f (sub 1af4:1100)
        bar 0: mem at 0x80080000 [0x800800ff]
        bus: usb-bus.0
          type usb-bus

I now think in some cases the mouse falls back to adb when usb does not
work. Hence the wiggling/clicking that is needed to get 9.0.4 to get to the
desktop.
Can we disable usb-bus creation for via=cuda?


If this helps mac_newworld.c
> could add another usb bus or do somerthing different to match real
> hardware but you have to convince Mark about that first... Also Mac
> keyboards have a hub where the mouse is usially connected. Does modeling
> that setup with QEMU help?
>
> No, same issues with that.


> Other idea you could try is to boot 10.1 and 10.2 and compare the ioreg
> outputs for the USB devices to see if there are some differences or get
> the USB driver versions and try to find out what changed in them.
>
>
I attempted to take a look, but without mouse/kbd it is difficult to get to
ioreg ;-)



> >> or even better updating the main docs in
> >>
> >> https://www.qemu.org/docs/master/system/ppc/powermac.html
> >>
> > That would have to be taken up by someone else.
>
> That page is generated from this file in QEMU source:
>
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/ppc/powermac.rst
>
> you can submit a patch to that like I did:
>
> https://lists.nongnu.org/archive/html/qemu-ppc/2023-01/msg00006.html
>
> Regards,
> BALATON Zoltan
>

--00000000000009aa1305f303cd72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 3:15 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tu=
e, 24 Jan 2023, Howard Spoelstra wrote:<br>
&gt; On Tue, Jan 24, 2023 at 2:49 AM BALATON Zoltan &lt;<a href=3D"mailto:b=
alaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;&gt; On Tue, 24 Jan 2023, Howard Spoelstra wrote:<br>
&gt;&gt;&gt; From a Mac OS guest perspective, via=3Dcuda is needed for Mac =
OS 9.0.4 due<br>
&gt;&gt; to<br>
&gt;&gt;&gt; the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my gue=
ss would be<br>
&gt;&gt;&gt; that these suffer the same usb issue)<br>
&gt;&gt;&gt; The real powermac3,1 AGP has no adb.<br>
&gt;&gt;<br>
&gt;&gt; And do these OSes run on real PowerMac3,1? If so then we likely ha=
ve a bug<br>
&gt;&gt; in USB emulation so maybe that could be fixed? In any case my patc=
h does<br>
&gt;&gt; not change mac99 and this should continue to work.<br>
&gt;&gt;<br>
&gt;&gt;&gt; via=3Dcuda supports Mac OS 9.0.4 up to OS X 10.4. via=3Dpmu is=
 strictly only<br>
&gt;&gt;&gt; needed for Mac OS X 10.5 guest (for which the speed reported w=
as hacked<br>
&gt;&gt; to<br>
&gt;&gt;&gt; 900Mhz to fool the installer), but should support all Mac OS/O=
S X that<br>
&gt;&gt; are<br>
&gt;&gt;&gt; now supported.<br>
&gt;&gt;<br>
&gt;&gt; Since via=3Dpmu is what should be a real machine does it run OS X =
&gt;=3D10.2<br>
&gt;&gt; already?<br>
&gt;&gt;<br>
&gt;<br>
&gt; A real powermac3,1 (G4 400Mhz/AGP) runs 8.6 up to10.4.11<br>
&gt;<br>
&gt; qemu-system-ppc status:<br>
&gt; 8.6 will not boot from CD or HD.<br>
&gt; 9.0.4* with via=3Dpmu only supports mouse, not kbd. Needs via=3Dcuda d=
ue to 2<br>
&gt; usb device problem<br>
&gt; 9.1 and 9.2 with via=3Dpmu<br>
&gt; 10.0 and 10.1 with via=3Dpmu: no mouse and kdb. Needs via=3Dcuda. (so =
also with<br>
&gt; an usb problem)<br>
&gt; 10.2 with via=3Dpmu (but has serious graphics speed problem, also with=
<br>
&gt; via=3Dcuda)<br>
&gt; 10.3 and 10.4 with via=3Dpmu<br>
&gt; 10.5 only with via=3Dpmu (but needs the 900Mhz speed hack).<br>
&gt;<br>
&gt; *9.0.4 will only run with Mac OS Rom version 5.2.1 and above.<br>
<br>
I thought MacOS 8 needed old world ROM but looks like it can also load it <=
br>
from disk on new world machines. Then what version of the ROM it has? <br>
It seems there was some change at ROM 5.2.1 then which solves the problem <=
br>
with usb and older versions may have done something differently and <br>
expect it to work unlike it&#39;s emulated now.<br>
<br></blockquote><div>The rom on the 8.6 Cd is version ....</div><div>The d=
isk utility on the CD cannot initialise a hard disk (something we had with =
some 9.0.4 versions too) <br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
So it seems versions before 10.2 have a problem (except 9,1 and 9.2 which <=
br>
may have a newer usb driver maybe? also 9.0.4 with ROM 5.2.1 and I assume <=
br>
later 9.x versions have at least this or newer Toolbox ROM) I think it&#39;=
s <br>
esasier to debug with OS X because it&#39;s easier to get logs and the driv=
ers <br>
may also be open source so easier to check what&#39;s happening so let&#39;=
s just <br>
forget about MacOS9 for now and try to find out what changed between 10.1 <=
br>
and 10.2 in usb handling.<br>
<br>
&gt; It seems via=3Dpmu provides usb mouse first, usb kbd second.<br>
&gt; With Mac OS 9.0.4 the second device will not work.<br>
&gt; With 10.0 / 10.1 both usb mouse and kbd do not work.<br>
<br>
These are added here:<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/mac_ne=
wworld.c#L435" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu=
-project/qemu/-/blob/master/hw/ppc/mac_newworld.c#L435</a><br>
<br>
you could change the order but it does not matter if both needs to work. <b=
r>
If it makes the first one work then maybe the older USB drivers only <br>
handle one port per bus? But then the problem in OS X may be different.<br>
<br>
&gt; Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by defa=
ult I<br>
&gt; only see one bus: USB 0 into which both mouse and kdb are plugged.<br>
&gt; On the real G4 the mouse and kbd are each plugged into another bus, so=
 I<br>
&gt; see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.<br>
&gt;<br>
&gt; With -M mac99,via=3Dcuda one USB bus is always created. It has id &quo=
t;usb-bus&quot;<br>
&gt; We can add a second USB bus with e.g. -device pci-ohci,id=3Dusb1=C2=A0=
 (this is<br>
&gt; the Apple USB controller).<br>
&gt;<br>
&gt; Then add mouse and kbd to different buses with:<br>
&gt; -device usb-mouse,bus=3Dusb-bus.0=C2=A0 =C2=A0 (attaches to first and =
default bus)<br>
&gt; -device usb-kbd,bus=3Dusb1.0 (attaches to second bus).<br>
&gt;<br>
&gt; This then mimics what I see on real hardware. Should qemu-system-ppc b=
y<br>
&gt; default provide the same?<br>
<br>
Does this solve the problem you have? </blockquote><div><br></div><div>No.<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>(You talk about via=3Dcude above but I <br>
think it should be via=3Dpmu. Is that a typo?) </blockquote><div><br></div>=
<div>No, even with via-cuda the first usb bus is created:</div><div>dev: pc=
i-ohci, id &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 masterbus =3D &quot;=
&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 num-ports =3D 3 (0x3)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 firstport =3D 0 (0x0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr=
 =3D 0d.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 romfile =3D &quot;&quot;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 romsize =3D 4294967295 (0xffffffff)<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 rombar =3D 1 (0x1)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 multifuncti=
on =3D false<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-pcie-lnksta-dllla =3D true<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-pcie-extcap-init =3D true<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 failover_pair_id =3D &quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 acpi-index =3D 0 (0x0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 class USB control=
ler, addr 00:0d.0, pci id 106b:003f (sub 1af4:1100)<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 bar 0: mem at 0x80080000 [0x800800ff]<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bus: usb-bus.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type usb-bus<br></=
div><div>=C2=A0</div><div>I now think in some cases the mouse falls back to=
 adb when usb does not work. Hence the wiggling/clicking that is needed to =
get 9.0.4 to get to the desktop.<br></div><div>Can we disable usb-bus creat=
ion for via=3Dcuda?<br></div><div><br></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">If this helps mac_newworld.c <br>
could add another usb bus or do somerthing different to match real <br>
hardware but you have to convince Mark about that first... Also Mac <br>
keyboards have a hub where the mouse is usially connected. Does modeling <b=
r>
that setup with QEMU help?<br>
<br></blockquote><div>No, same issues with that.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Other idea you could try is to boot 10.1 and 10.2 and compare the ioreg <br=
>
outputs for the USB devices to see if there are some differences or get <br=
>
the USB driver versions and try to find out what changed in them.<br>
<br></blockquote><div>=C2=A0</div><div>I attempted to take a look, but with=
out mouse/kbd it is difficult to get to ioreg ;-)<br></div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; or even better updating the main docs in<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://www.qemu.org/docs/master/system/ppc/powermac.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/s=
ystem/ppc/powermac.html</a><br>
&gt;&gt;<br>
&gt; That would have to be taken up by someone else.<br>
<br>
That page is generated from this file in QEMU source:<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/p=
pc/powermac.rst" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qe=
mu-project/qemu/-/blob/master/docs/system/ppc/powermac.rst</a><br>
<br>
you can submit a patch to that like I did:<br>
<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-ppc/2023-01/msg00006.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archive=
/html/qemu-ppc/2023-01/msg00006.html</a><br>
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--00000000000009aa1305f303cd72--

