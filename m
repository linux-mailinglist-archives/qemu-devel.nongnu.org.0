Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C250E3BF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:54:52 +0200 (CEST)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj071-0002dJ-MI
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nj05N-0000Xd-Tr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:53:10 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:44526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nj05K-0000EV-5f
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:53:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9719B8185C;
 Mon, 25 Apr 2022 14:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A072BC385BC;
 Mon, 25 Apr 2022 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650898382;
 bh=2d/1yAOVmYsCW9kJuQkBsU2TaXtcebq8zUB95NfIY+o=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=QKdYT1HLv3X0O4J5zWLygGZ+KUW0l33P03Ua0xMdckTS8WGfW9sVt5C4r9SYq0Y4W
 rrY+4aQmOKUovpC2nYrfpvbc9BV6UgfDCbm9SyNQw6a4E2xQFyrSbwhPHH51/wpA9S
 IyU/opY1adl2kZxM3fI8zLxPBKAoIgKy0LcHbS0vNZ0jz3xzAjniCJrGC+Y6JuLpwD
 2zXOnbfYgEnzenMoz9t4aiG39hkbUE8znOqRBH0/jb6EqFeuAmk1P5jXMv+x87WIou
 n1vd5BSAahx/WWDoL2n6uPNG4aA8l5yp1oX3FIvOdYCgRHojodF/3TOLaqgjXicba1
 0sfALvii55OFg==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7C3AC27C0054;
 Mon, 25 Apr 2022 10:53:00 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute2.internal (MEProxy); Mon, 25 Apr 2022 10:53:00 -0400
X-ME-Sender: <xms:y7VmYtrBZC8Zu64O4UXFwaKxuZup8ZeVuoCIhCms7J92pM3Q7gB6Uw>
 <xme:y7VmYvqB_ryXW1_4_ZphfM_s6K9iBovtAxdtQn1bRrtX8Xk3eiXdDvpldyZl3xRlb
 te5XDlFXy-rYkGpOB0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddugdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 hicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedvhfeuvddthfdufffhkeekffetgffhledtleegffetheeugeejffdu
 hefgteeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeeh
 ieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugi
 drlhhuthhordhush
X-ME-Proxy: <xmx:y7VmYqNL_LZicuZal0_wT-FGnRkaFFOzXPObXQSxPaGJUtMxqFGadw>
 <xmx:y7VmYo4SiO5H2zySG1LRtiwiDkqIQyUUkI9Pp5F2u-jjdQRXlIm60Q>
 <xmx:y7VmYs4-x0vwyMzJZ7T18qHW7WCv9WHuX_YMkaGLcrDTSivfmPUCTQ>
 <xmx:zLVmYhYi4pSZLux0Nq7oJpRDXaCJpdEbVmv58hLuFhFBa0uvCJZiIw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0E2B821E006E; Mon, 25 Apr 2022 10:52:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <27616b2f-1eff-42ff-91e0-047f531639ea@www.fastmail.com>
In-Reply-To: <20220425134051.GA175928@chaop.bj.intel.com>
References: <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <3b99f157-0f30-4b30-8399-dd659250ab8d@www.fastmail.com>
 <20220425134051.GA175928@chaop.bj.intel.com>
Date: Mon, 25 Apr 2022 07:52:38 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Chao Peng" <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Type: text/plain
Received-SPF: pass client-ip=145.40.68.75; envelope-from=luto@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, 
 Jun" <jun.nakajima@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, Apr 25, 2022, at 6:40 AM, Chao Peng wrote:
> On Sun, Apr 24, 2022 at 09:59:37AM -0700, Andy Lutomirski wrote:
>> 

>> 
>> 2. Bind the memfile to a VM (or at least to a VM technology).  Now it's in the initial state appropriate for that VM.
>> 
>> For TDX, this completely bypasses the cases where the data is prepopulated and TDX can't handle it cleanly.  For SEV, it bypasses a situation in which data might be written to the memory before we find out whether that data will be unreclaimable or unmovable.
>
> This sounds a more strict rule to avoid semantics unclear.
>
> So userspace needs to know what excatly happens for a 'bind' operation.
> This is different when binds to different technologies. E.g. for SEV, it
> may imply after this call, the memfile can be accessed (through mmap or
> what ever) from userspace, while for current TDX this should be not allowed.

