Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B208B601FC2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 02:39:45 +0200 (CEST)
Received: from localhost ([::1]:47986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okae0-00045u-5t
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 20:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1okaYm-0001Yc-Lk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 20:34:20 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:39705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1okaYh-0006fS-Pn
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 20:34:20 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso15177562fac.6
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DZFNHgeagPRGpN511S5OVmTVLDSRxzqHSZND+ilItHI=;
 b=rX/14hxyK+jbBsNmsi6OICKyz6vY8MdAjLpdpmL8Eoa7S9QfTsmtZ2g16772VPAdQ3
 fyx8viqBFbhwe4fsuILQVTdMHesYZMcl1oUOCmX8b3E05NNXj84+XzmbL1LsDXmL5F1j
 LMV1n2XU1a76XmxIXhbX/jQLk94Nf9oyipbD0iN/8f2ZIv+JsTvOocrVsgP0HsxvQWOB
 FV59MeLky59LcmcQNFmf5mPPHgZyPDz4SSGEWvXafNz+jO3Il6nH3aWk0dudbCEewkRL
 w2EkcpSee8Zn3VXKnm1otN85uvjvLHE28I2YLKCADeFtBWdkawzMyHE1W2n1XGklWzw2
 7bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DZFNHgeagPRGpN511S5OVmTVLDSRxzqHSZND+ilItHI=;
 b=aMzZKQyN9QHB7gzF+YBMk56xvqgIb3TbGDyQrrLaC3rZtQyXoAZS/nM/9hyJ6Td/6V
 n6DyQ5flw1+ZBjmMMueDpz3eZDdecbUEkpVGiKMIrE1hRGjtu2kRyNfahSBx8i0eXzYH
 lhamASBkHohWFZjXQtE/DNmpqGbGafuftIFVETW4kbUxjVJgn+OzOgi5oFsaQ9d2yvlI
 9WreaJV7qo5OvBJNwxeBFSYZ2gUf2GcNTleYPCVvfCcIhPsCrsKcS2TtwxFZfsqypa7O
 iCnNBfP4Mek5u8W8ZQw7VQ6QeloMyi/vTlqB1vRBJIAIThu8jok2SNUTBaDVx6sZbdmL
 wN8Q==
X-Gm-Message-State: ACrzQf2gqR8fAMQ0gvn1zOAPAAGKFqqLo44+YwroKIPHhtHlLsb/A8Th
 0Td7KRCT7lDN/4EpF7GPS8YxRZRk1MPLqQ==
X-Google-Smtp-Source: AMsMyM6GsW9qHuPFp8+B+qhuY2BytXR7EdsQrQz18ZdcSSusgW2PC6Ay30Uig0XRAo3WSxCvao9eLQ==
X-Received: by 2002:a17:90a:4594:b0:20b:23d5:8ead with SMTP id
 v20-20020a17090a459400b0020b23d58eadmr35608180pjg.127.1666053232202; 
 Mon, 17 Oct 2022 17:33:52 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 q59-20020a17090a1b4100b001efa9e83927sm9986738pjq.51.2022.10.17.17.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 17:33:51 -0700 (PDT)
Date: Tue, 18 Oct 2022 00:33:48 +0000
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
Message-ID: <Y030bGhh0mvGS6E1@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com>
 <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=seanjc@google.com; helo=mail-oa1-x2d.google.com
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

On Fri, Sep 30, 2022, Fuad Tabba wrote:
> > > > > pKVM would also need a way to make an fd accessible again
> > > > > when shared back, which I think isn't possible with this patch.
> > > >
> > > > But does pKVM really want to mmap/munmap a new region at the page-level,
> > > > that can cause VMA fragmentation if the conversion is frequent as I see.
> > > > Even with a KVM ioctl for mapping as mentioned below, I think there will
> > > > be the same issue.
> > >
> > > pKVM doesn't really need to unmap the memory. What is really important
> > > is that the memory is not GUP'able.
> >
> > Well, not entirely unguppable, just unguppable without a magic FOLL_* flag,
> > otherwise KVM wouldn't be able to get the PFN to map into guest memory.
> >
> > The problem is that gup() and "mapped" are tied together.  So yes, pKVM doesn't
> > strictly need to unmap memory _in the untrusted host_, but since mapped==guppable,
> > the end result is the same.
> >
> > Emphasis above because pKVM still needs unmap the memory _somehwere_.  IIUC, the
> > current approach is to do that only in the stage-2 page tables, i.e. only in the
> > context of the hypervisor.  Which is also the source of the gup() problems; the
> > untrusted kernel is blissfully unaware that the memory is inaccessible.
> >
> > Any approach that moves some of that information into the untrusted kernel so that
> > the kernel can protect itself will incur fragmentation in the VMAs.  Well, unless
> > all of guest memory becomes unguppable, but that's likely not a viable option.
> 
> Actually, for pKVM, there is no need for the guest memory to be GUP'able at
> all if we use the new inaccessible_get_pfn().

Ya, I was referring to pKVM without UPM / inaccessible memory.

Jumping back to blocking gup(), what about using the same tricks as secretmem to
block gup()?  E.g. compare vm_ops to block regular gup() and a_ops to block fast
gup() on struct page?  With a Kconfig that's selected by pKVM (which would also
need its own Kconfig), e.g. CONFIG_INACCESSIBLE_MAPPABLE_MEM, there would be zero
performance overhead for non-pKVM kernels, i.e. hooking gup() shouldn't be
controversial.

I suspect the fast gup() path could even be optimized to avoid the page_mapping()
lookup by adding a PG_inaccessible flag that's defined iff the TBD Kconfig is
selected.  I'm guessing pKVM isn't expected to be deployed on massivve NUMA systems
anytime soon, so there should be plenty of page flags to go around.

Blocking gup() instead of trying to play refcount games when converting back to
private would eliminate the need to put heavy restrictions on mapping, as the goal
of those were purely to simplify the KVM implementation, e.g. the "one mapping per
memslot" thing would go away entirely.

> This of course goes back to what I'd mentioned before in v7; it seems that
> representing the memslot memory as a file descriptor should be orthogonal to
> whether the memory is shared or private, rather than a private_fd for private
> memory and the userspace_addr for shared memory.

I also explored the idea of backing any guest memory with an fd, but came to
the conclusion that private memory needs a separate handle[1], at least on x86.

For SNP and TDX, even though the GPA is the same (ignoring the fact that SNP and
TDX steal GPA bits to differentiate private vs. shared), the two types need to be
treated as separate mappings[2].  Post-boot, converting is lossy in both directions,
so even conceptually they are two disctint pages that just happen to share (some)
GPA bits.

To allow conversions, i.e. changing which mapping to use, without memslot updates,
KVM needs to let userspace provide both mappings in a single memslot.  So while
fd-based memory is an orthogonal concept, e.g. we could add fd-based shared memory,
KVM would still need a dedicated private handle.

For pKVM, the fd doesn't strictly need to be mutually exclusive with the existing
userspace_addr, but since the private_fd is going to be added for x86, I think it
makes sense to use that instead of adding generic fd-based memory for pKVM's use
case (which is arguably still "private" memory but with special semantics).

[1] https://lore.kernel.org/all/YulTH7bL4MwT5v5K@google.com
[2] https://lore.kernel.org/all/869622df-5bf6-0fbb-cac4-34c6ae7df119@kernel.org

>  The host can then map or unmap the shared/private memory using the fd, which
>  allows it more freedom in even choosing to unmap shared memory when not
>  needed, for example.

