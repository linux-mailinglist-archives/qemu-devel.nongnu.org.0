Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A65F6376
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:17:10 +0200 (CEST)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogN09-0002MG-Fx
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ogMb7-0005qD-3j
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:51:18 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:44767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1ogMb4-0008RB-Mr
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:51:16 -0400
Received: by mail-lf1-x12f.google.com with SMTP id s20so1671299lfi.11
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tIvLoyAzCOVKOX99D0R9AADU51C3uknT25CXCqDgD1U=;
 b=syjvuFslfwj1fipmU574j5/yWZL2S3jYhnbWtJ5/bW8iUM/V71vSmb5AsxhaQ/2G0o
 ctXQnXj/0GSOAbOLK304yQgqsFpIlw2wn3vENsIXReAQESQ7FYQ3e3iDUnXAdUxwt4Td
 kB2rW56eQNiKHDXyNU3pU/c0Ku79mAkkC7m5TZZLTqHBqVkt65rb0q9hLTPBpEEa/mRq
 eX1zzMQ6IXkPCewSrX8mVTXOcPVRl/qAef1AVJ52kW5/Ujtn6X047jAV62EnnUX9Aztm
 0/+I6X+EdhcVKtpUJDxafJIJ2F5NBl87Wqp+wSebFHrCPcoC3fkGq5u8ifnCkUUfBbKO
 WVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tIvLoyAzCOVKOX99D0R9AADU51C3uknT25CXCqDgD1U=;
 b=50Pj+PNvJ/9ThoHfvY2LyhqzP/CVQnJ5dmtC/GSHjPL67Bj89XaoitrrQPmix/UOi6
 1UMWV4VyXAZSQd/g8QPFjB5MjSkjJ6+gVe3wso3eYHCw8me6nT13PStsmCB5O60Dv6QW
 c/F+NLiE4nzbvVg2+j1K7k8UAaKZkl9ECzzaO06B+MxIlhkTf7odzjL65aApyIyP6nPb
 8VYUaFtKVlkXPcfDmGjZADDKiOfXEoZtXXTpxH+pEB8obNU87ptz0jCuwq8SANi36cgV
 ugl6S1jtEy2wZB9MH4WZ9kuNsAOIHUPmrd/3CIS/xpLJZ3TEDOtoZscT7iBhnuvoJ54E
 Yqzw==
X-Gm-Message-State: ACrzQf2Etu7i34X0ZUoKRXYWgR/ffRM2wB48cDBRqwi94m4fHofB8fYt
 E9oD4VrO9gCZerb1Uyz4rV5Sr2LufTJRE9W7PNDM/Q==
X-Google-Smtp-Source: AMsMyM5ikUdU3CKf42PjcY0cjPjhnAUfk+hgFVaVlzCr5IsHwJzEJDOSLagw5jbRXrOt3sxCo/qZdi3EfGbbRlMYSzI=
X-Received: by 2002:ac2:4c8b:0:b0:4a2:2432:93ff with SMTP id
 d11-20020ac24c8b000000b004a2243293ffmr1387544lfl.26.1665046264888; Thu, 06
 Oct 2022 01:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
In-Reply-To: <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Oct 2022 09:50:28 +0100
Message-ID: <CA+EHjTz=o9M47frGCXgNJ8J5_Rn=YjzZR5uvCTxStw+GfGE5kg@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
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
 mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=tabba@google.com; helo=mail-lf1-x12f.google.com
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

Hi,

<...>


> diff --git a/mm/memfd_inaccessible.c b/mm/memfd_inaccessible.c
> new file mode 100644
> index 000000000000..2d33cbdd9282
> --- /dev/null
> +++ b/mm/memfd_inaccessible.c

<...>

> +struct file *memfd_mkinaccessible(struct file *memfd)
> +{
> +       struct inaccessible_data *data;
> +       struct address_space *mapping;
> +       struct inode *inode;
> +       struct file *file;
> +
> +       data = kzalloc(sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       data->memfd = memfd;
> +       mutex_init(&data->lock);
> +       INIT_LIST_HEAD(&data->notifiers);
> +
> +       inode = alloc_anon_inode(inaccessible_mnt->mnt_sb);
> +       if (IS_ERR(inode)) {
> +               kfree(data);
> +               return ERR_CAST(inode);
> +       }
> +
> +       inode->i_mode |= S_IFREG;
> +       inode->i_op = &inaccessible_iops;
> +       inode->i_mapping->private_data = data;
> +
> +       file = alloc_file_pseudo(inode, inaccessible_mnt,
> +                                "[memfd:inaccessible]", O_RDWR,
> +                                &inaccessible_fops);
> +       if (IS_ERR(file)) {
> +               iput(inode);
> +               kfree(data);

I think this might be missing a return at this point.

> +       }
> +
> +       file->f_flags |= O_LARGEFILE;
> +
> +       mapping = memfd->f_mapping;
> +       mapping_set_unevictable(mapping);
> +       mapping_set_gfp_mask(mapping,
> +                            mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
> +
> +       return file;
> +}

Thanks,
/fuad



> +
> +void inaccessible_register_notifier(struct file *file,
> +                                   struct inaccessible_notifier *notifier)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +
> +       mutex_lock(&data->lock);
> +       list_add(&notifier->list, &data->notifiers);
> +       mutex_unlock(&data->lock);
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_register_notifier);
> +
> +void inaccessible_unregister_notifier(struct file *file,
> +                                     struct inaccessible_notifier *notifier)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +
> +       mutex_lock(&data->lock);
> +       list_del(&notifier->list);
> +       mutex_unlock(&data->lock);
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_unregister_notifier);
> +
> +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> +                        int *order)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +       struct file *memfd = data->memfd;
> +       struct page *page;
> +       int ret;
> +
> +       ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
> +       if (ret)
> +               return ret;
> +
> +       *pfn = page_to_pfn_t(page);
> +       *order = thp_order(compound_head(page));
> +       SetPageUptodate(page);
> +       unlock_page(page);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_get_pfn);
> +
> +void inaccessible_put_pfn(struct file *file, pfn_t pfn)
> +{
> +       struct page *page = pfn_t_to_page(pfn);
> +
> +       if (WARN_ON_ONCE(!page))
> +               return;
> +
> +       put_page(page);
> +}
> +EXPORT_SYMBOL_GPL(inaccessible_put_pfn);
> --
> 2.25.1
>

