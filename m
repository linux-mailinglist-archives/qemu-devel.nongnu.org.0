Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D35602A7D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 13:45:26 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okl2C-0005wV-B0
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 07:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1okkuB-0002vK-Md; Tue, 18 Oct 2022 07:37:07 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:29124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1okku9-0000Oa-HK; Tue, 18 Oct 2022 07:37:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D5500746335;
 Tue, 18 Oct 2022 13:37:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9ED9574632C; Tue, 18 Oct 2022 13:37:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9DBFF74632B;
 Tue, 18 Oct 2022 13:37:01 +0200 (CEST)
Date: Tue, 18 Oct 2022 13:37:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 00/13] Misc ppc/mac machines clean up
In-Reply-To: <923f59f6-5824-26b6-30e0-783060aad888@eik.bme.hu>
Message-ID: <a229e9f8-35b-a4b1-8166-1c2c28867355@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <923f59f6-5824-26b6-30e0-783060aad888@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Oct 2022, BALATON Zoltan wrote:
> On Mon, 3 Oct 2022, BALATON Zoltan wrote:
>> This series includes some clean ups to mac_newworld and mac_oldworld
>> to make them a bit simpler and more readable, It also removes the
>> shared mac.h file that turns out was more of a random collection of
>> unrelated things. Getting rid of this mac.h improves the locality of
>> device models and reduces unnecessary interdependency.
>
> Ping?

Ping^2 Only patch 4-5 still need a review. This series is a quite simple 
clean up with no functional change and it's on the list for a month now 
with this v3 is waiting for the last two weeks. I hoped to do some more 
changes after this was merged but with this rate of maintainer activity 
I'm not sure even this simple clean up can make it until the freeze and 
there seems to be no hope to get in more changes this year, We need to do 
something about this situation as it hinders development. It should not be 
so difficult to make even simple changes.

Regards,
BALATON Zoltan

>> v3: Some more patch spliting and changes I've noticed and address more
>> review comments
>> v2: Split some patches and add a few more I've noticed now and address
>> review comments
>> 
>> BALATON Zoltan (13):
>>  mac_newworld: Drop some variables
>>  mac_oldworld: Drop some more variables
>>  mac_{old|new}world: Set tbfreq at declaration
>>  mac_{old|new}world: Avoid else branch by setting default value
>>  mac_{old|new}world: Simplify cmdline_base calculation
>>  mac_newworld: Clean up creation of Uninorth devices
>>  mac_{old|new}world: Reduce number of QOM casts
>>  hw/ppc/mac.h: Move newworld specific parts out from shared header
>>  hw/ppc/mac.h: Move macio specific parts out from shared header
>>  hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
>>  hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>>  hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>>  mac_nvram: Use NVRAM_SIZE constant
>> 
>> MAINTAINERS                   |   2 +
>> hw/ide/macio.c                |   1 -
>> hw/intc/heathrow_pic.c        |   1 -
>> hw/intc/openpic.c             |   1 -
>> hw/misc/macio/cuda.c          |   1 -
>> hw/misc/macio/gpio.c          |   1 -
>> hw/misc/macio/macio.c         |   8 +-
>> hw/misc/macio/pmu.c           |   1 -
>> hw/nvram/mac_nvram.c          |   2 +-
>> hw/pci-host/grackle.c         |  15 +--
>> hw/pci-host/uninorth.c        |   1 -
>> hw/ppc/mac.h                  | 105 ----------------
>> hw/ppc/mac_newworld.c         | 225 ++++++++++++++++------------------
>> hw/ppc/mac_oldworld.c         | 111 +++++++----------
>> include/hw/misc/macio/macio.h |  23 +++-
>> include/hw/nvram/mac_nvram.h  |  51 ++++++++
>> include/hw/pci-host/grackle.h |  44 +++++++
>> 17 files changed, 280 insertions(+), 313 deletions(-)
>> delete mode 100644 hw/ppc/mac.h
>> create mode 100644 include/hw/nvram/mac_nvram.h
>> create mode 100644 include/hw/pci-host/grackle.h
>> 
>> 
>
>

