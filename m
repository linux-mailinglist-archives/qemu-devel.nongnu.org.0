Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F742D99C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:00:20 +0200 (CEST)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0LL-0005lF-Hj
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb0JC-0004DV-GO; Thu, 14 Oct 2021 08:58:07 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:24464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb0J8-0002CK-F1; Thu, 14 Oct 2021 08:58:05 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9A8AA748F56;
 Thu, 14 Oct 2021 14:57:57 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6562C746333; Thu, 14 Oct 2021 14:57:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 642317462D3;
 Thu, 14 Oct 2021 14:57:57 +0200 (CEST)
Date: Thu, 14 Oct 2021 14:57:57 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
In-Reply-To: <874bab13-a7f9-9449-2285-19731da2947c@ilande.co.uk>
Message-ID: <f426a823-56f6-cf41-5516-65bedc144552@eik.bme.hu>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2642fe45-16af-0281-92e1-e1fc68b1069b@csgroup.eu>
 <874bab13-a7f9-9449-2285-19731da2947c@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-580767832-1634215788=:97421"
Content-ID: <8255a0ed-49c6-956d-1c8b-3c5de152c39f@eik.bme.hu>
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org, clg@kaod.org,
 hpoussin@reactos.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-580767832-1634215788=:97421
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <2fd7e481-6e63-7fc6-9bca-aad9678e89e9@eik.bme.hu>

On Thu, 14 Oct 2021, Mark Cave-Ayland wrote:
> On 14/10/2021 11:47, Christophe Leroy wrote:
>> Le 14/10/2021 à 12:34, Christophe Leroy a écrit :
>>> Le 14/10/2021 à 11:31, Thomas Huth a écrit :
>>>> 
>>>>   Hi,
>>>> 
>>>> I tried to build a current Linux kernel for the "bamboo" board and use it 
>>>> in QEMU, but QEMU then quickly aborts with:
>>>> 
>>>>   pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
>>>> 
>>>> (or with a "DCR write error" if I try to use the cuImage instead).
>>>> 
>>>> I googled a little bit and found this discussion:
>>>> 
>>>> https://qemu-devel.nongnu.narkive.com/vYHona3u/emulating-powerpc-440ep-with-qemu-system-ppcemb#post2 
>>>> 
>>>> Seems like this board was used for KVM on the PPC440 only, and has never 
>>>> been enabled with the TCG emulation?
>>>> 
>>>> Well, KVM support on the 440 has been removed years ago already:
>>>> 
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2677b8dd8de0dc1496ede4da09b9dfd59f15cea 
>>>> 
>>>> So is this "bamboo" board dead code in QEMU now? Or does anybody still 
>>>> have a kernel binary which could be used for testing it? Note: This board 
>>>> does not support "-bios", so u-boot or other firmwares are certainly also 
>>>> not an option here...
>>>> Should we mark "bamboo" as deprecated nowadays?
>>>> 
>>> 
>>> I have the following change in QEMU to be able to run the bamboo, found it 
>>> some time ago via google (can't remember where):
>>> 
>>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>>> index 8147ba6f94..600e89e791 100644
>>> --- a/hw/ppc/ppc4xx_pci.c
>>> +++ b/hw/ppc/ppc4xx_pci.c
>>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int 
>>> irq_num)
>>> 
>>>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>> 
>>> -    return slot - 1;
>>> +    return slot ? slot - 1 : slot;
>>>   }
>>> 
>>>   static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>> ---
>>> 
>>> It's probably no the final change, but at least it allows booting bamboo 
>>> on qemu again.
>>> 
>> 
>> Found the source : 
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769121.html
>
> Ah yes, that thread rings a bell. I think the important part was in my 
> initial reply at 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769115.html: in other 
> words ppc4xx_pci_map_irq() function expects the IRQ number to range from 1 to 
> 4.
>
> When I looked at this the issue was caused by the guest writing to PCI 
> configuration space to disable PCI interrupts: this ends up calling 
> pci_update_irq_disabled() as below:
>
> /* Called after interrupt disabled field update in config space,
> * assert/deassert interrupts if necessary.
> * Gets original interrupt disable bit value (before update). */
> static void pci_update_irq_disabled(PCIDevice *d, int was_irq_disabled)
> {
>    int i, disabled = pci_irq_disabled(d);
>    if (disabled == was_irq_disabled)
>        return;
>    for (i = 0; i < PCI_NUM_PINS; ++i) {
>        int state = pci_irq_state(d, i);
>        pci_change_irq_level(d, i, disabled ? -state : state);
>    }
> }
>
> Since the IRQ is disabled pci_change_irq_level() ends up being called with -1 
> which triggers the assert().
>
> My feeling is that the existing assert() is correct, since from what I can 
> see without it there would be an IRQ array underflow, however I wasn't sure 
> whether passing a negative number to pci_change_irq_level() is supposed to be 
> valid?

A comment from Peter Maydell in hw/ppc/ppc440_pcix.c which is similar code 
for sam460ex says:

/*
  * All four IRQ[ABCD] pins from all slots are tied to a single board
  * IRQ, so our mapping function here maps everything to IRQ 0.
  * The code in pci_change_irq_level() tracks the number of times
  * the mapped IRQ is asserted and deasserted, so if multiple devices
  * assert an IRQ at the same time the behaviour is correct.
  *
  * This may need further refactoring for boards that use multiple IRQ lines.
  */
static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)

So I guess negative values could be valid to mean decrease the number of 
times this was raised but I'm not sure. The sam460ex maps all PCI 
interrupts to a single IRQ so this function just returns 0 and let the 
hw/pci/pci.c deal with the rest. Something similar might work for 440ep 
but don't know what the real hardware does. I could not find any 
explanation or IRQ mapping in the data sheets I have on 440ep but this may 
be specific to the bamboo board and we don't have much info on that.

Regards,
BALATON Zoltan
--3866299591-580767832-1634215788=:97421--

