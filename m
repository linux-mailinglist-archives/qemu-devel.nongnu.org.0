Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF6E4F6961
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:44:13 +0200 (CEST)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncAdY-0005RU-IH
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1ncAcI-0003u6-KH
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:42:54 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:57868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1ncAcG-0000jW-II
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:42:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B4EA61CAF;
 Wed,  6 Apr 2022 18:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FAFC385A6;
 Wed,  6 Apr 2022 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649270562;
 bh=sbHbRXEyEAYhEDFwzan7utBqpNK0sjzefEArFgF8uSU=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=eIaWhMw6qdMVoRFxQeR1SfjCYwZy9RX4+1QgPmQTaYkMgXq5EQ0sAVb/ULadR9MI7
 LH+S/c+4WuHCz9BUADIJglVSfcRcc6WejwYyM8Zb7kxiMxjNjlQQDilGIN/w8F20LF
 hrAlrpaJiEnF7GwrtgY3GeH3IG43iicZf7iLsWrBPdjz0Xcg62zOdFu6x9zo7xgJk5
 hq2ap75faI5QFkM7ufk+5PP4JDHKHirOI6tOCxRHtxkvbVauUHCe7lAi4Fdoyzj8y9
 G3ucqOIFtsChrg/dqSy9ybRF2yetOLigWYzb0CjPhvgDFTZx/nxy8vUOVNf/cZzrqO
 oArXJrEdmbMlg==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 0C18527C005B;
 Wed,  6 Apr 2022 14:42:39 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute2.internal (MEProxy); Wed, 06 Apr 2022 14:42:40 -0400
X-ME-Sender: <xms:Ht9NYhmq5xzhyiIJCwoSNR5UKnnggxn-w-bA7jJiiVPF0uyVtVnVhQ>
 <xme:Ht9NYs3-dzZtMQe620UwGT8ssxHBBO-eBkOnyr5HtekaozhZyGx33dQF5TpjmUy85
 LbHHkaqaYX2JUhBy4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
 ftrfgrthhtvghrnheptdfhheettddvtedvtedugfeuuefhtddugedvleevleefvdetleff
 gfefvdekgeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudek
 heeifedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuh
 igrdhluhhtohdruhhs
X-ME-Proxy: <xmx:Ht9NYnoDYKLmq3-m68aE4ZmTtDuPp5nNnCT76TQ2-A9bkXUgsPDoLQ>
 <xmx:Ht9NYhmDXKudHVFzfFNB9vrnlRpFqFnPc15MUqY9W5FRFPjkhgnWOw>
 <xmx:Ht9NYv0LfNldKQsbPRd1ZzGo2WkQjQkgAIaqEiMoePxTGJRS43r7JA>
 <xmx:H99NYqX58bpe62swpvglNF4SOMgzeqaX78xe7NzkfeRGX_q08j8zpA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8341B21E006E; Wed,  6 Apr 2022 14:42:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-385-g3a17909f9e-fm-20220404.001-g3a17909f
Mime-Version: 1.0
Message-Id: <4ae11ddc-0fe6-4644-a30e-006d99dba456@www.fastmail.com>
In-Reply-To: <YkyKywkQYbr9U0CA@google.com>
References: <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com>
 <54acbba9-f4fd-48c1-9028-d596d9f63069@www.fastmail.com>
 <YkyKywkQYbr9U0CA@google.com>
Date: Wed, 06 Apr 2022 11:42:17 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Sean Christopherson" <seanjc@google.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 Will Deacon <will@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Andi Kleen <ak@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, 
 Jun" <jun.nakajima@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Linux API <linux-api@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, Apr 5, 2022, at 11:30 AM, Sean Christopherson wrote:
> On Tue, Apr 05, 2022, Andy Lutomirski wrote:

>
>> resume guest
>> *** host -> hypervisor -> guest ***
>> Guest unshares the page.
>> *** guest -> hypervisor ***
>> Hypervisor removes PTE.  TLBI.
>> *** hypervisor -> guest ***
>> 
>> Obviously considerable cleverness is needed to make a virt IOMMU like this
>> work well, but still.
>> 
>> Anyway, my suggestion is that the fd backing proposal get slightly modified
>> to get it ready for multiple subtypes of backing object, which should be a
>> pretty minimal change.  Then, if someone actually needs any of this
>> cleverness, it can be added later.  In the mean time, the
>> pread()/pwrite()/splice() scheme is pretty good.
>
> Tangentially related to getting private-fd ready for multiple things, 
> what about
> implementing the pread()/pwrite()/splice() scheme in pKVM itself?  I.e. 
> read() on
> the VM fd, with the offset corresponding to gfn in some way.
>

Hmm, could make sense.

