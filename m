Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A425B6E5F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 15:30:36 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY5zm-0005yS-PR
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 09:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1oY5xp-0004MA-CE
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:28:33 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:48137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1oY5xl-0004XP-Pr
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:28:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6452758125D;
 Tue, 13 Sep 2022 09:28:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Sep 2022 09:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1663075707; x=1663082907; bh=n3
 5h590WgdUt3xeeXXEzHszlHEJbyzJQQXGzriv2Bdw=; b=lKhOb1x+8VXpLkYPJq
 dQl5YvKDsVrJ3pc1cddIuP6OhdRr8PsWyp/A/vRSqdBGYijU98a2laOVKR84OdSY
 CdujPPGE0VZNBRb8AFY5Y5Bx1hpN0K9qsML8ipAktp7Q4dsDv5hCzrn+3fKsf/oU
 AhorqLE+1pGl42TcXBgEa1DEL85Fj/o6hRRyojZPC9K2zjk3pPIL5621K5ST63O8
 QfX/As62Z9kgVwLF1Vd52L/j0ZbsibgzX3lP1nE0p6SlvlCfHzYP8Y99DMnqszRU
 4kZiWacNgNvCjeHG/gHZIM3PEyq5YzCWaFwJxZ8RsSsTMQSpviggfPNqbX84abPQ
 SlkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663075707; x=1663082907; bh=n35h590WgdUt3xeeXXEzHszlHEJb
 yzJQQXGzriv2Bdw=; b=ZZUXlLMBCwce09seR6ZzZnhVx7X63lDnrSq7QexCOwba
 A9401e3wLEjkdxebo61so4SM6Eq2+gBV02DerWOkmkljGlX/8BrYO0KifPKbfmud
 tQGaxOuowW4z8g5wT/UeLXR8rB2bnERzrbHJwJ5umSz5EJnMO4J9NxfjkUcDN41W
 ISvaKFiU8znaJRomeYO0cB8ZVXsFHA6uardhWbtNSZOWNtG8CTvsDtlB8FinOjfN
 45PNRNVCpZA3g1XU+QLYkHfi3HSFsluN4GdXXUFeq8Zm+Jgw+zf2yo/okKDpCwuQ
 Wv9geoz6xdCGPVhJGhJCSQxqRkadFT8yTRz4LL3O3A==
X-ME-Sender: <xms:eYUgY8CjLPKuTLErxJ4o7QqNakfFEyw9cYv848faCnzZPxniWs4lwg>
 <xme:eYUgY-hUFvVKwy38mKzxfqEfSEJ3tEM_VA5Gzsp_f_5cZePwaLvxqDi6bkNeJt1XW
 CueKAX56_RWW-j6RfE>
X-ME-Received: <xmr:eYUgY_nuCtjj0RQRFpPvX2-WFSAdAlgNrUl5Hj9r4PSXpqEMl-Z2eKx-upeysHMSG2w3RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
 ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
 grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
 tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:eYUgYyziyk8GEwFDdH5XLuijt9yUa6rzCS1KLcOm2ep5cIGYKtwNtw>
 <xmx:eYUgYxSZaSXMPQyjTS7T6QD290vjxjCsvaAjVUPK4mcC-Dgg1cdtuw>
 <xmx:eYUgY9bB1MRIgbGNWw19SQsAqBeUUHmJgRlp1QnEzC7DGx9oHYpRvg>
 <xmx:e4UgY4Oc1dwdLRHEd5XIz0WqilcnByyzA9-tDEQ_CmYKJfC235yyYQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 09:28:25 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 9C1AC10458D; Tue, 13 Sep 2022 16:28:21 +0300 (+03)
Date: Tue, 13 Sep 2022 16:28:21 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Sean Christopherson <seanjc@google.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Hugh Dickins <hughd@google.com>,	Chao Peng <chao.p.peng@linux.intel.com>,
 kvm@vger.kernel.org,	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org,	Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,	Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,	Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>,	Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,	Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,	Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,	"Gupta,
 Pankaj" <pankaj.gupta@amd.com>, Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220913132821.3ch5cv3rgdxqgz3i@box.shutemov.name>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
 <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
 <20220908011037.ez2cdorthqxkerwk@box.shutemov.name>
 <YyBQ+wzPtGwwRB/U@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyBQ+wzPtGwwRB/U@google.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=kirill@shutemov.name;
 helo=new3-smtp.messagingengine.com
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

On Tue, Sep 13, 2022 at 09:44:27AM +0000, Sean Christopherson wrote:
> On Thu, Sep 08, 2022, Kirill A. Shutemov wrote:
> > On Wed, Aug 31, 2022 at 05:24:39PM +0300, Kirill A . Shutemov wrote:
> > > On Sat, Aug 20, 2022 at 10:15:32PM -0700, Hugh Dickins wrote:
> > > > > I will try next week to rework it as shim to top of shmem. Does it work
> > > > > for you?
> > > > 
> > > > Yes, please do, thanks.  It's a compromise between us: the initial TDX
> > > > case has no justification to use shmem at all, but doing it that way
> > > > will help you with some of the infrastructure, and will probably be
> > > > easiest for KVM to extend to other more relaxed fd cases later.
> > > 
> > > Okay, below is my take on the shim approach.
> > > 
> > > I don't hate how it turned out. It is easier to understand without
> > > callback exchange thing.
> > > 
> > > The only caveat is I had to introduce external lock to protect against
> > > race between lookup and truncate.
> 
> As before, I think this lock is unnecessary.  Or at least it's unnessary to hold
> the lock across get/put.  The ->invalidate() call will ensure that the pfn is
> never actually used if get() races with truncation.

The updated version you replying to does not use the lock to protect
against truncation anymore. The lock protect notifier list.

> Switching topics, what actually prevents mmapp() on the shim?  I tried to follow,
> but I don't know these areas well enough.

It has no f_op->mmap, so mmap() will fail with -ENODEV. See do_mmap().
(I did not read the switch statement correctly at first. Note there are
two 'fallthrough' there.)

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

