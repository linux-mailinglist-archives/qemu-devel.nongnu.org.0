Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D874AD4AF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:22:50 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMi0-000070-IN
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:22:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nHMC6-0006mD-Sj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nHMC3-0006IS-5c
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644310184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67PxmAL3Xd8LpaVSVss2M9MADvWamDZ50hstBrm0qA0=;
 b=hBJAKnJsVjqFtw1SgP/A4zPzzzRYRqnq5uy0VkcI0miT1jkkAej5NBBaHhYP/oG35Ip42f
 Bk74PGQ9vBXhnHyAMSltsBAkDkK7eYZDZP1w1FbQJN6KEnVUJ84wz3PML7/i45SnoWzgrI
 nV7LXV/3hLnCUDdINr5jYeLpt3OJ3QE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-asQtM6lXOjKKLs9oUq_nWQ-1; Tue, 08 Feb 2022 03:49:41 -0500
X-MC-Unique: asQtM6lXOjKKLs9oUq_nWQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020adfc748000000b001e333edbe40so836453wrh.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=67PxmAL3Xd8LpaVSVss2M9MADvWamDZ50hstBrm0qA0=;
 b=dH/pDhi0y9aLcJBoOa+zzseAkr65UxiLP8WWUOZC4f7AL1jzRhIcdirvP8En8JWBaS
 ixJyWOmTRuq84fy+2C4g+ZdSCYaKUEVtHVDxwuJCoPqyEGKmh2IfgKPffw1F6YMtT8qt
 +++4GETQ1/atEoOzbyBeOdA+ih/JKyMlSPPIA/RSdkxHH2KDs4wKrD2ei1gljpBdlMqV
 7KMi/0ogi9wLrOFJ31swyzyY0DawJCobSwhJmPygv3juR8bo1MBxB5UjQZjYLJsVmG8M
 5Jv1tsrzQkKeo0MYUXp/peiXUztZFDmnRqsF7G/c3QSkyrcyEaC/WlRQO3CUBWKlXcBT
 Agjw==
X-Gm-Message-State: AOAM5323V6dVG+/fVhpQDUiSCL9NpPxqL9resdwj7nFu6JGuizDKaWNN
 VnFa1SbI9VRpSMXh1Cy7iDYwp40lJWrqNcILVcrpBurhhPsR4y47ePT3uq/wJuFqYGkEQK9RsU/
 ylfcfCl6WCDTF2Yc=
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr168368wmj.180.1644310180710; 
 Tue, 08 Feb 2022 00:49:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHPvqe9Mcgm6+Q7EEAETSuMiKnrZQ8yFi6vJk5xylaclj7xAKcrNR6NQiWp2HFxsqZydBSFg==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr168333wmj.180.1644310180425; 
 Tue, 08 Feb 2022 00:49:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c712:a800:a1a0:a823:5301:d1af?
 (p200300cbc712a800a1a0a8235301d1af.dip0.t-ipconnect.de.
 [2003:cb:c712:a800:a1a0:a823:5301:d1af])
 by smtp.gmail.com with ESMTPSA id b16sm1728277wrj.26.2022.02.08.00.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:49:37 -0800 (PST)
Message-ID: <07aae6e7-4042-1c5c-a482-6ad3a34a3b07@redhat.com>
Date: Tue, 8 Feb 2022 09:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Vlastimil Babka <vbabka@suse.cz>, Chao Peng
 <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-3-chao.p.peng@linux.intel.com>
 <25166513-3074-f3b9-12cc-420ba74f153e@suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 02/12] mm/memfd: Introduce MFD_INACCESSIBLE flag
In-Reply-To: <25166513-3074-f3b9-12cc-420ba74f153e@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, jun.nakajima@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.02.22 19:51, Vlastimil Babka wrote:
> On 1/18/22 14:21, Chao Peng wrote:
>> Introduce a new memfd_create() flag indicating the content of the
>> created memfd is inaccessible from userspace. It does this by force
>> setting F_SEAL_INACCESSIBLE seal when the file is created. It also set
>> F_SEAL_SEAL to prevent future sealing, which means, it can not coexist
>> with MFD_ALLOW_SEALING.
>>
>> The pages backed by such memfd will be used as guest private memory in
>> confidential computing environments such as Intel TDX/AMD SEV. Since
>> page migration/swapping is not yet supported for such usages so these
>> pages are currently marked as UNMOVABLE and UNEVICTABLE which makes
>> them behave like long-term pinned pages.
> 
> Shouldn't the amount of such memory allocations be restricted? E.g. similar
> to secretmem_mmap() doing mlock_future_check().

I've raised this already in the past and Kirill wanted to look into it [1].

We'll most certainly need a way to limit/control the amount of
unswappable + unmovable ("worse than mlock" memory) a user/process can
consume via this mechanism.


[1]
https://lkml.kernel.org/r/20211122135933.arjxpl7wyskkwvwv@box.shutemov.name


-- 
Thanks,

David / dhildenb


