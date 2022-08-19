Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A0259A67B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 21:39:19 +0200 (CEST)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP7pu-0003GG-02
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 15:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1oP7og-0001t5-0Q
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 15:38:02 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1oP7od-0008Aa-TD
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 15:38:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso8477232pjk.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 12:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=k9KpOd9i/ZNi1t1K9tR8np0p9gkpfM3VrD2lfsO25Mo=;
 b=HC3bATKO80CNvgZPBl3R//G0TK0r3ngVuJktWYhEP8NaHJnXH6/HXfP142vc4oH9Aw
 oJyeetzADSpgcohe210zCSh8DQfsxcwVcf8c/0gFINaAT23hmdkT8TGnAAdrxDmHlKGf
 fctMqKyKBGj1alfGcbKBQ2/gLlX44if/PwK0HhdyLICbvLdbiwe2vlRz/1zOJjoePZzP
 pxHe9IuraDvzqkDJ8J71BHT2b3xfBrXGMv+aVkONLXSJx4ZIfmskklMmsRvcCwUvoOUK
 TVCUXOcQ5kN8i0t/EAZeKwJMG0HSZvtVvquJlnRoYjq4V1P98OEYU5jvAIbcSHYlInUs
 Kn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=k9KpOd9i/ZNi1t1K9tR8np0p9gkpfM3VrD2lfsO25Mo=;
 b=KOmkOmPfsbpKeItneFzDqQHFmZiUXHGwnfjUMNqaMbKedAfUDHnbcR2N2gxqL0X2Yo
 b6FwDElu10Oh2pw1nkaydmNg0dv5GyFSiMPvVhaTj7z3IYEBthu2FAY09CSiNFRcXte0
 ZoUpzhHAUQf0QXQLpnjzPJZTgudYphiZeca+bA/eGhBqcoNNV5BUWqvmhr5npoRJl+7n
 vHXK5IS1ECzHByddyNh+WZ36t763agPuyIncteSF5V3PXqaj7ZcAZJBENmrti0YPxkTh
 jT/qR9k1HWOMj5Lg7YdrjceXKEpX6B5xu9bLbv4jq8U8okZwuYsk91/bItsIfyslmhh+
 5dPQ==
X-Gm-Message-State: ACgBeo0sh2r6p4OFpV7AzY+rKTH8g7HKt1/OUzeHtimOdFI8PEF3AGmz
 k4v+egKUecW6yid8B0wMBZxtb86mDEPjaxFLql0nRw==
X-Google-Smtp-Source: AA6agR6k/DAzQx9qRqaoRc0DfYUeZpNmDFrlAHfGRBtmhp/IGDr8OXnmdkj2tKhP7ciJU8phJ2DTP7DaAQ0zqKSGHws=
X-Received: by 2002:a17:90b:4b91:b0:1f4:e116:8f1 with SMTP id
 lr17-20020a17090b4b9100b001f4e11608f1mr10112497pjb.121.1660937873970; Fri, 19
 Aug 2022 12:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
In-Reply-To: <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 19 Aug 2022 12:37:42 -0700
Message-ID: <CAGtprH9xyw6bt4=RBWF6-v2CSpabOCpKq5rPz+e-9co7EisoVQ@mail.gmail.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
 Andi Kleen <ak@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 aarcange@redhat.com, 
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=vannapurve@google.com; helo=mail-pj1-x102e.google.com
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

> ...
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 230c8ff9659c..bb714c2a4b06 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -914,6 +914,35 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
>
>  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
>
> +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> +#define KVM_MEM_ATTR_PRIVATE   0x0001
> +static int kvm_vm_ioctl_set_encrypted_region(struct kvm *kvm, unsigned int ioctl,
> +                                            struct kvm_enc_region *region)
> +{
> +       unsigned long start, end;
> +       void *entry;
> +       int r;
> +
> +       if (region->size == 0 || region->addr + region->size < region->addr)
> +               return -EINVAL;
> +       if (region->addr & (PAGE_SIZE - 1) || region->size & (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       start = region->addr >> PAGE_SHIFT;
> +       end = (region->addr + region->size - 1) >> PAGE_SHIFT;
> +
> +       entry = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION ?
> +                               xa_mk_value(KVM_MEM_ATTR_PRIVATE) : NULL;
> +
> +       r = xa_err(xa_store_range(&kvm->mem_attr_array, start, end,
> +                                       entry, GFP_KERNEL_ACCOUNT));

xa_store_range seems to create multi-index entries by default.
Subsequent xa_store_range call changes all the entries stored
previously.
xa_store needs to be used here instead of xa_store_range to achieve
the intended behavior.

> +
> +       kvm_zap_gfn_range(kvm, start, end + 1);
> +
> +       return r;
> +}
> +#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
> +
> ...

