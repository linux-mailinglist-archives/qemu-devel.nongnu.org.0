Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A93F96B5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:16:06 +0200 (CEST)
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJXxr-0002At-FD
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJXwu-0001Ud-9T
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:14:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50658
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJXws-0001l0-IH
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 05:14:56 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mJXwM-0002HU-Up; Fri, 27 Aug 2021 10:14:29 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210826200720.2196827-1-philmd@redhat.com>
 <20210826200720.2196827-4-philmd@redhat.com>
 <b8842325-cf0c-31f6-a4ba-68890eea4e49@ilande.co.uk>
 <CAFEAcA-fn4L9mSqvq+fQ9FhNnvAYv5gJmRMGYbQJNdJ15h81Lg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <44d7475b-0d4a-58e0-59e1-bba24cb1ca7e@ilande.co.uk>
Date: Fri, 27 Aug 2021 10:14:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-fn4L9mSqvq+fQ9FhNnvAYv5gJmRMGYbQJNdJ15h81Lg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 3/3] hw/usb/xhci: Always expect 'dma' link property to
 be set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/08/2021 09:54, Peter Maydell wrote:

>> In a way I could see why you may wish to explicitly set the DMA memory region, but a
>> quick look around suggests that devices where the memory region is unspecified
>> (typically using a link property called "dma_mr") then the default is assumed to be
>> get_system_memory(). That seems a reasonably intuitive default to me, but presumably
>> there is another type of mistake you're trying to guard against here?
> 
> Mostly we have allowed a default for "dma link not set" as a transitional
> thing. When we added the 'dma' links to a device which had multiple users
> and we didn't at the time want to go through and modify all those users to
> make sure they all set the link, we made the device default if the link
> wasn't set be "behave the same way the device behaved before we added support
> for the link property". I think it's useful cleanup to get rid of the
> back-compat
> default -- from a theoretical perspective devices should mostly not
> be directly grabbing and using the system_memory.

Ah so the plan moving forward is to always have an explicit MR passed in for DMA use. 
Sorry if I missed that in earlier versions of the patchset, I'm still getting back up 
to speed on QEMU hacking.

Was there a decision as to what the property name should be? I see "dma_mr" used 
quite a bit, and if there will be more patches to remove the system_memory default 
from other devices then it would be nice to try and use the same name everywhere.

>>> @@ -43,13 +48,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
>>>        s->irq = g_new0(qemu_irq, s->xhci.numintrs);
>>>        qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
>>>                                 s->xhci.numintrs);
>>> -    if (s->xhci.dma_mr) {
>>> -        s->xhci.as =  g_malloc0(sizeof(AddressSpace));
>>> -        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
>>> -    } else {
>>> -        s->xhci.as = &address_space_memory;
>>> -    }
>>> -
>>> +    address_space_init(&s->xhci.as, s->xhci.dma_mr, "usb-xhci-dma");
>>>        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
>>>    }
>>
>> My understanding of the patch is that you're trying to avoid the heap allocation
>> above (which is a good idea!) so from that perspective all you need is somewhere to
>> store the AddressSpace used for the the xhci-sysbus device, for which XHCISysbusState
>> would be the natural choice.
>>
>> It seems to me that the easiest approach is just to set the s->xhci.as pointer in
>> xhci_sysbus_realize() in exactly the same as usb_xhci_pci_realize() does:
>>
>> typedef struct XHCISysbusState {
>>       ...
>>       ...
>>       AddressSpace as;
>> } XHCISysbusState
>>
>> static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
>> {
>>       XHCISysbusState *s = XHCI_SYSBUS(dev);
>>       ...
>>       ...
>>       address_space_init(&s->as, s->xhci.dma_mr ? s->xhci.dma_mr : get_system_memory(),
>>                          "usb-xhci-dma");
>>       s->xhci.as = &s->as;
>> }
>>
>> I think this approach is clearer since the xhci-sysbus device always creates its own
>> address space which is either an alias onto normal system memory or the custom
>> MemoryRegion provided via the "dma_mr" link property.
> 
> I don't think we should continue to provide the back-compat fallback
> for "no link property set", but I agree that we should have
> have s->xhci.as = &s->as. This means that for the PCI case we can
> continue to set s->xhci.as = pci_address_space(), so the other patch
> that exposes the root MR of the PCI AS then becomes unneeded.


ATB,

Mark.

