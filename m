Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74968F0E7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:34:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlVr-0000Cf-Ax; Wed, 08 Feb 2023 09:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pPlVc-0008SS-2v
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:33:19 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pPlVZ-0002qG-5l
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675866793; x=1707402793;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8KcKWewbx7SW47tBdMx3GjfQOx6Ls7Z1Rizk+UTjZEo=;
 b=lVqSar0rVfHySIa1CWcoMUrUypTxNKvF9hffRR84H5XQD0Z7axnGujB9
 opPuIN2JzmoG8wrEM6xrmhZRoHtA+jLlOwofAwGItmPP8xiyBvRR4iP2W
 ujKlpdEeqdZBePvd2Jk4eslFUX7Pwowr2Nus5akOu+l2KbKSY38wG7cd9
 QrAs8O6xVXAhDbpdkfsBRSuIXXxClM7HL9bqTrwIGTPfSVCVcX30nReJv
 kX9mncFu4t+vOlVF/N7GKKGsh2Wso6oxHDSVQ8yCq1QvZxXnQ0S+BnRKS
 CiZex3E5tKy+Qzg8X+dVtLp755TXQdHujf3dKN5X93ZmoBhFhN9Og1PSi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309459571"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="309459571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:33:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="996160728"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="996160728"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.252])
 ([10.249.169.252])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:33:04 -0800
Message-ID: <0ffc69e1-5b2f-d8f9-ff45-cfd0cb0357da@intel.com>
Date: Wed, 8 Feb 2023 22:33:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/6] i386: Remove unused parameter "uint32_t bit" in
 feature_word_description()
To: Lei Wang <lei4.wang@intel.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com, yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-3-lei4.wang@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230106083826.5384-3-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/6/2023 4:38 PM, Lei Wang wrote:
> Parameter "uint32_t bit" is not used in function feature_word_description(),
> so remove it.
> 
> Signed-off-by: Lei Wang <lei4.wang@intel.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   target/i386/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b6d1247e5e..883098bc5a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4290,7 +4290,7 @@ static const TypeInfo max_x86_cpu_type_info = {
>       .class_init = max_x86_cpu_class_init,
>   };
>   
> -static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
> +static char *feature_word_description(FeatureWordInfo *f)
>   {
>       assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
>   
> @@ -4329,6 +4329,7 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>       CPUX86State *env = &cpu->env;
>       FeatureWordInfo *f = &feature_word_info[w];
>       int i;
> +    g_autofree char *feat_word_str = feature_word_description(f);
>   
>       if (!cpu->force_features) {
>           env->features[w] &= ~mask;
> @@ -4341,7 +4342,6 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>   
>       for (i = 0; i < 64; ++i) {
>           if ((1ULL << i) & mask) {
> -            g_autofree char *feat_word_str = feature_word_description(f, i);
>               warn_report("%s: %s%s%s [bit %d]",
>                           verbose_prefix,
>                           feat_word_str,


