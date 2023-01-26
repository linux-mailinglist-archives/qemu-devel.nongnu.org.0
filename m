Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B491067C806
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:08:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKz9u-0007Ek-G5; Thu, 26 Jan 2023 05:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pKz9l-0007Bi-Pc; Thu, 26 Jan 2023 05:07:03 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pKz9i-0003hG-VW; Thu, 26 Jan 2023 05:06:57 -0500
Received: by mail-ej1-x632.google.com with SMTP id mg12so3705762ejc.5;
 Thu, 26 Jan 2023 02:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q3hCH1rwmOEol+/svBmlAHQLohvGYmk8e1eQ3utAXjA=;
 b=oMyYqQLp7ob0TnVdnsbIG5+ZrOfGSYODCCdlPa3bd3+OOl9+hNWMcVsYrYlK4B2VEI
 LG/5VcuRN0s4TpBwvRC65La5ihIXETC/N7V6yh+uOK7DahOQdHGiih90/ZUK7rE40dq7
 EI87sfYO6WR7TVTEtQyKVua38nnLNR8W/+bb3PWGHm2t6NUYXw6U08LDqpY1/M2e8prY
 Y409X2awfkDLEcnAveTHf59oOfWwKfW1BrVDsg8i1ZSo90RRhwQ008qF/TYaB/BBdzBE
 5yqINGEDnQnWv4uSEJaK7SvoklXzxoIKTCt3UourirZFlUOaf8o207N7NqdbGkhZ4mFZ
 7Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3hCH1rwmOEol+/svBmlAHQLohvGYmk8e1eQ3utAXjA=;
 b=jUqR8GwBzy2dMzScuzQxqXk1GJ2RzNTwa7G23fKOUGmiDfkSqRXlP9278HzfyULQn9
 6fPGUxHlF7N9KxB1NUaTAx+RGWF/gvRV90k1QaIvGX0l2+edpiPodVFOfUxY+RBOIFHz
 QR1x+x959GHyJegsZMU2nYwPS5hj3S6m0UTMAcR3FR/z4l0a0YxtKsCqsRWi8whBXo/5
 x/uEFikkJPjQGB5NwxVZ5XIBhvc1n4gv9xKiRmcJ25B1LvtDtzVInA4p4R57D1ZTQ5ud
 jF/8YYlGqXfQq8vvx/Bl5JGxzSt8KApFC7luavgAf3EHAa0e5nuRvp5QYmI3QTvoCXok
 xqgg==
X-Gm-Message-State: AFqh2kpOWfBGlIacT3nYw5CvtDz8oHDAuWVcc+q8abIk5Qcm8s8kwh/P
 RemaAeiQirOnJpKBHcqOUDus22JW3mZV264LBK8=
X-Google-Smtp-Source: AMrXdXuSn7i1b+CkjnRy12tG/92jEa/89f6+7L4yX4jVd4Qm0pS7l6bbBy4rWKhmKI+pOyvbmHAftYIRBsrZvgsmjPY=
X-Received: by 2002:a17:906:f181:b0:870:1090:66d1 with SMTP id
 gs1-20020a170906f18100b00870109066d1mr3973671ejb.242.1674727612619; Thu, 26
 Jan 2023 02:06:52 -0800 (PST)
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
 <CABLmASHotQcPDRQxhMdL729wGHNkT0gfYt2GH8U5e190eOTCQQ@mail.gmail.com>
 <a9dbc41c-29e5-7672-d9ec-4ec43ae3a6c8@eik.bme.hu>
In-Reply-To: <a9dbc41c-29e5-7672-d9ec-4ec43ae3a6c8@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 26 Jan 2023 11:06:39 +0100
Message-ID: <CABLmASFqzt8f_Qk8O_KvYOqSqeffsVVBaaknbUxL86Ch3VR3kA@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000721fb605f327e854"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x632.google.com
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

