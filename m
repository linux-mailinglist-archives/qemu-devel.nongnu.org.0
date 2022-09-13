Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B415B7632
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 18:13:15 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY8XB-0002JD-Ub
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 12:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1oY8LJ-0001b9-2a
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:01:08 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1oY8LG-0000pp-Ne
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:00:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id CC1605802D8;
 Tue, 13 Sep 2022 12:00:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Sep 2022 12:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1663084851; x=1663092051; bh=nR
 H4z7e+oXA2SkZv/m8JgJqSDk7nulXrp2QoWv1YEN4=; b=XM4CuKJtTWDLoARjMU
 ZEoD6wB5FqnJdSnY3AUy+IO++7ZeMKuIGV7uzlq8uSGUd+dk9chibkWCsvDK8GNY
 lUXAlf7MPuPfea2V80ipCokGbqWGe90/O4izA17lU44CEqmslzDymGWi8CmFigUv
 /1pt2fDthxiWGh3J8mgjWfumcmOTyZXvfPJoP6Id6cvvaavU+5xrsA9EhZpt5Euf
 aywjzWe1+3TbO7Nv8QkUYFPgV+AlIEB+1KFSYXFxjZDIPVazeJogLXHgNC4ex0Ea
 /IlPGW+cYL0/VjUf6NiNk6Okczw8aRTkqyNAGpU2Ezuj6KQd9nYmPgjUi1it7PhV
 upFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663084851; x=1663092051; bh=nRH4z7e+oXA2SkZv/m8JgJqSDk7n
 ulXrp2QoWv1YEN4=; b=L9Yl22VBFNLeetc6fSQgTPfXDMKU/Un/Nk3+eIFVPVGM
 jXoMC62j/pqiRCZhTsfDKXXjDf0pwGuFtuMs1+x5MjSaHS9RqdS4IdUUxa93GbGA
 kpWwa4xQFzg0GgHggZDoI/hD1+DFTJ8Y554qKeRFdOTrWvQf98vrayUX4L3sBVbf
 uF2qW1fujBLU6PEAPaHmqdw/urgqhR4LySbsxm1+RXzmoNNVO2rXx1nfscmcdinv
 GAoZo5+589NE8/kQ5NTX+lIcLX4szCiqfW2jXy0gAXNFnk8Eide20Iu/gvidC+XI
 00H5SJY8aaxn8RExcr8e6V6nkwTTQXr4g+Y4SDFVqQ==
X-ME-Sender: <xms:MakgY8Bb_c1hF-G-V0xWPp6v2tFFK59WYo5RW7yO9_bo81elPeCgoA>
 <xme:MakgY-isRLK2xNjFVddU3SuO8bJG_C6SNZa4RK15I9d4SP_yc0hvI3va7iWTOsVZo
 3FaCARM6L7l1xyd5Zk>
X-ME-Received: <xmr:MakgY_lm1icemmPyCRuc9L2e_WJ__1iRM-x3EYy78zCdcr1QKV3cVpWOP2lYACbn3DOrxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
 ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
 grmhgvqeenucggtffrrghtthgvrhhnpeelgffhfeetlefhveffleevfffgtefffeelfedu
 udfhjeduteeggfeiheefteehjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhl
 sehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:MakgYyz6PLeOqvzrzN5MSngKpLn4PepAjtzzW3M8h49ivJQx919_Qg>
 <xmx:MakgYxTRjdKN_AfcWIfFLJ3MShKx3UaKy8i5hyCqMXeqjxeGHGl_eQ>
 <xmx:MakgY9aZkKdjYf2ydxmqv_7Rz2mI3q82LHYS_E-o9H-iPrDI0ym8hA>
 <xmx:M6kgY4M0E0kvqk7pyaWP0fDgJCM7yLnmmneraumr2YriAtgMkDNi7w>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 12:00:49 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id CDFF310465E; Tue, 13 Sep 2022 19:00:46 +0300 (+03)
Date: Tue, 13 Sep 2022 19:00:46 +0300
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
Message-ID: <20220913160046.rkz7uh6cpwy6wyzg@box.shutemov.name>
References: <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
 <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
 <20220908011037.ez2cdorthqxkerwk@box.shutemov.name>
 <YyBQ+wzPtGwwRB/U@google.com>
 <20220913132821.3ch5cv3rgdxqgz3i@box.shutemov.name>
 <YyCZZSyCrwXLLCD9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyCZZSyCrwXLLCD9@google.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=kirill@shutemov.name;
 helo=new2-smtp.messagingengine.com
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

On Tue, Sep 13, 2022 at 02:53:25PM +0000, Sean Christopherson wrote:
> > > Switching topics, what actually prevents mmapp() on the shim?  I tried to follow,
> > > but I don't know these areas well enough.
> > 
> > It has no f_op->mmap, so mmap() will fail with -ENODEV. See do_mmap().
> > (I did not read the switch statement correctly at first. Note there are
> > two 'fallthrough' there.)
> 
> Ah, validate_mmap_request().  Thought not implementing ->mmap() was the key, but
> couldn't find the actual check.

validate_mmap_request() is in mm/nommu.c which is not relevant for real
computers.

I was talking about this check:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/mmap.c#n1495

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

