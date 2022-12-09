Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2999647FB2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 09:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ZCy-00029V-JH; Fri, 09 Dec 2022 03:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1p3ZCw-00028t-9i
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:58:14 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1p3ZCs-0000M7-S9
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:58:14 -0500
Received: by mail-lf1-x12c.google.com with SMTP id cf42so6046392lfb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 00:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gp1CS7Meiq+pIbSii4z5cXIlLneg3MN7qFdozmHymVI=;
 b=E/x8MfyHq0pvG76tFAoTpvy7CIl6AZ/DXSktZtUUHx9htZyzZzIyyyejJX+Z5LhNoZ
 BfbRN8UAevFSOtzp4JppIsvy8NAubeUIHoHXy12LJuicNHsxJ0ywnFBkhhPc0wmIeQWb
 qcUXLfwjYDJqHZKmmDI4xG32Clrn1p+sZEjlkB8NpHfgUxqZRGgC2sRwQyb7LuDb930C
 KP/SCBSPi9LZmWY759rSxQzO90/iJms/Iy5PVWFItww2bXmVN5m0QPWs27fPnxDmmAFp
 rW6dv5i9kdZ7njcnskoLufcW0vlq6jRAQLaWkJ3bzoUVJVyWcssXqX+JaUJ3Qd8tbnae
 PtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gp1CS7Meiq+pIbSii4z5cXIlLneg3MN7qFdozmHymVI=;
 b=TdkUxi9WMBcZH9h+xgQA7qQarrnMS0bb4tqmhJT2TOatb/++CL+/lKvWNXUkkQPQuK
 rNC6C1jdhj05SSVx73BbbSdC0TQfP+KH+maFH3Kx9wT2pzNGtTtk0oThW/syqrEM02O3
 HCs/k4YR2oSxBJyIjdQeys6HB6tHAtO2hii85sKWfDIM+XEYmtMoWKxEAojm/hmlnV4r
 swACzm4zwr7b6vB2Fe79QWcszuEwdbOG2MkBIC0lH1vOHn1TQ9i7KpcivIQwM3QBmIMx
 ONTUG/qel+RS4lT17HtKBNHI6+IrqzENkzIdb2Cf9AK2qiQ1SX/6p92uJzG3DZGp+7hn
 4kXg==
X-Gm-Message-State: ANoB5plg7K/odXVdCqWIXy/HZiQ7bZcOTPQI+IpAzldED/hYiKEpudpM
 JxJN3oJ3EUGQkvb8g77eZm/vEaYHI7u3g4YCXuAXuA==
X-Google-Smtp-Source: AA0mqf6DXGi83+EtVqrYOPd7DkCwuGXo4btVdvKWiVU8r9LgbIx2JZR0SIbABL87tZxVPowMY+gUHClt3SoCihIF5Fw=
X-Received: by 2002:a05:6512:3287:b0:4b5:65e6:7ba2 with SMTP id
 p7-20020a056512328700b004b565e67ba2mr7947255lfe.598.1670576288101; Fri, 09
 Dec 2022 00:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-7-chao.p.peng@linux.intel.com>
 <CA+EHjTxwxsAPGYGgBGqDnNvecKNztrBY4j9a9FHmSTJG3Senpg@mail.gmail.com>
 <20221208111336.GA1304936@chaop.bj.intel.com>
