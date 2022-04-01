Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5F4EF9D7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 20:27:31 +0200 (CEST)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naLzd-0008SQ-Lq
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 14:27:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1naLx5-0007dF-TF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:24:51 -0400
Received: from [2607:f8b0:4864:20::1033] (port=41709
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1naLx4-0002wt-23
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:24:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so3336255pjm.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u8pAbwXuVZ7sCmxLVbJSUFO5pNLY6s4GVBTnQJD82aI=;
 b=YYzb/Ra45v4lgC8Mo/lsfCtm73X48xfnKrwB54MwA5wPabpTz4mmwu8S2I8qAYyJj5
 Kn8uWkEGKw42ptlWD2HrRNgNxXueDq73aO//NsxdRXksW3j8tF8LEZ9TNnOWeavfn4mS
 ZnUNSezrBOtvRZXs/fW/nfMTjCy5B2muTjyglf0mxjSXQ6YnqfEviq2D7D++dUzYgxcG
 UdF4Qru6HTQXhc6znRvUaCdL76qs761lqxWW05blkvDbtrYsJVEI4tJZNsF09hAOBLyT
 1WnaRrSyuvDFbGtFyDjWoiF7bOi7Ge6us5fAD3EwikvFCxEpyQbi8pGe9Fn/yt7zc2oz
 m/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u8pAbwXuVZ7sCmxLVbJSUFO5pNLY6s4GVBTnQJD82aI=;
 b=HrCFQXLZ4MZWh0rudarNcdd6XMyqYfNgl9x5yyUrXLbtBVmeDXmezaVLEFMoonqGw+
 BCkLv9kj5fXiIsR+0XB413/mi/J9AVybLcQMgs42C83I9lok163cbJupsgIK/QQP1PF5
 ab7KerzdyLNZcBocosPahOUqSlqcs49GDzSDgvnB2Qk7leRkxjn+tEDcx9BHs/RrtjB7
 rQCtD8B5d+TgjHsfaYk0lxza4rF4xd/2WjcKcDwQ4WQuahQTiB6UOdIs1wj4cYvBAh3p
 xpzQmmYq5bb1pabRTr7b4CRi95xzg4bHXKlvvVsVTXC1GBt5pL4M6fMzrtBlM21YXLwe
 e8GA==
X-Gm-Message-State: AOAM530uxI6FVFJRruiMMhWg1RBLSfl3NM+1vUKFh9mneOhxW34HsJYy
 X9ZfQojVNgHjKk51FsTt/9nTgA==
X-Google-Smtp-Source: ABdhPJwlAe0fXT7OVI7wEJgZhusGac4WQ7Y+Hjw0pJaGrpLtvXvp7Ss9UWdSc1InlU9W2r2G1vWIkQ==
X-Received: by 2002:a17:90b:1c86:b0:1bf:2a7e:5c75 with SMTP id
 oo6-20020a17090b1c8600b001bf2a7e5c75mr13348243pjb.145.1648837488223; 
 Fri, 01 Apr 2022 11:24:48 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 oc10-20020a17090b1c0a00b001c7510ed0c8sm14589897pjb.49.2022.04.01.11.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 11:24:47 -0700 (PDT)
Date: Fri, 1 Apr 2022 18:24:44 +0000
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Steven Price <steven.price@arm.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YkdDbCdFy1Fp06K2@google.com>
References: <YkH32nx+YsJuUbmZ@google.com> <YkIFW25WgV2WIQHb@google.com>
 <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com> <Ykcy7fj/d+f9OUl/@google.com>
 <Ykc+ZNWlsXCaOrM9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykc+ZNWlsXCaOrM9@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1033.google.com
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

On Fri, Apr 01, 2022, Quentin Perret wrote:
> On Friday 01 Apr 2022 at 17:14:21 (+0000), Sean Christopherson wrote:
> > On Fri, Apr 01, 2022, Quentin Perret wrote:
> > I assume there is a scenario where a page can be converted from shared=>private?
> > If so, is there a use case where that happens post-boot _and_ the contents of the
> > page are preserved?
> 
> I think most our use-cases are private=>shared, but how is that
> different?

Ah, it's not really different.  What I really was trying to understand is if there
are post-boot conversions that preserve data.  I asked about shared=>private because
there are known pre-boot conversions, e.g. populating the initial guest image, but
AFAIK there are no use cases for post-boot conversions, which might be more needy in
terms of performance.

> > > We currently don't allow the host punching holes in the guest IPA space.
> > 
> > The hole doesn't get punched in guest IPA space, it gets punched in the private
> > backing store, which is host PA space.
> 
> Hmm, in a previous message I thought that you mentioned when a whole
> gets punched in the fd KVM will go and unmap the page in the private
> SPTEs, which will cause a fatal error for any subsequent access from the
> guest to the corresponding IPA?

Oooh, that was in the context of TDX.  Mixing VMX and arm64 terminology... TDX has
two separate stage-2 roots, one for private IPAs and one for shared IPAs.  The
guest selects private/shared by toggling a bit stolen from the guest IPA space.
Upon conversion, KVM will remove from one stage-2 tree and insert into the other.

But even then, subsequent accesses to the wrong IPA won't be fatal, as KVM will
treat them as implicit conversions.  I wish they could be fatal, but that's not
"allowed" given the guest/host contract dictated by the TDX specs.

> If that's correct, I meant that we currently don't support that - the
> host can't unmap anything from the guest stage-2, it can only tear it
> down entirely. But again, I'm not too worried about that, we could
> certainly implement that part without too many issues.

I believe for the pKVM case it wouldn't be unmapping, it would be a PFN change.

> > > Once it has donated a page to a guest, it can't have it back until the
> > > guest has been entirely torn down (at which point all of memory is
> > > poisoned by the hypervisor obviously).
> > 
> > The guest doesn't have to know that it was handed back a different page.  It will
> > require defining the semantics to state that the trusted hypervisor will clear
> > that page on conversion, but IMO the trusted hypervisor should be doing that
> > anyways.  IMO, forcing on the guest to correctly zero pages on conversion is
> > unnecessarily risky because converting private=>shared and preserving the contents
> > should be a very, very rare scenario, i.e. it's just one more thing for the guest
> > to get wrong.
> 
> I'm not sure I agree. The guest is going to communicate with an
> untrusted entity via that shared page, so it better be careful. Guest
> hardening in general is a major topic, and of all problems, zeroing the
> page before sharing is probably one of the simplest to solve.

Yes, for private=>shared you're correct, the guest needs to be paranoid as
there are no guarantees as to what data may be in the shared page.

I was thinking more in the context of shared=>private conversions, e.g. the guest
is done sharing a page and wants it back.  In that case, forcing the guest to zero
the private page upon re-acceptance is dicey.  Hmm, but if the guest needs to
explicitly re-accept the page, then putting the onus on the guest to zero the page
isn't a big deal.  The pKVM contract would just need to make it clear that the
guest cannot make any assumptions about the state of private data 

Oh, now I remember why I'm biased toward the trusted entity doing the work.
IIRC, thanks to TDX's lovely memory poisoning and cache aliasing behavior, the
guest can't be trusted to properly initialize private memory with the guest key,
i.e. the guest could induce a #MC and crash the host.

Anywho, I agree that for performance reasons, requiring the guest to zero private
pages is preferable so long as the guest must explicitly accept/initiate conversions.

> Also, note that in pKVM all the hypervisor code at EL2 runs with
> preemption disabled, which is a strict constraint. As such one of the
> main goals is the spend as little time as possible in that context.
> We're trying hard to keep the amount of zeroing/memcpy-ing to an
> absolute minimum. And that's especially true as we introduce support for
> huge pages. So, we'll take every opportunity we get to have the guest
> or the host do that work.

FWIW, TDX has the exact same constraints (they're actually worse as the trusted
entity runs with _all_ interrupts blocked).  And yeah, it needs to be careful when
dealing with huge pages, e.g. many flows force the guest/host to do 512 * 4kb operations.

