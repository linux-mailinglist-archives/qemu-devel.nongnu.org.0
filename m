Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67A613F3B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:48:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbg5-0000ng-5G; Mon, 31 Oct 2022 16:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbfv-0000mO-K2; Mon, 31 Oct 2022 16:46:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbft-0003rR-Jn; Mon, 31 Oct 2022 16:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g7upetxt/IylWZrSX4zjsk2L6lk5Xl0My+mmdlf7bqg=; b=MJoz4KH/IhGaOJIiZRRked83Hb
 pxHVPzP6s9erDofNKN23IfrjhBVhRiN+U6Uqdq1uR9WSHwoMZpugYCJ99SpaFDLSGUzKNAWX+YILr
 87QU4uFB06p5N90BUygGJGC9tDGbrbSK/QAWCsKvBir8wHiQjhW7a3GBDDI8IkbHlUObgrgLhTYHC
 Xp3jGJM7strk794dNBkBiXzM/YG2ROhfJMGM9OnWCLdRLl4BhZ8CPD0zJNViju+qcAxa8TxLvmBH3
 iizt094R2FwGr7pJjgSoygd8pWJwCs/gztiKDprHoqf2+LF2q/f3O/QVls77CcMPd9rH08iufnl31
 lwR0BoFTPP8yJNGzsU4qwdxYKyVY/QOBuf3a90WnwToM5TLC1Ra5uAfsvZLiVJvrk2u4BeTeikQxh
 aOwv5Y7GiLh05run/Z65YqI1Q1R/Zwsm7oOcljZ6a6Q+ZWXIqNf/5T4U1fvENSMf6WaE6TZdE0VHr
 u5w8sGUUeHfzukEOwaWWScQTUpvtTq2F/MLDVUyzHG/UegEA4z6Lb+MMVR6JUMgQED6xwV3dvf/wq
 SuNog/FVCK0p2KyTsXUtJu9rzXTS0M4yhtVET3QXNJ664y42pxI1LY04/5Z3W0EiSiygB9LMRghjJ
 8FS3IpAxs69/eeI3MiJU81WLoh/VrTqvuXJkDwOrY=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbfn-0007Wt-Ei; Mon, 31 Oct 2022 20:46:19 +0000
