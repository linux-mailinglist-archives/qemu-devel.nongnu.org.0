Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4168DE42
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRDI-0007w9-Ts; Tue, 07 Feb 2023 11:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPRDE-0007tF-4Q; Tue, 07 Feb 2023 11:52:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPRDC-00037l-2I; Tue, 07 Feb 2023 11:52:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6BDB1745720;
 Tue,  7 Feb 2023 17:50:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 333ED745712; Tue,  7 Feb 2023 17:50:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 315937456E3;
 Tue,  7 Feb 2023 17:50:21 +0100 (CET)
Date: Tue, 7 Feb 2023 17:50:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 0/7] Misc ppc/mac machines clean up
In-Reply-To: <5e078ad6-74b5-af81-22e7-b4942eea31cf@eik.bme.hu>
Message-ID: <91ba8c47-f766-c1ae-12c1-6981923724de@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <f3a4fea7-4d85-300e-386d-bca205a50c7a@ilande.co.uk>
 <5e078ad6-74b5-af81-22e7-b4942eea31cf@eik.bme.hu>
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

On Thu, 2 Feb 2023, BALATON Zoltan wrote:
> On Wed, 1 Feb 2023, Mark Cave-Ayland wrote:
>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>> This is the remainder of the series that were postponed to after the
>>> freeze the last time I've tried to submit them with some new patches
>>> I did meanwhile.
>>> 
>>> BALATON Zoltan (7):
>>>    input/adb: Only include header where needed
>>>    mac_{old,new}world: Use local variable instead of qdev_get_machine()
>>>    mac_{old,new}world: Pass MacOS VGA NDRV in card ROM instead of fw_cfg
>>>    mac_newworld: Add machine types for different mac99 configs
>>>    mac_newworld: Deprecate mac99 with G5 CPU
>>>    mac_newworld: Deprecate mac99 "via" option
>>>    mac_newworld: Document deprecation
>>>
>>>   docs/about/deprecated.rst    |   7 ++
>>>   docs/system/ppc/powermac.rst |  12 ++--
>>>   hw/misc/macio/cuda.c         |   2 -
>>>   hw/misc/macio/pmu.c          |   3 -
>>>   hw/misc/mos6522.c            |   1 -
>>>   hw/ppc/mac_newworld.c        | 130 +++++++++++++++++++++++++++++++----
>>>   hw/ppc/mac_oldworld.c        |  21 ++----
>>>   include/hw/misc/mac_via.h    |   1 +
>>>   include/hw/misc/macio/cuda.h |   1 +
>>>   include/hw/misc/macio/pmu.h  |   1 +
>>>   include/hw/misc/mos6522.h    |   3 +-
>>>   11 files changed, 142 insertions(+), 40 deletions(-)
>> 
>> I've applied patches 1 and 2 to my qemu-macppc branch. Patch 3 isn't the 
>> right solution to the problem, and the discussion as to how the New World 
>> machines should be organised in future for patches 4 to 7 still hasn't been 
>> clarified.
>
> Thanks, let's come back to patch 3 in the other thread. As for 4-7 the 
> discussion seems to have ended and the result was that nobody really cares 
> besides you and me. So make a suggestion for names instead of the machine id 
> based ones I came up with and I'll change it to use those names. Whatever we 
> call these is still better than what we have currently so as long as I can 
> get PowerMac3,1 and PowerMac7,2 with a simple -machine option without getting 
> them confused in qemu-system-ppc64 I'd go for that.

Thank you for taking care of these, now only the last patches are not yet 
merged. We can postpone the NDRV patch for later but I'd appreciate if you 
could make an alternative fix in OpenBIOS. I'd still want to resolve the 
mac99 machine though and add new machine names and start deprecation now. 
I'm waiting for your suggestion on names for these machines and preferred 
partitioning of the changes in patches so I can change and resubmit these. 
I'd like this to not miss the freeze which may seem far ahead but at the 
speed these are reviewed and merged I wanted to get over it as soon as 
possible. (Othersise this would be the second time these miss a freeze.)

Regards,
BALATON Zoltan