In-Reply-To: <20221208111336.GA1304936@chaop.bj.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Dec 2022 08:57:31 +0000
Message-ID: <CA+EHjTzF4-83LQ1YJBdnb5r=Bo0uiPc=WFhY6XyLK=KTmYbFRQ@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] KVM: Unmap existing mappings when change the
 memory attributes
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=tabba@google.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Thu, Dec 8, 2022 at 11:18 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> On Wed, Dec 07, 2022 at 05:16:34PM +0000, Fuad Tabba wrote:
> > Hi,
> >
> > On Fri, Dec 2, 2022 at 6:19 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > >
> > > Unmap the existing guest mappings when memory attribute is changed
> > > between shared and private. This is needed because shared pages and
> > > private pages are from different backends, unmapping existing ones
> > > gives a chance for page fault handler to re-populate the mappings
> > > according to the new attribute.
> > >
> > > Only architecture has private memory support needs this and the
> > > supported architecture is expected to rewrite the weak
> > > kvm_arch_has_private_mem().
> >
> > This kind of ties into the discussion of being able to share memory in
> > place. For pKVM for example, shared and private memory would have the
> > same backend, and the unmapping wouldn't be needed.
> >
> > So I guess that, instead of kvm_arch_has_private_mem(), can the check
> > be done differently, e.g., with a different function, say
> > kvm_arch_private_notify_attribute_change() (but maybe with a more
> > friendly name than what I suggested :) )?
>
> Besides controlling the unmapping here, kvm_arch_has_private_mem() is
> also used to gate the memslot KVM_MEM_PRIVATE flag in patch09. I know
> unmapping is confirmed unnecessary for pKVM, but how about
> KVM_MEM_PRIVATE? Will pKVM add its own flag or reuse KVM_MEM_PRIVATE?
> If the answer is the latter, then yes we should use a different check
> which only works for confidential usages here.

I think it makes sense for pKVM to use the same flag (KVM_MEM_PRIVATE)
and not to add another one.

Thank you,
/fuad



