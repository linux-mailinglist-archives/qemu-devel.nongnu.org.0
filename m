Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E2612D37
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:04:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGOv-0006ob-2U; Sun, 30 Oct 2022 18:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opGOq-0006lo-Ij; Sun, 30 Oct 2022 18:03:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opGOh-0008AR-IR; Sun, 30 Oct 2022 18:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DW4cVLsKvZJGN/P0VPLa/y4pFWKuS1ues/7Qg+kLJAg=; b=e+5PzLk0JFXfNBxgGJMGAg5ilY
 +0jDfwjhzIY7Fo55Nuk3pqugPpPzAG2WLT75ZWuujUKa5XWT+6HCOxW2dyycnyVTf2AztBKlmt14F
 MaIQQihFFMOgsrmgC/kcLCgWDt81zmqcuAXIlKOGtCraKo1EiP56VHrb3I3C0mPqETv6917BBqFOF
 CgDDR64jPNdkBMV6LCxMtmb03ynAkKeaeDds+yn4fajlU5qDsFZQH7Dub9dIpao5rBZaXBsC61SKO
 mMY3Mj97scHqsS4DFpT2S6IqapS+xrdN1HlZQS4Go35570TwWwXkusstbDsx6+P3oZf+1Qp7Oz1EN
 EjWlEWsoA/gIIH1wR8n7SDAGbKrqplYCHXyIfoAgtEtKyXwrD+gYmGBr3vZ9DiFXS4tUKiJHNcckv
 xMtvDTaZ3ogYWMEypK9atTrwk9ADAqwmq5wmCUbsX7kXH0rdtUhl3f9tWw5qL06n57YJ8lA8nXXXo
 ORuFPbId2UH/o4WAMJCBPt3P8V5thwjW2Td945bi7KuiEPCdiE5teT27bQXETranq41PHIOH+8kZ/
 vK/SGPm/lGp0oihFbgstsERqs+6iXY0OMXl3ulMFpLh/mhaY361RtiDoGYi23e+F2Qq05ZCmxKpW1
 H4ZyLh3Wp9RAKB6XEmOT/11lHoMM2yOTO2HHGtkwo=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opGOb-0003H5-AZ; Sun, 30 Oct 2022 22:03:09 +0000
Message-ID: <cd48ea7a-1269-6b3b-73e4-d7f2a1abffd5@ilande.co.uk>
Date: Sun, 30 Oct 2022 22:03:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666957578.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1666957578.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 12:56, BALATON Zoltan wrote:

> Since only one week is left until freeze starts I've included some
> more patches in this version that I've intended to submit after the
> clean ups but we're running out of time now. The last 3 patches could
> be squashed together, I've just split these up because I expect
> resistence from Mark to any changes so maybe it's easier to digest
> piece by piece and can cherry pick parts easier this way but ideally
> these should be in one patch.
> 
> I'd appreciate very much if this series would get in before the
> freeze, it is very discouraging to spend time with something that gets
> ignored and then postponed for the rest of the year just to start
> again the same in January. This might be a reason why not many people
> contribute to this part of QEMU besides that maybe only a few people
> are still interested so those who are interested should be served
> better to not scare them off even more.
> 
> Regards,
> BALATON Zoltan
> 
> v6: Drop cmdline_base patch
> v5: Fix last patch and add one more patch to fix NDRV with ati-vga
> v4: Add some more patches that I've found since v3 or was intended in
> separate series
> v3: Some more patch spliting and changes I've noticed and address more
> review comments
> v2: Split some patches and add a few more I've noticed now and address
> review comments
> 
> BALATON Zoltan (19):
>    mac_newworld: Drop some variables
>    mac_oldworld: Drop some more variables
>    mac_{old|new}world: Set tbfreq at declaration
>    mac_{old|new}world: Avoid else branch by setting default value
>    mac_newworld: Clean up creation of Uninorth devices
>    mac_{old|new}world: Reduce number of QOM casts
>    hw/ppc/mac.h: Move newworld specific parts out from shared header
>    hw/ppc/mac.h: Move macio specific parts out from shared header
>    hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
>    hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>    hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>    mac_nvram: Use NVRAM_SIZE constant
>    mac_{old|new}world: Code style fix adding missing braces to if-s
>    mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum
>    mac_newworld: Add machine types for different mac99 configs
>    mac_newworld: Deprecate mac99 with G5 CPU
>    mac_newworld: Deprecate mac99 "via" option
>    mac_newworld: Document deprecation
>    mac_{old,new}world: Pass MacOS VGA NDRV in card ROM instead of fw_cfg
> 
>   MAINTAINERS                   |   2 +
>   docs/about/deprecated.rst     |   7 +
>   docs/system/ppc/powermac.rst  |  12 +-
>   hw/ide/macio.c                |   1 -
>   hw/intc/heathrow_pic.c        |   1 -
>   hw/intc/openpic.c             |   1 -
>   hw/misc/macio/cuda.c          |   1 -
>   hw/misc/macio/gpio.c          |   1 -
>   hw/misc/macio/macio.c         |   8 +-
>   hw/misc/macio/pmu.c           |   1 -
>   hw/nvram/mac_nvram.c          |   2 +-
>   hw/pci-host/grackle.c         |  15 +-
>   hw/pci-host/uninorth.c        |   1 -
>   hw/ppc/mac.h                  | 105 ----------
>   hw/ppc/mac_newworld.c         | 353 ++++++++++++++++++++++------------
>   hw/ppc/mac_oldworld.c         | 131 ++++++-------
>   include/hw/misc/macio/macio.h |  23 ++-
>   include/hw/nvram/mac_nvram.h  |  51 +++++
>   include/hw/pci-host/grackle.h |  44 +++++
>   19 files changed, 421 insertions(+), 339 deletions(-)
>   delete mode 100644 hw/ppc/mac.h
>   create mode 100644 include/hw/nvram/mac_nvram.h
>   create mode 100644 include/hw/pci-host/grackle.h

I've queued patches 1-14 in my qemu-macppc branch (whilst fixing the typos in the 
description for patch 5) and will send a PR in time for soft freeze.


ATB,

Mark.

