Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA867CD87
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:19:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL35e-0008Od-UT; Thu, 26 Jan 2023 09:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pL35Y-0008Nv-NC; Thu, 26 Jan 2023 09:18:52 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pL35W-00075H-1A; Thu, 26 Jan 2023 09:18:52 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A9398746361;
 Thu, 26 Jan 2023 15:16:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A686C74634B; Thu, 26 Jan 2023 15:16:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A48537457E7;
 Thu, 26 Jan 2023 15:16:19 +0100 (CET)
Date: Thu, 26 Jan 2023 15:16:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASFqzt8f_Qk8O_KvYOqSqeffsVVBaaknbUxL86Ch3VR3kA@mail.gmail.com>
Message-ID: <6bf1e427-311a-1d96-e84a-ab65f62b8b48@eik.bme.hu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 26 Jan 2023, Howard Spoelstra wrote:
> I tested all Mac OS/OSX available to me with mouse and kbd alternately
> connected to usb-bus1 or usb-bus2.
>
> ./qemu-system-ppc \
> -M mac99,usb=off \
> -L pc-bios \
> -boot c \
> -prom-env "auto-boot?=true" \
> -display gtk -monitor stdio \
> -drive file=/home/hsp/Mac-disks/9.0.4.img,format=raw,media=disk \
> -device pci-ohci,id=usb-bus1 \
> -device pci-ohci,id=usb-bus2 \
> -device usb-mouse,bus=usb-bus1.0,pcap=9.0.4_p1_mouse-2usb.pcap \
> -device usb-kbd,bus=usb-bus2.0,pcap=9.0.4_p2_kbd-2usb.pcap \
> -device sungem,netdev=network01 -netdev user,id=network01 \
> -trace "usb_ohci*"
>
> These are the results:
>
> Mac OS:
> #9.0.4 bus1 kbd: works up to usb_ohci_port_reset port #0 in trace, pcap
> shows normal operation and recognition as HID device .
> #9.0.4 bus2 mouse. Reverts to adb mouse. No recognition as HID device.
> #9.0.4 bus1 mouse: usb_ohci_port_reset port #0 (twice). No further traffic
> in trace. Reverts to adb mouse. No recognition as HID device.
> #9.0.4 bus2 kbd then no longer works (due to reset?)
>
> I attempted to replace the 9.0.4 disk based USB drivers with the drivers
> from 9.1, which did not work.
>
> #9.1/9.2: mouse and kbd work on both buses. Profiler shows 2 buses with one
> device each.
>
> Mac OS X
> #10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
> mouse. No recognition as HID device.
> #10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point kbd
> pcap shows normal interrupt operation and recognition as HID device
> #10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point kbd
> pcap shows normal interrupt operation and recognition as HID device
> #10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
> mouse. pcap shows no recognition as HID device.
> #10.0 in both cases apple system profiler shows 2 usb buses but no devices.
>
>
> #10.1 bus1 mouse: pcap shows normal interrupt operation and recognition as
> HID device, trace shows continuous traffic
> #10.1 bus2 kbd: works. pcap shows normal interrupt operation and
> recognition as HID device, trace shows continuous traffic
> #10.1 bus1 kbd: works. pcap shows normal interrupt operation and
> recognition as HID device, trace shows continuous traffic
> #10.1 bus2 mouse: pcap shows normal interrupt operation and recognition as
> HID device, trace shows continuous traffic
> #10.1 Mouse does not move on desktop, but trace shows packets flow.
>
> #10.2/10.3/10.4/10.5 mouse and kbd work on both buses. Profiler shows 2
> buses with one device each.

Maybe we need a bit more details from around the point the traces start to 
differ between the versions and about 10-20 lines before it srops and 
10-20 lines after (around) that point with versions that work for 
comparison. It seems the versions that don't work get some error and the 
OHCI device stops or it's something around reset as the suspend is also 
called from there. But we need to locate more where is it in the driver to 
be able to tell what's happening. Maybe also add -trace enable="usb_ohci*" 
-trace enable="usb_port*" and try to correlate what the driver is doing 
by that. The OS X driver sources are available at

https://github.com/apple-oss-distributions/IOHIDFamily

the versions correslonding to OS releases are at

https://opensource.apple.com/releases/

10.1.x had 8.3 and 10.2 had version 33 of this driver but new in 10.2 was

https://github.com/apple-oss-distributions/IOUSBFamily/tree/IOUSBFamily-190.4.1

so it seems there was some bigger change in USB handling between those 
versions. Darwin sources may have more detailed info but I don't know 
where to find those.

> 10.0 and 9.0.4 seem to suffer the same issue (mouse not communicating as a
> HID device, but 10.1 seems to have another issue.
>
> Attempts to run Mac OS X ioreg show that it fails in that it cannot read
> the full registry.
> This was already noticed here:
> https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg05260.html

If this is related to the NVRAM format as speculated in later that thread:

https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg05315.html

Then that format is also documented in the sources:

https://github.com/apple-oss-distributions/AppleCore99NVRAM

and there are other emulators that implement it:

https://github.com/dingusdev/dingusppc/blob/master/devices/common/ofnvram.cpp

so this should be easy to fix. Ask Mark to do that in QEMU and OpenBIOS or 
let somebody do it without making a fuss about it. (If we could boot these 
OSes with a firmware ROM from the real machine we could verify if it's a 
problem with NVRAM format or something else. Maybe I should try OS X on 
g3beige but it currently stops in Toolbox ROM before display is up or 
accessing CD so not sure if OS X could boor. If it does not need Toolbox 
just OpenFirmware maybe it could work but I haven't tried yet. What's a 
good version of OS X to run on a real G3 beige?)

> -Ioreg from a real G4 running 10.4 and output from the PCI DDK name
> registry tool from a real G4 running 9.0.4 and from Qemu running 9.0.4, 9.1
> and 9.2 are available here:
> https://surfdrive.surf.nl/files/index.php/s/1wcC3GGaagqKVpj/download

This ioreg output is truncated. Use ioreg -w 0 -l to get a full output.

Regards,
BALATON Zoltan

