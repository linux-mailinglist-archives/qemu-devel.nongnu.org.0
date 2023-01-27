Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8067DE27
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 08:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLIkP-00054B-C7; Fri, 27 Jan 2023 02:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pLIkM-00053q-FE; Fri, 27 Jan 2023 02:02:02 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pLIkJ-0002iI-UD; Fri, 27 Jan 2023 02:02:02 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ud5so11189952ejc.4;
 Thu, 26 Jan 2023 23:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVDYkkTtKUuK6QLUJE3GLZeEhk+ImMx+TEeFxCVCpPY=;
 b=XynEKfMQvT59CRVicqe+p8v8yTyLik1oEnNzHPtRqcj1lM99q2LW/Di0CJa3WGHTIo
 idhs96Q4vwDwfcwPIkBHs8WociCo8wziRQG7H8o/LctS5Igyx36Ze7CEjEN8s4hjAoYs
 GbrvIOFRYntVvU0nJEpNsLFWRfQ1OL42LwTfK/9RAFOeEDvd1hjr9Ggh97/SQx4RNAd6
 NLSAQhcdxCtrQvQbefjueQm1kEi1+WTKv1vuQ2mV+0gECE+RxVwVb/g54awSC4AKNGnp
 1/6W48+4qfhBwJXCPRt3qqw3JLasgBp3LE31IW2rRzfhjdR7ggn9hNwEoRcZVEKoJli+
 3m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVDYkkTtKUuK6QLUJE3GLZeEhk+ImMx+TEeFxCVCpPY=;
 b=p3Q5gtdIr0da8s2QQpBz7b1WHKXRpo8hRv8vC+Id8wZh5+tqgmyyW3qRevUC2c5JsA
 wCzGfAqX63wZPnA9/vqcoYgSDPU7OmovcNmEbJBtjP3NyELy5PIsDLvAxSG0J8GHFsGU
 HqMsTLuejAHLmmIanizz5qW2OYIS+G/wffMNNBOLNrTxuvmwaAbmQ/lA+JBUvgj+B0cS
 N0rVRpi07MCoD50QQWuzZdDK/ziK633XCeAS5WOT4VP3RF2qNY6CZGVOdwSu5nunAdtH
 CUKpQYdfygfJB/zij3NIW6hYlq25nlqtLlYl3rwfZ6SVwqXpEZpT5Wx7HB3rxdkiDLax
 gUBQ==
X-Gm-Message-State: AFqh2kp7J4snaqMJMFz8D/XdsbnBxbtLL/WS9q1yXSohakMO0qS8JYcc
 iTlROZdYs4A7eDLPdVUcpF4Ue2UeelPOAo0lHu4=
X-Google-Smtp-Source: AMrXdXsLZ+1bFxisAMN6DscTx+9dn9r7G3QFwfxjQZ4lSKWzbMm7gM2EgVkbcEtFv33CLyyka3hG627Pc0Sj3+rv7kk=
X-Received: by 2002:a17:907:80cd:b0:84d:458f:48c8 with SMTP id
 io13-20020a17090780cd00b0084d458f48c8mr6066292ejc.204.1674802917454; Thu, 26
 Jan 2023 23:01:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672868854.git.balaton@eik.bme.hu>
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
 <CABLmASFqzt8f_Qk8O_KvYOqSqeffsVVBaaknbUxL86Ch3VR3kA@mail.gmail.com>
 <f13d890c-35a7-53f9-0cb7-7903582043d1@eik.bme.hu>
 <CABLmASGtRrmqgsySdUd97so8R0qY7gTAu4AUfGU_-7dc_xkauA@mail.gmail.com>
 <98430ad5-dedf-9ece-211a-1978d86dd0a5@eik.bme.hu>
 <15621125-9fd5-e856-861d-87749fae2f10@eik.bme.hu>
In-Reply-To: <15621125-9fd5-e856-861d-87749fae2f10@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Fri, 27 Jan 2023 08:01:46 +0100
Message-ID: <CABLmASFYBwhygzKAVWG1zQy216Ufs87zUhQWcBav7p1RzOuefQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f6b75005f339705e"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62f.google.com
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

