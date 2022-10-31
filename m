Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F6614075
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:10:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcyR-0006o5-GF; Mon, 31 Oct 2022 18:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1opcyJ-0006ly-S8; Mon, 31 Oct 2022 18:09:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1opcyF-0003uz-AU; Mon, 31 Oct 2022 18:09:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D7FC075A150;
 Mon, 31 Oct 2022 23:09:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8A61875A15D; Mon, 31 Oct 2022 23:09:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 87EEE75A15C;
 Mon, 31 Oct 2022 23:09:24 +0100 (CET)
Date: Mon, 31 Oct 2022 23:09:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v6 00/19] Misc ppc/mac machines clean up
In-Reply-To: <a3185b5f-9ee4-e76a-8e96-0908234c8df4@ilande.co.uk>
Message-ID: <da7320f7-4f9b-23bd-1aa5-279125c86e2@eik.bme.hu>
References: <cover.1666957578.git.balaton@eik.bme.hu>
 <cd48ea7a-1269-6b3b-73e4-d7f2a1abffd5@ilande.co.uk>
 <59497b0-a5d4-3c8c-524b-9cde50aae5e7@eik.bme.hu>
 <a3185b5f-9ee4-e76a-8e96-0908234c8df4@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-614714875-1667254164=:38745"
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-614714875-1667254164=:38745
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 31 Oct 2022, Mark Cave-Ayland wrote:
> On 30/10/2022 22:23, BALATON Zoltan wrote:
>> On Sun, 30 Oct 2022, Mark Cave-Ayland wrote:
>>> On 28/10/2022 12:56, BALATON Zoltan wrote:
>>>> Since only one week is left until freeze starts I've included some
>>>> more patches in this version that I've intended to submit after the
>>>> clean ups but we're running out of time now. The last 3 patches could
>>>> be squashed together, I've just split these up because I expect
>>>> resistence from Mark to any changes so maybe it's easier to digest
>>>> piece by piece and can cherry pick parts easier this way but ideally
>>>> these should be in one patch.
>>>> 
>>>> I'd appreciate very much if this series would get in before the
>>>> freeze, it is very discouraging to spend time with something that gets
>>>> ignored and then postponed for the rest of the year just to start
>>>> again the same in January. This might be a reason why not many people
>>>> contribute to this part of QEMU besides that maybe only a few people
>>>> are still interested so those who are interested should be served
>>>> better to not scare them off even more.
>>>> 
>>>> Regards,
>>>> BALATON Zoltan
>>>> 
>>>> v6: Drop cmdline_base patch
>>>> v5: Fix last patch and add one more patch to fix NDRV with ati-vga
>>>> v4: Add some more patches that I've found since v3 or was intended in
>>>> separate series
>>>> v3: Some more patch spliting and changes I've noticed and address more
>>>> review comments
>>>> v2: Split some patches and add a few more I've noticed now and address
>>>> review comments
>>>> 
>>>> BALATON Zoltan (19):
>>>>    mac_newworld: Drop some variables
>>>>    mac_oldworld: Drop some more variables
>>>>    mac_{old|new}world: Set tbfreq at declaration
>>>>    mac_{old|new}world: Avoid else branch by setting default value
>>>>    mac_newworld: Clean up creation of Uninorth devices
>>>>    mac_{old|new}world: Reduce number of QOM casts
>>>>    hw/ppc/mac.h: Move newworld specific parts out from shared header
>>>>    hw/ppc/mac.h: Move macio specific parts out from shared header
>>>>    hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
>>>>    hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>>>>    hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>>>>    mac_nvram: Use NVRAM_SIZE constant
>>>>    mac_{old|new}world: Code style fix adding missing braces to if-s
>>>>    mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum
>>>>    mac_newworld: Add machine types for different mac99 configs
>>>>    mac_newworld: Deprecate mac99 with G5 CPU
>>>>    mac_newworld: Deprecate mac99 "via" option
>>>>    mac_newworld: Document deprecation
>>>>    mac_{old,new}world: Pass MacOS VGA NDRV in card ROM instead of fw_cfg
>>>> 
>>>>   MAINTAINERS                   |   2 +
>>>>   docs/about/deprecated.rst     |   7 +
>>>>   docs/system/ppc/powermac.rst  |  12 +-
>>>>   hw/ide/macio.c                |   1 -
>>>>   hw/intc/heathrow_pic.c        |   1 -
>>>>   hw/intc/openpic.c             |   1 -
>>>>   hw/misc/macio/cuda.c          |   1 -
>>>>   hw/misc/macio/gpio.c          |   1 -
>>>>   hw/misc/macio/macio.c         |   8 +-
>>>>   hw/misc/macio/pmu.c           |   1 -
>>>>   hw/nvram/mac_nvram.c          |   2 +-
>>>>   hw/pci-host/grackle.c         |  15 +-
>>>>   hw/pci-host/uninorth.c        |   1 -
>>>>   hw/ppc/mac.h                  | 105 ----------
>>>>   hw/ppc/mac_newworld.c         | 353 ++++++++++++++++++++++------------
>>>>   hw/ppc/mac_oldworld.c         | 131 ++++++-------
>>>>   include/hw/misc/macio/macio.h |  23 ++-
>>>>   include/hw/nvram/mac_nvram.h  |  51 +++++
>>>>   include/hw/pci-host/grackle.h |  44 +++++
>>>>   19 files changed, 421 insertions(+), 339 deletions(-)
>>>>   delete mode 100644 hw/ppc/mac.h
>>>>   create mode 100644 include/hw/nvram/mac_nvram.h
>>>>   create mode 100644 include/hw/pci-host/grackle.h
>>> 
>>> I've queued patches 1-14 in my qemu-macppc branch (whilst fixing the typos 
>>> in the description for patch 5) and will send a PR in time for soft 
>>> freeze.
>> 
>> Thanks. Sorry about the typos, looks like I missed two in that patch: otder 
>> -> order and reorganise. Did you fix both?
>
> Yes, I've done that.
>
>> What about the remaining patches?
>
> AIUI there are two separate discussion points outstanding from the series: 
> adding new machines (deprecating mac99), and changing the mechanism for 
> handling the VGA option ROM. I'm not saying that we can't improve QEMU in 
> these areas, but we should discuss these points separately on-list, 
> particularly with regard to the machines indicating why they were chosen and 
> what references we have against real hardware before making any final 
> decision.

