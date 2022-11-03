Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82F617D18
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:53:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZhI-0003HG-VT; Thu, 03 Nov 2022 08:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oqZh1-0003Dh-2C; Thu, 03 Nov 2022 08:51:46 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oqZgu-0002mX-CY; Thu, 03 Nov 2022 08:51:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EB19D74638A;
 Thu,  3 Nov 2022 13:51:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A47A974633D; Thu,  3 Nov 2022 13:51:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A2EF274632B;
 Thu,  3 Nov 2022 13:51:19 +0100 (CET)
Date: Thu, 3 Nov 2022 13:51:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org, 
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 0/3] ppc/e500: Add support for eSDHC
In-Reply-To: <72e7c23d-5a07-8d51-2bdb-cf957b84ac2f@gmail.com>
Message-ID: <29fdeb41-5032-fca0-62a8-c8ee7fa611e7@eik.bme.hu>
References: <20221101222934.52444-1-philmd@linaro.org>
 <72e7c23d-5a07-8d51-2bdb-cf957b84ac2f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1118473289-1667479879=:12665"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1118473289-1667479879=:12665
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 2 Nov 2022, Daniel Henrique Barboza wrote:
> On 11/1/22 19:29, Philippe Mathieu-Daudé wrote:
>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>> as an 'UNIMP' region. See v4 cover here:
>> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/
>> 
>> Since v5:
>> - Rebased (ppc-next merged)
>> - Properly handle big-endian
>> 
>> Since v4:
>> - Do not rename ESDHC_* definitions to USDHC_*
>> - Do not modify SDHCIState structure
>> 
>> Supersedes: <20221031115402.91912-1-philmd@linaro.org>
>
> Queued in gitlab.com/danielhb/qemu/tree/ppc-8.0 (since we missed the
> freeze for 7.2).

Could you please always use ppc-next to queue patches for the next 
upcoming version and ppc-7.2 for the current version? Unless this makes 
your workflow harder in which case ignore this but the reason I ask is 
because then it's enough for me to only track ppc-next if I need to rebase 
patches on that and don't have to add a new branch at every release 
(unless I have some patches to rebase on it during a freeze but that's 
less likely than rebasing on your queued patches for the next release xo 
using version for the current branch and keep next for the future versions 
makes more sense to me).

> BTW, checkpatch complained about this line being too long (83 chars):
>
>
> 3/3 Checking commit bc7b8cc88560 (hw/ppc/e500: Add Freescale eSDHC to 
> e500plat)
> WARNING: line over 80 characters
> #150: FILE: hw/ppc/e500.c:1024:
> +                                    pmc->ccsrbar_base + 
> MPC85XX_ESDHC_REGS_OFFSET,
>
>
> The code except is this:
>
>    if (pmc->has_esdhc) {
>        create_unimplemented_device("esdhc",
>                                    pmc->ccsrbar_base + 
> MPC85XX_ESDHC_REGS_OFFSET,
>                                    MPC85XX_ESDHC_REGS_SIZE);
>
>
> To get rid of the warning we would need to make a python-esque identation 
> (line
> break after "(" ) or create a new variable to hold the sum. Both seems 
> overkill
> so I'll ignore the warning. Phil is welcome to re-send if he thinks it's 
> worth
> it.

Or you could break indentation and not start at the ( but 3 chars back. I.e.:

create_unimplemented_device("esdhc",
                          pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
                          MPC85XX_ESDHC_REGS_SIZE);

But I think it can be just ignored in this case.

> And I'll follow it up with my usual plea in these cases: can we move the line 
> size warning to 100 chars? For QEMU 8.0? Pretty please?

I think the consensus was to keep 80 columns if possible, this is good 
becuase you can open more files side by side (although it does not match 
well with the long _ naming convention of glib and qemu)  but we have a 
distinction between checkpatch warning and error in line length. I think 
it will give error at 90 chars but as long as it's just warns that means: 
fix it if you can but in rare cases if it's more readable with a slightly 
longer line then it is still acceptable. I think that's the case here, 
splitting the line would be less readable than a few chars longer line.

Regards,
BALATON Zoltan
--3866299591-1118473289-1667479879=:12665--

