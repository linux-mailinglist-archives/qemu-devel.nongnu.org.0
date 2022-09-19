Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3895B5BD51B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 21:13:18 +0200 (CEST)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaMCh-0004NH-VM
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 15:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oaM9x-0001J9-Lp
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:10:25 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oaM9v-0002Uh-N1
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:10:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so8338879pja.5
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=uHDCmC+fkGgZQ7BzMPp6c7XrTAwkaI5bKq16AmgDePo=;
 b=FzLZKvxtooNg2nIQsy5+eM5f7fy1lAzBB2VA1wO/c/z5x+mIvht2HeQTpz0+O2GNON
 qYfCZIIQd7vVS1ydcSUk98uZRncHJ8NJqsBYal/77hLUDVgkbWXOBd+hz5VEBE58svml
 7veNt7a5mrys0Ba0zXNGukgmilRYcWUK1G5Ld55DCw1aaAWGjuHTYvwOXM55fy1GZCq2
 /HIYNCCaMOBCvVP4bTRqEX/0Cg2d5v66Gen6iUYVbeQoaRoKlz+CSMn6594FqKI3OBOx
 CgWqKCHmKyJawz7IbqlOUC2g8zhLuRqDNc0zsCq7DTjXNqPS5WtBOOhuXN/fLqvu7Nx+
 YhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uHDCmC+fkGgZQ7BzMPp6c7XrTAwkaI5bKq16AmgDePo=;
 b=TOoSRMsAE64ZywJbDgFzUwDWe/AWaprzNbQS4uWAfuzkK4W1AVY64Xe1EY4v15QzB+
 tD4zespl+ZFYlz1xlkXLKU+NUF2/Zul1uWfrsS0BrKyr9VK/1sdRX0Vd6sQOHqh4Q8d9
 cv48i79iSChFT5IRecKOAgaXPF4pk+qRxI4VvGfZRem+hYxrNAoW7i9+mUiN1DonCmz5
 XF903uxsBNqKXtgn0YGO5hafwoMx/WcZR1omaF/NYaIGxhwa6qSeS7qYvmFG9iE3Yx/U
 ZhEmDhthakqDQRUIQ5huQB9MC/Fg8k+8suCmW0yPtzfJKwzqPuVaxRgaEGZQoQxY/lZJ
 guWg==
X-Gm-Message-State: ACrzQf1wJz7KmxhWsxn2Xgn2VryOpnyRLZQkqJw+deRtqxW5rvfCaIi3
 e06Qf451E6j418Ck04bQmze0tQ==
X-Google-Smtp-Source: AMsMyM68H82eEsZf9j6+Lgi2bA7LULrsBpCz2pkVmtzhsIZbm7nIKWn17NC3OpQf7t6rW+ZP9MqtOQ==
X-Received: by 2002:a17:90a:b00b:b0:203:a6de:5b0f with SMTP id
 x11-20020a17090ab00b00b00203a6de5b0fmr1533338pjq.134.1663614619499; 
 Mon, 19 Sep 2022 12:10:19 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 p187-20020a6229c4000000b00540c24ba181sm20357398pfp.120.2022.09.19.12.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 12:10:18 -0700 (PDT)
Date: Mon, 19 Sep 2022 19:10:15 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <Yyi+l3+p9lbBAC4M@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

+Will, Marc and Fuad (apologies if I missed other pKVM folks)

On Mon, Sep 19, 2022, David Hildenbrand wrote:
> On 15.09.22 16:29, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > KVM can use memfd-provided memory for guest memory. For normal userspace
> > accessible memory, KVM userspace (e.g. QEMU) mmaps the memfd into its
> > virtual address space and then tells KVM to use the virtual address to
> > setup the mapping in the secondary page table (e.g. EPT).
> > 
> > With confidential computing technologies like Intel TDX, the
> > memfd-provided memory may be encrypted with special key for special
> > software domain (e.g. KVM guest) and is not expected to be directly
> > accessed by userspace. Precisely, userspace access to such encrypted
> > memory may lead to host crash so it should be prevented.
> 
> Initially my thaught was that this whole inaccessible thing is TDX specific
> and there is no need to force that on other mechanisms. That's why I
> suggested to not expose this to user space but handle the notifier
> requirements internally.
> 
> IIUC now, protected KVM has similar demands. Either access (read/write) of
> guest RAM would result in a fault and possibly crash the hypervisor (at
> least not the whole machine IIUC).

