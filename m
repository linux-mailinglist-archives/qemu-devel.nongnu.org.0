Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85067DA31
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 01:07:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLCGF-00046O-KT; Thu, 26 Jan 2023 19:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pLCG9-00043u-UM; Thu, 26 Jan 2023 19:06:26 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pLCG3-00058h-5s; Thu, 26 Jan 2023 19:06:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5AE60746361;
 Fri, 27 Jan 2023 01:03:49 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1865474634B; Fri, 27 Jan 2023 01:03:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 161B97457E7;
 Fri, 27 Jan 2023 01:03:49 +0100 (CET)
Date: Fri, 27 Jan 2023 01:03:49 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASGtRrmqgsySdUd97so8R0qY7gTAu4AUfGU_-7dc_xkauA@mail.gmail.com>
Message-ID: <98430ad5-dedf-9ece-211a-1978d86dd0a5@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
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
 <CABLmASGtRrmqgsySdUd97so8R0qY7gTAu4AUfGU_-7dc_xkauA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Thu, 26 Jan 2023, Howard Spoelstra wrote:
> On Thu, Jan 26, 2023 at 9:57 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Thu, 26 Jan 2023, Howard Spoelstra wrote:
>>> Mac OS X
>>> #10.0 bus1 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
>>> mouse. No recognition as HID device.
>>> #10.0 bus2 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point
>> kbd
>>> pcap shows normal interrupt operation and recognition as HID device
>>> #10.0 bus1 kbd: usb_ohci_stop pci-ohci: USB Suspended. Up to that point
>> kbd
>>> pcap shows normal interrupt operation and recognition as HID device
>>> #10.0 bus2 mouse: usb_ohci_stop pci-ohci: USB Suspended. Reverts to adb
>>> mouse. pcap shows no recognition as HID device.
>>> #10.0 in both cases apple system profiler shows 2 usb buses but no
>> devices.
>>
>> These are all the logs I get booting a 10.0 install iso with  mac99,via=pmu
>>
>>>> =============================================================
>>>> OpenBIOS 1.1 [May 25 2022 20:04]
>>>> Configuration device id QEMU version 1 machine id 1
>>>> CPUs: 1
>>>> Memory: 256M
>>>> UUID: 00000000-0000-0000-0000-000000000000
>>>> CPU type PowerPC,G4
>> milliseconds isn't unique.
>>>> switching to new context:
>>>> call-method slw_update_keymap failed with error ffffffdf
>>>> call-method slw_update_keymap failed with error ffffffdf
>> usb_ohci_reset pci-ohci
>> usb_ohci_stop pci-ohci: USB Suspended
>> usb_ohci_set_ctl pci-ohci: new state 0x0
>> usb_ohci_stop pci-ohci: USB Suspended
>> usb_ohci_port_detach port #0
>> usb_ohci_port_attach port #0
>> usb_ohci_port_detach port #1
>> usb_ohci_port_attach port #1
>> dbdma_unassigned_flush: use of unassigned channel 0
>> dbdma_unassigned_flush: use of unassigned channel 0
>> usb_ohci_mem_write_bad_offset 0x30
>> usb_ohci_set_ctl pci-ohci: new state 0x80
>> usb_ohci_start pci-ohci: USB Operational
>> usb_ohci_hub_power_up powered up all ports
>> usb_ohci_hub_power_up powered up all ports
>> usb_ohci_set_ctl pci-ohci: new state 0xc0
>> usb_ohci_stop pci-ohci: USB Suspended
>> usb_ohci_hub_power_up powered up all ports
>> usb_ohci_hub_power_up powered up all ports
>> usb_ohci_port_reset port #0
>>
>> It's probably OK until it restarts but the seems to be stopped. Anybody
>> wants to have a look? Maybe start with finding what the states mean.
>>
>>
> I get the same with two usb-ohci controllers (so 6 ports) running Mac OS
> 9.0.4:
>
> usb_ohci_set_ctl pci-ohci: new state 0x80
> usb_ohci_start pci-ohci: USB Operational
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_hub_power_up powered up all ports
> usb_ohci_port_reset port #0
> usb_ohci_port_reset port #0
>
> So both usb mouse and kbd do not work.
>
> the pcap file for the mouse stalls here:
> 12 0.007048 0.1.0 host USB 64 SET CONFIGURATION Response

Maybe the driver gets something from the emulated HID device that it 
cannot handle and stops during init? Can you reproduce the same with OS X 
10.0 and try to correlate the events you see in pcap and trace with the 
driver source or find out how to enable and read the messages in the 
driver (unless these are stripped from the binary in Mac OS X but maybe 
there's something in the guest logs; ave you checked those?) In QEMU the 
usb-kbd and mouse are implemented in hw/usb/dev-hid.c but this file does 
not have any debuging or traces. You might try to add some printfs for 
testing.

> However, when I use the usb probe tool from the USB DDK, to probe the buses
> I see the host emit a get descriptor
>
> 13 115.761725 host 0.0.0 USB 64 GET DESCRIPTOR Request DEVICE
> 14 115.761803 0.0.0 host USB 72 GET DESCRIPTOR Response DEVICE
> 15 115.773719 host 0.0.0 USB 64 SET ADDRESS Request
> etc. and this time the mouse is recognised as HID device, the host starts
> polling it and mouse and kbd start to work.

It could be possible that the driver did not get to this point but once 
something else get's past that it recognises the device but I have no idea 
how this works and not even sure which OS you had this result with. Is 
this still 9.0.4? That's hard to debug because we don't know what its 
driver is doing.

Is there a Darwin, OpenDarwin or whatever was that called during the years 
iso that boots on this machine (also on the real one)? That should be 
fully open source and probably have the same drivers as Mac OS X so 
reproducing with that could give some more info or maybe its driver is 
more verbose about errors and has debugging. So you could try to find an 
early Darwin version that's about the same time as early OS X versions or 
look at the IOHIDFamily and try to find what part of it is running when 
you see the logs (as this driver is quite complex it may not be easy).

Regards,
BALATON Zoltan