--000000000000721fb605f327e854
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 4:33 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 24 Jan 2023, Howard Spoelstra wrote:
> > On Tue, Jan 24, 2023 at 3:15 PM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >> I thought MacOS 8 needed old world ROM but looks like it can also load
> it
> >> from disk on new world machines. Then what version of the ROM it has?
> >> It seems there was some change at ROM 5.2.1 then which solves the
> problem
> >> with usb and older versions may have done something differently and
> >> expect it to work unlike it's emulated now.
> >>
> >> The rom on the 8.6 Cd is version ....
> > The disk utility on the CD cannot initialise a hard disk (something we
> had
> > with some 9.0.4 versions too)
>
> This sentence seems to be unfinished, also the disk utility problem is
> maybe unrelated so just ignore that for now and focus on usb first.
>
> >> So it seems versions before 10.2 have a problem (except 9,1 and 9.2
> which
> >> may have a newer usb driver maybe? also 9.0.4 with ROM 5.2.1 and I
> assume
> >> later 9.x versions have at least this or newer Toolbox ROM) I think it's
> >> esasier to debug with OS X because it's easier to get logs and the
> drivers
> >> may also be open source so easier to check what's happening so let's
> just
> >> forget about MacOS9 for now and try to find out what changed between
> 10.1
> >> and 10.2 in usb handling.
> >>
> >>> It seems via=pmu provides usb mouse first, usb kbd second.
> >>> With Mac OS 9.0.4 the second device will not work.
> >>> With 10.0 / 10.1 both usb mouse and kbd do not work.
> >>
> >> These are added here:
> >>
> >>
> >>
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/mac_newworld.c#L435
> >>
> >> you could change the order but it does not matter if both needs to work.
> >> If it makes the first one work then maybe the older USB drivers only
> >> handle one port per bus? But then the problem in OS X may be different.
> >>
> >>> Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by
> >> default I
> >>> only see one bus: USB 0 into which both mouse and kdb are plugged.
> >>> On the real G4 the mouse and kbd are each plugged into another bus, so
> I
> >>> see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.
> >>>
> >>> With -M mac99,via=cuda one USB bus is always created. It has id
> "usb-bus"
> >>> We can add a second USB bus with e.g. -device pci-ohci,id=usb1  (this
> is
> >>> the Apple USB controller).
> >>>
> >>> Then add mouse and kbd to different buses with:
> >>> -device usb-mouse,bus=usb-bus.0    (attaches to first and default bus)
> >>> -device usb-kbd,bus=usb1.0 (attaches to second bus).
> >>>
> >>> This then mimics what I see on real hardware. Should qemu-system-ppc by
> >>> default provide the same?
> >>
> >> Does this solve the problem you have?
> >
> >
> > No.
>
> OK so then we should not do that by default either unless we find it's
> needed for some reason.
>
> >> (You talk about via=cude above but I
> >> think it should be via=pmu. Is that a typo?)
> >
> >
> > No, even with via-cuda the first usb bus is created:
> > dev: pci-ohci, id ""
> >        masterbus = ""
> >        num-ports = 3 (0x3)
> >        firstport = 0 (0x0)
> >        addr = 0d.0
> >        romfile = ""
> >        romsize = 4294967295 (0xffffffff)
> >        rombar = 1 (0x1)
> >        multifunction = false
> >        x-pcie-lnksta-dllla = true
> >        x-pcie-extcap-init = true
> >        failover_pair_id = ""
> >        acpi-index = 0 (0x0)
> >        class USB controller, addr 00:0d.0, pci id 106b:003f (sub
> 1af4:1100)
> >        bar 0: mem at 0x80080000 [0x800800ff]
> >        bus: usb-bus.0
> >          type usb-bus
> >
> > I now think in some cases the mouse falls back to adb when usb does not
> > work. Hence the wiggling/clicking that is needed to get 9.0.4 to get to
> the
> > desktop.
> > Can we disable usb-bus creation for via=cuda?
>
> Yes, try:
>
> qemu-system-ppc -M mac99,usb=no
>
> (I had to look at the code to find that out).
>
> > If this helps mac_newworld.c
> >> could add another usb bus or do somerthing different to match real
> >> hardware but you have to convince Mark about that first... Also Mac
> >> keyboards have a hub where the mouse is usially connected. Does modeling
> >> that setup with QEMU help?
> >>
> >> No, same issues with that.
>
> Then it's probably not about how these ports are arranged but something
> about modeiling the hardware maybe (i.e. QEMU does something differently
> than real hardware and this confuses the driver).
>
> >> Other idea you could try is to boot 10.1 and 10.2 and compare the ioreg
> >> outputs for the USB devices to see if there are some differences or get
> >> the USB driver versions and try to find out what changed in them.
> >>
> >>
> > I attempted to take a look, but without mouse/kbd it is difficult to get
> to
> > ioreg ;-)
>


I tested all Mac OS/OSX available to me with mouse and kbd alternately
connected to usb-bus1 or usb-bus2.

