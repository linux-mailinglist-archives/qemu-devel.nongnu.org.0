Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC315602ECB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:50:51 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknve-0006Jh-Pg
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1okmrl-00059j-RP
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:42:45 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1okmrT-0007FV-Qx
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:42:44 -0400
Received: by mail-pf1-x429.google.com with SMTP id 3so14111073pfw.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TQSORsKSMngPJb5f/eC6Hu6kpkY5kYXJ98QHFM8UvxY=;
 b=ZHxxlG3UTEot3sPjKtvw1X3aBdRbEmIooxBSsM63jzfeOELeKLeWEK8Ka0UBZMDOP+
 akvRFs76C2wKq91BFhqgTb5HB703LMV7esd/A+wWslFPM0+sKw9GkKbhOLqB+y2xkhr8
 xAw55/tP2EjBapVx7JcnOuoy3rb21J87PUbxaFqakG14s9yKfbb31M3qi5ybSq2mRACM
 jSitk4irsc/WL0t07xPDMeWHTF1Fx+OZSUwfySvO4jPCavdKRxOz8qiV/i/KYM1y4DB8
 jWL9urfkjvvcFCgxaCtIJ6pE7MoPjXcItlLTszbdaWP+IhZBfYH0+bbwgZYx0bdSzYu+
 tT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQSORsKSMngPJb5f/eC6Hu6kpkY5kYXJ98QHFM8UvxY=;
 b=E5cLbFcHlzn0GCmNmuj+jxW5YF+xuNNafTFg8cfKBTzbHhJGpzBZB70fJSZvWKrzff
 rn8WU1NpPuD2MJGVhrenqC5sv+4tNlEHanys9drHlyuAUtFpKLHzByuKKYT5EFGYnvrc
 e0IwlrAHRDkHhK/muVW4LVltce/iJahR8ITYJwrd3y1LsHvcZK5g+yalks/yKZCWNFYN
 uE8ASqsji+MC9Tf1JYt0jjhnun9gHYQ0+qnzgd1PC9T3WCl7waTbvWS7dqtaPksrLcC0
 uCJKoXzSoY+RVDN39JIeqJTQYEkhR+kW9hS8ff2wUEm8uRfQ83bftXA9NbybYHuRr7qq
 ZurQ==
X-Gm-Message-State: ACrzQf248FdtF4HpdfASWPXW4L9SBvPAv0szZ/qeEwUAM0UqBRe+SCvF
 gnh2Ptj3PIv6mY6a3xLYRZrUEIpGy7JC/dZesh31Bg==
X-Google-Smtp-Source: AMsMyM457hPoLFIJ8lUjGLgHK/+h3GgdmiyyuIPyEtfxcbOdN4bX0W7oNp+dFIXy83RpDOunf04FJy/8XBLnfxpoQmE=
X-Received: by 2002:a63:88c7:0:b0:462:79de:dc75 with SMTP id
 l190-20020a6388c7000000b0046279dedc75mr2721715pgd.458.1666100542751; Tue, 18
 Oct 2022 06:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <de680280-f6b1-9337-2ae4-4b2faf2b823b@suse.cz>
 <20221017161955.t4gditaztbwijgcn@box.shutemov.name>
 <c63ad0cd-d517-0f1e-59e9-927d8ae15a1a@amd.com>
 <20221017215640.hobzcz47es7dq2bi@box.shutemov.name>
In-Reply-To: <20221017215640.hobzcz47es7dq2bi@box.shutemov.name>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 18 Oct 2022 19:12:10 +0530
Message-ID: <CAGtprH8xEdgATjQdhi2b_KqUuSOZHUM-Lh+O-ZtcFKbHf2_75g@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Gupta, Pankaj" <pankaj.gupta@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=vannapurve@google.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
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

