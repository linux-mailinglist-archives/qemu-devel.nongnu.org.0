Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B092A6B671B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 15:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbMSf-0005Uv-DT; Sun, 12 Mar 2023 10:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pbMSd-0005UX-2G
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 10:14:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pbMSb-0005rA-5o
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 10:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vpeJQLu/bKMunTvAW3oyAs7lueERzEzsJ5v7WUxnlZY=; b=UVx6LPslk+GZxB2VyZiE7xscqD
 y7R3SxPUEJvTc0OvwtIPHp322SX0/fmIELdt56jiaHp0m0DJUMNPUI0iC5x3G4xBCyralLa/X0zTf
 W8kMtxD7Bdd+MyXhDGvcbCvYtkHyILWW0HeOxpa0HXYHoEICkFF++HXyxXGmjDiuQqx+X+TAYxq5H
 NviWZCllD6qIOdP4OiPdSzyDyu2+wJ1Lz9M19cds1xm7mYJWaKwBCGkG0qIhqPZbx8Y0JijU9Y541
 Uc2tmWsfQB0vemx76ALSMFVnLShk3sv/6XpLnOmp6uBkMNuzxUIexDymaexP5lN49Y7vqqt94cwGV
 n1t19/jX4Wt9ehkk9NZJq1azm8psuiwAGaVjtCRu6yhWPkuj/h7SvFcW+gIBf5Fsy2q0mRb7z/ow8
 xgovAIQKWoD3wjqp4RWb2fPpWkIAo/dvxKMLqOBoSw/ArmjKQPy8sxdOYHSojPNs4mpgfLY+Pne1E
 /8ZMt+NAwmpLUX7sdp4AD5KTwAwPNZ207gEjknl75rlJFMpFuEYB50uMNxGOlf2KjPwPeyYdurJph
 asEnq+sMxRehOVW48StltGxPauMCoMPTbAPucYwkkgGAmvjbR64/H7bfEarf2xjwbJex7uDCbC6nM
 RqlFShjg8/QGDNXWqltyUGvx7xWVGLfEzD2Jgpm5k=;
Received: from [2a00:23c4:8bac:200:3870:f067:8488:5afb]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pbMRt-000AcX-1n; Sun, 12 Mar 2023 14:13:21 +0000
Message-ID: <069eeb2b-5198-0bf9-c82c-ebc9beba956e@ilande.co.uk>
Date: Sun, 12 Mar 2023 14:13:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
 <2febd48f-c0e4-b5ee-4984-fac257417cef@ilande.co.uk>
 <4e31b40a-4db5-5cda-7e8c-4ef562fe107e@aol.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <4e31b40a-4db5-5cda-7e8c-4ef562fe107e@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:200:3870:f067:8488:5afb
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 06/03/2023 16:37, Chuck Zmudzinski wrote:

