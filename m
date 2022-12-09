Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE86480FE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ae8-0003ZG-LP; Fri, 09 Dec 2022 05:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1p3adr-0003Yy-Sy
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 05:30:08 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1p3adp-0004DK-Hm
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 05:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670581805; x=1702117805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/prfHxCiSlBxWfoeJd3D/jFGHprw/PG+Xq/ru3E/OI0=;
 b=HX2p5oIr0sgWYUUD6BH910nKyqD1Xbiww38k1vhO77lh6HquIjlr15xv
 rpNhYJcOUqvnZ84sge80gg8t302R51DUr1eexx3ZF3jSfzlrEoSjSaMeT
 AuEySuWrFK1ioxn/azLuMv40GFuXzWkrSA4mcZFWg91uQysjIEKSWfGA0
 MfmSimVq9aw+tNoIoqgiDqn+zKkwZrg1wUGlqJbHixldNz67N0Sk9Dtrk
 63rQPgC9UjbE3aABDhHemlMNjVaawFQDYEa9pejyZBVluL5kOYmjdIf5X
 vLGnBngHwDkRx2fTG4IylCRRZebJrRI0vJTsGGbVWASf/zb+Fvqg1k9Af Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="297111332"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="297111332"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 02:30:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="710840379"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="710840379"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 02:29:59 -0800
Date: Fri, 9 Dec 2022 05:29:47 -0500
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Xiaocheng Dong <xiaocheng.dong@intel.com>
Cc: weijiang.yang@intel.com, yang.zhong@intel.com, qemu-devel@nongnu.org,
 yang.zhong@intel.linux.com
Subject: Re: [PATCH] target/i386: Fix wrong XSAVE feature names
Message-ID: <Y5MOGwQY0BI28zGu@yangzhon>
References: <20221208024747.509579-1-xiaocheng.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208024747.509579-1-xiaocheng.dong@intel.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=yang.zhong@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

In fact, one month ago, I have sent out V2 for this issue. thanks!
https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg04825.html

Yang


On Wed, Dec 07, 2022 at 09:47:47PM -0500, Xiaocheng Dong wrote:
> The previous patch changes the name from FEAT_XSAVE_COMP_{LO|HI}
> to FEAT_XSAVE_XCR0_{LO|HI}, the changes for CPUID.0x12.0x1 should be
> FEAT_XSAVE_XCR0_{LO|HI}, the SGX can't work in VM if these are not right
> 
> Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")
> 
> Signed-off-by: Xiaocheng Dong <xiaocheng.dong@intel.com>
> ---
>  target/i386/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 22b681ca37..0f71ff9fea 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          } else {
>              *eax &= env->features[FEAT_SGX_12_1_EAX];
>              *ebx &= 0; /* ebx reserve */
> -            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
> -            *edx &= env->features[FEAT_XSAVE_XSS_HI];
> +            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
> +            *edx &= env->features[FEAT_XSAVE_XCR0_HI];
>  
>              /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
>              *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
> -- 
> 2.31.1
> 
> 

