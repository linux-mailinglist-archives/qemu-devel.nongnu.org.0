Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9A5B0A0C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:27:40 +0200 (CEST)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxtr-0004xo-TW
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1oVxlQ-0008UE-WD
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:18:57 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1oVxlH-0008N4-QL
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:18:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 865F22B05B86;
 Wed,  7 Sep 2022 12:18:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 07 Sep 2022 12:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1662567515; x=1662574715; bh=5D
 ZtFrVdqR12nN7HSUlbgO9Phu3Lj4gHCeI3MI0eXEs=; b=gKjMSLcGKU47Bpx6uQ
 gZ+Ahn/J6pmAu6Fk54tOUPmkt4ySG4YQ4tNtCsXNooyXqDQdnB0p/CITTV1m34mq
 s+LAYPRNp7umaA0DS2tD6Bl9cL2UPuUH1NnFqt+Hujshubfu6tpdqxXryN7Jif7b
 wFcbM6hQx1KAluzks24vm6vt401JXycrXk/U1TxhftI2k9a3Qr1m/7eQrpEGaUoY
 dMxR1PpNXaxHCUiB+IzNfCTcZdKp74OQaJyZNKu9NNG2Kd9Cty0VZ7c37OqmpmGx
 91qSQwwUWpUuKrGDcjIKulD3bI5YIyxjctZu6ma29GlM+OIwXDzKYX0fO8UNhgKu
 Ok5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662567515; x=1662574715; bh=5DZtFrVdqR12nN7HSUlbgO9Phu3L
 j4gHCeI3MI0eXEs=; b=OZJQAUW2is2zfDT/Ce2aXyZmrMSXobT3OZMp5q6fVpQ/
 iVRiwH1zHSZcVtLQ2DkHlpUlqbEffGM1fAmWod1B2oWsgEDoe///wEj9f9lghrAo
 QmF2m0YsiHOKiN8AKnZz/6f5uUQMq/9NAYeyhYKiSfFb9Dz+qoavKwdvW7oRiyhC
 EATCi/71d3py5lcq99u7ST/c6PkyOa3KHXiwFRYH2JEiXVa1izqMZLW3QFlYIdsy
 XqD1Q0zUyBwkxx7SuUl6U3WVue4FTTdJB8uWCgJhcTDbXLhEkyIR5uYLz6VpaFwh
 96XgrgE3i0bQPirExWJbzFosbfLoZt7t6DTe9rF30A==
X-ME-Sender: <xms:V8QYYw_o5DzFzVn-nsNBEVd-FS_D_oEsE0Ni1kSDm-EDmUqf7t5RYw>
 <xme:V8QYY4tkvs0qarp3milgqkj-QnUfLwCvr9jPsDhMl_JVoMp1Uawemvudn2tTZjoFP
 RKollyj_THPCycU494>
X-ME-Received: <xmr:V8QYY2AJ6tnceeMtt6ze-9Y21GxOCHjfGO0Uaic1_Z0sgkplNSGu4E0Lv93m0HLV2ntwuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
 ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
 grmhgvqeenucggtffrrghtthgvrhhnpeelgffhfeetlefhveffleevfffgtefffeelfedu
 udfhjeduteeggfeiheefteehjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhl
 sehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:V8QYYweqdTZRL4Hql-Il9ILHjXYOl5I2TLxUmx4tUf2irEd7UWrODA>
 <xmx:V8QYY1Nzk_PUNIp2LKA55MR0G9GVC8m4bLDpu3YSj4OFMB6ygSASzg>
 <xmx:V8QYY6lIz_r5CyIgsFG97LMd1GcuCvwSFmdupTCv8XNGm0jAThrJpw>
 <xmx:W8QYYyKr-0dAl_rNZ4o-w_sGm3XfXyNXiJWuDL3a0JOCCopTLRQCg_cdsds>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 12:18:31 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id CAD3C103799; Wed,  7 Sep 2022 19:18:27 +0300 (+03)
Date: Wed, 7 Sep 2022 19:18:27 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Hildenbrand <david@redhat.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org,	Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,	Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>,	Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,	Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,	Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,	luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com,	ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com,	dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,	Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com,	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 05/14] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <20220907161827.klbscalq5lk66rco@box.shutemov.name>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-6-chao.p.peng@linux.intel.com>
 <203c752f-9439-b5ae-056c-27b2631dcb81@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <203c752f-9439-b5ae-056c-27b2631dcb81@redhat.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=kirill@shutemov.name;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Fri, Aug 05, 2022 at 03:28:50PM +0200, David Hildenbrand wrote:
> On 06.07.22 10:20, Chao Peng wrote:
> > Introduce a new memfd_create() flag indicating the content of the
> > created memfd is inaccessible from userspace through ordinary MMU
> > access (e.g., read/write/mmap). However, the file content can be
> > accessed via a different mechanism (e.g. KVM MMU) indirectly.
> > 
> > It provides semantics required for KVM guest private memory support
> > that a file descriptor with this flag set is going to be used as the
> > source of guest memory in confidential computing environments such
> > as Intel TDX/AMD SEV but may not be accessible from host userspace.
> > 
> > The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
> > also impossible for a memfd created with this flag.
> 
> It's kind of weird to have it that way. Why should the user have to
> care? It's the notifier requirement to have that, no?
> 
> Why can't we handle that when register a notifier? If anything is
> already mapped, fail registering the notifier if the notifier has these
> demands. If registering succeeds, block it internally.
> 
> Or what am I missing? We might not need the memfile set flag semantics
> eventually and would not have to expose such a flag to user space.

Well, with the new shim-based[1] implementation the approach without uAPI
does not work.

We now have two struct file, one is a normal accessible memfd and the
other one is wrapper around that hides the memfd from userspace and
filters allowed operations. If we first create an accessible memfd that
userspace see it would be hard to hide it as by the time userspace may
have multiple fds in different processes that point to the same struct
file.

[1] https://lore.kernel.org/all/20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