--000000000000f6b75005f339705e
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 27, 2023 at 3:29 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Fri, 27 Jan 2023, BALATON Zoltan wrote:
> > On Thu, 26 Jan 2023, Howard Spoelstra wrote:
> >> On Thu, Jan 26, 2023 at 9:57 PM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >>> On Thu, 26 Jan 2023, Howard Spoelstra wrote:
> >>>> Mac OS X
> >>>> #10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to
> adb
> >>>> mouse. No recognition as HID device.
> >>>> #10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that
> point
> >>> kbd
> >>>> pcap shows normal interrupt operation and recognition as HID device
> >>>> #10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that
> point
> >>> kbd
> >>>> pcap shows normal interrupt operation and recognition as HID device
> >>>> #10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to
> adb
> >>>> mouse. pcap shows no recognition as HID device.
> >>>> #10.0 in both cases apple system profiler shows 2 usb buses but no
> >>> devices.
> >>>
> >>> These are all the logs I get booting a 10.0 install iso with
> >>> mac99,via=pmu
> >>>
> >>>>> =============================================================
> >>>>> OpenBIOS 1.1 [May 25 2022 20:04]
> >>>>> Configuration device id QEMU version 1 machine id 1
> >>>>> CPUs: 1
> >>>>> Memory: 256M
> >>>>> UUID: 00000000-0000-0000-0000-000000000000
> >>>>> CPU type PowerPC,G4
> >>> milliseconds isn't unique.
> >>>>> switching to new context:
> >>>>> call-method slw_update_keymap failed with error ffffffdf
> >>>>> call-method slw_update_keymap failed with error ffffffdf
> >>> usb_ohci_reset pci-ohci
> >>> usb_ohci_stop pci-ohci: USB Suspended
> >>> usb_ohci_set_ctl pci-ohci: new state 0x0
> >>> usb_ohci_stop pci-ohci: USB Suspended
> >>> usb_ohci_port_detach port #0
> >>> usb_ohci_port_attach port #0
> >>> usb_ohci_port_detach port #1
> >>> usb_ohci_port_attach port #1
> >>> dbdma_unassigned_flush: use of unassigned channel 0
> >>> dbdma_unassigned_flush: use of unassigned channel 0
> >>> usb_ohci_mem_write_bad_offset 0x30
> >>> usb_ohci_set_ctl pci-ohci: new state 0x80
> >>> usb_ohci_start pci-ohci: USB Operational
> >>> usb_ohci_hub_power_up powered up all ports
> >>> usb_ohci_hub_power_up powered up all ports
> >>> usb_ohci_set_ctl pci-ohci: new state 0xc0
> >>> usb_ohci_stop pci-ohci: USB Suspended
> >>> usb_ohci_hub_power_up powered up all ports
> >>> usb_ohci_hub_power_up powered up all ports
> >>> usb_ohci_port_reset port #0
> >>>
> >>> It's probably OK until it restarts but the seems to be stopped. Anybody
> >>> wants to have a look? Maybe start with finding what the states mean.
> >>>
> >>>
> >> I get the same with two usb-ohci controllers (so 6 ports) running Mac OS
> >> 9.0.4:
> >>
> >> usb_ohci_set_ctl pci-ohci: new state 0x80
> >> usb_ohci_start pci-ohci: USB Operational
> >> usb_ohci_hub_power_up powered up all ports
> >> usb_ohci_hub_power_up powered up all ports
> >> usb_ohci_hub_power_up powered up all ports
> >> usb_ohci_hub_power_up powered up all ports
> >> usb_ohci_hub_power_up powered up all ports
> >> usb_ohci_hub_power_up powered up all ports
> >> usb_ohci_port_reset port #0
> >> usb_ohci_port_reset port #0
> >>
> >> So both usb mouse and kbd do not work.
> >>
> >> the pcap file for the mouse stalls here:
> >> 12 0.007048 0.1.0 host USB 64 SET CONFIGURATION Response
> >
> > Maybe the driver gets something from the emulated HID device that it
> cannot
> > handle and stops during init? Can you reproduce the same with OS X 10.0
> and
> > try to correlate the events you see in pcap and trace with the driver
> source
> > or find out how to enable and read the messages in the driver (unless
> these
> > are stripped from the binary in Mac OS X but maybe there's something in
> the
> > guest logs; ave you checked those?) In QEMU the usb-kbd and mouse are
> > implemented in hw/usb/dev-hid.c but this file does not have any debuging
> or
> > traces. You might try to add some printfs for testing.
> >
> >> However, when I use the usb probe tool from the USB DDK, to probe the
> buses
> >> I see the host emit a get descriptor
> >>
> >> 13 115.761725 host 0.0.0 USB 64 GET DESCRIPTOR Request DEVICE
> >> 14 115.761803 0.0.0 host USB 72 GET DESCRIPTOR Response DEVICE
> >> 15 115.773719 host 0.0.0 USB 64 SET ADDRESS Request
> >> etc. and this time the mouse is recognised as HID device, the host
> starts
> >> polling it and mouse and kbd start to work.
> >
> > It could be possible that the driver did not get to this point but once
> > something else get's past that it recognises the device but I have no
> idea
> > how this works and not even sure which OS you had this result with. Is
> this
> > still 9.0.4? That's hard to debug because we don't know what its driver
> is
> > doing.
> >
> > Is there a Darwin, OpenDarwin or whatever was that called during the
> years
> > iso that boots on this machine (also on the real one)? That should be
> fully
> > open source and probably have the same drivers as Mac OS X so
> reproducing
> > with that could give some more info or maybe its driver is more verbose
> about
> > errors and has debugging. So you could try to find an early Darwin
> version
> > that's about the same time as early OS X versions or look at the
> IOHIDFamily
> > and try to find what part of it is running when you see the logs (as
> this
> > driver is quite complex it may not be easy).
>
> The oldest Darwin CD I could find is 6.2 which boots and works so it's not
> old enough for us.
>
> The simplest driver is in the oldest 10.0 version so maybe we should try
> to look at that:
>
> https://github.com/apple-oss-distributions/IOHIDFamily/tree/IOHIDFamily-6
>
> and the low level part is in the xnu kernel:
>
>
> https://github.com/apple-oss-distributions/xnu/tree/xnu-123.5/iokit/Families/IOHIDSystem
>
> I don't quite know how it works and where it starts running but a large
> part of it looks like it handles key mapping. While booting I see an error
> from OpenBIOS saying:
>
> >> call-method slw_update_keymap failed with error ffffffdf
>
> Could this be related to the problem? What is this error about? This
> PearPC bug has some info on where it may come from:
>
>
This seem to come from here:
https://web.archive.org/web/20150922180615/http://www.opensource.apple.com/source/BootX/BootX-45/bootx.tproj/ci.subproj/sl_words.c


