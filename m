Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169454FF5B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 23:29:17 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2JWl-000567-Rg
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 17:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o2JV7-0003ag-Bj
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 17:27:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o2JV5-0004jE-MG
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 17:27:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5170760pjg.5
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4Nh/ioaLxS4TiMuv6mrO3BuuJxs5edtEcbJCJ0DlzHg=;
 b=kqV10ZowD4mEAwkhnGeH7Vi46uyd6cVb+D27K/8D7q4ZgbepI0UMc7Xg/GhUj7mWCn
 sUXIO1GdA6DWiQTudDzJU8yc0x7fO1CRRIYu+qGUSrN9fwrVOrLdD1rfHGdBXyFAfxoY
 HUeLpXo40NmxK6NMGADGQ7EfuqeHEdheydvWwcQvIfZxA5YfRVWSMGNAX2325hWiHuHY
 7FXv22PI/DmPa7E2x1nANjza+zy8ei0HlKM5niFMLK6Y/yuw6Rd/UBQlspC2hX9x3Qb4
 bTlUA9qVQpHAf6cfcS9FKqlK43DFOWeREbCmJaIPzqYk2+TsXXbIzRcnGQoReMxVEUKW
 K2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Nh/ioaLxS4TiMuv6mrO3BuuJxs5edtEcbJCJ0DlzHg=;
 b=gdh+yLHzcn47kO6GH9bkYJy/u38+8kPAEn4Sy9o/fIVKNjkTGCxe0qwnklAabR64lR
 2snjnxwSxdYPt9m/vGL4jp1ItiIiJKCwUrzzXRTS+sD1cmmKuL4bzyxDOP3M2z3fGMqE
 d8Nk03WdFENZX8mbgQWk+5lSwniKmd1DX6r6XomOW6w0eoYhp9+XoSKL7zxg2egO+eaH
 u217EczncLUg46/51x6dM8+cTC9k6j61tOTpgLPE9n1fQdIVy8Te5bSH9jYAjxRZBA7I
 /vYq62OGyMIDuS0SqCGm9Tg7CiduZPXtYDkF3nNTc0CPFJ9WHtGo8ApUJSGfAbcqJRUC
 0HnA==
X-Gm-Message-State: AJIora/SmKt/KIlZLNPcAPV/h3UjLlpWR124HAI7TVm1Kfg4rlI3tfOk
 VMMek+BegS+tAvjLT9mOY6bZDw==
X-Google-Smtp-Source: AGRyM1uRS2fAbjyxhFU2PYlmkBtwm8UeO62IZrWZixGAXkVAe6FeSFCI9nOgPKmO0Bfh0yLM2ya5lQ==
X-Received: by 2002:a17:90a:4503:b0:1ea:4718:829f with SMTP id
 u3-20020a17090a450300b001ea4718829fmr12496982pjg.103.1655501249895; 
 Fri, 17 Jun 2022 14:27:29 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 f2-20020a62db02000000b0051868677e6dsm4218356pfg.51.2022.06.17.14.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 14:27:29 -0700 (PDT)
Date: Fri, 17 Jun 2022 21:27:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YqzxvYU7EtHab6U7@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <Yqzpf3AEYabFWjnW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqzpf3AEYabFWjnW@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1032.google.com
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

On Fri, Jun 17, 2022, Sean Christopherson wrote:
> > @@ -110,6 +133,7 @@ struct kvm_userspace_memory_region {
> >   */
> >  #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
> >  #define KVM_MEM_READONLY	(1UL << 1)
> > +#define KVM_MEM_PRIVATE		(1UL << 2)
> 
> Hmm, KVM_MEM_PRIVATE is technically wrong now that a "private" memslot maps private
> and/or shared memory.  Strictly speaking, we don't actually need a new flag.  Valid
> file descriptors must be >=0, so the logic for specifying a memslot that can be
> converted between private and shared could be that "(int)private_fd < 0" means
> "not convertible", i.e. derive the flag from private_fd.
> 
> And looking at the two KVM consumers of the flag, via kvm_slot_is_private(), they're
> both wrong.  Both kvm_faultin_pfn() and kvm_mmu_max_mapping_level() should operate
> on the _fault_, not the slot.  So it would actually be a positive to not have an easy
> way to query if a slot supports conversion.

I take that back, the usage in kvm_faultin_pfn() is correct, but the names ends
up being confusing because it suggests that it always faults in a private pfn.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b6d75016e48c..e1008f00609d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4045,7 +4045,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
                        return RET_PF_EMULATE;
        }

-       if (fault->is_private) {
+       if (kvm_slot_can_be_private(slot)) {
                r = kvm_faultin_pfn_private(vcpu, fault);
                if (r != RET_PF_CONTINUE)
                        return r == RET_PF_FIXED ? RET_PF_CONTINUE : r;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 31f704c83099..c5126190fb71 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -583,9 +583,9 @@ struct kvm_memory_slot {
        struct kvm *kvm;
 };

-static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
+static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
 {
-       return slot && (slot->flags & KVM_MEM_PRIVATE);
+       return slot && !!slot->private_file;
 }

 static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)


