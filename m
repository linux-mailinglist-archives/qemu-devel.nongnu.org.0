Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C362CC58
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 22:13:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovPh6-0004UL-Oo; Wed, 16 Nov 2022 16:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ek11YwsKCqMDFNHUOHbWQJJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--ackerleytng.bounces.google.com>)
 id 1ovPMg-0006NL-Ao
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 15:50:34 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ek11YwsKCqMDFNHUOHbWQJJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--ackerleytng.bounces.google.com>)
 id 1ovPMa-0005a9-S0
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 15:50:34 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 bw25-20020a056a00409900b0056bdd4f8818so10341287pfb.15
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vm8HknjbQpP5x1fHUQZ8Fa+JhrBUsKYRYb84Ljw06/8=;
 b=BxC9ZIiQoKs8ZVqFtGoVwkhZjhvx+R8PRQB6GTtgA210grIKaMUfq2t0MWY3kI6kkp
 Ri7QGvFmdcQHkk1hdrwKgiBlH7UL9kkXPXLqHdnAIp3PIrrDNkNKuXekVJ7+ZRLfdmPg
 cQkuCip07OmxTzEL5JEZGej5dA3zvd1W4OtdIo2gBJqiIu2fJkfRqzbucnRGJGmvoaGQ
 JeagXDUkI3LTmVilwN+XEnCxUy4kfrqeJ1CvBsbW5yvysO4wop2f/STxLeY9zAtDUUFw
 n8gsLiJIOgQlD8T85gNo08kYyGRdhjrlcaafVDzmuk2vc2ElQCmnrFZnsbi5bwPjtr2C
 xOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vm8HknjbQpP5x1fHUQZ8Fa+JhrBUsKYRYb84Ljw06/8=;
 b=qv2eRLHpxsSv+MkuMU/2K8Ha2G5sPBE70TYre/Ruda+BndANdf1KKf8Is4fXeaQIfx
 MTyaw8p9HTtGNlA0B0n6RhEh13Ji7VLpvMmu8pWfiWe7ru4NubsFf8rV7EKXb6AFpUvl
 2E2i6tgUwSN6o2W1eB8WGcXme+sWIXi5V7Fe8P1KsPX2JIyPuirGJgg1pqFt0Ur0rYMW
 LJxokQMDijD8kmImHmhfDbnMJQO0Aw3sB3+R9MBAqxCDi/OfOBs8BEBlj1aMDIcBh/l0
 SnLnBXgpw6zR0NPYdM57dTYCLO2AX6hg/Z+X1JqBfs9ZbMwxUtlR1WrTc93BbyQdg4cs
 Mzyg==
X-Gm-Message-State: ANoB5pn/SXof8Tos++DM8b6+W+W+Wk18s7Kbm2oTrzXct+6gy3zOmwdY
 v9VGJQQ6LpdTbvrf5iwydDo2P7O1rL8eH4Q8TA==
X-Google-Smtp-Source: AA0mqf41ZmTXB/mfU/GsYmUkRkGNKElgXElKSWsJxXMeA5xlBE38lutMTDBINT6VM1Rkky14pOwbEWAq8JgrwGlebg==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:aa7:9041:0:b0:572:9681:1018 with SMTP
 id n1-20020aa79041000000b0057296811018mr6472865pfo.39.1668631826322; Wed, 16
 Nov 2022 12:50:26 -0800 (PST)
Date: Wed, 16 Nov 2022 20:50:25 +0000
In-Reply-To: <20221025151344.3784230-8-chao.p.peng@linux.intel.com>
Mime-Version: 1.0
References: <20221025151344.3784230-8-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221116205025.1510291-1-ackerleytng@google.com>
Subject: Re: [PATCH v9 7/8] KVM: Handle page fault for private memory
From: Ackerley Tng <ackerleytng@google.com>
To: chao.p.peng@linux.intel.com
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 bfields@fieldses.org, bp@alien8.de, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, kvm@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com, 
 mingo@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 qperret@google.com, rppt@kernel.org, seanjc@google.com, shuah@kernel.org, 
 songmuchun@bytedance.com, steven.price@arm.com, tabba@google.com, 
 tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz, 
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com, 
 x86@kernel.org, yu.c.zhang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3Ek11YwsKCqMDFNHUOHbWQJJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--ackerleytng.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Nov 2022 16:11:39 -0500
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