> https://github.com/sebastianbiallas/pearpc/issues/4
>
> but I don't know if any of this is relevant.
>
> Regards,
> BALATON Zoltan
>

--000000000000f6b75005f339705e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 27, 2023 at 3:29 AM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, 27 Jan 2023, BALATON Zoltan wrote:<br>
&gt; On Thu, 26 Jan 2023, Howard Spoelstra wrote:<br>
&gt;&gt; On Thu, Jan 26, 2023 at 9:57 PM BALATON Zoltan &lt;<a href=3D"mail=
to:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<=
br>
&gt;&gt;&gt; On Thu, 26 Jan 2023, Howard Spoelstra wrote:<br>
&gt;&gt;&gt;&gt; Mac OS X<br>
&gt;&gt;&gt;&gt; #10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. R=
everts to adb<br>
&gt;&gt;&gt;&gt; mouse. No recognition as HID device.<br>
&gt;&gt;&gt;&gt; #10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up =
to that point<br>
&gt;&gt;&gt; kbd<br>
&gt;&gt;&gt;&gt; pcap shows normal interrupt operation and recognition as H=
ID device<br>
&gt;&gt;&gt;&gt; #10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up =
to that point<br>
&gt;&gt;&gt; kbd<br>
&gt;&gt;&gt;&gt; pcap shows normal interrupt operation and recognition as H=
ID device<br>
&gt;&gt;&gt;&gt; #10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. R=
everts to adb<br>
&gt;&gt;&gt;&gt; mouse. pcap shows no recognition as HID device.<br>
&gt;&gt;&gt;&gt; #10.0 in both cases apple system profiler shows 2 usb buse=
s but no<br>
&gt;&gt;&gt; devices.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; These are all the logs I get booting a 10.0 install iso with <=
br>
&gt;&gt;&gt; mac99,via=3Dpmu<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;&gt;&gt;&gt; OpenBIOS 1.1 [May 25 2022 20:04]<br>
&gt;&gt;&gt;&gt;&gt; Configuration device id QEMU version 1 machine id 1<br=
>
&gt;&gt;&gt;&gt;&gt; CPUs: 1<br>
&gt;&gt;&gt;&gt;&gt; Memory: 256M<br>
&gt;&gt;&gt;&gt;&gt; UUID: 00000000-0000-0000-0000-000000000000<br>
&gt;&gt;&gt;&gt;&gt; CPU type PowerPC,G4<br>
&gt;&gt;&gt; milliseconds isn&#39;t unique.<br>
&gt;&gt;&gt;&gt;&gt; switching to new context:<br>
&gt;&gt;&gt;&gt;&gt; call-method slw_update_keymap failed with error ffffff=
df<br>
&gt;&gt;&gt;&gt;&gt; call-method slw_update_keymap failed with error ffffff=
df<br>
&gt;&gt;&gt; usb_ohci_reset pci-ohci<br>
&gt;&gt;&gt; usb_ohci_stop pci-ohci: USB Suspended<br>
&gt;&gt;&gt; usb_ohci_set_ctl pci-ohci: new state 0x0<br>
&gt;&gt;&gt; usb_ohci_stop pci-ohci: USB Suspended<br>
&gt;&gt;&gt; usb_ohci_port_detach port #0<br>
&gt;&gt;&gt; usb_ohci_port_attach port #0<br>
&gt;&gt;&gt; usb_ohci_port_detach port #1<br>
&gt;&gt;&gt; usb_ohci_port_attach port #1<br>
&gt;&gt;&gt; dbdma_unassigned_flush: use of unassigned channel 0<br>
&gt;&gt;&gt; dbdma_unassigned_flush: use of unassigned channel 0<br>
&gt;&gt;&gt; usb_ohci_mem_write_bad_offset 0x30<br>
&gt;&gt;&gt; usb_ohci_set_ctl pci-ohci: new state 0x80<br>
&gt;&gt;&gt; usb_ohci_start pci-ohci: USB Operational<br>
&gt;&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt;&gt; usb_ohci_set_ctl pci-ohci: new state 0xc0<br>
&gt;&gt;&gt; usb_ohci_stop pci-ohci: USB Suspended<br>
&gt;&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt;&gt; usb_ohci_port_reset port #0<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; It&#39;s probably OK until it restarts but the seems to be sto=
pped. Anybody<br>
&gt;&gt;&gt; wants to have a look? Maybe start with finding what the states=
 mean.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt; I get the same with two usb-ohci controllers (so 6 ports) running =
