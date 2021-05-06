Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DF375D20
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 00:18:44 +0200 (CEST)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lemKQ-0002SJ-K8
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 18:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lemIi-000218-CJ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 18:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lemIf-0000N8-Km
 for qemu-devel@nongnu.org; Thu, 06 May 2021 18:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620339411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVqtcHMBiEb5CBRrlD2feZ+Jh9dkQ48ROy3h7QQSIaA=;
 b=UiW8H7RrnHr5SAuNY13ZZkrYgb1/x/YTrFEsOZdXZ7MqQWbfgiLPMQO6jfCmTrFQFqqVR7
 MSpuyIya29Wc5zNp3nZbXvMfkUICW4Jn5LMXzzB8P8ATLuWQxBk0lZaQFdbtcbcENf2UZH
 lA2yI7a4nntUHtN54C5TyiZgEzOe28Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-bCkilFXlNEGUMolnrLCKfA-1; Thu, 06 May 2021 18:16:49 -0400
X-MC-Unique: bCkilFXlNEGUMolnrLCKfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC99318397A4;
 Thu,  6 May 2021 22:16:48 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6638710027A5;
 Thu,  6 May 2021 22:16:48 +0000 (UTC)
Date: Thu, 6 May 2021 18:16:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Yang Weijiang <weijiang.yang@intel.com>
Subject: Re: [PATCH v7 2/6] target/i386: Enable XSS feature enumeration for
 CPUID
Message-ID: <20210506221647.zaq4or66rqspxssb@habkost.net>
References: <20210226022058.24562-1-weijiang.yang@intel.com>
 <20210226022058.24562-3-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210226022058.24562-3-weijiang.yang@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, sean.j.christopherson@intel.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 26, 2021 at 10:20:54AM +0800, Yang Weijiang wrote:
