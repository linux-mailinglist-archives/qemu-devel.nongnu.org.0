Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A46990A1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:03:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSb5a-0006MD-LE; Thu, 16 Feb 2023 05:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1pSb5T-0006Bc-9U
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:01:59 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1pSb5R-0000YP-7C
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:01:58 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF2C4581F74;
 Thu, 16 Feb 2023 05:01:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Feb 2023 05:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1676541714; x=1676548914; bh=mU
 wZ0jLBJxHz2jqLQpzE2WZti2villst4pazhry1LDk=; b=asp+w4tFm/0L+ogLMm
 Aah1xvH4AC5j6a6LcApo6uCb3V6IY8r2ikkDaJR2FB7shHkGsgS8TyPVHysvz1wl
 w7G3DJVe3kyuaXTizspLXlv3dJBwdw64oluQvhEnmtO4wfuyeISDBd6koC5smlpl
 c93B3qTaOlQ4qQH+023WPx+j/T99sQC2oSsiiLdLbmjIl2Ea27cka8xxchVgLeve
 2iThLMVvWxeyJ8/+TtsHp414ynVa9p8Ek5ApwrgL7rZwSTPWcV36dqF+GqYO8/Dy
 1WBs+dM4cIQcKpj/xukVy46UYiPY04WL8AW6VZXgpBrsVwNylSig3yXUWWzBeko4
 D/Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1676541714; x=1676548914; bh=mUwZ0jLBJxHz2jqLQpzE2WZti2vi
 llst4pazhry1LDk=; b=tjURGj5OYhitZIFJH3pTuYCsW7QnYHGo+Bne0z8nqsMe
 1vE03qoSKLsFpwrfX45Li0aYqbWQm4stNaS+vt48/4lKLIjocyVldJiCveFBfosz
 z1zO21pN4R/OzCph8SEKEFFabqMyT2/AI11YU8k8hPU4nDeuJnfB8orvpWtkHJyT
 9mZGqb+AKEOq7igi7qO71E1BN9IKsiUYj0+uGfblt1DBv9l3HV4NB/LxejoHDK8a
 Re5iX+uoxlS4q0MeYcJEFDpzZxspfZMJAZuyRJEeItqZ6bNa39wmmelk/84cmodq
 jRXd7aIoo1nGJiyBaZUIp7vf0F5yoSOrbVFLya1HVg==
X-ME-Sender: <xms:Ef_tYzaWl82N0I06rUgcVq24rgB0UPCcY_uZCX5iMdPrN79_UTiyYQ>
 <xme:Ef_tYyaVPVBOKK0gm-z_DyI7flgQuvDSu3EG7BaDzT2yhKmqV-mpAiN3ChBJhHpN3
 36E8wlywbwfeB-_lBk>
X-ME-Received: <xmr:Ef_tY1_9oOigwbr3GGpJODva1Y__qcK34XggsAHHIDjA9f4TX0aN_mQBvPjK5NI0x87C_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
 ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
 grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
 tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:Ef_tY5qnpuptUFz_7q9O0jrLxFFrdoyPKTcdPLw4Oe4i1P9ucNbHbQ>
 <xmx:Ef_tY-p8xe27YBBU1UELy8V2QuAQ-IGOmMnZ8rbJaTvFU0viy-Jabg>
 <xmx:Ef_tY_QH7z8xTeiVhI_VGSg6zgQX4ss2bNezQMrty9LRd49QHytaLA>
 <xmx:Ev_tY7OboPatSl1njimvH7MDK1iQT2H5wcb75YSbti-YfrG81Ou-SA>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 05:01:52 -0500 (EST)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 93F7210CCE1; Thu, 16 Feb 2023 13:01:50 +0300 (+03)
Date: Thu, 16 Feb 2023 13:01:50 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, qemu-devel@nongnu.org,	chao.p.peng@linux.intel.com,
 aarcange@redhat.com,	ak@linux.intel.com, akpm@linux-foundation.org,
 arnd@arndb.de,	bfields@fieldses.org, bp@alien8.de, corbet@lwn.net,
 dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, hpa@zytor.com, hughd@google.com,	jlayton@kernel.org,
 jmattson@google.com, joro@8bytes.org,	jun.nakajima@intel.com,
 kirill.shutemov@linux.intel.com,	linmiaohe@huawei.com, luto@kernel.org,
 mail@maciej.szmigiero.name,	mhocko@suse.com, michael.roth@amd.com,
 mingo@redhat.com,	naoya.horiguchi@nec.com, pbonzini@redhat.com,
 qperret@google.com,	rppt@kernel.org, seanjc@google.com, shuah@kernel.org,
 steven.price@arm.com, tabba@google.com, tglx@linutronix.de,
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com,
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org,
 yu.c.zhang@linux.intel.com
Subject: Re: [RFC PATCH 1/2] mm: restrictedmem: Allow userspace to specify
 mount_path for memfd_restricted
Message-ID: <20230216100150.yv2ehwrdcfzbdhcq@box.shutemov.name>
References: <cover.1676507663.git.ackerleytng@google.com>
 <176081a4817e492965a864a8bc8bacb7d2c05078.1676507663.git.ackerleytng@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176081a4817e492965a864a8bc8bacb7d2c05078.1676507663.git.ackerleytng@google.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=kirill@shutemov.name;
 helo=new3-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 12:41:16AM +0000, Ackerley Tng wrote:
> By default, the backing shmem file for a restrictedmem fd is created
> on shmem's kernel space mount.
> 
> With this patch, an optional tmpfs mount can be specified, which will
> be used as the mountpoint for backing the shmem file associated with a
> restrictedmem fd.
> 
> This change is modeled after how sys_open() can create an unnamed
> temporary file in a given directory with O_TMPFILE.
> 
> This will help restrictedmem fds inherit the properties of the
> provided tmpfs mounts, for example, hugepage allocation hints, NUMA
> binding hints, etc.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  include/linux/syscalls.h           |  2 +-
>  include/uapi/linux/restrictedmem.h |  8 ++++
>  mm/restrictedmem.c                 | 63 +++++++++++++++++++++++++++---
>  3 files changed, 66 insertions(+), 7 deletions(-)
>  create mode 100644 include/uapi/linux/restrictedmem.h
> 
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index f9e9e0c820c5..4b8efe9a8680 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -1056,7 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
>  asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
>  					    unsigned long home_node,
>  					    unsigned long flags);
> -asmlinkage long sys_memfd_restricted(unsigned int flags);
> +asmlinkage long sys_memfd_restricted(unsigned int flags, const char __user *mount_path);
>  
>  /*
>   * Architecture-specific system calls

I'm not sure what the right practice now: do we provide string that
contains mount path or fd that represents the filesystem (returned from
fsmount(2) or open_tree(2)).

fd seems more flexible: it allows to specify unbind mounts.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