I think this is actually a good thing.  While SEV, TDX, pKVM, etc achieve similar goals and have broadly similar ways of achieving them, they really are different, and having userspace be aware of the differences seems okay to me.

(Although I don't think that allowing userspace to mmap SEV shared pages is particularly wise -- it will result in faults or cache incoherence depending on the variant of SEV in use.)

>
> And I feel we still need a third flow/operation to indicate the
> completion of the initialization on the memfile before the guest's 
> first-time launch. SEV needs to check previous mmap-ed areas are munmap-ed
> and prevent future userspace access. After this point, then the memfile
> becomes truely private fd.

Even that is technology-dependent.  For TDX, this operation doesn't really exist.  For SEV, I'm not sure (I haven't read the specs in nearly enough detail).  For pKVM, I guess it does exist and isn't quite the same as a shared->private conversion.

Maybe this could be generalized a bit as an operation "measure and make private" that would be supported by the technologies for which it's useful.


>
>> 
>> 
>> ----------------------------------------------
>> 
>> Now I have a question, since I don't think anyone has really answered it: how does this all work with SEV- or pKVM-like technologies in which private and shared pages share the same address space?  I sounds like you're proposing to have a big memfile that contains private and shared pages and to use that same memfile as pages are converted back and forth.  IO and even real physical DMA could be done on that memfile.  Am I understanding correctly?
>
> For TDX case, and probably SEV as well, this memfile contains private memory
> only. But this design at least makes it possible for usage cases like
> pKVM which wants both private/shared memory in the same memfile and rely
> on other ways like mmap/munmap or mprotect to toggle private/shared instead
> of fallocate/hole punching.

Hmm.  Then we still need some way to get KVM to generate the correct SEV pagetables.  For TDX, there are private memslots and shared memslots, and they can overlap.  If they overlap and both contain valid pages at the same address, then the results may not be what the guest-side ABI expects, but everything will work.  So, when a single logical guest page transitions between shared and private, no change to the memslots is needed.  For SEV, this is not the case: everything is in one set of pagetables, and there isn't a natural way to resolve overlaps.

If the memslot code becomes efficient enough, then the memslots could be fragmented.  Or the memfile could support private and shared data in the same memslot.  And if pKVM does this, I don't see why SEV couldn't also do it and hopefully reuse the same code.

>
>> 
>> If so, I think this makes sense, but I'm wondering if the actual memslot setup should be different.  For TDX, private memory lives in a logically separate memslot space.  For SEV and pKVM, it doesn't.  I assume the API can reflect this straightforwardly.
>
> I believe so. The flow should be similar but we do need pass different
> flags during the 'bind' to the backing store for different usages. That
> should be some new flags for pKVM but the callbacks (API here) between
> memfile_notifile and its consumers can be reused.

And also some different flag in the operation that installs the fd as a memslot?

>
>> 
>> And the corresponding TDX question: is the intent still that shared pages aren't allowed at all in a TDX memfile?  If so, that would be the most direct mapping to what the hardware actually does.
>
> Exactly. TDX will still use fallocate/hole punching to turn on/off the
> private page. Once off, the traditional shared page will become
> effective in KVM.

Works for me.

For what it's worth, I still think it should be fine to land all the TDX memfile bits upstream as long as we're confident that SEV, pKVM, etc can be added on without issues.

I think we can increase confidence in this by either getting one other technology's maintainers to get far enough along in the design to be confident and/or by having a pure-kernel-software implementation that serves as a testbed.  For the latter, maybe it could support two different models with little overhead:

Pure software "interleaved" model: pages are shared or private and a hypercall converts them.  The access mode is entirely determined by the state programmed by hypercall.  I think this is essentially what Vishal implemented, but with the "HACK" replaced by something permanent and (if they're not already in the series) appropriate access checks implemented to actually protect the private memory.

Pure software "separate" mode: one GPA bit is set aside as the shared vs private bit.  The normal memslots are restricted to the shared half of GPA space.  Private memslots use the private half.  This works a lot like TDX.  This would be new code.  We don't *really* need this for testing, since TDX itself exercises the same programming model, but it would let people without TDX hardware exercise the interesting bits of the memory management.

Paolo, etc: what do you think?

>
> Chao
>> 
>> --Andy

