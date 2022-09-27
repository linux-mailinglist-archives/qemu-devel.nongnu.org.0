Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D678E5ED06C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:49:20 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odJOB-0006hy-C6
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1odJMX-0005K0-GU
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:47:37 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1odJMV-0000TF-PW
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:47:37 -0400
Received: by mail-pg1-x536.google.com with SMTP id r62so6838463pgr.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Ga4pQWEDXBG9/XYtSTlScJ77nN/lKyKRhvrVN6ZYtEQ=;
 b=Zt6DAEHvTS8wxWv1WyEBwMpb/J0TAGqNJWSYq7B/TUUmald3XX9OlT/d5Lzj6Si+Bc
 j2rFkg3bzOhJaWeJmSBV0V8U3XVEjrwk9qHAVJiEkvevxCuOWyXtok5P3iv/Iw8ESLef
 6LPeA8HKLKlToZ8BNFYQq63V4Oktsc1qDJcFhLSS4oHG7yiRN/kOGqpPb7Yj4VO8VCP6
 +5edR6WRMr1lS7G3XjYbUcnl8iY36M5Ts6GW4jUNk9gvSm6NZePMAF2GZViOeXNHh0tr
 SRk8IvIZSS6mDMv+zdaigNV2/rVcP+cwljmgJZfO6Qwc/ZF3/efpr9a3QxY+c3ZolRxi
 dBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Ga4pQWEDXBG9/XYtSTlScJ77nN/lKyKRhvrVN6ZYtEQ=;
 b=334d0lf8k8vVHXyRPRUlrSKutg13+zp5CcWX7IjrR+MkhzZ/Mcmtx1VqTLEf6lmTvM
 Bn6EnFPJr7nnWaBHChW14cuuQFAORvxN06Ql47SEl+6uv0n3+TazIdbmKaz7z9UOGJ+H
 nUJpyiKypPhgIlGmWvtGbSVpy+ClmlPPHz/Zso85C4v10pLSd0jGBZfPIw3ML95IQFW5
 diWjP5fwF7W2HvICE9eXE9LC8SFeS1iMdYFPGqTydDw9j12poH2ajWVRuAZu4+K0jnaT
 +YmIDPQym4gixhWIpR9arwD4qnMGO4p9FzVgeVg7POp6nXjvz5hFhqeOulyM7VNw6tvM
 XqZg==
X-Gm-Message-State: ACrzQf3WqULGr1quFN/cFiSi5R3OkxB0nbXcZF84FHoRPI6qbORi/I6L
 RfeWtztmJn6qLKYn3KOxI+uZ2g==
X-Google-Smtp-Source: AMsMyM7e3pORG/ZiCK/KOAmPTIhR9W8OFaIKxiR5Fl7ql/8DpZyNJcNG+S+vv6Tj5cxsHspqGFGwnQ==
X-Received: by 2002:a63:1e03:0:b0:43a:a64d:f3a4 with SMTP id
 e3-20020a631e03000000b0043aa64df3a4mr26001459pge.121.1664318853506; 
 Tue, 27 Sep 2022 15:47:33 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 l3-20020a170902f68300b00176b3c9693esm2081016plg.299.2022.09.27.15.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 15:47:32 -0700 (PDT)
Date: Tue, 27 Sep 2022 22:47:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <YzN9gYn1uwHopthW@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=seanjc@google.com; helo=mail-pg1-x536.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022, Fuad Tabba wrote:
> Hi,
> 
> On Mon, Sep 26, 2022 at 3:28 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > On Fri, Sep 23, 2022 at 04:19:46PM +0100, Fuad Tabba wrote:
> > > > Then on the KVM side, its mmap_start() + mmap_end() sequence would:
> > > >
> > > >   1. Not be supported for TDX or SEV-SNP because they don't allow adding non-zero
> > > >      memory into the guest (after pre-boot phase).
> > > >
> > > >   2. Be mutually exclusive with shared<=>private conversions, and is allowed if
> > > >      and only if the entire gfn range of the associated memslot is shared.
> > >
> > > In general I think that this would work with pKVM. However, limiting
> > > private<->shared conversions to the granularity of a whole memslot
> > > might be difficult to handle in pKVM, since the guest doesn't have the
> > > concept of memslots. For example, in pKVM right now, when a guest
> > > shares back its restricted DMA pool with the host it does so at the
> > > page-level.

Y'all are killing me :-)

Isn't the guest enlightened?  E.g. can't you tell the guest "thou shalt share at
granularity X"?  With KVM's newfangled scalable memslots and per-vCPU MRU slot,
X doesn't even have to be that high to get reasonable performance, e.g. assuming
the DMA pool is at most 2GiB, that's "only" 1024 memslots, which is supposed to
work just fine in KVM.

> > > pKVM would also need a way to make an fd accessible again
> > > when shared back, which I think isn't possible with this patch.
> >
> > But does pKVM really want to mmap/munmap a new region at the page-level,
> > that can cause VMA fragmentation if the conversion is frequent as I see.
> > Even with a KVM ioctl for mapping as mentioned below, I think there will
> > be the same issue.
> 
> pKVM doesn't really need to unmap the memory. What is really important
> is that the memory is not GUP'able.

Well, not entirely unguppable, just unguppable without a magic FOLL_* flag,
otherwise KVM wouldn't be able to get the PFN to map into guest memory.

The problem is that gup() and "mapped" are tied together.  So yes, pKVM doesn't
strictly need to unmap memory _in the untrusted host_, but since mapped==guppable,
the end result is the same.

Emphasis above because pKVM still needs unmap the memory _somehwere_.  IIUC, the
current approach is to do that only in the stage-2 page tables, i.e. only in the
context of the hypervisor.  Which is also the source of the gup() problems; the
untrusted kernel is blissfully unaware that the memory is inaccessible.

Any approach that moves some of that information into the untrusted kernel so that
the kernel can protect itself will incur fragmentation in the VMAs.  Well, unless
all of guest memory becomes unguppable, but that's likely not a viable option.

