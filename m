Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBE2889BA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 15:27:37 +0200 (CEST)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQsQq-0002DV-Gm
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 09:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincenzo.frascino@arm.com>)
 id 1kQqH5-0004CC-6R; Fri, 09 Oct 2020 07:09:23 -0400
Received: from foss.arm.com ([217.140.110.172]:40842)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vincenzo.frascino@arm.com>)
 id 1kQqH2-00087O-6C; Fri, 09 Oct 2020 07:09:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF013D6E;
 Fri,  9 Oct 2020 04:09:18 -0700 (PDT)
Received: from [10.37.12.22] (unknown [10.37.12.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21FAD3F66B;
 Fri,  9 Oct 2020 04:09:17 -0700 (PDT)
Subject: Re: [PATCH 0/3] target/arm: MTE fixes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201008162155.161886-1-richard.henderson@linaro.org>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <4a6344f2-3263-1852-27f7-b7818a6fbec6@arm.com>
Date: Fri, 9 Oct 2020 12:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008162155.161886-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=vincenzo.frascino@arm.com; helo=foss.arm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 07:07:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.208,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 09 Oct 2020 09:26:13 -0400
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 10/8/20 5:21 PM, Richard Henderson wrote:
> One code cleanup and two bug fixes for MTE.
> 
> Vincenzo, thanks for the clear report.  Can you please run
> this through your test case?
> 
> 

No problem, thank you for addressing the issues quickly. I did run my tests and
added my tags to the relevant patches.

> r~
> 
> 
> Richard Henderson (3):
>   target/arm: Remove redundant mmu_idx lookup
>   target/arm: Fix reported EL for mte_check_fail
>   target/arm: Ignore HCR_EL2.ATA when {E2H,TGE} != 11
> 
>  target/arm/internals.h  |  9 +++++----
>  target/arm/helper.c     |  9 +++++----
>  target/arm/mte_helper.c | 13 ++++---------
>  3 files changed, 14 insertions(+), 17 deletions(-)
> 

-- 
Regards,
Vincenzo