./qemu-system-ppc \
-M mac99,usb=off \
-L pc-bios \
-boot c \
-prom-env "auto-boot?=true" \
-display gtk -monitor stdio \
-drive file=/home/hsp/Mac-disks/9.0.4.img,format=raw,media=disk \
-device pci-ohci,id=usb-bus1 \
-device pci-ohci,id=usb-bus2 \
-device usb-mouse,bus=usb-bus1.0,pcap=9.0.4_p1_mouse-2usb.pcap \
-device usb-kbd,bus=usb-bus2.0,pcap=9.0.4_p2_kbd-2usb.pcap \
-device sungem,netdev=network01 -netdev user,id=network01 \
-trace "usb_ohci*"

These are the results:

Mac OS:
#9.0.4 bus1 kbd: works up to usb_ohci_port_reset port #0 in trace, pcap
shows normal operation and recognition as HID device .
#9.0.4 bus2 mouse. Reverts to adb mouse. No recognition as HID device.
#9.0.4 bus1 mouse: usb_ohci_port_reset port #0 (twice). No further traffic
in trace. Reverts to adb mouse. No recognition as HID device.
#9.0.4 bus2 kbd then no longer works (due to reset?)

I attempted to replace the 9.0.4 disk based USB drivers with the drivers
from 9.1, which did not work.

#9.1/9.2: mouse and kbd work on both buses. Profiler shows 2 buses with one
device each.

Mac OS X
#10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
mouse. No recognition as HID device.
#10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point kbd
pcap shows normal interrupt operation and recognition as HID device
#10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point kbd
pcap shows normal interrupt operation and recognition as HID device
#10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
mouse. pcap shows no recognition as HID device.
#10.0 in both cases apple system profiler shows 2 usb buses but no devices.


#10.1 bus1 mouse: pcap shows normal interrupt operation and recognition as
HID device, trace shows continuous traffic
#10.1 bus2 kbd: works. pcap shows normal interrupt operation and
recognition as HID device, trace shows continuous traffic
#10.1 bus1 kbd: works. pcap shows normal interrupt operation and
recognition as HID device, trace shows continuous traffic
#10.1 bus2 mouse: pcap shows normal interrupt operation and recognition as
HID device, trace shows continuous traffic
#10.1 Mouse does not move on desktop, but trace shows packets flow.

#10.2/10.3/10.4/10.5 mouse and kbd work on both buses. Profiler shows 2
buses with one device each.

