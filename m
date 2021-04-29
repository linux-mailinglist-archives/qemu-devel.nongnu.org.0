Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE52C36E2DF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 03:08:55 +0200 (CEST)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbvAk-0003yX-Dc
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 21:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lbv9M-0003XW-Tk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 21:07:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lbv95-0008TI-9f
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 21:07:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6A35A7457EF;
 Thu, 29 Apr 2021 03:07:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 42A547457E8; Thu, 29 Apr 2021 03:07:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 41A777457E7;
 Thu, 29 Apr 2021 03:07:07 +0200 (CEST)
Date: Thu, 29 Apr 2021 03:07:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: X on old (non-x86) Linux guests
In-Reply-To: <YIlmweq8zLIhN04l@work-vm>
Message-ID: <614fe571-f38b-bc9d-bc8-9ce9b599dfa6@eik.bme.hu>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
 <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
 <CA+rFky5-FzxjFDJND8a8iQ1XYZ7PsBkYkK4CFO7X6mjAqD+sBg@mail.gmail.com>
 <b5ed0e7-86fa-3157-3b5a-506f9aff5cac@eik.bme.hu>
 <YIlmweq8zLIhN04l@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Andrew Randrianasulu <randrianasulu@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021, Dr. David Alan Gilbert wrote:
> * BALATON Zoltan (balaton@eik.bme.hu) wrote:
>> On Wed, 28 Apr 2021, Andrew Randrianasulu wrote:
>>> On Wednesday, April 28, 2021, Andrew Randrianasulu <randrianasulu@gmail.com>
>>> wrote:
>>>> On Monday, April 26, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>> On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
>>>>>>  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
>>>>>> under QEMU which was pretty neat.  But I failed to find a succesful
>>>>>> combination to get X working; has anyone any suggestions?
>>>>>>
>>>>>
>>>>> Adding Andrew who has experimented with old X framebuffer so he may
>>>>> remember something more but that was on x86.
>>>>
>>>>
>>>>
>>>> Sorry, I still away from my desktop (with notes/logs), not sure when
>>>> return..
>>>> I do not think I tried something that old.. Kernel 2.2 i guess, before any
>>>> attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx
>>>> attempted to use that (as it tries by default in much newer distros)
>>
>> Maybe it would work better with newer RedHat than 6.0? I think I've seen
>> images up to at least 7.1 that supported alpha but I don't know how to boot
>> them. I could get kernel and installer running with -kernel -initrd but did
>> not find the CD on the defailt CMD646 controller (seems to only have driver
>> for one SCSI controller) so I'm not sure how to try this. Trying to just
>> boot from the CD without -kernel -initrd it just stops after displaying
>> "Hello" in top left but that could be something about alpha firmware I don't
>> know how to use.
>
> I ended up using -kernel/-initrd and passed the cdrom as an image to hdb
> rather than with -cdrom; as you say the cmd646 didn't like the cdrom.
> (Where I'm pretty sure my real Alpha does have a CDROM connected to it's
> cmd646).  And none of the SCSI controllers would work.

Passing the iso as HD did not work with 7.1 iso as that does not seem to 
be hybrid or the kernel said no partition found.

> I'll make some notes on my command line this weekend and post them next
> week; I'll try the X suggestions as well.

It looks like RedHat versions before 7.1 don't have any fb drivers (not 
sure those existed on kernel 2.2), the 7.1 iso has kernel 2.4 but only 
seems to have radeonfb and r128 drm driver which may not work as it 
probably wants to use 3D or other features we don't emulate yet. If you 
can't compile a kernel with aty128fb you may try the provided radeonfb 
with -device ati-vga,model=rv100 but not sure if that will load or work. 
If you can get picture with that then X using fb driver may work. Not sure 
if the X r128 driver would work with -device ati-vga but I'm quite sure a 
radeon driver will not work yet even if you set model to rv100 as those 
drivers usually want to use memory queues that we don't emulate yet.

It also seems there was once a 7.2 iso available from Compaq but could not 
find a place that still has it so don't know if that would be any better. 
Maybe you can try other distros too to see if those have more fb drivers.

Regards,
BALATON Zoltan