> Currently, CPUID.(EAX=0DH,ECX=01H) doesn't enumerate features in
> XSS properly, add the support here. XCR0 bits indicate user-mode XSAVE
> components, and XSS bits indicate supervisor-mode XSAVE components.
> 
> Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> ---
>  target/i386/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++-----
>  target/i386/cpu.h | 12 ++++++++++++
>  2 files changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 89edab4240..f3923988ed 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1058,6 +1058,24 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          },
>          .tcg_features = TCG_XSAVE_FEATURES,
>      },
> +    [FEAT_XSAVE_XSS_LO] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0xD,
> +            .needs_ecx = true,
> +            .ecx = 1,
> +            .reg = R_ECX,
> +        },
> +    },
> +    [FEAT_XSAVE_XSS_HI] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0xD,
> +            .needs_ecx = true,
> +            .ecx = 1,
> +            .reg = R_EDX
> +        },
> +    },
>      [FEAT_6_EAX] = {
>          .type = CPUID_FEATURE_WORD,
>          .feat_names = {
> @@ -1478,6 +1496,9 @@ static uint32_t xsave_area_size(uint64_t mask)
>      for (i = 0; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
>          const ExtSaveArea *esa = &x86_ext_save_areas[i];
>          if ((mask >> i) & 1) {
> +            if (i >= 2 && !esa->offset) {

Maybe a few comments at the definition of ExtSaveArea to explain
that offset can now be zero (and what it means when it's zero)
would be helpful.  I took a while to understand why this is safe.

Would it be valid to say "ExtSaveArea.offset has a valid offset
only if the component is in CPUID_XSTATE_XCR0_MASK"?  If so,
can't this check be simply replaced with:
  if ((1 << i) & CPUID_XSTATE_XCR0_MASK)
?

Or maybe this function should just contain a:
  assert(!(mask & CPUID_XSTATE_XCR0_MASK));
at the beginning?


> +                continue;
> +            }
>              ret = MAX(ret, esa->offset + esa->size);
>          }
>      }
> @@ -1489,12 +1510,18 @@ static inline bool accel_uses_host_cpuid(void)
>      return kvm_enabled() || hvf_enabled();
>  }
>  
> -static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
> +static inline uint64_t x86_cpu_xsave_xcr0_components(X86CPU *cpu)
>  {
>      return ((uint64_t)cpu->env.features[FEAT_XSAVE_XCR0_HI]) << 32 |
>             cpu->env.features[FEAT_XSAVE_XCR0_LO];
>  }
>  
> +static inline uint64_t x86_cpu_xsave_xss_components(X86CPU *cpu)
> +{
> +    return ((uint64_t)cpu->env.features[FEAT_XSAVE_XSS_HI]) << 32 |
> +           cpu->env.features[FEAT_XSAVE_XSS_LO];
> +}
> +
>  const char *get_register_name_32(unsigned int reg)
>  {
>      if (reg >= CPU_NB_REGS32) {
> @@ -5716,7 +5743,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          }
>  
>          if (count == 0) {
> -            *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
> +            *ecx = xsave_area_size(x86_cpu_xsave_xcr0_components(cpu));
>              *eax = env->features[FEAT_XSAVE_XCR0_LO];
>              *edx = env->features[FEAT_XSAVE_XCR0_HI];
>              /*
> @@ -5728,11 +5755,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>              *ebx = kvm_enabled() ? *ecx : xsave_area_size(env->xcr0);
>          } else if (count == 1) {
>              *eax = env->features[FEAT_XSAVE];
> +            *ecx = env->features[FEAT_XSAVE_XSS_LO];
> +            *edx = env->features[FEAT_XSAVE_XSS_HI];

What about EBX?  It is documented as "The size in bytes of the
XSAVE area containing all states enabled by XCRO | IA32_XSS".

The Intel SDM is not clear, but I assume this would be
necessarily the size of the area in compacted format?


>          } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
> -            if ((x86_cpu_xsave_components(cpu) >> count) & 1) {
> -                const ExtSaveArea *esa = &x86_ext_save_areas[count];
> +            const ExtSaveArea *esa = &x86_ext_save_areas[count];
> +            if ((x86_cpu_xsave_xcr0_components(cpu) >> count) & 1) {
>                  *eax = esa->size;
>                  *ebx = esa->offset;
> +            } else if ((x86_cpu_xsave_xss_components(cpu) >> count) & 1) {
> +                *eax = esa->size;
> +                *ebx = 0;
> +                *ecx = 1;
>              }
>          }
>          break;
> @@ -6059,6 +6092,9 @@ static void x86_cpu_reset(DeviceState *dev)
>      }
>      for (i = 2; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
>          const ExtSaveArea *esa = &x86_ext_save_areas[i];
> +        if (!esa->offset) {
> +            continue;

Most of the comments at the xsave_area_size() hunk would apply
here.  I miss some clarity on what esa->offset==0 really means.

Would it be valid to replace this with a check for
  ((1 << i) & CPUID_XSTATE_XCR0_MASK)
?

> +        }
>          if (env->features[esa->feature] & esa->bits) {
>              xcr0 |= 1ull << i;
>          }
> @@ -6295,8 +6331,10 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>          }
>      }
>  
> -    env->features[FEAT_XSAVE_XCR0_LO] = mask;
> +    env->features[FEAT_XSAVE_XCR0_LO] = mask & CPUID_XSTATE_XCR0_MASK;
>      env->features[FEAT_XSAVE_XCR0_HI] = mask >> 32;
> +    env->features[FEAT_XSAVE_XSS_LO] = mask & CPUID_XSTATE_XSS_MASK;
> +    env->features[FEAT_XSAVE_XSS_HI] = mask >> 32;
>  }
>  
>  /***** Steps involved on loading and filtering CPUID data
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 52f31335c4..8aeaa8869a 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -504,6 +504,16 @@ typedef enum X86Seg {
>  #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
>  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
>  
> +/* CPUID feature bits available in XCR0 */
> +#define CPUID_XSTATE_XCR0_MASK  (XSTATE_FP_MASK | XSTATE_SSE_MASK | \
> +                                 XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK | \
> +                                 XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK | \
> +                                 XSTATE_ZMM_Hi256_MASK | \
> +                                 XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK)
> +
> +/* CPUID feature bits available in XSS */
> +#define CPUID_XSTATE_XSS_MASK    0

Do you expect this to be used outside target/i386/cpu.c?  If not,
maybe it could be moved close to the x86_ext_save_areas[]
definition, as any updates to x86_ext_save_areas will require an
update to these macros.

> +
>  /* CPUID feature words */
>  typedef enum FeatureWord {
>      FEAT_1_EDX,         /* CPUID[1].EDX */
> @@ -541,6 +551,8 @@ typedef enum FeatureWord {
>      FEAT_VMX_EPT_VPID_CAPS,
>      FEAT_VMX_BASIC,
>      FEAT_VMX_VMFUNC,
> +    FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
> +    FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
>      FEATURE_WORDS,
>  } FeatureWord;
>  
> -- 
> 2.26.2
> 
> 

-- 
Eduardo