Message-ID: <a3185b5f-9ee4-e76a-8e96-0908234c8df4@ilande.co.uk>
Date: Mon, 31 Oct 2022 20:46:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1666957578.git.balaton@eik.bme.hu>
 <cd48ea7a-1269-6b3b-73e4-d7f2a1abffd5@ilande.co.uk>
 <59497b0-a5d4-3c8c-524b-9cde50aae5e7@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <59497b0-a5d4-3c8c-524b-9cde50aae5e7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v6 00/19] Misc ppc/mac machines clean up
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 30/10/2022 22:23, BALATON Zoltan wrote:
> On Sun, 30 Oct 2022, Mark Cave-Ayland wrote:
>> On 28/10/2022 12:56, BALATON Zoltan wrote:
>>> Since only one week is left until freeze starts I've included some
>>> more patches in this version that I've intended to submit after the
>>> clean ups but we're running out of time now. The last 3 patches could
>>> be squashed together, I've just split these up because I expect
>>> resistence from Mark to any changes so maybe it's easier to digest
>>> piece by piece and can cherry pick parts easier this way but ideally
>>> these should be in one patch.
>>>
>>> I'd appreciate very much if this series would get in before the
>>> freeze, it is very discouraging to spend time with something that gets
>>> ignored and then postponed for the rest of the year just to start
>>> again the same in January. This might be a reason why not many people
>>> contribute to this part of QEMU besides that maybe only a few people
>>> are still interested so those who are interested should be served
>>> better to not scare them off even more.
>>>
>>> Regards,
>>> BALATON Zoltan
>>>
>>> v6: Drop cmdline_base patch
>>> v5: Fix last patch and add one more patch to fix NDRV with ati-vga
>>> v4: Add some more patches that I've found since v3 or was intended in
>>> separate series
>>> v3: Some more patch spliting and changes I've noticed and address more
>>> review comments
>>> v2: Split some patches and add a few more I've noticed now and address
>>> review comments
>>>
>>> BALATON Zoltan (19):
>>>    mac_newworld: Drop some variables
>>>    mac_oldworld: Drop some more variables
>>>    mac_{old|new}world: Set tbfreq at declaration
>>>    mac_{old|new}world: Avoid else branch by setting default value
>>>    mac_newworld: Clean up creation of Uninorth devices
>>>    mac_{old|new}world: Reduce number of QOM casts
>>>    hw/ppc/mac.h: Move newworld specific parts out from shared header
>>>    hw/ppc/mac.h: Move macio specific parts out from shared header
>>>    hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
>>>    hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>>>    hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>>>    mac_nvram: Use NVRAM_SIZE constant
>>>    mac_{old|new}world: Code style fix adding missing braces to if-s
>>>    mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum
>>>    mac_newworld: Add machine types for different mac99 configs
>>>    mac_newworld: Deprecate mac99 with G5 CPU
>>>    mac_newworld: Deprecate mac99 "via" option
>>>    mac_newworld: Document deprecation
>>>    mac_{old,new}world: Pass MacOS VGA NDRV in card ROM instead of fw_cfg
>>>
>>>   MAINTAINERS                   |   2 +
>>>   docs/about/deprecated.rst     |   7 +
>>>   docs/system/ppc/powermac.rst  |  12 +-
>>>   hw/ide/macio.c                |   1 -
>>>   hw/intc/heathrow_pic.c        |   1 -
>>>   hw/intc/openpic.c             |   1 -
>>>   hw/misc/macio/cuda.c          |   1 -
>>>   hw/misc/macio/gpio.c          |   1 -
>>>   hw/misc/macio/macio.c         |   8 +-
>>>   hw/misc/macio/pmu.c           |   1 -
>>>   hw/nvram/mac_nvram.c          |   2 +-
>>>   hw/pci-host/grackle.c         |  15 +-
>>>   hw/pci-host/uninorth.c        |   1 -
>>>   hw/ppc/mac.h                  | 105 ----------
>>>   hw/ppc/mac_newworld.c         | 353 ++++++++++++++++++++++------------
>>>   hw/ppc/mac_oldworld.c         | 131 ++++++-------
>>>   include/hw/misc/macio/macio.h |  23 ++-
>>>   include/hw/nvram/mac_nvram.h  |  51 +++++
>>>   include/hw/pci-host/grackle.h |  44 +++++
>>>   19 files changed, 421 insertions(+), 339 deletions(-)
>>>   delete mode 100644 hw/ppc/mac.h
>>>   create mode 100644 include/hw/nvram/mac_nvram.h
>>>   create mode 100644 include/hw/pci-host/grackle.h
>>
>> I've queued patches 1-14 in my qemu-macppc branch (whilst fixing the typos in the 
>> description for patch 5) and will send a PR in time for soft freeze.
> 
> Thanks. Sorry about the typos, looks like I missed two in that patch: otder -> order 
> and reorganise. Did you fix both?

Yes, I've done that.

> What about the remaining patches?

AIUI there are two separate discussion points outstanding from the series: adding new 
machines (deprecating mac99), and changing the mechanism for handling the VGA option 
ROM. I'm not saying that we can't improve QEMU in these areas, but we should discuss 
these points separately on-list, particularly with regard to the machines indicating 
why they were chosen and what references we have against real hardware before making 
any final decision.

In the meantime it is still possible to use the ati-rage device with the -prom-env 
'vga-ndrv=false' option until this point in time, so I don't feel this is something 
that has to be fixed in the limited discussion time available before freeze.


ATB,

Mark.

