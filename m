Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE232763F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 03:58:03 +0100 (CET)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGYl1-00089D-1m
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 21:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lGYkG-0007jU-BM
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:57:16 -0500
Received: from mga14.intel.com ([192.55.52.115]:25480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lGYkE-0008A3-06
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 21:57:16 -0500
IronPort-SDR: IxQMRBw1704hqpP3HsAFsTihjL5/ThOW00B4RdQDMX0Rq3DgBasXIjuHzzNo3JOUK4FB0FoZuc
 sGX5Owz6sZXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="185661460"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="185661460"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:57:11 -0800
IronPort-SDR: MsHAr2uqg0BPQuUWwpdiUL+tE2Bh4TaW+PQ0D6gzBKx+zgvI5E0IUZAzDlSyqsVqcbPf8SYMbA
 J7vsNCSZhlbw==
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="397267607"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.238.4.93])
 ([10.238.4.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:57:10 -0800
Subject: Re: [PATCH v2 1/2] target/i386: add "-cpu, lbr-fmt=*" support to
 enable guest LBR
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210201045453.240258-1-like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <3d325921-24f6-265d-fdb6-836039f9432e@linux.intel.com>
Date: Mon, 1 Mar 2021 10:57:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210201045453.240258-1-like.xu@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=like.xu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo & Eduardo,

Do we have any comment for the QEMU LBR enabling patches?

https://lore.kernel.org/qemu-devel/20210201045453.240258-1-like.xu@linux.intel.com/

On 2021/2/1 12:54, Like Xu wrote:
> The last branch recording (LBR) is a performance monitor unit (PMU)
> feature on Intel processors that records a running trace of the most
> recent branches taken by the processor in the LBR stack. The QEMU
> could configure whether it's enabled or not for each guest via CLI.
> 
> The LBR feature would be enabled on the guest if:
> - the KVM is enabled and the PMU is enabled and,
> - the msr-based-feature IA32_PERF_CAPABILITIES is supporterd on KVM and,
> - the supported returned value for lbr_fmt from this msr is not zero and,
> - the requested guest vcpu model does support FEAT_1_ECX.CPUID_EXT_PDCM,
> - the configured lbr-fmt value is the same as the host lbr_fmt value
>    or use the QEMU option "-cpu host,migratable=no".
> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>   target/i386/cpu.c     | 16 ++++++++++++++++
>   target/i386/cpu.h     | 10 ++++++++++
>   target/i386/kvm/kvm.c |  5 +++--
>   3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ae89024d36..80a5d3f0c2 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6504,6 +6504,13 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>               x86_cpu_get_supported_feature_word(w, false);
>           uint64_t requested_features = env->features[w];
>           uint64_t unavailable_features = requested_features & ~host_feat;
> +        if (kvm_enabled() && w == FEAT_PERF_CAPABILITIES &&
> +            (requested_features & PERF_CAP_LBR_FMT)) {
> +            if ((host_feat & PERF_CAP_LBR_FMT) !=
> +                (requested_features & PERF_CAP_LBR_FMT)) {
> +                unavailable_features |= PERF_CAP_LBR_FMT;
> +            }
> +        }
>           mark_unavailable_features(cpu, w, unavailable_features, prefix);
>       }
>   
> @@ -6611,6 +6618,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>           }
>       }
>   
> +    if (cpu->lbr_fmt) {
> +        if (!cpu->enable_pmu) {
> +            error_setg(errp, "LBR is unsupported since guest PMU is disabled.");
> +            return;
> +        }
> +        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
> +    }
> +
>       /* mwait extended info: needed for Core compatibility */
>       /* We always wake on interrupt even if host does not have the capability */
>       cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
> @@ -7184,6 +7199,7 @@ static Property x86_cpu_properties[] = {
>   #endif
>       DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
>       DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
> +    DEFINE_PROP_UINT8("lbr-fmt", X86CPU, lbr_fmt, 0),
>   
>       DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
>                          HYPERV_SPINLOCK_NEVER_NOTIFY),
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d23a5b340a..64320bced2 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -354,6 +354,7 @@ typedef enum X86Seg {
>   #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
>   
>   #define MSR_IA32_PERF_CAPABILITIES      0x345
> +#define PERF_CAP_LBR_FMT      0x3f
>   
>   #define MSR_IA32_TSX_CTRL		0x122
>   #define MSR_IA32_TSCDEADLINE            0x6e0
> @@ -1709,6 +1710,15 @@ struct X86CPU {
>        */
>       bool enable_pmu;
>   
> +    /*
> +     * Configure LBR_FMT bits on IA32_PERF_CAPABILITIES MSR.
> +     * This can't be enabled by default yet because it doesn't have
> +     * ABI stability guarantees, as it is only allowed to pass all
> +     * LBR_FMT bits returned by kvm_arch_get_supported_msr_feature()
> +     * (that depends on host CPU and kernel capabilities) to the guest.
> +     */
> +    uint8_t lbr_fmt;
> +
>       /* LMCE support can be enabled/disabled via cpu option 'lmce=on/off'. It is
>        * disabled by default to avoid breaking migration between QEMU with
>        * different LMCE configurations.
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 6dc1ee052d..49745efb78 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2705,8 +2705,9 @@ static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
>                                              MSR_IA32_PERF_CAPABILITIES);
>   
>       if (kvm_perf_cap) {
> -        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES,
> -                        kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]);
> +        kvm_perf_cap = cpu->migratable ?
> +            (kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]) : kvm_perf_cap;
> +        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES, kvm_perf_cap);
>       }
>   }
>   
> 