Mac OS<br>
&gt;&gt; 9.0.4:<br>
&gt;&gt; <br>
&gt;&gt; usb_ohci_set_ctl pci-ohci: new state 0x80<br>
&gt;&gt; usb_ohci_start pci-ohci: USB Operational<br>
&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt; usb_ohci_hub_power_up powered up all ports<br>
&gt;&gt; usb_ohci_port_reset port #0<br>
&gt;&gt; usb_ohci_port_reset port #0<br>
&gt;&gt; <br>
&gt;&gt; So both usb mouse and kbd do not work.<br>
&gt;&gt; <br>
&gt;&gt; the pcap file for the mouse stalls here:<br>
&gt;&gt; 12 0.007048 0.1.0 host USB 64 SET CONFIGURATION Response<br>
&gt;<br>
&gt; Maybe the driver gets something from the emulated HID device that it c=
annot <br>
&gt; handle and stops during init? Can you reproduce the same with OS X 10.=
0 and <br>
&gt; try to correlate the events you see in pcap and trace with the driver =
source <br>
&gt; or find out how to enable and read the messages in the driver (unless =
these <br>
&gt; are stripped from the binary in Mac OS X but maybe there&#39;s somethi=
ng in the <br>
&gt; guest logs; ave you checked those?) In QEMU the usb-kbd and mouse are =
<br>
&gt; implemented in hw/usb/dev-hid.c but this file does not have any debugi=
ng or <br>
&gt; traces. You might try to add some printfs for testing.<br>
&gt;<br>
&gt;&gt; However, when I use the usb probe tool from the USB DDK, to probe =
the buses<br>
&gt;&gt; I see the host emit a get descriptor<br>
&gt;&gt; <br>
&gt;&gt; 13 115.761725 host 0.0.0 USB 64 GET DESCRIPTOR Request DEVICE<br>
&gt;&gt; 14 115.761803 0.0.0 host USB 72 GET DESCRIPTOR Response DEVICE<br>
&gt;&gt; 15 115.773719 host 0.0.0 USB 64 SET ADDRESS Request<br>
&gt;&gt; etc. and this time the mouse is recognised as HID device, the host=
 starts<br>
