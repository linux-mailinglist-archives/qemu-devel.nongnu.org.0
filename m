Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07269687E8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 13:11:01 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmysm-0002Mz-5n
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 07:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46103)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hmysQ-0001F4-Mk
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hmysM-0008CF-QU
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:10:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:21109)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1hmysJ-00088I-01; Mon, 15 Jul 2019 07:10:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 44D6C7456CA;
 Mon, 15 Jul 2019 13:10:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 25A2F74569D; Mon, 15 Jul 2019 13:10:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 212E47456CC;
 Mon, 15 Jul 2019 13:10:19 +0200 (CEST)
Date: Mon, 15 Jul 2019 13:10:19 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
In-Reply-To: <64dd9cd5-8599-b157-3ba2-0ec565cee709@redhat.com>
Message-ID: <alpine.BSF.2.21.9999.1907151309190.6546@zero.eik.bme.hu>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-3-philmd@redhat.com>
 <alpine.BSF.2.21.9999.1907151251210.6546@zero.eik.bme.hu>
 <64dd9cd5-8599-b157-3ba2-0ec565cee709@redhat.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH-for-4.2 2/3] hw/usb/Kconfig: Add
 CONFIG_USB_EHCI_PCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jul 2019, Thomas Huth wrote:
> On 15/07/2019 12.54, BALATON Zoltan wrote:
>> On Mon, 15 Jul 2019, Philippe Mathieu-Daud=C3=A9 wrote:
>>> The USB_EHCI entry currently include PCI code. Since the EHCI
>>> implementation is already split in sysbus/PCI, add a new
>>> USB_EHCI_PCI. There are no logical changes, but the Kconfig
>>> dependencies tree is cleaner.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> hw/usb/Kconfig?????? | 9 ++++++---
>>> hw/usb/Makefile.objs | 5 +++--
>>> 2 files changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
>>> index 564305e283..495c6f2d48 100644
>>> --- a/hw/usb/Kconfig
>>> +++ b/hw/usb/Kconfig
>>> @@ -19,13 +19,16 @@ config USB_OHCI_PCI
>>>
>>> config USB_EHCI
>>> ??? bool
>>> -??? default y if PCI_DEVICES
>>> -??? depends on PCI
>>> ??? select USB
>>>
>>> +config USB_EHCI_PCI
>>> +??? bool
>>> +??? default y if PCI_DEVICES
>>> +??? select USB_EHCI
>>> +
>>> config USB_EHCI_SYSBUS
>>> ??? bool
>>> -??? select USB
>>> +??? select USB_EHCI
>>
>> Isn't this making USB_EHCI effectively the same as USB so maybe you
>> don't need to keep that around any more. Can you just add select USB t=
o
>> USB_EHCI_PCI and USB_EHCI_SYSBUS and delete USB_EHCI?
>
> If you want to compile without USB_EHCI_PCI and without USB_EHCI_SYSBUS=
,
> but with USB (e.g. due to XHCI), I think we should not include
> hcd-ehci.o file in the build. So I think it's fine that we have a
> separate config switch for this file.

So shouldn't build depend on either USB_EHCI_PCI or USB_EHCI_SYSBUS=20
selected then?

Regards,
BALATON Zoltan
