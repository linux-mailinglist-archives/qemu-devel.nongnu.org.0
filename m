Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB645A674
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 16:21:44 +0100 (CET)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXc7-0002lK-5p
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 10:21:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mpXad-0001uC-Bz
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:20:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mpXaa-0001BI-0x
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637680807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzZw5UfSegXbw18CEt/o6FXd1pUErV1MvwcNtl5mpBU=;
 b=PXbNt34wqhDZV3S3ho8nfqy6XLHaVcf3TDjhn+sjF1uYo8ccNHr2a7pt5mjOSvnL1QLkm+
 4j/VF6uD1TCizJWv/WagQ5/SFQngWX4BZJFKzVYsIgr2vM5niN2dIwvQG7XimNOkeuXDps
 LJK53mWx6zoLoj2/7zHrxQUo6eYmi1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-4Ne-1rDXOLiLHx4kpjek-g-1; Tue, 23 Nov 2021 10:20:05 -0500
X-MC-Unique: 4Ne-1rDXOLiLHx4kpjek-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1711173wms.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 07:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nzZw5UfSegXbw18CEt/o6FXd1pUErV1MvwcNtl5mpBU=;
 b=JcaIc5PtQibXl9JjSGCsXQV0GjhCNWn415Nvi0SlazCvpUSZNdJVyzYGfypNS4AaWj
 jumCIP5IJMax1H3qE7/xy7qVOUWRRpfWbVp5zAkM1TfP8hnAgvGEOgMvb7Mili07qjmy
 aw1/opms22G7yenzSFMpKJoABRoGJGBP9VHzGmGtY6ksG0nI1SLaqpzbuPqUMGwa5OwU
 CLqSAK7ya8ZTcpTMOze8IPTaYvn/zM7NTx9dMXJS77/b50TcEXNak7yrh3kTXc2VzMZP
 aoZoIbayCeWlN57bOx7NDQBRartN1PyMWyW1f3uKrM+HIr15WENJu+38V2qdNBvpB+KV
 2LKg==
X-Gm-Message-State: AOAM532tVs5o/FkgJyuTWtFk4+BJxFR7+W6Dg+CHv7Uzkr5Ihn6ScpyZ
 Y9x+qcnlmTHe+sMN5rQc3GHrKBeQRjbA51rkoBK/NxkMY2Vc3O03UNeKkgsX9ud2mQWCn1q7ZbC
 F32lvCuJ6LeK4Xp4=
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr8183346wrd.52.1637680804592; 
 Tue, 23 Nov 2021 07:20:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUoSoPvPvLO49H6NY+gHF+4FNFe07RzaW7WxEc5sbe1D39sGgbrgj8rSNIcLf3gIFDDlAziw==
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr8183284wrd.52.1637680804298; 
 Tue, 23 Nov 2021 07:20:04 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6765.dip0.t-ipconnect.de. [91.12.103.101])
 by smtp.gmail.com with ESMTPSA id n15sm1632169wmq.38.2021.11.23.07.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 07:20:03 -0800 (PST)
Message-ID: <ebe07977-8840-ebe2-57ce-9126a4081bb4@redhat.com>
Date: Tue, 23 Nov 2021 16:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
To: Paolo Bonzini <pbonzini@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Chao Peng <chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23.11.21 10:06, Paolo Bonzini wrote:
> On 11/19/21 16:39, David Hildenbrand wrote:
>>> If qmeu can put all the guest memory in a memfd and not map it, then
>>> I'd also like to see that the IOMMU can use this interface too so we
>>> can have VFIO working in this configuration.
>>
>> In QEMU we usually want to (and must) be able to access guest memory
>> from user space, with the current design we wouldn't even be able to
>> temporarily mmap it -- which makes sense for encrypted memory only. The
>> corner case really is encrypted memory. So I don't think we'll see a
>> broad use of this feature outside of encrypted VMs in QEMU. I might be
>> wrong, most probably I am:)
> 
> It's not _that_ crazy an idea, but it's going to be some work to teach 
> KVM that it has to kmap/kunmap around all memory accesses.

I'm also concerned about userspace access. But you sound like you have a
plan :)

-- 
Thanks,

David / dhildenb


