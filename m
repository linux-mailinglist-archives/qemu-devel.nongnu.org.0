Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD5457EBE
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 15:44:09 +0100 (CET)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moRb5-0003OX-QN
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 09:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoyuan0329os@gmail.com>)
 id 1moFbM-00050t-Nc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 20:55:36 -0500
Received: from [2607:f8b0:4864:20::52b] (port=36438
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaoyuan0329os@gmail.com>)
 id 1moFbK-0006G8-Iu
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 20:55:35 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g28so10087347pgg.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 17:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=17p5myYhxd1DhZxcAj8FE6tGw2XX7477rU/2jCULHIY=;
 b=ZaSY/6WDh36yTnPO3funThb8FwveZMT1wex7pJVnn+fZUBC1p9v0eYH/dLMcaB9HXN
 MF3+NE6ZVSK5hvPAoxzMspYsPJ2/t7RaoPXTPsvrWt1VPXyg5Ydz2GjI4oBEy7/Yqy7v
 HYQy9OCN4y2ylWkNEWFbXnJk5rad8Lbi2qLJVDzMlyowodFGSanwfsdvKMwc58d8p8ti
 lBcnLahb0sluOe9H0N/Y2EvQCJY/znuguPHpkNygQujYswQ8EwCxe3PZfzmen+S0jRQj
 p1KmZszVCG8Z+8Pi76caVM4IZW79xuweOrGg1QQ+HMA4uk2m9TY4cdOQr/zSFw1EvS6+
 09zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=17p5myYhxd1DhZxcAj8FE6tGw2XX7477rU/2jCULHIY=;
 b=XkxdYrPBDiABQPgnv+1Rtpuxbpc3GW9ajXN7hOX650SwA37MbKMcgu0KfUP1nhzhlV
 YqumSgjeLcERm/f7WqXJVPB5b+KCvjQwxAEdIMSnvcvI7CuSuRc6YJ7gFtTNekzZOYAo
 mqTG7SqM+ccUEyYKdHE2l/5+QwRoAdpKLBrTxRlax6jxb6IPFXxSVsH/cMNLTLtvRki6
 OF0aWbAdv0KGXJmQeEdYk0YNioyJRIWRRLltAiiYBXs8z9RqZwSxmf5fR/6lIG0FDxF+
 alUIRZfDi7UHZjSMcN5qpSPJxiHA+r5NhmZnT/68yzxkHavXLWMAuYCarm3IVa2NmGFQ
 h2EQ==
X-Gm-Message-State: AOAM530f4czCMqLhTo3ZGdNrEY368e4i7xEpGE/OjD23/qoVExvp6W5Z
 nxqB2ta/49ypuBJMG2e5EZg=
X-Google-Smtp-Source: ABdhPJxqfGSAOl+n1hw3lcxU/J2v5Bgk2T0qOLxz/60dcuVIoDGE4CcngM8bedIUT1nnDOyJlWJAjw==
X-Received: by 2002:a62:2503:0:b0:4a2:b772:25ac with SMTP id
 l3-20020a622503000000b004a2b77225acmr43341008pfl.53.1637373332481; 
 Fri, 19 Nov 2021 17:55:32 -0800 (PST)
Received: from localhost (176.222.229.35.bc.googleusercontent.com.
 [35.229.222.176])
 by smtp.gmail.com with ESMTPSA id x64sm845844pfd.151.2021.11.19.17.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 17:55:31 -0800 (PST)