The PowerMac3,1 and PowerMac7,3 are trivial as these have the hardware we 
emulate and this is also what OpenBIOS says in the device tree (at least 
for PowerMac3,1). The PowerBook3,2 is debatable but I'm OK with dropping 
that for now and only add powermac3_1 and powermac7_3 now. The sooner we 
start the deprecation of the G5 mac99 is the better as that would allow us 
to get rid of separate qemu-system-ppc and qemu-system-ppc64 in the future 
if that will be decided later but even if we won't do that this avoids the 
confusion that exists currently by having these machines work consistently 
between the ppc and ppc64 executables. I.e. -M powermac3_1 will always 
result in a G4 Mac and powermac7_3 is clearly a G5 Mac that can be seen 
from the model id. The old commands still work just print a warning with 
the new machine type so don't know what's your concern about this.

You could modify the patches by removing the powerboo3_2 parts and squash 
the patch 15-18 together. I can make such patch if it helps but you could 
do it easily too.

> In the meantime it is still possible to use the ati-rage device with the 
> -prom-env 'vga-ndrv=false' option until this point in time, so I don't feel 
> this is something that has to be fixed in the limited discussion time 
> available before freeze.

What discusiion do you expect about this? As there are not many people who 
care about Mac emulation and OpenBIOS apart from us 3 I don't think there 
will be much to discuss. Howard did not raise any concern and seemed to 
agree this is a good idea so only you have some concerns yet and the 
discussion time is also short because you were slow to respond on the 
first series. I understand you may not have time to work on this but then 
at least don't block patches for no good reason. If you merge this now we 
can still revert it before the release if a discussion results in a 
decision for that, but if you postpone it now we can't do anything before 
next year and we lose months again.

Regards,
BALATON Zoltan
--3866299591-614714875-1667254164=:38745--