On Tue, Oct 18, 2022 at 3:27 AM Kirill A . Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Mon, Oct 17, 2022 at 06:39:06PM +0200, Gupta, Pankaj wrote:
> > On 10/17/2022 6:19 PM, Kirill A . Shutemov wrote:
> > > On Mon, Oct 17, 2022 at 03:00:21PM +0200, Vlastimil Babka wrote:
> > > > On 9/15/22 16:29, Chao Peng wrote:
> > > > > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > > > >
> > > > > KVM can use memfd-provided memory for guest memory. For normal userspace
> > > > > accessible memory, KVM userspace (e.g. QEMU) mmaps the memfd into its
> > > > > virtual address space and then tells KVM to use the virtual address to
> > > > > setup the mapping in the secondary page table (e.g. EPT).
> > > > >
> > > > > With confidential computing technologies like Intel TDX, the
> > > > > memfd-provided memory may be encrypted with special key for special
> > > > > software domain (e.g. KVM guest) and is not expected to be directly
> > > > > accessed by userspace. Precisely, userspace access to such encrypted
> > > > > memory may lead to host crash so it should be prevented.
> > > > >
> > > > > This patch introduces userspace inaccessible memfd (created with
> > > > > MFD_INACCESSIBLE). Its memory is inaccessible from userspace through
> > > > > ordinary MMU access (e.g. read/write/mmap) but can be accessed via
> > > > > in-kernel interface so KVM can directly interact with core-mm without
> > > > > the need to map the memory into KVM userspace.
> > > > >
> > > > > It provides semantics required for KVM guest private(encrypted) memory
> > > > > support that a file descriptor with this flag set is going to be used as
> > > > > the source of guest memory in confidential computing environments such
> > > > > as Intel TDX/AMD SEV.
> > > > >
> > > > > KVM userspace is still in charge of the lifecycle of the memfd. It
> > > > > should pass the opened fd to KVM. KVM uses the kernel APIs newly added
> > > > > in this patch to obtain the physical memory address and then populate
> > > > > the secondary page table entries.
> > > > >
> > > > > The userspace inaccessible memfd can be fallocate-ed and hole-punched
> > > > > from userspace. When hole-punching happens, KVM can get notified through
> > > > > inaccessible_notifier it then gets chance to remove any mapped entries
> > > > > of the range in the secondary page tables.
> > > > >
> > > > > The userspace inaccessible memfd itself is implemented as a shim layer
> > > > > on top of real memory file systems like tmpfs/hugetlbfs but this patch
> > > > > only implemented tmpfs. The allocated memory is currently marked as
> > > > > unmovable and unevictable, this is required for current confidential
> > > > > usage. But in future this might be changed.
> > > > >
> > > > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > > > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > > > > ---
> > > >
> > > > ...
> > > >
> > > > > +static long inaccessible_fallocate(struct file *file, int mode,
> > > > > +                                  loff_t offset, loff_t len)
> > > > > +{
> > > > > +       struct inaccessible_data *data = file->f_mapping->private_data;
> > > > > +       struct file *memfd = data->memfd;
> > > > > +       int ret;
> > > > > +
> > > > > +       if (mode & FALLOC_FL_PUNCH_HOLE) {
> > > > > +               if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> > > > > +                       return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> > > > > +       inaccessible_notifier_invalidate(data, offset, offset + len);
> > > >
> > > > Wonder if invalidate should precede the actual hole punch, otherwise we open
> > > > a window where the page tables point to memory no longer valid?
> > >
> > > Yes, you are right. Thanks for catching this.
> >
> > I also noticed this. But then thought the memory would be anyways zeroed
> > (hole punched) before this call?
>
> Hole punching can free pages, given that offset/len covers full page.
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

I think moving this notifier_invalidate before fallocate may not solve
the problem completely. Is it possible that between invalidate and
fallocate, KVM tries to handle the page fault for the guest VM from
another vcpu and uses the pages to be freed to back gpa ranges? Should
hole punching here also update mem_attr first to say that KVM should
consider the corresponding gpa ranges to be no more backed by
inaccessible memfd?