Date: Sat, 20 Nov 2021 09:55:29 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [RFC v2 PATCH 07/13] KVM: Handle page fault for fd based memslot
Message-ID: <20211120015529.w23fg2df3fqs4ov5@sapienza>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-8-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119134739.20218-8-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=yaoyuan0329os@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 20 Nov 2021 09:43:13 -0500
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 09:47:33PM +0800, Chao Peng wrote:
> Current code assume the private memory is persistent and KVM can check
> with backing store to see if private memory exists at the same address
> by calling get_pfn(alloc=false).
>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 75 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 73 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 40377901598b..cd5d1f923694 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3277,6 +3277,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
>  	if (max_level == PG_LEVEL_4K)
>  		return PG_LEVEL_4K;
>
> +	if (memslot_is_memfd(slot))
> +		return max_level;
> +
>  	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
>  	return min(host_level, max_level);
>  }
> @@ -4555,6 +4558,65 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>  				  kvm_vcpu_gfn_to_hva(vcpu, gfn), &arch);
>  }
>
> +static bool kvm_faultin_pfn_memfd(struct kvm_vcpu *vcpu,
> +				  struct kvm_page_fault *fault, int *r)
> +{	int order;
> +	kvm_pfn_t pfn;
> +	struct kvm_memory_slot *slot = fault->slot;
> +	bool priv_gfn = kvm_vcpu_is_private_gfn(vcpu, fault->addr >> PAGE_SHIFT);
> +	bool priv_slot_exists = memslot_has_private(slot);
> +	bool priv_gfn_exists = false;
> +	int mem_convert_type;
> +
> +	if (priv_gfn && !priv_slot_exists) {
> +		*r = RET_PF_INVALID;
> +		return true;
> +	}
> +
> +	if (priv_slot_exists) {
> +		pfn = slot->memfd_ops->get_pfn(slot, slot->priv_file,
> +					       fault->gfn, false, &order);
> +		if (pfn >= 0)
> +			priv_gfn_exists = true;

Need "fault->pfn = pfn" here if actual pfn is returned in
get_pfn(alloc=false) case for private page case.

> +	}
> +
> +	if (priv_gfn && !priv_gfn_exists) {
> +		mem_convert_type = KVM_EXIT_MEM_MAP_PRIVATE;
> +		goto out_convert;
> +	}
> +
> +	if (!priv_gfn && priv_gfn_exists) {
> +		slot->memfd_ops->put_pfn(pfn);
> +		mem_convert_type = KVM_EXIT_MEM_MAP_SHARED;
> +		goto out_convert;
> +	}
> +
> +	if (!priv_gfn) {
> +		pfn = slot->memfd_ops->get_pfn(slot, slot->file,
> +					       fault->gfn, true, &order);

Need "fault->pfn = pfn" here, because he pfn for
share page is getted here only.

> +		if (fault->pfn < 0) {
> +			*r = RET_PF_INVALID;
> +			return true;
> +		}
> +	}
> +
> +	if (slot->flags & KVM_MEM_READONLY)
> +		fault->map_writable = false;
> +	if (order == 0)
> +		fault->max_level = PG_LEVEL_4K;
> +
> +	return false;
> +
> +out_convert:
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
> +	vcpu->run->mem.type = mem_convert_type;
> +	vcpu->run->mem.u.map.gpa = fault->gfn << PAGE_SHIFT;
> +	vcpu->run->mem.u.map.size = PAGE_SIZE;
> +	fault->pfn = -1;
> +	*r = -1;
> +	return true;
> +}
> +
>  static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault, int *r)
>  {
>  	struct kvm_memory_slot *slot = fault->slot;
> @@ -4596,6 +4658,9 @@ static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
>  		}
>  	}
>
> +	if (memslot_is_memfd(slot))
> +		return kvm_faultin_pfn_memfd(vcpu, fault, r);
> +
>  	async = false;
>  	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
>  					  fault->write, &fault->map_writable,
> @@ -4660,7 +4725,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	else
>  		write_lock(&vcpu->kvm->mmu_lock);
>
> -	if (fault->slot && mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva))
> +	if (fault->slot && !memslot_is_memfd(fault->slot) &&
> +			mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva))
>  		goto out_unlock;
>  	r = make_mmu_pages_available(vcpu);
>  	if (r)
> @@ -4676,7 +4742,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  	else
>  		write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +
> +	if (memslot_is_memfd(fault->slot))
> +		fault->slot->memfd_ops->put_pfn(fault->pfn);
> +	else
> +		kvm_release_pfn_clean(fault->pfn);
> +
>  	return r;
>  }
>
> --
> 2.17.1
>