> A memslot with KVM_MEM_PRIVATE being set can include both fd-based
> private memory and hva-based shared memory. Architecture code (like TDX
> code) can tell whether the on-going fault is private or not. This patch
> adds a 'is_private' field to kvm_page_fault to indicate this and
> architecture code is expected to set it.
>
> To handle page fault for such memslot, the handling logic is different
> depending on whether the fault is private or shared. KVM checks if
> 'is_private' matches the host's view of the page (maintained in
> mem_attr_array).
>   - For a successful match, private pfn is obtained with
>     restrictedmem_get_page () from private fd and shared pfn is obtained
>     with existing get_user_pages().
>   - For a failed match, KVM causes a KVM_EXIT_MEMORY_FAULT exit to
>     userspace. Userspace then can convert memory between private/shared
>     in host's view and retry the fault.
>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  arch/x86/kvm/mmu/mmu.c          | 56 +++++++++++++++++++++++++++++++--
>  arch/x86/kvm/mmu/mmu_internal.h | 14 ++++++++-
>  arch/x86/kvm/mmu/mmutrace.h     |  1 +
>  arch/x86/kvm/mmu/spte.h         |  6 ++++
>  arch/x86/kvm/mmu/tdp_mmu.c      |  3 +-
>  include/linux/kvm_host.h        | 28 +++++++++++++++++
>  6 files changed, 103 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 67a9823a8c35..10017a9f26ee 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3030,7 +3030,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>
>  int kvm_mmu_max_mapping_level(struct kvm *kvm,
>  			      const struct kvm_memory_slot *slot, gfn_t gfn,
> -			      int max_level)
> +			      int max_level, bool is_private)
>  {
>  	struct kvm_lpage_info *linfo;
>  	int host_level;
> @@ -3042,6 +3042,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>  			break;
>  	}
>
> +	if (is_private)
> +		return max_level;
> +
>  	if (max_level == PG_LEVEL_4K)
>  		return PG_LEVEL_4K;
>
> @@ -3070,7 +3073,8 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	 * level, which will be used to do precise, accurate accounting.
>  	 */
>  	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, slot,
> -						     fault->gfn, fault->max_level);
> +						     fault->gfn, fault->max_level,
> +						     fault->is_private);
>  	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
>  		return;
>
> @@ -4141,6 +4145,32 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>  	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true);
>  }
>
> +static inline u8 order_to_level(int order)
> +{
> +	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> +		return PG_LEVEL_1G;
> +
> +	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> +		return PG_LEVEL_2M;
> +
> +	return PG_LEVEL_4K;
> +}
> +
> +static int kvm_faultin_pfn_private(struct kvm_page_fault *fault)
>  +{
>  +	int order;
>  +	struct kvm_memory_slot *slot = fault->slot;
>  +
>  +	if (kvm_restricted_mem_get_pfn(slot, fault->gfn, &fault->pfn, &order))
>+		return RET_PF_RETRY;
>+
>+	fault->max_level = min(order_to_level(order), fault->max_level);
>+	fault->map_writable = !(slot->flags & KVM_MEM_READONLY);
>+	return RET_PF_CONTINUE;
>+}
>+
> static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> {
> 	struct kvm_memory_slot *slot = fault->slot;
>@@ -4173,6 +4203,22 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> 			return RET_PF_EMULATE;
> 	}
>
>+	if (kvm_slot_can_be_private(slot) &&
>+	    fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
>+		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
>+		if (fault->is_private)
>+			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
>+		else
>+			vcpu->run->memory.flags = 0;
>+		vcpu->run->memory.padding = 0;
>+		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
>+		vcpu->run->memory.size = PAGE_SIZE;
>+		return RET_PF_USER;
>+	}
>+
>+	if (fault->is_private)
>+		return kvm_faultin_pfn_private(fault);
>+

Since each memslot may also not be backed by restricted memory, we
should also check if the memslot has been set up for private memory
with

	if (fault->is_private && kvm_slot_can_be_private(slot))
		return kvm_faultin_pfn_private(fault);

Without this check, restrictedmem_get_page will get called with NULL
in slot->restricted_file, which causes a NULL pointer dereference.

> 	async = false;
> 	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
> 					  fault->write, &fault->map_writable,
>@@ -5557,6 +5603,9 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
> 			return -EIO;
> 	}
>
>+	if (r == RET_PF_USER)
>+		return 0;
>+
> 	if (r < 0)
> 		return r;
> 	if (r != RET_PF_EMULATE)
>@@ -6408,7 +6457,8 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
> 		 */
> 		if (sp->role.direct &&
> 		    sp->role.level < kvm_mmu_max_mapping_level(kvm, slot, sp->gfn,
>-							       PG_LEVEL_NUM)) {
>+							       PG_LEVEL_NUM,
>+							       false)) {
> 			kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
>
> 			if (kvm_available_flush_tlb_with_range())

