Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371D42D883
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 13:48:26 +0200 (CEST)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazDl-0008KZ-7y
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 07:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mazAR-0006n0-4M; Thu, 14 Oct 2021 07:45:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49232
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mazAN-0000iI-9s; Thu, 14 Oct 2021 07:44:58 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1maz9x-0003pB-Jk; Thu, 14 Oct 2021 12:44:33 +0100
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2642fe45-16af-0281-92e1-e1fc68b1069b@csgroup.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <874bab13-a7f9-9449-2285-19731da2947c@ilande.co.uk>
Date: Thu, 14 Oct 2021 12:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2642fe45-16af-0281-92e1-e1fc68b1069b@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/2021 11:47, Christophe Leroy wrote:

> Le 14/10/2021 à 12:34, Christophe Leroy a écrit :
>>
>>
>> Le 14/10/2021 à 11:31, Thomas Huth a écrit :
>>>
>>>   Hi,
>>>
>>> I tried to build a current Linux kernel for the "bamboo" board and use it in QEMU, 
>>> but QEMU then quickly aborts with:
>>>
>>>   pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
>>>
>>> (or with a "DCR write error" if I try to use the cuImage instead).
>>>
>>> I googled a little bit and found this discussion:
>>>
>>> https://qemu-devel.nongnu.narkive.com/vYHona3u/emulating-powerpc-440ep-with-qemu-system-ppcemb#post2 
>>>
>>>
>>> Seems like this board was used for KVM on the PPC440 only, and has never been 
>>> enabled with the TCG emulation?
>>>
>>> Well, KVM support on the 440 has been removed years ago already:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2677b8dd8de0dc1496ede4da09b9dfd59f15cea 
>>>
>>>
>>> So is this "bamboo" board dead code in QEMU now? Or does anybody still have a 
>>> kernel binary which could be used for testing it? Note: This board does not 
>>> support "-bios", so u-boot or other firmwares are certainly also not an option 
>>> here...
>>> Should we mark "bamboo" as deprecated nowadays?
>>>
>>
>> I have the following change in QEMU to be able to run the bamboo, found it some 
>> time ago via google (can't remember where):
>>
>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>> index 8147ba6f94..600e89e791 100644
>> --- a/hw/ppc/ppc4xx_pci.c
>> +++ b/hw/ppc/ppc4xx_pci.c
>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>>
>>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>
>> -    return slot - 1;
>> +    return slot ? slot - 1 : slot;
>>   }
>>
>>   static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>> ---
>>
>> It's probably no the final change, but at least it allows booting bamboo on qemu 
>> again.
>>
> 
> Found the source : https://www.mail-archive.com/qemu-devel@nongnu.org/msg769121.html

Ah yes, that thread rings a bell. I think the important part was in my initial reply 
at https://www.mail-archive.com/qemu-devel@nongnu.org/msg769115.html: in other words 
ppc4xx_pci_map_irq() function expects the IRQ number to range from 1 to 4.

When I looked at this the issue was caused by the guest writing to PCI configuration 
space to disable PCI interrupts: this ends up calling pci_update_irq_disabled() as below:

/* Called after interrupt disabled field update in config space,
  * assert/deassert interrupts if necessary.
  * Gets original interrupt disable bit value (before update). */
static void pci_update_irq_disabled(PCIDevice *d, int was_irq_disabled)
{
     int i, disabled = pci_irq_disabled(d);
     if (disabled == was_irq_disabled)
         return;
     for (i = 0; i < PCI_NUM_PINS; ++i) {
         int state = pci_irq_state(d, i);
         pci_change_irq_level(d, i, disabled ? -state : state);
     }
}

Since the IRQ is disabled pci_change_irq_level() ends up being called with -1 which 
triggers the assert().

My feeling is that the existing assert() is correct, since from what I can see 
without it there would be an IRQ array underflow, however I wasn't sure whether 
passing a negative number to pci_change_irq_level() is supposed to be valid?


ATB,

Mark.

