Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968DC459EBC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:56:19 +0100 (CET)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRb8-0001Ob-OA
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRZy-0000bK-LD
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:55:06 -0500
Received: from [2a00:1450:4864:20::430] (port=33738
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRZw-0003ef-VK
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:55:06 -0500
Received: by mail-wr1-x430.google.com with SMTP id d24so37696659wra.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BqjTDota6qXyAvZTc5GkJOlaJlVWffG7A+eb5cGOB4I=;
 b=hFdqHn9RNEZSqmlr5iDLMvf0Vh/+AoriBzrucJDGFvvIJzpz2aAWz7zCwMcTOr+R34
 6j7hJ9fO5kHUgK7EB0/daaP7kC1zOgykiLKdxfc87gJDPQoyALSWcczHDm9U0BSYJokp
 AYs2XlP5glYCiNr0o9z00QBu/ifYKPDURHskwgpc+6Gn6RND+kHujM/yXBMtesmOY/qw
 xD+0iG3/gZa85Jdlli0QkI8k/btW15XtTW9xX1W3cJOR27cMXzr4GgO0atHXR5uypfHq
 HS1mH2y+lrz1qzuP7LB1a47LCmEbc+GawVY+0evta3MLP0+p9x32ab6JPgNFuPo2gcKI
 7omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BqjTDota6qXyAvZTc5GkJOlaJlVWffG7A+eb5cGOB4I=;
 b=Snb8q4S/ewUoYuw4VEeQL15x3OxVyenwngl6w0AvN+nKZThEVO5hDuKyNfhha7fgrl
 O71ApysSg+K/eAl6fJteTrVK4c4xIC4iOEIjkzGW+ccsgQMNPc/zWTpLE0PE9/irbxUC
 paWJLIhcq4KKB8YiMQjKVWViN3KCoU2FGsN1V+Se9XkTj8hnn7tKNC684+vA9iug2dZE
 2Jm5Ty6NMms9ahI+m6t+79VJgcmwoSROnopJEnZ8CAwAEyNph7YNMmQ04elI8+kOizwu
 LspbxgbAjJYk/WQTN/h8UXcxneLAkqCp2yVTaQDS35SBDOHQXr7E/SoidIW3lQnbvQNj
 mf1A==
X-Gm-Message-State: AOAM530oH6uTUyY2tM+XJfHJxBs7Ao0O205Dzp1V5Lefv0E2wG1I/lI/
 xdl6H95lZcsYqtff6bLB7t8=
X-Google-Smtp-Source: ABdhPJywg45Zdyiao5yHIoV/TWl9Lu4GeLuq7tkwSYZ5N0X3GzMOpvzt3xNpQ/xwFgF2+cvecBOasQ==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr5341362wrl.24.1637657703555; 
 Tue, 23 Nov 2021 00:55:03 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id n1sm502199wmq.6.2021.11.23.00.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 00:55:03 -0800 (PST)
Message-ID: <5f6f43a1-bb4c-f498-2aba-4c93ab57fc98@gnu.org>
Date: Tue, 23 Nov 2021 09:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
From: Paolo Bonzini <bonzini@gnu.org>
In-Reply-To: <20211119134739.20218-2-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 14:47, Chao Peng wrote:
> +static void guest_invalidate_page(struct inode *inode,
> +				  struct page *page, pgoff_t start, pgoff_t end)
> +{
> +	struct shmem_inode_info *info = SHMEM_I(inode);
> +
> +	if (!info->guest_ops || !info->guest_ops->invalidate_page_range)
> +		return;
> +
> +	start = max(start, page->index);
> +	end = min(end, page->index + thp_nr_pages(page)) - 1;
> +
> +	info->guest_ops->invalidate_page_range(inode, info->guest_owner,
> +					       start, end);
> +}

The lack of protection makes the API quite awkward to use;
the usual way to do this is with refcount_inc_not_zero (aka 
kvm_get_kvm_safe).

Can you use the shmem_inode_info spinlock to protect against this?  If 
register/unregister take the spinlock, the invalidate and fallocate can 
take a reference under the same spinlock, like this:

	if (!info->guest_ops)
		return;

	spin_lock(&info->lock);
	ops = info->guest_ops;
	if (!ops) {
		spin_unlock(&info->lock);
		return;
	}

	/* Calls kvm_get_kvm_safe.  */
	r = ops->get_guest_owner(info->guest_owner);
	spin_unlock(&info->lock);
	if (r < 0)
		return;

	start = max(start, page->index);
	end = min(end, page->index + thp_nr_pages(page)) - 1;

	ops->invalidate_page_range(inode, info->guest_owner,
					       start, end);
	ops->put_guest_owner(info->guest_owner);

Considering that you have to take a mutex anyway in patch 13, and that 
the critical section here is very small, the extra indirect calls are 
cheaper than walking the vm_list; and it makes the API clearer.

Paolo

