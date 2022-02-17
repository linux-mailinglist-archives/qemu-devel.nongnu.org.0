Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D04BA950
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 20:11:44 +0100 (CET)
Received: from localhost ([::1]:49894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKmBr-0006Vq-I9
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 14:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nKmAL-0005en-SI
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 14:10:09 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nKmAI-0002lj-Pn
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 14:10:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A4E0B82415;
 Thu, 17 Feb 2022 19:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5A0C340ED;
 Thu, 17 Feb 2022 19:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645125000;
 bh=ak4f1IR3JDauRmqw+Ocnj7LciaJgX2pj5SekEDDFUWI=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=lvU0WOO7K9Hu3jpQEoQdykFWOeJkwK5YSzfr3pjVbg1el5417PRg02Pick+MlEGpN
 MEpDmxkNmZrSTji+4ogBj2o2IbCelGEu036iVOdZXEkPdHdZ2glKe6ogosYUm5F9HT
 gDM/BdAuWREwPXQ95pWYd4GdFZ3+k/DOUtEbXcTSSBRj9CrZcC43BdffBWtNxM8YeC
 6yq8iOdFwmjojXKG9BCONmQDeR8kW5H9TOY63x2JbOZ3SsxVOEuNlnbFSzLO8rRtJ9
 B6NnTxNVZnUWBrpO7D/xkCA/CAbXn4aQruPnMT1/fPRsSMe7g5lExjyihShVILWY7G
 jcgxVgwJMEg+g==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 22D2E27C0054;
 Thu, 17 Feb 2022 14:09:57 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute5.internal (MEProxy); Thu, 17 Feb 2022 14:09:58 -0500
X-ME-Sender: <xms:hJ0OYhfhcmP29_Nr736Rf_VR4Xx9AacSXN14ybFA7qE5VnfQw2k6UQ>
 <xme:hJ0OYvOcTkmAsvXFyzQM7abAFdGjOKqUwdKUufgnJTzNWmIqVnsewZPeBu9zKKj7i
 UP8-svOYeSuuoTfYFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 hicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedthfehtedtvdetvdetudfgueeuhfdtudegvdelveelfedvteelfffg
 fedvkeegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeeh
 ieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugi
 drlhhuthhordhush
X-ME-Proxy: <xmx:hJ0OYqh93zilhV36T3x1IBn9k-SuRB2m7ja01WV-VG3usyRPRUjl4w>
 <xmx:hJ0OYq_c0M0zS_-AqS7M6zHUbF53D4l6HsGQ7ZYCK1rxjXgarQM5bw>
 <xmx:hJ0OYtv0yrfYhSsvcFG55K3UtDbwJrTNB47JETg155Pixxqq5yvUJg>
 <xmx:hZ0OYhDilIaXT5yqAtBRSRwJg78QQdEAKf1oXJTOOymblLEqORlaWM_YpTY>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3BF2F21E006E; Thu, 17 Feb 2022 14:09:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <2ca78dcb-61d9-4c9d-baa9-955b6f4298bb@www.fastmail.com>
In-Reply-To: <20220217130631.GB32679@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
 <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
 <20220217130631.GB32679@chaop.bj.intel.com>
Date: Thu, 17 Feb 2022 11:09:35 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Chao Peng" <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
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
 "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Nakajima, 
 Jun" <jun.nakajima@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Dave Hansen <dave.hansen@intel.com>, Linux API <linux-api@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022, at 5:06 AM, Chao Peng wrote:
> On Fri, Feb 11, 2022 at 03:33:35PM -0800, Andy Lutomirski wrote:
>> On 1/18/22 05:21, Chao Peng wrote:
>> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>> > 
>> > Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
>> > the file is inaccessible from userspace through ordinary MMU access
>> > (e.g., read/write/mmap). However, the file content can be accessed
>> > via a different mechanism (e.g. KVM MMU) indirectly.
>> > 
>> > It provides semantics required for KVM guest private memory support
>> > that a file descriptor with this seal set is going to be used as the
>> > source of guest memory in confidential computing environments such
>> > as Intel TDX/AMD SEV but may not be accessible from host userspace.
>> > 
>> > At this time only shmem implements this seal.
>> > 
>> 
>> I don't dislike this *that* much, but I do dislike this. F_SEAL_INACCESSIBLE
>> essentially transmutes a memfd into a different type of object.  While this
>> can apparently be done successfully and without races (as in this code),
>> it's at least awkward.  I think that either creating a special inaccessible
>> memfd should be a single operation that create the correct type of object or
>> there should be a clear justification for why it's a two-step process.
>
> Now one justification maybe from Stever's comment to patch-00: for ARM
> usage it can be used with creating a normal memfd, (partially)populate
> it with initial guest memory content (e.g. firmware), and then
> F_SEAL_INACCESSIBLE it just before the first time lunch of the guest in
> KVM (definitely the current code needs to be changed to support that).

Except we don't allow F_SEAL_INACCESSIBLE on a non-empty file, right?  So this won't work.

In any case, the whole confidential VM initialization story is a bit buddy.  From the earlier emails, it sounds like ARM expects the host to fill in guest memory and measure it.  From my recollection of Intel's scheme (which may well be wrong, and I could easily be confusing it with SGX), TDX instead measures what is essentially a transcript of the series of operations that initializes the VM.  These are fundamentally not the same thing even if they accomplish the same end goal.  For TDX, we unavoidably need an operation (ioctl or similar) that initializes things according to the VM's instructions, and ARM ought to be able to use roughly the same mechanism.

Also, if we ever get fancy and teach the page allocator about memory with reduced directmap permissions, it may well be more efficient for userspace to shove data into a memfd via ioctl than it is to mmap it and write the data.