&gt;&gt; polling it and mouse and kbd start to work.<br>
&gt;<br>
&gt; It could be possible that the driver did not get to this point but onc=
e <br>
&gt; something else get&#39;s past that it recognises the device but I have=
 no idea <br>
&gt; how this works and not even sure which OS you had this result with. Is=
 this <br>
&gt; still 9.0.4? That&#39;s hard to debug because we don&#39;t know what i=
ts driver is <br>
&gt; doing.<br>
&gt;<br>
&gt; Is there a Darwin, OpenDarwin or whatever was that called during the y=
ears <br>
&gt; iso that boots on this machine (also on the real one)? That should be =
fully <br>
&gt; open source and probably have the same drivers as Mac OS X so reproduc=
ing <br>
&gt; with that could give some more info or maybe its driver is more verbos=
e about <br>
&gt; errors and has debugging. So you could try to find an early Darwin ver=
sion <br>
&gt; that&#39;s about the same time as early OS X versions or look at the I=
OHIDFamily <br>
&gt; and try to find what part of it is running when you see the logs (as t=
his <br>
&gt; driver is quite complex it may not be easy).<br>
<br>
The oldest Darwin CD I could find is 6.2 which boots and works so it&#39;s =
not <br>
old enough for us.<br>
<br>
The simplest driver is in the oldest 10.0 version so maybe we should try <b=
r>
to look at that:<br>
<br>
<a href=3D"https://github.com/apple-oss-distributions/IOHIDFamily/tree/IOHI=
DFamily-6" rel=3D"noreferrer" target=3D"_blank">https://github.com/apple-os=
s-distributions/IOHIDFamily/tree/IOHIDFamily-6</a><br>
<br>
and the low level part is in the xnu kernel:<br>
<br>
<a href=3D"https://github.com/apple-oss-distributions/xnu/tree/xnu-123.5/io=
kit/Families/IOHIDSystem" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/apple-oss-distributions/xnu/tree/xnu-123.5/iokit/Families/IOHIDSyste=
m</a><br>
<br>
I don&#39;t quite know how it works and where it starts running but a large=
 <br>
part of it looks like it handles key mapping. While booting I see an error =
<br>
from OpenBIOS saying:<br>
<br>
&gt;&gt; call-method slw_update_keymap failed with error ffffffdf<br>
<br>
Could this be related to the problem? What is this error about? This <br>
PearPC bug has some info on where it may come from:<br>
<br></blockquote><div><br></div><div>This seem to come from here:</div><div=
><a href=3D"https://web.archive.org/web/20150922180615/http://www.opensourc=
e.apple.com/source/BootX/BootX-45/bootx.tproj/ci.subproj/sl_words.c">https:=
//web.archive.org/web/20150922180615/http://www.opensource.apple.com/source=
/BootX/BootX-45/bootx.tproj/ci.subproj/sl_words.c</a></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<a href=3D"https://github.com/sebastianbiallas/pearpc/issues/4" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/sebastianbiallas/pearpc/issues=
/4</a><br>
<br>
but I don&#39;t know if any of this is relevant.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--000000000000f6b75005f339705e--

