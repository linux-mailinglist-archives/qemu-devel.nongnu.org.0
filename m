Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B866459EE4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 10:07:32 +0100 (CET)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRlx-0006vB-2w
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 04:07:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRkj-000651-AZ
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:06:13 -0500
Received: from [2a00:1450:4864:20::534] (port=45801
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpRkh-0005Mb-8A
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 04:06:13 -0500
Received: by mail-ed1-x534.google.com with SMTP id y12so89007672eda.12
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=F1MNEC3Zm1/pIEcv2UTnLR98/iLdaUYqO7rHMG7hrdo=;
 b=Jm9x7hgSTNjPI95TZAUBpStM6prfp4omw3ghFep8880iRmSAlHCDncfrvx0ZulBI0k
 uRF5cVosy0ZAOkN7k7DHR8RMikef0GsMjGQBfRTJwdkQbBMHTKC+8dQN1jtIFPu/LodB
 90BcipA2sMj4E5xYeVoMPvPdNt35Ov3ieONi6ofL5eaMrC06b5r69wta703vt/dp6HKl
 mOKyc1FX3+WeBazndttgraQfRx7Eyezb5K7ZBECIUI7je7n+CMTvD9S4yOGS7EgohGY2
 O5wumNy0wpF7upaxJWi4BEBUaXuKcq7lsh8+oCARlwW6EDQwTmq4rNCfdtxR2Wi17h0r
 PFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=F1MNEC3Zm1/pIEcv2UTnLR98/iLdaUYqO7rHMG7hrdo=;
 b=0JCq9TcdqLXgPSkhLwjrphzwbD3apUdE9rY3Gqzf3/FmSqJgdse34KLXEap6l9oaIP
 9IqzxnEEVUyEUxW+KDW7BPv22r/MWIeg6IK7eLvyLh8vnYvpy05Nk9bc4/RpwBZ2won6
 7yo3NvlCok2LEbBRBIkwB3m3lTdQTGerhMMf4R1Wyh/Y9snVNnaZpotmieUlGMQNfpFM
 JbqqRNZXGZWNAkDt+7hG9X4zRMC0loFz3XSD1KG4Zbc/BHp63uv2ZImDRLx9lx3otYxO
 h/l8SUY360FY4pYBR1kGgwgCR+xwqawKOKkh/70O5fbG3OmxP+WU+w9b5WOFF/BZ89ua
 xVGw==
X-Gm-Message-State: AOAM530EwYxbarfxl/ttB5wtMDd4ISQx/8dK8CqqSJM4EHlHdkzEnRUZ
 ZTSikKJr5MQa15O+gUBWNxI=
X-Google-Smtp-Source: ABdhPJzIThjxkju4L1CcQt8+JnyuJ4ximXnhRtdaj22BULFxN4ENlWBQUkSzm8vAQr99AxeWyw2Nkw==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr5448342ejc.275.1637658369748; 
 Tue, 23 Nov 2021 01:06:09 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id mc3sm4956388ejb.24.2021.11.23.01.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 01:06:09 -0800 (PST)
Message-ID: <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
Date: Tue, 23 Nov 2021 10:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Chao Peng <chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
In-Reply-To: <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 16:39, David Hildenbrand wrote:
>> If qmeu can put all the guest memory in a memfd and not map it, then
>> I'd also like to see that the IOMMU can use this interface too so we
>> can have VFIO working in this configuration.
> 
> In QEMU we usually want to (and must) be able to access guest memory
> from user space, with the current design we wouldn't even be able to
> temporarily mmap it -- which makes sense for encrypted memory only. The
> corner case really is encrypted memory. So I don't think we'll see a
> broad use of this feature outside of encrypted VMs in QEMU. I might be
> wrong, most probably I am:)

It's not _that_ crazy an idea, but it's going to be some work to teach 
KVM that it has to kmap/kunmap around all memory accesses.

I think it's great that memfd hooks are usable by more than one 
subsystem, OTOH it's fair that whoever needs it does the work---and VFIO 
does not need it for confidential VMs, yet, so it should be fine for now 
to have a single user.

On the other hand, as I commented already, the lack of locking in the 
register/unregister functions has to be fixed even with a single user. 
Another thing we can do already is change the guest_ops/guest_mem_ops to 
something like memfd_falloc_notifier_ops/memfd_pfn_ops, and the 
register/unregister functions to memfd_register/unregister_falloc_notifier.

Chao, can you also put this under a new CONFIG such as "bool MEMFD_OPS", 
and select it from KVM?

Thanks,

Paolo

