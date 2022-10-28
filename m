Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C9610703
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 02:56:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooDdS-0000BF-KC; Thu, 27 Oct 2022 20:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1ooDdP-0000Af-Oi
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 20:54:08 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1ooDdK-0001rN-DV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 20:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666918442; x=1698454442;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JAYgZzK+bu1AiAMfBeUpAq7DFBdu1wIvTCA06315ArM=;
 b=SS7zjgSR3JlP+ZhZyWgnBXEjqz89qxtmvYpxz9smt049Ya6zbjDrqc6m
 5F3i4kMVby7oDKI4nqVFRbkwDouxT8dmi1Q5g9pTHoUiQMLJCwceHtx/g
 dJBuwVROJv2HEk8gACKXPdtQCTe1eS1GothWMjhnFJD3Z8vyAWp0+F8Cd
 cJMo6pmnoEYx+HSaumU9427ylfAn48kD0xi8rqPdJ0ZE/NUxXHcTVqKGU
 sC4T6u9gPRVtmTumL9AHP4xJK8+RMYmvyeEIoi+ZfyQ4o6xIdji6XHOS8
 lTLi41thbmoYBeFGYFJkBs73ibRQrdizz5nL6vml7SBJluLIy82QaVhP3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="370445802"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="370445802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 17:53:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="663833092"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="663833092"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.139])
 ([10.238.212.139])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 17:53:57 -0700
Message-ID: <ca7518d2-4715-3d21-ee51-2c21f5878b0f@intel.com>
Date: Fri, 28 Oct 2022 08:53:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH] i386/cpu: Adjust cpuid addresable id count to match the
 spec
Content-Language: en-US
To: Ilya Oleinik <ilyaoleinik1@gmail.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, yang.zhong@intel.com, f4bug@amsat.org,
 richard.henderson@linaro.org
References: <20221010024934.2517-1-ilyaoleinik1@gmail.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <20221010024934.2517-1-ilyaoleinik1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 10/10/2022 10:49 AM, Ilya Oleinik wrote:
> For EBX bits 23 - 16 in CPUID[01] Intel's manual states:
> "
> *   The nearest power-of-2 integer that is not smaller than EBX[23:16]
>     is the number of unique initial APICIDs reserved for addressing
>     different logical processors in a physical package. This field is
>     only valid if CPUID.1.EDX.HTT[bit 28]= 1.
> "
> Ensure this condition is met.
> 
> Additionally, apply efb3934adf9ee7794db7e0ade9f576c634592891 to
> non passthrough cache mode.
> 
> Signed-off-by: Ilya Oleinik <ilyaoleinik1@gmail.com>
> ---
>  target/i386/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad623d91e4..e793bcc03f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -245,8 +245,8 @@ static void encode_cache_cpuid4(CPUCacheInfo *cache,
>      *eax = CACHE_TYPE(cache->type) |
>             CACHE_LEVEL(cache->level) |
>             (cache->self_init ? CACHE_SELF_INIT_LEVEL : 0) |
> -           ((num_cores - 1) << 26) |
> -           ((num_apic_ids - 1) << 14);
> +           ((pow2ceil(num_cores) - 1) << 26) |
> +           ((pow2ceil(num_apic_ids) - 1) << 14);
>  
>      assert(cache->line_size > 0);
>      assert(cache->partitions > 0);
> @@ -5258,7 +5258,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          }
>          *edx = env->features[FEAT_1_EDX];
>          if (cs->nr_cores * cs->nr_threads > 1) {
> -            *ebx |= (cs->nr_cores * cs->nr_threads) << 16;
> +            *ebx |= (pow2ceil(cs->nr_cores * cs->nr_threads)) << 16;
>              *edx |= CPUID_HT;
>          }
>          if (!cpu->enable_pmu) {
> @@ -5313,12 +5313,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>              switch (count) {
>              case 0: /* L1 dcache info */
>                  encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> -                                    1, cs->nr_cores,

Hi Ilya,

Just curious why the origin implementation is hard-coded to 1 and is there any
bug reported related to this?

> +                                    cs->nr_threads, cs->nr_cores,
>                                      eax, ebx, ecx, edx);
>                  break;
>              case 1: /* L1 icache info */
>                  encode_cache_cpuid4(env->cache_info_cpuid4.l1i_cache,
> -                                    1, cs->nr_cores,
> +                                    cs->nr_threads, cs->nr_cores,
>                                      eax, ebx, ecx, edx);
>                  break;
>              case 2: /* L2 cache info */

