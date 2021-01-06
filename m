Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EF2EC07D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:38:01 +0100 (CET)
Received: from localhost ([::1]:36300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAsq-0004KT-41
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAl6-0004cX-OI; Wed, 06 Jan 2021 10:30:00 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAl4-0003Iw-Io; Wed, 06 Jan 2021 10:30:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2B7D37470E9;
 Wed,  6 Jan 2021 16:29:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F357E74646C; Wed,  6 Jan 2021 16:29:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F1A1E74645B;
 Wed,  6 Jan 2021 16:29:55 +0100 (CET)
Date: Wed, 6 Jan 2021 16:29:55 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/22] ppc-for-6.0 queue 20210106
In-Reply-To: <CAFEAcA8CTq=ukdTxGsapQKv-vpGTK2vSuU-XTg3DXn+voPbe0g@mail.gmail.com>
Message-ID: <ccfeebf-cfea-d13e-7016-1d6d34a7e4f@eik.bme.hu>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
 <CAFEAcA8CTq=ukdTxGsapQKv-vpGTK2vSuU-XTg3DXn+voPbe0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Wed, 6 Jan 2021, Peter Maydell wrote:
> On Wed, 6 Jan 2021 at 03:38, David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>> The following changes since commit 52d25464605dc20022ad94aa8bc8e8473e600833:
>>
>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210104' into staging (2021-01-05 16:18:20 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210106
>>
>> for you to fetch changes up to 5cbd51a5a58098444ffa246ece2013849be04299:
>>
>>   ppc440_pcix: Fix up pci config access (2021-01-06 11:09:59 +1100)
>>
>> ----------------------------------------------------------------
>> ppc patch queue 2021-01-06
>>
>> First pull request for 2021, which has a bunch of things accumulated
>> over the holidays.  Includes:
>>   * A number of cleanups to sam460ex and ppc440 code from BALATON Zoltan
>>   * Several fixes for builds with --without-default-devices from Greg Kurz
>>   * Fixes for some DRC reset problems from Greg Kurz
>>   * QOM conversion of the PPC 4xx UIC devices from Peter Maydell
>>   * Some other assorted fixes and cleanups
>>
>> ----------------------------------------------------------------
>> BALATON Zoltan via (5):
>>       ppc4xx: Move common dependency on serial to common option
>>       sam460ex: Remove FDT_PPC dependency from KConfig
>>       ppc440_pcix: Improve comment for IRQ mapping
>>       ppc440_pcix: Fix register write trace event
>>       ppc440_pcix: Fix up pci config access
>
>
> Applied, thanks. I'm afraid I missed reading Balaton's email
> before pushing this to master, so the whole set is in there;
> sorry about that. Would you mind sending a patchset that
> makes the necessary changes on top of master (reverts or fixes
> as appropriate)?

Sent a fixup series with the two reverts and the missing patch.

Regards,
BALATON Zoltan

> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> for any user-visible changes.
>
> -- PMM
>
>

