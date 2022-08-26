Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC45A2B45
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:30:44 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbIB-00053M-SY
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1oRb80-0006Wi-JM
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:20:13 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:35599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1oRb7y-0006cu-Fq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:20:12 -0400
Received: by mail-oi1-x232.google.com with SMTP id u14so2368017oie.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JxB2qaa3GXj7Ww0WJz/K7eVu2ESNhoaSdSA9k8puE0w=;
 b=rNZHisjyMKdc1KU7tmh/nGQkaLaNeYt3bMs5VKI6xJP2h2AOfOUzwRZRLla65xJeDe
 CEYqIxWJMO3nXKmE2NClEC3ph5qIL8NDIQhMrgP6gJ0WU4aWnONbzX+FJWCvfdfcSIsP
 AezQ9zuYWaHPSiF6LfTwPDglMWkbw4zeg+3bhrcfEcjamrhe4gPIvEzOpxfWMPFeywgQ
 UoNWH8KGUwupF/7+yTAgAVu4bX9J2NJTBc7jkz7aI3melLIyLqn9dmv13Lxx0qNdblrw
 TITwMBj98834n0fELMej+U+DtcWyCv5lRYX7IgVMedybI7TbJ5XNWzkK1RBJSfbEeA4F
 GDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JxB2qaa3GXj7Ww0WJz/K7eVu2ESNhoaSdSA9k8puE0w=;
 b=pFmeMwB7DI0d3+jN7hyrwOH+NV4+W0imvETAvf1SGUemgBxsJkVYd1B7a/7SBWK66T
 5rTIzxwJSkneUmj9mu5Y2B8UEEKkRA4swy0ljn1YmGcddgaYAvV2vrnnDvOShXNwC3Fw
 jIxW4kPugB0/I+/AHLbyJT1f0vgkeT7Y4R0gcBxkMsWb+t9B7OEHbxPElaCeY53l15Vp
 AsGC/Yb4hH44n6Kg88ltZV7sZVOddyugUJJO24fCTh16dTNTtr+4fQeDRGrI/bOr1cMG
 B8ABlsDR50jppawX/saR0U5A/fjaP3gZKcsIN02UNby3P57y+H4JC658P2wQ5BNOCSmF
 /PlQ==
X-Gm-Message-State: ACgBeo3izKWQC3emXjgwPjJ828LVJUhBDXDGUV2cJLPCiPojj0RtC8YO
 ts+C3uKQ56AjVRcHg9BKTNSjzmGldYskvvyiXqN9LA==
X-Google-Smtp-Source: AA6agR6SQe5onizWDvNdLrAzua1I9O94/DWXsFjcgNFZAlcVSFzWJyrqTisu6QhEpjJ6FUet5mh61grmllD7Si4hFpE=
X-Received: by 2002:a05:6808:152a:b0:344:c8d1:27e1 with SMTP id
 u42-20020a056808152a00b00344c8d127e1mr1877973oiw.294.1661527208826; Fri, 26
 Aug 2022 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
In-Reply-To: <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 26 Aug 2022 16:19:32 +0100
Message-ID: <CA+EHjTzRcEQcZRJixBa=fBXd4=-oZK=unmBLwBAFVixCPfY-dQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=tabba@google.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

Hi Chao,

On Wed, Jul 6, 2022 at 9:25 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
>
> Normally, a write to unallocated space of a file or the hole of a sparse
> file automatically causes space allocation, for memfd, this equals to
> memory allocation. This new seal prevents such automatically allocating,
> either this is from a direct write() or a write on the previously
> mmap-ed area. The seal does not prevent fallocate() so an explicit
> fallocate() can still cause allocating and can be used to reserve
> memory.
>
> This is used to prevent unintentional allocation from userspace on a
> stray or careless write and any intentional allocation should use an
> explicit fallocate(). One of the main usecases is to avoid memory double
> allocation for confidential computing usage where we use two memfds to
> back guest memory and at a single point only one memfd is alive and we
> want to prevent memory allocation for the other memfd which may have
> been mmap-ed previously. More discussion can be found at:
>
>   https://lkml.org/lkml/2022/6/14/1255
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/uapi/linux/fcntl.h |  1 +
>  mm/memfd.c                 |  3 ++-
>  mm/shmem.c                 | 16 ++++++++++++++--
>  3 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 2f86b2ad6d7e..98bdabc8e309 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -43,6 +43,7 @@
>  #define F_SEAL_GROW    0x0004  /* prevent file from growing */
>  #define F_SEAL_WRITE   0x0008  /* prevent writes */
>  #define F_SEAL_FUTURE_WRITE    0x0010  /* prevent future writes while mapped */
> +#define F_SEAL_AUTO_ALLOCATE   0x0020  /* prevent allocation for writes */

I think this should also be added to tools/include/uapi/linux/fcntl.h

Cheers,
/fuad


>  /* (1U << 31) is reserved for signed error codes */
>
>  /*
> diff --git a/mm/memfd.c b/mm/memfd.c
> index 08f5f8304746..2afd898798e4 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -150,7 +150,8 @@ static unsigned int *memfd_file_seals_ptr(struct file *file)
>                      F_SEAL_SHRINK | \
>                      F_SEAL_GROW | \
>                      F_SEAL_WRITE | \
> -                    F_SEAL_FUTURE_WRITE)
> +                    F_SEAL_FUTURE_WRITE | \
> +                    F_SEAL_AUTO_ALLOCATE)
>
>  static int memfd_add_seals(struct file *file, unsigned int seals)
>  {
> diff --git a/mm/shmem.c b/mm/shmem.c
> index a6f565308133..6c8aef15a17d 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2051,6 +2051,8 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>         struct vm_area_struct *vma = vmf->vma;
>         struct inode *inode = file_inode(vma->vm_file);
>         gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
> +       struct shmem_inode_info *info = SHMEM_I(inode);
> +       enum sgp_type sgp;
>         int err;
>         vm_fault_t ret = VM_FAULT_LOCKED;
>
> @@ -2113,7 +2115,12 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>                 spin_unlock(&inode->i_lock);
>         }
>
> -       err = shmem_getpage_gfp(inode, vmf->pgoff, &vmf->page, SGP_CACHE,
> +       if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
> +               sgp = SGP_NOALLOC;
> +       else
> +               sgp = SGP_CACHE;
> +
> +       err = shmem_getpage_gfp(inode, vmf->pgoff, &vmf->page, sgp,
>                                   gfp, vma, vmf, &ret);
>         if (err)
>                 return vmf_error(err);
> @@ -2459,6 +2466,7 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
>         struct inode *inode = mapping->host;
>         struct shmem_inode_info *info = SHMEM_I(inode);
>         pgoff_t index = pos >> PAGE_SHIFT;
> +       enum sgp_type sgp;
>         int ret = 0;
>
>         /* i_rwsem is held by caller */
> @@ -2470,7 +2478,11 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
>                         return -EPERM;
>         }
>
> -       ret = shmem_getpage(inode, index, pagep, SGP_WRITE);
> +       if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
> +               sgp = SGP_NOALLOC;
> +       else
> +               sgp = SGP_WRITE;
> +       ret = shmem_getpage(inode, index, pagep, sgp);
>
>         if (ret)
>                 return ret;
> --
> 2.25.1
>