Yep.  The missing piece for pKVM is the ability to convert from shared to private
while preserving the contents, e.g. to hand off a large buffer (hundreds of MiB)
for processing in the protected VM.  Thoughts on this at the bottom.

> > This patch introduces userspace inaccessible memfd (created with
> > MFD_INACCESSIBLE). Its memory is inaccessible from userspace through
> > ordinary MMU access (e.g. read/write/mmap) but can be accessed via
> > in-kernel interface so KVM can directly interact with core-mm without
> > the need to map the memory into KVM userspace.
> 
> With secretmem we decided to not add such "concept switch" flags and instead
> use a dedicated syscall.
>

I have no personal preference whatsoever between a flag and a dedicated syscall,
but a dedicated syscall does seem like it would give the kernel a bit more
flexibility.

> What about memfd_inaccessible()? Especially, sealing and hugetlb are not
> even supported and it might take a while to support either.

Don't know about sealing, but hugetlb support for "inaccessible" memory needs to
come sooner than later.  "inaccessible" in quotes because we might want to choose
a less binary name, e.g. "restricted"?.

Regarding pKVM's use case, with the shim approach I believe this can be done by
allowing userspace mmap() the "hidden" memfd, but with a ton of restrictions
piled on top.

My first thought was to make the uAPI a set of KVM ioctls so that KVM could tightly
tightly control usage without taking on too much complexity in the kernel, but
working through things, routing the behavior through the shim itself might not be
all that horrific.

IIRC, we discarded the idea of allowing userspace to map the "private" fd because
things got too complex, but with the shim it doesn't seem _that_ bad.

E.g. on the memfd side:

  1. The entire memfd must be mapped, and at most one mapping is allowed, i.e.
     mapping is all or nothing.

  2. Acquiring a reference via get_pfn() is disallowed if there's a mapping for
     the restricted memfd.

  3. Add notifier hooks to allow downstream users to further restrict things.

  4. Disallow splitting VMAs, e.g. to force userspace to munmap() everything in
     one shot.

  5. Require that there are no outstanding references at munmap().  Or if this
     can't be guaranteed by userspace, maybe add some way for userspace to wait
     until it's ok to convert to private?  E.g. so that get_pfn() doesn't need
     to do an expensive check every time.
     
  static int memfd_restricted_mmap(struct file *file, struct vm_area_struct *vma)
  {
	if (vma->vm_pgoff)
		return -EINVAL;

	if ((vma->vm_end - vma->vm_start) != <file size>)
		return -EINVAL;

	mutex_lock(&data->lock);

	if (data->has_mapping) {
		r = -EINVAL;
		goto err;
	}
	list_for_each_entry(notifier, &data->notifiers, list) {
		r = notifier->ops->mmap_start(notifier, ...);
		if (r)
			goto abort;
	}

	notifier->ops->mmap_end(notifier, ...);
	mutex_unlock(&data->lock);
	return 0;

  abort:
	list_for_each_entry_continue_reverse(notifier &data->notifiers, list)
		notifier->ops->mmap_abort(notifier, ...);
  err:
	mutex_unlock(&data->lock);
	return r;
  }

  static void memfd_restricted_close(struct vm_area_struct *vma)
  {
	mutex_lock(...);

	/*
	 * Destroy the memfd and disable all future accesses if there are
	 * outstanding refcounts (or other unsatisfied restrictions?).
	 */
	if (<outstanding references> || ???)
		memfd_restricted_destroy(...);
	else
		data->has_mapping = false;

	mutex_unlock(...);
  }

  static int memfd_restricted_may_split(struct vm_area_struct *area, unsigned long addr)
  {
	return -EINVAL;
  }

  static int memfd_restricted_mapping_mremap(struct vm_area_struct *new_vma)
  {
	return -EINVAL;
  }

Then on the KVM side, its mmap_start() + mmap_end() sequence would:

  1. Not be supported for TDX or SEV-SNP because they don't allow adding non-zero
     memory into the guest (after pre-boot phase).

  2. Be mutually exclusive with shared<=>private conversions, and is allowed if
     and only if the entire gfn range of the associated memslot is shared.

