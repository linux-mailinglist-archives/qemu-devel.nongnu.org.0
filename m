Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70F5F2F5C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 13:12:23 +0200 (CEST)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofJN0-0000Iz-5W
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 07:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ofJCk-0000H8-K7
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:01:46 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:47409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ofJCh-00067j-7r
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:01:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1427B2B0693A;
 Mon,  3 Oct 2022 07:01:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 03 Oct 2022 07:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1664794895; x=1664802095; bh=zW
 dvG4+iogw6diIyocCUGRkeH6TacYI7IEyT3UtjbNg=; b=XW0tQq+0FScqGFQ+dF
 EG6F8k62Rsx9LqjjPoMSaTzwILoz+/n7fDSAlh7WYeR96n8T61QlRplQ1RwjHMcl
 5yeu/5/d9DsmVOkrwscLBOVYwK//hEwVRqSGfyOxvyaN6fDU3U9/Ul0OAyquCK4L
 zRmP8Y/FYnAIVSX/EEgAEL/OVuR+e1x1q141vTbhzYa4Xr1+1qkB9dSxrZodeJSv
 47Gsq3Ji5dnuN5ybt15lYTZBO4OY32j0R3nw90tsm7yRM3eI40KVNN4uiQQID7lJ
 hQ73LO0XlNe44SV2CPb3saKmbWbVBGNI34ILjrBrcE4C2D0m6MgnGajRH8sJJMcx
 k74Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664794895; x=1664802095; bh=zWdvG4+iogw6diIyocCUGRkeH6Ta
 cYI7IEyT3UtjbNg=; b=1sNbOr+reC4ozopaOlqM0nB+iKaIJWlgEvuSnvehqupR
 +mlBVJgNgylpAZCIvqFPaIK2WPBApah/unlsgtS4kvfqTaq0BXfmuOgDyqL7ZnIQ
 N4SHAmIclsBSegb6mvH9c6U6qgmglracDnl3H9l2JEzJ06uiMWBbM0OB6YGGTfWD
 xnzX8C09pcaBkEsrBGKxi6+eppftTXbcrP0y67raFiRetpglM6SEeybTggLt0Jxu
 nY7ma+CNPCBaDHOqaNh+TyiGfPgg6QbqgPqtYrZHB34i7u4TRk5W/6Bl6YElrJmP
 flUk+OkuovZLsxzhxLvWeLYpKvAWNhY6chI73rMRtg==
X-ME-Sender: <xms:DcE6Y6f52k5yy0Jlg1AeQ7dDWJCrmyiSx6kROu3hIkspfTGHK9TTRw>
 <xme:DcE6Y0Nyco_uRp-K-WwZKELvbqi_T8WM-Zrx3OOkmBhxAu7gSWznB0GrnN29DXbFT
 2-3FfUfe9_RpTMbUxY>
X-ME-Received: <xmr:DcE6Y7gwh0050G_SwvT6qpZdBhwZjbBFjdHUuyL-6_rWH_mMo2iv_wfLg4oCQTj36_KCxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
 ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
 grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
 tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:DcE6Y3962DbaiPjQuEqjImm6i_1iQb_fS9v9CvfrtqHzYR-gAxDkXQ>
 <xmx:DcE6Y2sGkiMEPQ8rZ-eMFeI2-zb7XvW71RUslSW8I3M3jgj-wl-pxQ>
 <xmx:DcE6Y-F5e4wRoyMQiP3Pv56Fi1Qf4Te9r2uZ0-YIquinDsLq-5Ao1w>
 <xmx:D8E6YzreQvrnUZwE5JTwmdtxSOE-mJJ5MYLVoAkceXUT8tLhySzNUatLQXA>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Oct 2022 07:01:33 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 87A6C104CE4; Mon,  3 Oct 2022 14:01:29 +0300 (+03)
Date: Mon, 3 Oct 2022 14:01:29 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Fuad Tabba <tabba@google.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,	Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20221003110129.bbee7kawhw5ed745@box.shutemov.name>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <CA+EHjTyrexb_LX7Jm9-MGwm4DBvfjCrADH4oumFyAvs2_0oSYw@mail.gmail.com>
 <20220930162301.i226o523teuikygq@box.shutemov.name>
 <CA+EHjTyphrouY1FV2NQOBLDG81JYhiHFGBNKjT1K2j+pVNij+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyphrouY1FV2NQOBLDG81JYhiHFGBNKjT1K2j+pVNij+A@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.18; envelope-from=kirill@shutemov.name;
 helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 03, 2022 at 08:33:13AM +0100, Fuad Tabba wrote:
> > I think it is "don't do that" category. inaccessible_register_notifier()
> > caller has to know what file it operates on, no?
> 
> The thing is, you could oops the kernel from userspace. For that, all
> you have to do is a memfd_create without the MFD_INACCESSIBLE,
> followed by a KVM_SET_USER_MEMORY_REGION using that as the private_fd.
> I ran into this using my port of this patch series to arm64.

My point is that it has to be handled on a different level. KVM has to
reject private_fd if it is now inaccessible. It should be trivial by
checking file->f_inode->i_sb->s_magic.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

