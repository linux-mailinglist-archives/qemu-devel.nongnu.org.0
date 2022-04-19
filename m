Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E910507CC8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:46:15 +0200 (CEST)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngwbu-0004sC-HB
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1ngwZy-0003VQ-Mg
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:44:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1ngwZv-0003RA-HF
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:44:14 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h1so134144pfv.12
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VLhwP2K5wAQdNCL/I+laKlmhhmXTIYpsE+P3ZBVdEQY=;
 b=r6feRZnKvLFz70LElt69P5H+fCR2FPIhGGDf/HEN3FRecAYZ9XCe48UHMGy+CySLim
 Nf5DSsTsuheV1j+T6ia1xrZDpsTF3FTPXu+PVf45W3eRaPm0iYir4XnaqNkn/g+rZCO2
 +mve4Z0JSADruCniouTjwzcvVDbH3e2O3juiT4JkLMIr7ZXwKFqeJlsDlQ8PoQ143YKV
 4mXbdBPsHAvnmaRpFABAN6Fu2TxYwMuj7lx3m1l+FUNKtOImv1EuD09eyGgiiWGIIwwL
 LNoj8AvJNwOZZPiT6ZBr88Y7Sec+d18PBB4ep9ryJg1nLwP6Jf9EVG8Bvth2Y321pPhZ
 R+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLhwP2K5wAQdNCL/I+laKlmhhmXTIYpsE+P3ZBVdEQY=;
 b=cz4GBZfK11KTF9Ffch+fh/44y+N1tM6Hf+lORbsQZIJJpeVSLFs1RU1vbdmmOyPyZf
 EKCIsXyOxChWliy9CDDWY3ux76NAyT23rQDxI0sa7Q3Ez5rX4Y3OyVqCdOWC8r2G6oxE
 Yj2VefHZUGqmlnsWR2M2nlCZUMF2KWntUcOnxAd8AuLcm0g1Q8a2/kcTMZARxG6UIv7G
 dHPiBOv4AWFAcORReDIwj/QpGpeHM9L5Ny7BBfmk2kkRWN2GFQWCwY9qCj2BYOSLueFa
 kBMRHFk2BiSjzXFGOI/5PrI6OpAnkRDVmgIJpyMUjf3nUJvKOAsmrKrz5hWF/IpS/+N3
 scJQ==
X-Gm-Message-State: AOAM533gu9by+olzgHok6BH73ZRMjapB0tvgDzGVR6zOBKz3aB6GORX4
 xl9jiV4ednxgJ5sDzzjrNRGyJtoihrzPTq991D6gqA==
X-Google-Smtp-Source: ABdhPJy1nh6THruK7UwMlM2wpxzbJNt+bc4+NMZX+nwIAjwmQ/JmNyUx85odCJYd4rFIN0fRrs6lthI6/1JylF8mddI=
X-Received: by 2002:a65:56cb:0:b0:378:82ed:d74 with SMTP id
 w11-20020a6556cb000000b0037882ed0d74mr16683302pgs.491.1650408247642; Tue, 19
 Apr 2022 15:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-12-chao.p.peng@linux.intel.com>
In-Reply-To: <20220310140911.50924-12-chao.p.peng@linux.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 19 Apr 2022 15:43:56 -0700
Message-ID: <CAGtprH-qTB2sehidF7xkSvR3X4D5cUOLpMBXf4mhTEh0BUR-mQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/13] KVM: Zap existing KVM mappings when pages
 changed in the private fd
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=vannapurve@google.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 6:11 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> KVM gets notified when memory pages changed in the memory backing store.
> When userspace allocates the memory with fallocate() or frees memory
> with fallocate(FALLOC_FL_PUNCH_HOLE), memory backing store calls into
> KVM fallocate/invalidate callbacks respectively. To ensure KVM never
> maps both the private and shared variants of a GPA into the guest, in
> the fallocate callback, we should zap the existing shared mapping and
> in the invalidate callback we should zap the existing private mapping.
>
> In the callbacks, KVM firstly converts the offset range into the
> gfn_range and then calls existing kvm_unmap_gfn_range() which will zap
> the shared or private mapping. Both callbacks pass in a memslot
> reference but we need 'kvm' so add a reference in memslot structure.
>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/linux/kvm_host.h |  3 ++-
>  virt/kvm/kvm_main.c      | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 9b175aeca63f..186b9b981a65 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -236,7 +236,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>  int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
>  #endif
>
> -#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> +#if defined(KVM_ARCH_WANT_MMU_NOTIFIER) || defined(CONFIG_MEMFILE_NOTIFIER)
>  struct kvm_gfn_range {
>         struct kvm_memory_slot *slot;
>         gfn_t start;
> @@ -568,6 +568,7 @@ struct kvm_memory_slot {
>         loff_t private_offset;
>         struct memfile_pfn_ops *pfn_ops;
>         struct memfile_notifier notifier;
> +       struct kvm *kvm;
>  };
>
>  static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 67349421eae3..52319f49d58a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -841,8 +841,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
>  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
>
>  #ifdef CONFIG_MEMFILE_NOTIFIER
> +static void kvm_memfile_notifier_handler(struct memfile_notifier *notifier,
> +                                        pgoff_t start, pgoff_t end)
> +{
> +       int idx;
> +       struct kvm_memory_slot *slot = container_of(notifier,
> +                                                   struct kvm_memory_slot,
> +                                                   notifier);
> +       struct kvm_gfn_range gfn_range = {
> +               .slot           = slot,
> +               .start          = start - (slot->private_offset >> PAGE_SHIFT),
> +               .end            = end - (slot->private_offset >> PAGE_SHIFT),
> +               .may_block      = true,
> +       };
> +       struct kvm *kvm = slot->kvm;
> +
> +       gfn_range.start = max(gfn_range.start, slot->base_gfn);

gfn_range.start seems to be page offset within the file. Should this rather be:
gfn_range.start = slot->base_gfn + min(gfn_range.start, slot->npages);

> +       gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> +

Similar to previous comment, should this rather be:
gfn_range.end = slot->base_gfn + min(gfn_range.end, slot->npages);

> +       if (gfn_range.start >= gfn_range.end)
> +               return;
> +
> +       idx = srcu_read_lock(&kvm->srcu);
> +       KVM_MMU_LOCK(kvm);
> +       kvm_unmap_gfn_range(kvm, &gfn_range);
> +       kvm_flush_remote_tlbs(kvm);
> +       KVM_MMU_UNLOCK(kvm);
> +       srcu_read_unlock(&kvm->srcu, idx);
> +}
> +
> +static struct memfile_notifier_ops kvm_memfile_notifier_ops = {
> +       .invalidate = kvm_memfile_notifier_handler,
> +       .fallocate = kvm_memfile_notifier_handler,
> +};
> +
>  static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
>  {
> +       slot->notifier.ops = &kvm_memfile_notifier_ops;
>         return memfile_register_notifier(file_inode(slot->private_file),
>                                          &slot->notifier,
>                                          &slot->pfn_ops);
> @@ -1963,6 +1998,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>         new->private_file = file;
>         new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
>                               region_ext->private_offset : 0;
> +       new->kvm = kvm;
>
>         r = kvm_set_memslot(kvm, old, new, change);
>         if (!r)
> --
> 2.17.1
>

