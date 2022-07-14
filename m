Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB56457432C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 06:32:11 +0200 (CEST)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBqWI-0002Sr-Ge
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 00:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oBqTr-00010J-TH
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 00:29:39 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:40032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oBqTq-0001IH-0h
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 00:29:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7617961EDF;
 Thu, 14 Jul 2022 04:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552F5C34114;
 Thu, 14 Jul 2022 04:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772973;
 bh=fZjf6kM0D523BGGdK0aisyqfUcBCAbftTGPrzQxmYl4=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=V79TD0WneKTSUMaxeccz769Avk5rrUv+BQsMCuv30eZPWMnX6+Rs7QSWI3hvDNAO1
 KpmstDAbglH2L3xl/Rf6tHONjRq4ZVSraY3CO03oU6frXMHG1i/oGxmKlvpMhMkxbT
 /ceXbqiDvJbEcLUGzgZjjuLW8etDCobLJQf6P5fYlXJoSz3dHSICDUWEkeuNMHoFtO
 7eQSb+hMvAiNXYvGsB/qUKMPtz9IPZs14taX81mdcMi2PTplJt/6oe6E0PwlsWPWb+
 BxsVcmmZkd37abT/u8jlTeanGzTO0yslVCn/ubUfB6HkVdWhQQ2nwyYOnQzbcWMEb2
 vlgJPxpBZikeQ==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 27C2D27C0054;
 Thu, 14 Jul 2022 00:29:31 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 00:29:31 -0400
X-ME-Sender: <xms:qJvPYii29dAPbs_NpMgLHxhVXc4L0Sjcg_lr5sRIkLTcZRf9JDcl5A>
 <xme:qJvPYjCbHJ_QG4ltuWLgayikUHS2XGZ29WM9MlidRbBTzlJ66vMUr9hVKmHef6O-R
 7PC-LsZVz_Mqjyz2fY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejkedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvdfhuedvtdfhudffhfekkefftefghfeltdelgeffteehueegjeff
 udehgfetiefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudek
 heeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuh
 igrdhluhhtohdruhhs
X-ME-Proxy: <xmx:qJvPYqGLOxrAPwNk-220lDr2W5tpjR4mLXcTgdlR0gEB3i-gOYU2CQ>
 <xmx:qJvPYrSFHEaKpA3pRKzZg-iOSfXaA839zBgCzKjTiKzrkWYut0kmPg>
 <xmx:qJvPYvxpeBBe4a3rrdpEwgU1634k-2FWm0ADCA6yDIw3ZEVQtF_IyQ>
 <xmx:q5vPYkxOdsVoPeCrLR_3at-Za3z_dmEXWySUh5DAoyOM-51svN7zEhnbCfE>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A4A7431A0062; Thu, 14 Jul 2022 00:29:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <b0c726d4-2ad3-47e7-90cf-d67b36e7d59e@www.fastmail.com>
In-Reply-To: <13d25d2e-ff79-5762-ddb8-87df56f5cbcf@amd.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <b1c12a4b-46f7-081b-242f-005a8824aad1@amd.com>
 <20220713075738.GC2831541@chaop.bj.intel.com>
 <13d25d2e-ff79-5762-ddb8-87df56f5cbcf@amd.com>
Date: Wed, 13 Jul 2022 21:29:08 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 "Chao Peng" <chao.p.peng@linux.intel.com>
Cc: "kvm list" <kvm@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 "Linux API" <linux-api@vger.kernel.org>, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-kselftest@vger.kernel.org,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Sean Christopherson" <seanjc@google.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "Wanpeng Li" <wanpengli@tencent.com>,
 "Jim Mattson" <jmattson@google.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "the arch/x86 maintainers" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Hugh Dickins" <hughd@google.com>,
 "Jeff Layton" <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Shuah Khan" <shuah@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Steven Price" <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Vishal Annapurve" <vannapurve@google.com>,
 "Yu Zhang" <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Dave Hansen" <dave.hansen@intel.com>,
 "Andi Kleen" <ak@linux.intel.com>,
 "David Hildenbrand" <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 "Quentin Perret" <qperret@google.com>,
 "Michael Roth" <michael.roth@amd.com>, "Michal Hocko" <mhocko@suse.com>,
 "Muchun Song" <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Type: text/plain
Received-SPF: pass client-ip=139.178.84.217; envelope-from=luto@kernel.org;
 helo=dfw.source.kernel.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, Jul 13, 2022, at 3:35 AM, Gupta, Pankaj wrote:
>>>> This is the v7 of this series which tries to implement the fd-based KVM
>>>> guest private memory. The patches are based on latest kvm/queue branch
>>>> commit:
>>>>
>>>>     b9b71f43683a (kvm/queue) KVM: x86/mmu: Buffer nested MMU
>>>> split_desc_cache only by default capacity
>>>>
>>>> Introduction
>>>> ------------
>>>> In general this patch series introduce fd-based memslot which provides
>>>> guest memory through memory file descriptor fd[offset,size] instead of
>>>> hva/size. The fd can be created from a supported memory filesystem
>>>> like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
>>>
>>> Thinking a bit, As host side fd on tmpfs or shmem will store memory on host
>>> page cache instead of mapping pages into userspace address space. Can we hit
>>> double (un-coordinated) page cache problem with this when guest page cache
>>> is also used?
>> 
>> This is my understanding: in host it will be indeed in page cache (in
>> current shmem implementation) but that's just the way it allocates and
>> provides the physical memory for the guest. In guest, guest OS will not
>> see this fd (absolutely), it only sees guest memory, on top of which it
>> can build its own page cache system for its own file-mapped content but
>> that is unrelated to host page cache.
>
> yes. If guest fills its page cache with file backed memory, this at host 
> side(on shmem fd backend) will also fill the host page cache fast. This 
> can have an impact on performance of guest VM's if host goes to memory 
> pressure situation sooner. Or else we end up utilizing way less System 
> RAM.

Is this in any meaningful way different from a regular VM?

--Andy