>
> Thanks,
> Chao
> >
> > Thanks,
> > /fuad
> >
> > >
> > > Also, during memory attribute changing and the unmapping time frame,
> > > page fault handler may happen in the same memory range and can cause
> > > incorrect page state, invoke kvm_mmu_invalidate_* helpers to let the
> > > page fault handler retry during this time frame.
> > >
> > > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > > ---
> > >  include/linux/kvm_host.h |   7 +-
> > >  virt/kvm/kvm_main.c      | 168 ++++++++++++++++++++++++++-------------
> > >  2 files changed, 116 insertions(+), 59 deletions(-)
> > >
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 3d69484d2704..3331c0c92838 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -255,7 +255,6 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> > >  int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
> > >  #endif
> > >
> > > -#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> > >  struct kvm_gfn_range {
> > >         struct kvm_memory_slot *slot;
> > >         gfn_t start;
> > > @@ -264,6 +263,8 @@ struct kvm_gfn_range {
> > >         bool may_block;
> > >  };
> > >  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> > > +
> > > +#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> > >  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> > >  bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> > >  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> > > @@ -785,11 +786,12 @@ struct kvm {
> > >
> > >  #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> > >         struct mmu_notifier mmu_notifier;
> > > +#endif
> > >         unsigned long mmu_invalidate_seq;
> > >         long mmu_invalidate_in_progress;
> > >         gfn_t mmu_invalidate_range_start;
> > >         gfn_t mmu_invalidate_range_end;
> > > -#endif
> > > +
> > >         struct list_head devices;
> > >         u64 manual_dirty_log_protect;
> > >         struct dentry *debugfs_dentry;
> > > @@ -1480,6 +1482,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
> > >  int kvm_arch_post_init_vm(struct kvm *kvm);
> > >  void kvm_arch_pre_destroy_vm(struct kvm *kvm);
> > >  int kvm_arch_create_vm_debugfs(struct kvm *kvm);
> > > +bool kvm_arch_has_private_mem(struct kvm *kvm);
> > >
> > >  #ifndef __KVM_HAVE_ARCH_VM_ALLOC
> > >  /*
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index ad55dfbc75d7..4e1e1e113bf0 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -520,6 +520,62 @@ void kvm_destroy_vcpus(struct kvm *kvm)
> > >  }
> > >  EXPORT_SYMBOL_GPL(kvm_destroy_vcpus);
> > >
> > > +void kvm_mmu_invalidate_begin(struct kvm *kvm)
> > > +{
> > > +       /*
> > > +        * The count increase must become visible at unlock time as no
> > > +        * spte can be established without taking the mmu_lock and
> > > +        * count is also read inside the mmu_lock critical section.
> > > +        */
> > > +       kvm->mmu_invalidate_in_progress++;
> > > +
> > > +       if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > > +               kvm->mmu_invalidate_range_start = INVALID_GPA;
> > > +               kvm->mmu_invalidate_range_end = INVALID_GPA;
> > > +       }
> > > +}
> > > +
> > > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > > +{
> > > +       WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > > +
> > > +       if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > > +               kvm->mmu_invalidate_range_start = start;
> > > +               kvm->mmu_invalidate_range_end = end;
> > > +       } else {
> > > +               /*
> > > +                * Fully tracking multiple concurrent ranges has diminishing
> > > +                * returns. Keep things simple and just find the minimal range
> > > +                * which includes the current and new ranges. As there won't be
> > > +                * enough information to subtract a range after its invalidate
> > > +                * completes, any ranges invalidated concurrently will
> > > +                * accumulate and persist until all outstanding invalidates
> > > +                * complete.
> > > +                */
> > > +               kvm->mmu_invalidate_range_start =
> > > +                       min(kvm->mmu_invalidate_range_start, start);
> > > +               kvm->mmu_invalidate_range_end =
> > > +                       max(kvm->mmu_invalidate_range_end, end);
> > > +       }
> > > +}
> > > +
> > > +void kvm_mmu_invalidate_end(struct kvm *kvm)
> > > +{
> > > +       /*
> > > +        * This sequence increase will notify the kvm page fault that
> > > +        * the page that is going to be mapped in the spte could have
> > > +        * been freed.
> > > +        */
> > > +       kvm->mmu_invalidate_seq++;
> > > +       smp_wmb();
> > > +       /*
> > > +        * The above sequence increase must be visible before the
> > > +        * below count decrease, which is ensured by the smp_wmb above
> > > +        * in conjunction with the smp_rmb in mmu_invalidate_retry().
> > > +        */
> > > +       kvm->mmu_invalidate_in_progress--;
> > > +}
> > > +
> > >  #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> > >  static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
> > >  {
> > > @@ -714,45 +770,6 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
> > >         kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);
> > >  }
> > >
> > > -void kvm_mmu_invalidate_begin(struct kvm *kvm)
> > > -{
> > > -       /*
> > > -        * The count increase must become visible at unlock time as no
> > > -        * spte can be established without taking the mmu_lock and
> > > -        * count is also read inside the mmu_lock critical section.
> > > -        */
> > > -       kvm->mmu_invalidate_in_progress++;
> > > -
> > > -       if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > > -               kvm->mmu_invalidate_range_start = INVALID_GPA;
> > > -               kvm->mmu_invalidate_range_end = INVALID_GPA;
> > > -       }
> > > -}
> > > -
> > > -void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > > -{
> > > -       WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > > -
> > > -       if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> > > -               kvm->mmu_invalidate_range_start = start;
> > > -               kvm->mmu_invalidate_range_end = end;
> > > -       } else {
> > > -               /*
> > > -                * Fully tracking multiple concurrent ranges has diminishing
> > > -                * returns. Keep things simple and just find the minimal range
> > > -                * which includes the current and new ranges. As there won't be
> > > -                * enough information to subtract a range after its invalidate
> > > -                * completes, any ranges invalidated concurrently will
> > > -                * accumulate and persist until all outstanding invalidates
> > > -                * complete.
> > > -                */
> > > -               kvm->mmu_invalidate_range_start =
> > > -                       min(kvm->mmu_invalidate_range_start, start);
> > > -               kvm->mmu_invalidate_range_end =
> > > -                       max(kvm->mmu_invalidate_range_end, end);
> > > -       }
> > > -}
> > > -
> > >  static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> > >  {
> > >         kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> > > @@ -806,23 +823,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
> > >         return 0;
> > >  }
> > >
> > > -void kvm_mmu_invalidate_end(struct kvm *kvm)
> > > -{
> > > -       /*
> > > -        * This sequence increase will notify the kvm page fault that
> > > -        * the page that is going to be mapped in the spte could have
> > > -        * been freed.
> > > -        */
> > > -       kvm->mmu_invalidate_seq++;
> > > -       smp_wmb();
> > > -       /*
> > > -        * The above sequence increase must be visible before the
> > > -        * below count decrease, which is ensured by the smp_wmb above
> > > -        * in conjunction with the smp_rmb in mmu_invalidate_retry().
> > > -        */
> > > -       kvm->mmu_invalidate_in_progress--;
> > > -}
> > > -
> > >  static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
> > >                                         const struct mmu_notifier_range *range)
> > >  {
> > > @@ -1140,6 +1140,11 @@ int __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
> > >         return 0;
> > >  }
> > >
> > > +bool __weak kvm_arch_has_private_mem(struct kvm *kvm)
> > > +{
> > > +       return false;
> > > +}
> > > +
> > >  static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
> > >  {
> > >         struct kvm *kvm = kvm_arch_alloc_vm();
> > > @@ -2349,15 +2354,47 @@ static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> > >         return 0;
> > >  }
> > >
> > > +static void kvm_unmap_mem_range(struct kvm *kvm, gfn_t start, gfn_t end)
> > > +{
> > > +       struct kvm_gfn_range gfn_range;
> > > +       struct kvm_memory_slot *slot;
> > > +       struct kvm_memslots *slots;
> > > +       struct kvm_memslot_iter iter;
> > > +       int i;
> > > +       int r = 0;
> > > +
> > > +       gfn_range.pte = __pte(0);
> > > +       gfn_range.may_block = true;
> > > +
> > > +       for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > > +               slots = __kvm_memslots(kvm, i);
> > > +
> > > +               kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
> > > +                       slot = iter.slot;
> > > +                       gfn_range.start = max(start, slot->base_gfn);
> > > +                       gfn_range.end = min(end, slot->base_gfn + slot->npages);
> > > +                       if (gfn_range.start >= gfn_range.end)
> > > +                               continue;
> > > +                       gfn_range.slot = slot;
> > > +
> > > +                       r |= kvm_unmap_gfn_range(kvm, &gfn_range);
> > > +               }
> > > +       }
> > > +
> > > +       if (r)
> > > +               kvm_flush_remote_tlbs(kvm);
> > > +}
> > > +
> > >  static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > >                                            struct kvm_memory_attributes *attrs)
> > >  {
> > >         gfn_t start, end;
> > >         unsigned long i;
> > >         void *entry;
> > > +       int idx;
> > >         u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> > >
> > > -       /* flags is currently not used. */
> > > +       /* 'flags' is currently not used. */
> > >         if (attrs->flags)
> > >                 return -EINVAL;
> > >         if (attrs->attributes & ~supported_attrs)
> > > @@ -2372,6 +2409,13 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > >
> > >         entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> > >
> > > +       if (kvm_arch_has_private_mem(kvm)) {
> > > +               KVM_MMU_LOCK(kvm);
> > > +               kvm_mmu_invalidate_begin(kvm);
> > > +               kvm_mmu_invalidate_range_add(kvm, start, end);
> > > +               KVM_MMU_UNLOCK(kvm);
> > > +       }
> > > +
> > >         mutex_lock(&kvm->lock);
> > >         for (i = start; i < end; i++)
> > >                 if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > > @@ -2379,6 +2423,16 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > >                         break;
> > >         mutex_unlock(&kvm->lock);
> > >
> > > +       if (kvm_arch_has_private_mem(kvm)) {
> > > +               idx = srcu_read_lock(&kvm->srcu);
> > > +               KVM_MMU_LOCK(kvm);
> > > +               if (i > start)
> > > +                       kvm_unmap_mem_range(kvm, start, i);
> > > +               kvm_mmu_invalidate_end(kvm);
> > > +               KVM_MMU_UNLOCK(kvm);
> > > +               srcu_read_unlock(&kvm->srcu, idx);
> > > +       }
> > > +
> > >         attrs->address = i << PAGE_SHIFT;
> > >         attrs->size = (end - i) << PAGE_SHIFT;
> > >
> > > --
> > > 2.25.1
> > >