10.0 and 9.0.4 seem to suffer the same issue (mouse not communicating as a
HID device, but 10.1 seems to have another issue.

Attempts to run Mac OS X ioreg show that it fails in that it cannot read
the full registry.
This was already noticed here:
https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg05260.html

-Ioreg from a real G4 running 10.4 and output from the PCI DDK name
registry tool from a real G4 running 9.0.4 and from Qemu running 9.0.4, 9.1
and 9.2 are available here:
https://surfdrive.surf.nl/files/index.php/s/1wcC3GGaagqKVpj/download


Best,
Howard

--000000000000721fb605f327e854
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 4:33 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tu=
e, 24 Jan 2023, Howard Spoelstra wrote:<br>
&gt; On Tue, Jan 24, 2023 at 3:15 PM BALATON Zoltan &lt;<a href=3D"mailto:b=
alaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;&gt; I thought MacOS 8 needed old world ROM but looks like it can also =
load it<br>
&gt;&gt; from disk on new world machines. Then what version of the ROM it h=
as?<br>
&gt;&gt; It seems there was some change at ROM 5.2.1 then which solves the =
problem<br>
&gt;&gt; with usb and older versions may have done something differently an=
d<br>
&gt;&gt; expect it to work unlike it&#39;s emulated now.<br>
&gt;&gt;<br>
&gt;&gt; The rom on the 8.6 Cd is version ....<br>
&gt; The disk utility on the CD cannot initialise a hard disk (something we=
 had<br>
&gt; with some 9.0.4 versions too)<br>
<br>
This sentence seems to be unfinished, also the disk utility problem is <br>
maybe unrelated so just ignore that for now and focus on usb first.<br>
<br>
&gt;&gt; So it seems versions before 10.2 have a problem (except 9,1 and 9.=
2 which<br>
&gt;&gt; may have a newer usb driver maybe? also 9.0.4 with ROM 5.2.1 and I=
 assume<br>
&gt;&gt; later 9.x versions have at least this or newer Toolbox ROM) I thin=
k it&#39;s<br>
&gt;&gt; esasier to debug with OS X because it&#39;s easier to get logs and=
 the drivers<br>
&gt;&gt; may also be open source so easier to check what&#39;s happening so=
 let&#39;s just<br>
&gt;&gt; forget about MacOS9 for now and try to find out what changed betwe=
en 10.1<br>
&gt;&gt; and 10.2 in usb handling.<br>
&gt;&gt;<br>
&gt;&gt;&gt; It seems via=3Dpmu provides usb mouse first, usb kbd second.<b=
r>
&gt;&gt;&gt; With Mac OS 9.0.4 the second device will not work.<br>
&gt;&gt;&gt; With 10.0 / 10.1 both usb mouse and kbd do not work.<br>
&gt;&gt;<br>
&gt;&gt; These are added here:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/hw/p=
pc/mac_newworld.c#L435" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/qemu-project/qemu/-/blob/master/hw/ppc/mac_newworld.c#L435</a><br>
&gt;&gt;<br>
&gt;&gt; you could change the order but it does not matter if both needs to=
 work.<br>
&gt;&gt; If it makes the first one work then maybe the older USB drivers on=
ly<br>
&gt;&gt; handle one port per bus? But then the problem in OS X may be diffe=
rent.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Real hardware provides two USB buses: USB 0 and USB 1. In Qemu=
 by<br>
&gt;&gt; default I<br>
&gt;&gt;&gt; only see one bus: USB 0 into which both mouse and kdb are plug=
ged.<br>
&gt;&gt;&gt; On the real G4 the mouse and kbd are each plugged into another=
 bus, so I<br>
&gt;&gt;&gt; see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With -M mac99,via=3Dcuda one USB bus is always created. It has=
 id &quot;usb-bus&quot;<br>
&gt;&gt;&gt; We can add a second USB bus with e.g. -device pci-ohci,id=3Dus=
b1=C2=A0 (this is<br>
&gt;&gt;&gt; the Apple USB controller).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Then add mouse and kbd to different buses with:<br>
&gt;&gt;&gt; -device usb-mouse,bus=3Dusb-bus.0=C2=A0 =C2=A0 (attaches to fi=
rst and default bus)<br>
&gt;&gt;&gt; -device usb-kbd,bus=3Dusb1.0 (attaches to second bus).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This then mimics what I see on real hardware. Should qemu-syst=
em-ppc by<br>
&gt;&gt;&gt; default provide the same?<br>
&gt;&gt;<br>
&gt;&gt; Does this solve the problem you have?<br>
&gt;<br>
&gt;<br>
&gt; No.<br>
<br>
OK so then we should not do that by default either unless we find it&#39;s =
<br>
needed for some reason.<br>
<br>
&gt;&gt; (You talk about via=3Dcude above but I<br>
&gt;&gt; think it should be via=3Dpmu. Is that a typo?)<br>
&gt;<br>
&gt;<br>
&gt; No, even with via-cuda the first usb bus is created:<br>
&gt; dev: pci-ohci, id &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 masterbus =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 num-ports =3D 3 (0x3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 firstport =3D 0 (0x0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D 0d.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 romfile =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 romsize =3D 4294967295 (0xffffffff)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 rombar =3D 1 (0x1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 multifunction =3D false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-pcie-lnksta-dllla =3D true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-pcie-extcap-init =3D true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 failover_pair_id =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi-index =3D 0 (0x0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 class USB controller, addr 00:0d.0, pci id =
106b:003f (sub 1af4:1100)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 bar 0: mem at 0x80080000 [0x800800ff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 bus: usb-bus.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type usb-bus<br>
&gt;<br>
&gt; I now think in some cases the mouse falls back to adb when usb does no=
t<br>
&gt; work. Hence the wiggling/clicking that is needed to get 9.0.4 to get t=
o the<br>
&gt; desktop.<br>
&gt; Can we disable usb-bus creation for via=3Dcuda?<br>
<br>
Yes, try:<br>
<br>
qemu-system-ppc -M mac99,usb=3Dno<br>
<br>
(I had to look at the code to find that out).<br>
<br>
&gt; If this helps mac_newworld.c<br>
&gt;&gt; could add another usb bus or do somerthing different to match real=
<br>
&gt;&gt; hardware but you have to convince Mark about that first... Also Ma=
c<br>
&gt;&gt; keyboards have a hub where the mouse is usially connected. Does mo=
deling<br>
&gt;&gt; that setup with QEMU help?<br>
&gt;&gt;<br>
&gt;&gt; No, same issues with that.<br>
<br>
Then it&#39;s probably not about how these ports are arranged but something=
 <br>
about modeiling the hardware maybe (i.e. QEMU does something differently <b=
r>
than real hardware and this confuses the driver).<br>
<br>
&gt;&gt; Other idea you could try is to boot 10.1 and 10.2 and compare the =
ioreg<br>
&gt;&gt; outputs for the USB devices to see if there are some differences o=
r get<br>
&gt;&gt; the USB driver versions and try to find out what changed in them.<=
br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I attempted to take a look, but without mouse/kbd it is difficult to g=
et to<br>
&gt; ioreg ;-)<br></blockquote><div>=C2=A0</div><div><br></div><div>
<div>I tested all Mac OS/OSX available to me with mouse and kbd alternately=
 connected to usb-bus1 or usb-bus2. <br></div><div><br></div><div>./qemu-sy=
stem-ppc \<br>-M mac99,usb=3Doff \<br>-L pc-bios \<br>-boot c \<br>-prom-en=
v &quot;auto-boot?=3Dtrue&quot; \<br>-display gtk -monitor stdio \<br>-driv=
e file=3D/home/hsp/Mac-disks/9.0.4.img,format=3Draw,media=3Ddisk \<br>-devi=
ce pci-ohci,id=3Dusb-bus1 \<br>-device pci-ohci,id=3Dusb-bus2 \<br>-device =
usb-mouse,bus=3Dusb-bus1.0,pcap=3D9.0.4_p1_mouse-2usb.pcap \<br>-device usb=
-kbd,bus=3Dusb-bus2.0,pcap=3D9.0.4_p2_kbd-2usb.pcap \<br>-device sungem,net=
dev=3Dnetwork01 -netdev user,id=3Dnetwork01 \<br>-trace &quot;usb_ohci*&quo=
t;<br><br>These are the results:</div><div><br></div><div>Mac OS:<br></div>=
<div>#9.0.4 bus1 kbd: works up to usb_ohci_port_reset port #0 in trace, pca=
p shows normal operation and recognition as HID device . <br>#9.0.4 bus2 mo=
use. Reverts to adb mouse. No recognition as HID device.<br>#9.0.4
 bus1 mouse: usb_ohci_port_reset port #0 (twice). No further traffic in=20
trace. Reverts to adb mouse. No recognition as HID device.<br>#9.0.4 bus2 k=
bd then no longer works (due to reset?)<br><br>I attempted to replace the 9=
.0.4 disk based USB drivers with the drivers from 9.1, which did not work.<=
br><br>#9.1/9.2: mouse and kbd work on both buses. Profiler shows 2 buses w=
ith one device each.<br></div><div><br></div><div>Mac OS X<br>#10.0 bus1 mo=
use: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb mouse. No recogn=
ition as HID device.<br>#10.0
 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point kbd=20
pcap shows normal interrupt operation and recognition as HID device<br>#10.=
0
 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point kbd=20
pcap shows normal interrupt operation and recognition as HID device<br>#10.=
0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb mouse. =
pcap shows no recognition as HID device.<br>#10.0 in both cases apple syste=
m profiler shows 2 usb buses but no devices. =C2=A0<br><br>#10.1 bus1 mouse=
: pcap shows normal interrupt operation and recognition as HID device, trac=
e shows continuous traffic<br>#10.1 bus2 kbd: works. pcap shows normal inte=
rrupt operation and recognition as HID device, trace shows continuous traff=
ic<br>#10.1 bus1 kbd: works. pcap shows normal interrupt operation and reco=
gnition as HID device, trace shows continuous traffic<br>#10.1 bus2 mouse: =
pcap shows normal interrupt operation and recognition as HID device, trace =
shows continuous traffic<br>#10.1 Mouse does not move on desktop, but trace=
 shows packets flow.<br><br>#10.2/10.3/10.4/10.5 mouse and kbd work on both=
 buses. Profiler shows 2 buses with one device each.<br></div><div><br></di=
v><div>10.0 and 9.0.4 seem to suffer the same issue (mouse not communicatin=
g as a HID device, but 10.1 seems to have another issue.<br></div><div><br>=
</div><div>Attempts to run Mac OS X ioreg show that it fails in that it can=
not read the full registry. <br></div><div>This was already noticed here:</=
div><div><a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2016-09/m=
sg05260.html" target=3D"_blank">https://lists.gnu.org/archive/html/qemu-dev=
el/2016-09/msg05260.html</a></div><div><br></div><div>-Ioreg
 from a real G4 running 10.4 and output from the PCI DDK name registry=20
tool from a real G4 running 9.0.4 and from Qemu running 9.0.4, 9.1 and=20
9.2 are available here: <a href=3D"https://surfdrive.surf.nl/files/index.ph=
p/s/1wcC3GGaagqKVpj/download" target=3D"_blank">https://surfdrive.surf.nl/f=
iles/index.php/s/1wcC3GGaagqKVpj/download</a> <br></div><div><br></div><div=
><br></div><div>Best,</div><div>Howard</div>

</div><div><br></div><div>=C2=A0</div></div></div>

--000000000000721fb605f327e854--

