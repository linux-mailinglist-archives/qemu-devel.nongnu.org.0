Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5D658AB9B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:27:48 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxMh-0000hB-HN
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJxLB-0007gx-13
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJxL6-000214-Ph
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659705968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJBXhzmt1GniFe2smeou8x6jmkkaotxI6ROvs4HpGEk=;
 b=bpkEz2iOjvmYkH6VqnaDfNHgqGT0ELkwEQZ5jkL78af+dgRHHpcOoV2AW8YnkXOv88YBxe
 pow/GbzO5yzeeGp0L+WWtlFxnAPz5tYfNIF5Zj0kRdan0EV2SfzYBgl1LHxlv+mF8DOQFj
 5xAP6JdktNElst8eIPeD5hyZxMDL9xA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-YvgnqlQyMb6PfS9zU8p3tw-1; Fri, 05 Aug 2022 09:26:06 -0400
X-MC-Unique: YvgnqlQyMb6PfS9zU8p3tw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h133-20020a1c218b000000b003a4f57eaeaaso1268873wmh.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 06:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=mJBXhzmt1GniFe2smeou8x6jmkkaotxI6ROvs4HpGEk=;
 b=UA1wZsZLw/mV3cIYCA/kGBvc/HT344jHvuXYMWlOXf3X74BYA6T2LvR5PY11ez3uII
 886ztPEoqqPjOAfNXjbxDOdC7/DRfaFLz6swthZfBkCR91X495ngBpQbMKmg5oD4TAsU
 oZbcGXqgib7MJnErl0iVO6FwXu/StGJdfzHujB85QpTu1xGSDYSwkRuyfespOpaimlkz
 M0/dsBy2RA1tbRhP6/EWH4koy+AUaWtycqvovdFKn7thBMuy5VSNnB+CYfPs5hdEj5jM
 0pXmWijVgUPxVmxtw5JXLWlFeiusMsVgyXV+IKR6d+2L+AyaaxuStbafPh4SKOuPf1Qz
 HK9g==
X-Gm-Message-State: ACgBeo3agKo9/lHYpxh3Arq0nCvpM2MD7A6d1AsI65613xUH6rZp++kr
 5ogGVNnhn9b+gkyYQy9gfOdvjPDGS2KdPm5hAFlc8eHhHCt9b7Tt84LCtvLZBMyfwgsn7UfWLaF
 a4Jjk/TtZxp7hBV0=
X-Received: by 2002:a5d:588f:0:b0:220:761a:6894 with SMTP id
 n15-20020a5d588f000000b00220761a6894mr4409181wrf.406.1659705965746; 
 Fri, 05 Aug 2022 06:26:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ajxOjPYt9fURAvT4aPqpXXmNPivXi3/PkheqDod4RApDXYAPhtZxZHk1xvMFDF/irKdR08g==
X-Received: by 2002:a5d:588f:0:b0:220:761a:6894 with SMTP id
 n15-20020a5d588f000000b00220761a6894mr4409161wrf.406.1659705965445; 
 Fri, 05 Aug 2022 06:26:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003a32490c95dsm9887725wmq.35.2022.08.05.06.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 06:26:05 -0700 (PDT)
Message-ID: <a34d88b9-a4b9-cb9e-91d9-c5a89449fcd5@redhat.com>
Date: Fri, 5 Aug 2022 15:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 04/14] mm/shmem: Support memfile_notifier
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-5-chao.p.peng@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220706082016.2603916-5-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 06.07.22 10:20, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Implement shmem as a memfile_notifier backing store. Essentially it
> interacts with the memfile_notifier feature flags for userspace
> access/page migration/page reclaiming and implements the necessary
> memfile_backing_store callbacks.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---

[...]

> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +static struct memfile_node *shmem_lookup_memfile_node(struct file *file)
> +{
> +	struct inode *inode = file_inode(file);
> +
> +	if (!shmem_mapping(inode->i_mapping))
> +		return NULL;
> +
> +	return  &SHMEM_I(inode)->memfile_node;
> +}
> +
> +
> +static int shmem_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> +			 int *order)
> +{
> +	struct page *page;
> +	int ret;
> +
> +	ret = shmem_getpage(file_inode(file), offset, &page, SGP_WRITE);
> +	if (ret)
> +		return ret;
> +
> +	unlock_page(page);
> +	*pfn = page_to_pfn_t(page);
> +	*order = thp_order(compound_head(page));
> +	return 0;
> +}
> +
> +static void shmem_put_pfn(pfn_t pfn)
> +{
> +	struct page *page = pfn_t_to_page(pfn);
> +
> +	if (!page)
> +		return;
> +
> +	put_page(page);


Why do we export shmem_get_pfn/shmem_put_pfn and not simply

get_folio()

and let the caller deal with putting the folio? What's the reason to

a) Operate on PFNs and not folios
b) Have these get/put semantics?

> +}
> +
> +static struct memfile_backing_store shmem_backing_store = {
> +	.lookup_memfile_node = shmem_lookup_memfile_node,
> +	.get_pfn = shmem_get_pfn,
> +	.put_pfn = shmem_put_pfn,
> +};
> +#endif /* CONFIG_MEMFILE_NOTIFIER */
> +
>  void __init shmem_init(void)
>  {
>  	int error;
> @@ -3956,6 +4059,10 @@ void __init shmem_init(void)
>  	else
>  		shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
>  #endif
> +
> +#ifdef CONFIG_MEMFILE_NOTIFIER
> +	memfile_register_backing_store(&shmem_backing_store);

Can we instead prove a dummy function that does nothing without
CONFIG_MEMFILE_NOTIFIER?

> +#endif
>  	return;
>  
>  out1:


-- 
Thanks,

David / dhildenb


