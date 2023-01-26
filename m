Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72367D8CA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 23:50:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLB31-0006yk-Gr; Thu, 26 Jan 2023 17:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pLB2z-0006yE-4A; Thu, 26 Jan 2023 17:48:45 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pLB2x-0004eM-3W; Thu, 26 Jan 2023 17:48:44 -0500
Received: by mail-ej1-x62f.google.com with SMTP id kt14so9215711ejc.3;
 Thu, 26 Jan 2023 14:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n3PhndVbubjWkacpJY//Lj1flNNeaFtg3RFtIK+akNQ=;
 b=IymeC21yaWQZyVeifOzaQZGwGMm80HPw9Je78yc95sLND8pbbbbSL/58ptkEN+Lu8b
 fJ+8sfTzi9/i92xLPj3eKAOPQo2lmFFHr5q1rFfOHVI4Ulf1w+TIvnyrZtJpOCwRyS07
 c8KCQyMMqWVgJj+37kQ935Cv067M8qSo7kbKqD/nmp4g3jg6ci0BWJjjiK3DiTxoptXy
 KQEuNAlGfCaKEgCjbRPk8tkV8XaX00d3VqOjXFZO9sqS6ZKQ/Uwavmy+Qk9nGRNARV1/
 9SxaABta22YXG339ERUZtyY5pujjbnD7wEaB25s7oW7/pc6nzb+EjRbr7N6otaz54H3j
 Y7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3PhndVbubjWkacpJY//Lj1flNNeaFtg3RFtIK+akNQ=;
 b=CG3SBu1sKxI3SN08k1fzgGPCc2aaZjE8nUBl+sAaHuT5FbTxhEKfrbd4k9GsqWaye3
 jaVjmI8vIzRuDymh8FVM7lGIE1yGLK4Jn+p59PhvSAoIZ0EeBf1XYO7XB23Iu9qU8UQ1
 S9dY5mhkD9DLZb08134fAOX6VNWGFM0AfORfYjaFs7V0KdpmHVznPpl9AbcYTuT9cGpi
 glcI3PLJeFjkGCXSs6EpKy24L6L419o3znDh8dq2W4CzR6m5UydLaue6AjT70XK18Dv7
 EsguJ9k2dMeu5FJJnyzMBeJN7YSwYJkXtHwBfrxvl868EbaQCOredkE6Z+gJcbO/hbWi
 kONg==
X-Gm-Message-State: AFqh2kq34zOxDGKZvBup9/95R9riLeHF5iq/ojr42e2AGzxFGc3QGJO1
 xWyeyvQRX0ZPPqV04z0ixiZxg1Owarx6nVqXV/Q=
X-Google-Smtp-Source: AMrXdXuypfVTgtQMCHc8SvWzi1GINCvvDclX14+H+lAbutX1Dq+MQjnPSQiEgW0NltGWq9UIdIv4Cwdtx4jJlPzWiTk=
X-Received: by 2002:a17:906:c315:b0:84d:3fa0:ee4f with SMTP id
 s21-20020a170906c31500b0084d3fa0ee4fmr3913293ejz.71.1674773319572; Thu, 26
 Jan 2023 14:48:39 -0800 (PST)
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
 <CABLmASFqzt8f_Qk8O_KvYOqSqeffsVVBaaknbUxL86Ch3VR3kA@mail.gmail.com>
 <f13d890c-35a7-53f9-0cb7-7903582043d1@eik.bme.hu>
In-Reply-To: <f13d890c-35a7-53f9-0cb7-7903582043d1@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 26 Jan 2023 23:48:28 +0100
Message-ID: <CABLmASGtRrmqgsySdUd97so8R0qY7gTAu4AUfGU_-7dc_xkauA@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000cae05605f3328c9b"
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

--000000000000cae05605f3328c9b
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 9:57 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Thu, 26 Jan 2023, Howard Spoelstra wrote:
> > Mac OS X
> > #10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
> > mouse. No recognition as HID device.
> > #10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point
> kbd
> > pcap shows normal interrupt operation and recognition as HID device
> > #10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point
> kbd
> > pcap shows normal interrupt operation and recognition as HID device
> > #10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
> > mouse. pcap shows no recognition as HID device.
> > #10.0 in both cases apple system profiler shows 2 usb buses but no
> devices.
>
> These are all the logs I get booting a 10.0 install iso with  mac99,via=pmu
>
> >> =============================================================
> >> OpenBIOS 1.1 [May 25 2022 20:04]
> >> Configuration device id QEMU version 1 machine id 1
> >> CPUs: 1
> >> Memory: 256M
> >> UUID: 00000000-0000-0000-0000-000000000000
> >> CPU type PowerPC,G4
> milliseconds isn't unique.
> >> switching to new context:
> >> call-method slw_update_keymap failed with error ffffffdf
> >> call-method slw_update_keymap failed with error ffffffdf
> usb_ohci_reset pci-ohci
> usb_ohci_stop pci-ohci: USB Suspended
> usb_ohci_set_ctl pci-ohci: new state 0x0
> usb_ohci_stop pci-ohci: USB Suspended
> usb_ohci_port_detach port #0
> usb_ohci_port_attach port #0
> usb_ohci_port_detach port #1
> usb_ohci_port_attach port #1
> dbdma_unassigned_flush: use of unassigned channel 0
> dbdma_unassigned_flush: use of unassigned channel 0
> usb_ohci_mem_write_bad_offset 0x30
> usb_ohci_set_ctl pci-ohci: new state 0x80
> usb_ohci_start pci-ohci: USB Operational
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_set_ctl pci-ohci: new state 0xc0
> usb_ohci_stop pci-ohci: USB Suspended
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_port_reset port #0
>
> It's probably OK until it restarts but the seems to be stopped. Anybody
> wants to have a look? Maybe start with finding what the states mean.
>
>
I get the same with two usb-ohci controllers (so 6 ports) running Mac OS
9.0.4:

usb_ohci_set_ctl pci-ohci: new state 0x80
usb_ohci_start pci-ohci: USB Operational
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_port_reset port #0
usb_ohci_port_reset port #0

So both usb mouse and kbd do not work.

the pcap file for the mouse stalls here:
12 0.007048 0.1.0 host USB 64 SET CONFIGURATION Response

However, when I use the usb probe tool from the USB DDK, to probe the buses
I see the host emit a get descriptor

13 115.761725 host 0.0.0 USB 64 GET DESCRIPTOR Request DEVICE
14 115.761803 0.0.0 host USB 72 GET DESCRIPTOR Response DEVICE
15 115.773719 host 0.0.0 USB 64 SET ADDRESS Request
 etc. and this time the mouse is recognised as HID device, the host starts
polling it and mouse and kbd start to work.

Best,
Howard

--000000000000cae05605f3328c9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 26, 2023 at 9:57 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, 26 Jan 2023, Howard Spoelstra wrote:<br>
&gt; Mac OS X<br>
&gt; #10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to ad=
b<br>
&gt; mouse. No recognition as HID device.<br>
&gt; #10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that poin=
t kbd<br>
&gt; pcap shows normal interrupt operation and recognition as HID device<br=
>
&gt; #10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that poin=
t kbd<br>
&gt; pcap shows normal interrupt operation and recognition as HID device<br=
>
&gt; #10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to ad=
b<br>
&gt; mouse. pcap shows no recognition as HID device.<br>
&gt; #10.0 in both cases apple system profiler shows 2 usb buses but no dev=
ices.<br>
<br>
These are all the logs I get booting a 10.0 install iso with=C2=A0 mac99,vi=
a=3Dpmu<br>
<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; OpenBIOS 1.1 [May 25 2022 20:04]<br>
&gt;&gt; Configuration device id QEMU version 1 machine id 1<br>
&gt;&gt; CPUs: 1<br>
&gt;&gt; Memory: 256M<br>
&gt;&gt; UUID: 00000000-0000-0000-0000-000000000000<br>
&gt;&gt; CPU type PowerPC,G4<br>
milliseconds isn&#39;t unique.<br>
&gt;&gt; switching to new context:<br>
&gt;&gt; call-method slw_update_keymap failed with error ffffffdf<br>
&gt;&gt; call-method slw_update_keymap failed with error ffffffdf<br>
usb_ohci_reset pci-ohci<br>
usb_ohci_stop pci-ohci: USB Suspended<br>
usb_ohci_set_ctl pci-ohci: new state 0x0<br>
usb_ohci_stop pci-ohci: USB Suspended<br>
usb_ohci_port_detach port #0<br>
usb_ohci_port_attach port #0<br>
usb_ohci_port_detach port #1<br>
usb_ohci_port_attach port #1<br>
dbdma_unassigned_flush: use of unassigned channel 0<br>
dbdma_unassigned_flush: use of unassigned channel 0<br>
usb_ohci_mem_write_bad_offset 0x30<br>
usb_ohci_set_ctl pci-ohci: new state 0x80<br>
usb_ohci_start pci-ohci: USB Operational<br>
usb_ohci_hub_power_up powered up all ports<br>
usb_ohci_hub_power_up powered up all ports<br>
usb_ohci_set_ctl pci-ohci: new state 0xc0<br>
usb_ohci_stop pci-ohci: USB Suspended<br>
usb_ohci_hub_power_up powered up all ports<br>
usb_ohci_hub_power_up powered up all ports<br>
usb_ohci_port_reset port #0<br>
<br>
It&#39;s probably OK until it restarts but the seems to be stopped. Anybody=
 <br>
wants to have a look? Maybe start with finding what the states mean.<br>
<br></blockquote><div><br></div><div>I get the same with two usb-ohci contr=
ollers (so 6 ports) running Mac OS 9.0.4:</div><div><br></div><div>usb_ohci=
_set_ctl pci-ohci: new state 0x80<br>usb_ohci_start pci-ohci: USB Operation=
al<br>usb_ohci_hub_power_up powered up all ports<br>usb_ohci_hub_power_up p=
owered up all ports<br>usb_ohci_hub_power_up powered up all ports<br>usb_oh=
ci_hub_power_up powered up all ports<br>usb_ohci_hub_power_up powered up al=
l ports<br>usb_ohci_hub_power_up powered up all ports<br>usb_ohci_port_rese=
t port #0<br>usb_ohci_port_reset port #0</div><div><br></div><div>So both u=
sb mouse and kbd do not work.</div><div><br></div><div>the pcap file for th=
e mouse stalls here:</div><div>12	0.007048	0.1.0	host	USB	64	SET CONFIGURAT=
ION Response</div><div><br></div><div>However, when I use the usb probe too=
l from the USB DDK, to probe the buses I see the host emit a get descriptor=
 <br></div><div><br></div><div>13	115.761725	host	0.0.0	USB	64	GET DESCRIPT=
OR Request DEVICE</div><div>14	115.761803	0.0.0	host	USB	72	GET DESCRIPTOR =
Response DEVICE</div><div>15	115.773719	host	0.0.0	USB	64	SET ADDRESS Reque=
st</div><div>=C2=A0etc. and this time the mouse is recognised as HID device=
, the host starts polling it and mouse and kbd start to work.</div><div><br=
></div><div>Best,</div><div>Howard<br></div></div></div>

--000000000000cae05605f3328c9b--

