Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A09748DB30
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:59:36 +0100 (CET)
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82Vj-0002Q1-3Z
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:59:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n82TF-0000eX-HN
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:57:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n82TC-0004JB-Gz
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642089417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVjjhSTO5jv7G5CNfPQaqxy98s1YUf5RmxMVGvagrRU=;
 b=N3zuWt+qJlJ1/lgg9nWUgBBSVDXlkQwA+tscrTjhQxCvLvipy1cBqOcl09cO+oiJtLkEhA
 /yRg5DnpikhUkVIGoRroOid0Ba0FGb3bxeZutaKFF1b4U2JF9kaMeToc054R0vHhtGmBly
 SgkvZ9PN6NU9zN3Fms76Zbj6SfXv8G8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-ditg7euMMsKozqpUBDivbQ-1; Thu, 13 Jan 2022 10:56:56 -0500
X-MC-Unique: ditg7euMMsKozqpUBDivbQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 g2-20020a056402424200b003f8ee03207eso5768967edb.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iVjjhSTO5jv7G5CNfPQaqxy98s1YUf5RmxMVGvagrRU=;
 b=2xBsBudxKCqoecGHG+WJMQILDq4wgX5GJxxkSA3BiTG7kAJv8Ak8y/UGvXjCVwnZhB
 ib12r3DfHqBgV6Tfy741OWOy6HAQXSt+pReaC6zhzVs8M+r7viAvipJ1BzXLHHZ+x4Ah
 x+cRgCxIw3WQL6VIzKRk8AfR9asPgOj7unt26wL2i9YoMlCjxTVU3Fj1rSmJ1hd8g98A
 0mVgEKFpW1jzm7lJ3ZIQw1YBtYLO35ov2BwSpVqNBjsuY8wuivyti7TU8G6uDlHge+NC
 8+H9Daaw6P1WCiTZp+zpw231rkuxTFyHAJoUOYv8AP5yJc2W27MTjoNp+KwkbP3wZM33
 elsQ==
X-Gm-Message-State: AOAM533JqHz+1oSNFoykN6oSQVPZ5l2nqHk0s6z1Zneu+kehbyk+UJ+t
 NLh2Cy0whnO/BOnRPkOwXP5JRzIMLXLkfMrGvd06rVNSuNwsCxwTxqgNo/60w9wdxrbw86iU3zw
 Mir0GE0hlfEYpSgY=
X-Received: by 2002:a17:907:3ea2:: with SMTP id
 hs34mr3985618ejc.191.1642089415193; 
 Thu, 13 Jan 2022 07:56:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdEZGBZ+SY0OUOH5+ulUWsavApWdL/E+Vnbzgt7kPf6DLvU3IuDpfFk7n3gAZ11fQX3pswoQ==
X-Received: by 2002:a17:907:3ea2:: with SMTP id
 hs34mr3985577ejc.191.1642089414855; 
 Thu, 13 Jan 2022 07:56:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id f29sm986699ejj.209.2022.01.13.07.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:56:54 -0800 (PST)
Message-ID: <0893e873-20c4-7e07-e7e4-3971dbb79118@redhat.com>
Date: Thu, 13 Jan 2022 16:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 kvm/queue 01/16] mm/shmem: Introduce F_SEAL_INACCESSIBLE
To: Chao Peng <chao.p.peng@linux.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-2-chao.p.peng@linux.intel.com>
 <7eb40902-45dd-9193-37f1-efaca381529b@redhat.com>
 <20220106130638.GB43371@chaop.bj.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220106130638.GB43371@chaop.bj.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.01.22 14:06, Chao Peng wrote:
> On Tue, Jan 04, 2022 at 03:22:07PM +0100, David Hildenbrand wrote:
>> On 23.12.21 13:29, Chao Peng wrote:
>>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>>
>>> Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
>>> the file is inaccessible from userspace in any possible ways like
>>> read(),write() or mmap() etc.
>>>
>>> It provides semantics required for KVM guest private memory support
>>> that a file descriptor with this seal set is going to be used as the
>>> source of guest memory in confidential computing environments such
>>> as Intel TDX/AMD SEV but may not be accessible from host userspace.
>>>
>>> At this time only shmem implements this seal.
>>>
>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>>> ---
>>>  include/uapi/linux/fcntl.h |  1 +
>>>  mm/shmem.c                 | 37 +++++++++++++++++++++++++++++++++++--
>>>  2 files changed, 36 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
>>> index 2f86b2ad6d7e..e2bad051936f 100644
>>> --- a/include/uapi/linux/fcntl.h
>>> +++ b/include/uapi/linux/fcntl.h
>>> @@ -43,6 +43,7 @@
>>>  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
>>>  #define F_SEAL_WRITE	0x0008	/* prevent writes */
>>>  #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
>>> +#define F_SEAL_INACCESSIBLE	0x0020  /* prevent file from accessing */
>>
>> I think this needs more clarification: the file content can still be
>> accessed using in-kernel mechanisms such as MEMFD_OPS for KVM. It
>> effectively disallows traditional access to a file (read/write/mmap)
>> that will result in ordinary MMU access to file content.
>>
>> Not sure how to best clarify that: maybe, prevent ordinary MMU access
>> (e.g., read/write/mmap) to file content?
> 
> Or: prevent userspace access (e.g., read/write/mmap) to file content?

The issue with that phrasing is that userspace will be able to access
that content, just via a different mechanism eventually ... e.g., via
the KVM MMU indirectly. If that makes it clearer what I mean :)

>>
>>>  /* (1U << 31) is reserved for signed error codes */
>>>  
>>>  /*
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index 18f93c2d68f1..faa7e9b1b9bc 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -1098,6 +1098,10 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
>>>  		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
>>>  			return -EPERM;
>>>  
>>> +		if ((info->seals & F_SEAL_INACCESSIBLE) &&
>>> +		    (newsize & ~PAGE_MASK))
>>> +			return -EINVAL;
>>> +
>>
>> What happens when sealing and there are existing mmaps?
> 
> I think this is similar to ftruncate, in either case we just allow that.
> The existing mmaps will be unmapped and KVM will be notified to
> invalidate the mapping in the secondary MMU as well. This assume we
> trust the userspace even though it can not access the file content.

Can't we simply check+forbid instead?

-- 
Thanks,

David / dhildenb


