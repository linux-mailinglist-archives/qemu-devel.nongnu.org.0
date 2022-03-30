Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D724EC999
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:22:01 +0200 (CEST)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZb56-0001B6-0u
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:22:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZb1h-0007LR-Hj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:18:29 -0400
Received: from [2607:f8b0:4864:20::1036] (port=42655
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZb1d-0005aD-0e
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:18:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so493592pjf.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 09:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nLFu3lC46wywpXjsuIK0ZHIhaIdPVQVthjLJWcG1bqs=;
 b=ObdhiCZmnQ357m81FhFtTehR9aYW6P4+BOjn381CbSMHEsU1E7K3XcewtQe3sJCPWQ
 Csyxq34Lypg3+bYvidjj+H3qoa/rNI7SuZbTd3AoCwOk6Mqd2uRtxKjVcVzSJoZodMTf
 D/y6FT6RGJsMSbkAlI8a0sPYLgZwkMMWyNwRd4fxHKehurrHJxHet0aUP9LncDJtE3cQ
 UPOz+IFAmZ6u0RgCGDhAInm8qhjfecUTWrGa0uueQmXiVf0afirovk1cfrPKwTF9EAHS
 gOr/NoP4PJTR2EKpDT/fo37IVT+5E6uWqx4jWGTeL/5PLf3qFXEVzRH+FzhiYJwPOXLr
 Ejdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nLFu3lC46wywpXjsuIK0ZHIhaIdPVQVthjLJWcG1bqs=;
 b=61Q7LRxakf1GI4wlq8pdH3Odofe36L+7liieIqO2JU4iwBd/rG6ez4YmQi8ewoueCO
 9X/LCoLzI5q+u7S8aDmbBfXLek5DslvBIkIojbWeGSAXWN0s9StwtGn4AwgyR+pFdzKu
 7U1aR9d0/74q+VagaRzW6r4qlVAA2JjOO/B7ckxOU5g37ir21MzhVS8WAkGK24DcIx7S
 RxIWV4fBv1H8uGzfdI6qJsATwZThCHqV1S59BSL8aVzMhrhhR54m0dVany6LpD3O3z0B
 krnmA4I0PYNdHtFpNL/+/lUVZh8FBx5A9yeR6UjrP+l6LX9Cj5AX5FcjPoeV6q6DA+78
 qCRA==
X-Gm-Message-State: AOAM530iTJVbcl1u0DsA/kL3SznX6wiNAh35+7zgXCj+j6zduTBBC+kQ
 N4OFvtKM31yF/jivVh6eAwejPg==
X-Google-Smtp-Source: ABdhPJzu0B5xizLOKCwUOp7QXz7jXFJn2pPNsklxdxdBWzWCsDjkD8HDdgo8h4C6dlF1WJ0c8QhdzA==
X-Received: by 2002:a17:903:2305:b0:154:4aa2:e800 with SMTP id
 d5-20020a170903230500b001544aa2e800mr29560plh.167.1648657099936; 
 Wed, 30 Mar 2022 09:18:19 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 b14-20020a056a000cce00b004fabc39519esm25365204pfv.5.2022.03.30.09.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 09:18:19 -0700 (PDT)
Date: Wed, 30 Mar 2022 16:18:15 +0000
From: Sean Christopherson <seanjc@google.com>
To: Steven Price <steven.price@arm.com>
Cc: Quentin Perret <qperret@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YkSCx7q4Dl25mSp8@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <YjyS6A0o4JASQK+B@google.com> <YkHspg+YzOsbUaCf@google.com>
 <YkH32nx+YsJuUbmZ@google.com> <YkIFW25WgV2WIQHb@google.com>
 <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Wed, Mar 30, 2022, Steven Price wrote:
> On 29/03/2022 18:01, Quentin Perret wrote:
> > Is implicit sharing a thing? E.g., if a guest makes a memory access in
> > the shared gpa range at an address that doesn't have a backing memslot,
> > will KVM check whether there is a corresponding private memslot at the
> > right offset with a hole punched and report a KVM_EXIT_MEMORY_ERROR? Or
> > would that just generate an MMIO exit as usual?
> 
> My understanding is that the guest needs some way of tagging whether a
> page is expected to be shared or private. On the architectures I'm aware
> of this is done by effectively stealing a bit from the IPA space and
> pretending it's a flag bit.
> 
> So when a guest access causes a fault, the flag bit (really part of the
> intermediate physical address) is compared against whether the page is
> present in the private fd. If they correspond (i.e. a private access and
> the private fd has a page, or a shared access and there's a hole in the
> private fd) then the appropriate page is mapped and the guest continues.
> If there's a mismatch then a KVM_EXIT_MEMORY_ERROR exit is trigged and
> the VMM is expected to fix up the situation (either convert the page or
> kill the guest if this was unexpected).

x86 architectures do steal a bit, but it's not strictly required.  The guest can
communicate its desired private vs. shared state via hypercall.  I refer to the
hypercall method as explicit conversion, and reacting to a page fault due to
accessing the "wrong" PA variant as implicit conversion.

I have dreams of supporting a software-only implementation on x86, a la pKVM, if
only for testing and debug purposes.  In that case, only explicit conversion is
supported.

I'd actually prefer TDX and SNP only allow explicit conversion, i.e. let the host
treat accesses to the "wrong" PA as illegal, but sadly the guest/host ABIs for
both TDX and SNP require the host to support implicit conversions.

> >>>> The key point is that KVM never decides to convert between shared and private, it's
> >>>> always a userspace decision.  Like normal memslots, where userspace has full control
> >>>> over what gfns are a valid, this gives userspace full control over whether a gfn is
> >>>> shared or private at any given time.
> >>>
> >>> I'm understanding this as 'the VMM is allowed to punch holes in the
> >>> private fd whenever it wants'. Is this correct?
> >>
> >> From the kernel's perspective, yes, the VMM can punch holes at any time.  From a
> >> "do I want to DoS my guest" perspective, the VMM must honor its contract with the
> >> guest and not spuriously unmap private memory.
> >>
> >>> What happens if it does so for a page that a guest hasn't shared back?
> >>
> >> When the hole is punched, KVM will unmap the corresponding private SPTEs.  If the
> >> guest is still accessing the page as private, the next access will fault and KVM
> >> will exit to userspace with KVM_EXIT_MEMORY_ERROR.  Of course the guest is probably
> >> hosed if the hole punch was truly spurious, as at least hardware-based protected VMs
> >> effectively destroy data when a private page is unmapped from the guest private SPTEs.
> >>
> >> E.g. Linux guests for TDX and SNP will panic/terminate in such a scenario as they
> >> will get a fault (injected by trusted hardware/firmware) saying that the guest is
> >> trying to access an unaccepted/unvalidated page (TDX and SNP require the guest to
> >> explicit accept all private pages that aren't part of the guest's initial pre-boot
> >> image).
> > 
> > I suppose this is necessary is to prevent the VMM from re-fallocating
> > in a hole it previously punched and re-entering the guest without
> > notifying it?
> 
> I don't know specifically about TDX/SNP, but one thing we want to
> prevent with CCA is the VMM deallocating/reallocating a private page
> without the guest being aware (i.e. corrupting the guest's state).So
> punching a hole will taint the address such that a future access by the
> guest is fatal (unless the guest first jumps through the right hoops to
> acknowledge that it was expecting such a thing).

Yep, both TDX and SNP will trigger a fault in the guest if the host removes and
reinserts a private page.  The current plan for Linux guests is to track whether
or not a given page has been accepted as private, and panic/die if a fault due
to unaccepted private page occurs.

