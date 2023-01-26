Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2567D6F6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9Jd-0002PS-GT; Thu, 26 Jan 2023 15:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pL9JY-0002Mm-Vq; Thu, 26 Jan 2023 15:57:45 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pL9JP-0000iQ-85; Thu, 26 Jan 2023 15:57:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A22E7746361;
 Thu, 26 Jan 2023 21:55:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 673F07457E7; Thu, 26 Jan 2023 21:55:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 64F3F745706;
 Thu, 26 Jan 2023 21:55:05 +0100 (CET)
Date: Thu, 26 Jan 2023 21:55:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASFqzt8f_Qk8O_KvYOqSqeffsVVBaaknbUxL86Ch3VR3kA@mail.gmail.com>
Message-ID: <f13d890c-35a7-53f9-0cb7-7903582043d1@eik.bme.hu>
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

These are all the logs I get booting a 10.0 install iso with  mac99,via=pmu

>> =============================================================
>> OpenBIOS 1.1 [May 25 2022 20:04]
>> Configuration device id QEMU version 1 machine id 1
>> CPUs: 1
>> Memory: 256M
>> UUID: 00000000-0000-0000-0000-000000000000
>> CPU type PowerPC,G4
milliseconds isn't unique.
>> switching to new context:
>> call-method slw_update_keymap failed with error ffffffdf
>> call-method slw_update_keymap failed with error ffffffdf
usb_ohci_reset pci-ohci
usb_ohci_stop pci-ohci: USB Suspended
usb_ohci_set_ctl pci-ohci: new state 0x0
usb_ohci_stop pci-ohci: USB Suspended
usb_ohci_port_detach port #0
usb_ohci_port_attach port #0
usb_ohci_port_detach port #1
usb_ohci_port_attach port #1
dbdma_unassigned_flush: use of unassigned channel 0
dbdma_unassigned_flush: use of unassigned channel 0
usb_ohci_mem_write_bad_offset 0x30
usb_ohci_set_ctl pci-ohci: new state 0x80
usb_ohci_start pci-ohci: USB Operational
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_set_ctl pci-ohci: new state 0xc0
usb_ohci_stop pci-ohci: USB Suspended
usb_ohci_hub_power_up powered up all ports
usb_ohci_hub_power_up powered up all ports
usb_ohci_port_reset port #0

It's probably OK until it restarts but the seems to be stopped. Anybody 
wants to have a look? Maybe start with finding what the states mean.

Regards,
BALATON Zoltan

