Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669145F0FC8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:21:23 +0200 (CEST)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIlM-00068p-Nf
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1oeIfJ-0003Ix-J0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:15:05 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:35354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1oeIfF-0007W9-0i
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:15:02 -0400
Received: by mail-lj1-x22a.google.com with SMTP id x29so5314220ljq.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GtlSJkLXw2SNcPVROAD1SJDnwutfnbZAayHj4onnywk=;
 b=DOMyGYFKf+TZsvY4xp2ON3TIpgoHPlU49dDhE2e+lblBc8uIrSThwS/2igACfNwrxT
 B80A327TY7zTQhfHZWcTomLg9RP5BFCafC1G5Xq0tQ7fwoJvvStDoxT0G2gxcG663JP2
 Fs7G3g4B/VZpF4ch3hxit7Ug+GQ+GOdS/DQOAl43rZESxPq8F6OkxZ3VQDuWTfhZaVv4
 SIQHFtGYvuP6RLRGuDR8p9bpU8nbzmLRHnOHWxhEywjmhLPHJS0aPcx7Quodth6mnW/e
 VlopEFYGcfN96ScGyCOubqRcKtcTue5tCsqbI81iqfPNUwyTk6FXx34dym02k3Ilq/RK
 sZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GtlSJkLXw2SNcPVROAD1SJDnwutfnbZAayHj4onnywk=;
 b=Pq3TqQ99TKKivp0/BLeqLyZMycW53XFlc7f1BNdssfV6BjObdgDQjAh61ulztkcCFr
 /WC1V3BaUn9qJYWlQBa7LcR5pDxTbBlCAOHYaUXyhi6lOwPSX+qFYBk79Da8WBWpzp64
 Vxd66iuOKz+rlVWVr44sL/8Bo3Jhaf/vS0oCeTbvI6boVECTY+zJ/1z/I/XVkrS/KmBV
 pFjIXmBSpOgnJ5zW0R/N8akxtqahC4aZ6mT9JdTO3buug7ohiApNFPBepCp+zJcJX1Oi
 rNYv1Ffum+aPzjOvdqUw8WpL10T3/4p3WO5O7gWKUkTLuPC13EeIcpxSKNgRDjpXYB7Z
 Berw==
X-Gm-Message-State: ACrzQf0stm631ZS3eS1dkTm5eIEAr/YkNbpBOxsUvYtg8W+UrnOOzELm
 O4VJBA9Ufj5TE1UWh0YRxIigU8OAcsndaX+fA1NJFw==
X-Google-Smtp-Source: AMsMyM7jpq+XBzS300JrKAbZeYDxFloAXMmPfSxwUISYLv3b6zRl+QtVRiHq6i7/nDDb8l/3nFMe7wpgyR1WcsBFjoI=
X-Received: by 2002:a05:651c:1508:b0:26c:622e:abe1 with SMTP id
 e8-20020a05651c150800b0026c622eabe1mr3044232ljf.228.1664554497777; Fri, 30
 Sep 2022 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
In-Reply-To: <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 30 Sep 2022 17:14:00 +0100
Message-ID: <CA+EHjTyrexb_LX7Jm9-MGwm4DBvfjCrADH4oumFyAvs2_0oSYw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=tabba@google.com; helo=mail-lj1-x22a.google.com
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
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "linux/sbitmap.h"
> +#include <linux/memfd.h>
> +#include <linux/pagemap.h>
> +#include <linux/pseudo_fs.h>
> +#include <linux/shmem_fs.h>
> +#include <uapi/linux/falloc.h>
> +#include <uapi/linux/magic.h>
> +
> +struct inaccessible_data {
> +       struct mutex lock;
> +       struct file *memfd;
> +       struct list_head notifiers;
> +};
> +
> +static void inaccessible_notifier_invalidate(struct inaccessible_data *data,
> +                                pgoff_t start, pgoff_t end)
> +{
> +       struct inaccessible_notifier *notifier;
> +
> +       mutex_lock(&data->lock);
> +       list_for_each_entry(notifier, &data->notifiers, list) {
> +               notifier->ops->invalidate(notifier, start, end);
> +       }
> +       mutex_unlock(&data->lock);
> +}
> +
> +static int inaccessible_release(struct inode *inode, struct file *file)
> +{
> +       struct inaccessible_data *data = inode->i_mapping->private_data;
> +
> +       fput(data->memfd);
> +       kfree(data);
> +       return 0;
> +}
> +
> +static long inaccessible_fallocate(struct file *file, int mode,
> +                                  loff_t offset, loff_t len)
> +{
> +       struct inaccessible_data *data = file->f_mapping->private_data;
> +       struct file *memfd = data->memfd;
> +       int ret;
> +
> +       if (mode & FALLOC_FL_PUNCH_HOLE) {
> +               if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> +                       return -EINVAL;
> +       }
> +
> +       ret = memfd->f_op->fallocate(memfd, mode, offset, len);

I think that shmem_file_operations.fallocate is only set if
CONFIG_TMPFS is enabled (shmem.c). Should there be a check at
initialization that fallocate is set, or maybe a config dependency, or
can we count on it always being enabled?

> +       inaccessible_notifier_invalidate(data, offset, offset + len);
> +       return ret;
> +}
> +

<...>

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

If the memfd wasn't marked as inaccessible, or more generally
speaking, if the file isn't a memfd_inaccessible file, this ends up
accessing an uninitialized pointer for the notifier list. Should there
be a check for that here, and have this function return an error if
that's not the case?

Thanks,
/fuad



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