> On 1/28/2023 4:58 PM, Mark Cave-Ayland wrote:
>> On 28/01/2023 03:39, Chuck Zmudzinski wrote:
>>
>>> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
>>>> On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
>>>>> The current reserved slot check in do_pci_register_device(), added with
>>>>> commit 8b8849844fd6
>>>>
>>>> add ("subject here") please
>>>>
>>>>> ,is done even if the pci device being added is
>>>>> configured manually for a particular slot. The new property, when set
>>>>> to false, disables the check when the device is configured to request a
>>>>> particular slot. This allows an administrator or management tool to
>>>>> override slot_reserved_mask for a pci device by requesting a particular
>>>>> slot for the device. The new property is initialized to true which
>>>>> preserves the existing behavior of slot_reserved_mask by default.
>>>>>
>>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>>>
>>>> Thanks!
>>>> I'm trying to think of the best default for this.
> 
> Hi Michael and Mark,
> 
> The Xen maintainers pulled up the commit that reserves slot 2
> for the Intel IGD with the xenfv machine so we need to discuss
> how slot_reserved_mask should work with this change. The original
> version of the patch keeps the current default of always enforcing
> slot_reserved_mask, even if the administrator tries to configure the
> slots manually. So if we keep that behavior, we will need to patch
> the xenfv machine again to implement the desired behavior that
> slot_reserved_mask will only apply with automatic slot assignment
> for the xenfv machine. That would be a fairly trivial one-line patch
> to add on top of the patch the Xen maintainers just pulled up.
> 
> Another option is to change the default value of
> enforce_slot_reserved_mask_manual to false so slot_reserved_mask
> only affects automatic slot address assignment by default and then
> preserve the current behavior for the sun4u machine by patching the
> sun4u machine so the value of enforce_slot_reserved_mask_manual
> is true for the sun4u machine.
> 
>>>
>>> I think it would be better for the default value of
>>> enforce_slot_reserved_mask_manual to be false, so that a
>>> user-specified slot will by default override slot_reserved_mask.
>>> But doing that would change the current behavior of
>>> slot_reserved_mask.
>>>
>>> Currently, this is the only place where slot_reserved_mask is used in all
>>> of the Qemu source (code from hw/sparc64/sun4u.c):
>>>
>>> ------ snip -------
>>>       /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
>>>          reserved (leaving no slots free after on-board devices) however slots
>>>          0-3 are free on busB */
>>>       pci_bus->slot_reserved_mask = 0xfffffffc;
>>>       pci_busA->slot_reserved_mask = 0xfffffff1;
>>>       pci_busB->slot_reserved_mask = 0xfffffff0;
>>> ------ snip -------
>>>
>>> I think we could safely change the default value of
>>> enforce_slot_reserved_mask_manual to false but set
>>> it to true for the sparc64 sun4u board here to preserve
>>> the current behavior of the only existing board in Qemu
>>> that uses slot_reserved_mask.
>>>
>>> What do you think?
>>>
>>>> Users is trying to configure a specific device on a reserved
>>>> slot. Should we
>>>> CC a bunch more people for visibility. Input, anyone?
>>
>> For a bit of background, slot_reserved_mask was added by me to solve a problem with
>> the sun4u machine: on a real Ultra-5, the pci "A" bus has 2 free slots and the pci
>> "B" bus has 4 free slots. Whilst it is possible to plug a PCI device into any slot in
>> QEMU, the PCI bridges only have IRQ mapping registers for those 6 slots, so you can
>> easily end up with an auto-allocated slot where it is impossible for the OS to map
>> the IRQ.
>>
>> Hence slot_reserved_mask was originally intended to mark slots as being unavailable
>> for both manual and automatic allocation to ensure that devices plugged into both PCI
>> buses would always work.
> 
> Here is a third option:
> 
> Mark, would it be acceptable to replace the error in the case of manual
> allocation with a warning, so manual device assignment to a reserved slot
> in the sun4u machine would succeed (automatic assignment would still
> prevent the slot from being used) but there would be a warning message
> to provide the administrator/user with a clue that the current manual
> configuration of the device is not correct and could cause problems?
> 
> That would be a less aggressive change that could be implemented without
> needing to add the enforce_slot_reserved_mask_manual property to PCIBus.

Unfortunately in the sun4u case that doesn't quite work, since the PCI host bridge 
doesn't have IRQ routing registers for the reserved slots and so the card would still 
fail with a manual allocation.

In effect the reserved bit in its current implementation means "this slot is 
unavailable" which is the intended result for the original implementation. Certainly 
this logic would reduce the changes of creating an unusable setup from the command 
line, but then some management tools which manually allocates slots would still allow 
an unusable configuration.

> Also, Michael, I notice that the current usage of slot_reserved_mask violates
> the comment at the beginning of pci_bus.h that asks that the properties of
> PCIBus such as slot_reserved_mask be accessed via accessor functions in pci.h
> instead of directly accessing them. Should I also write v2 of the patch to add
> accessor functions for slot_reserved_mask so the accessor functions can be used
> instead of accessing slot_reserved_mask directly?
> 
> I will wait a little while for some feedback before posting v2 of this patch.

Another possibility could be to move the slot validation logic in 
do_pci_register_device() to a separate function, and add a new slot validation 
callback to PCIBusClass to be used by do_pci_register_device() instead. By default 
this would call the existing slot validation logic function.

It would then be possible to override the default slot validation function in the Xen 
case, perhaps even calling the existing logic first before adding your additional 
logic requirement on top.


ATB,

Mark.

