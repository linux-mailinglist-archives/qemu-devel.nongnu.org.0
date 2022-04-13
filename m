Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAB4FFB5D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:32:39 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefv4-0007JY-J0
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1neftR-0006Jv-2e
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1neftP-0002oZ-0c
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpsTDUjpmmHkgiKCF75tJ9Qb2QqmtHwjLJW7Lijr6Ec=;
 b=D2SnrNCKiTa1JS0rYYQDcOGF80pSS4KiX5Gqks49E+9oPr4w51x7Y6u/rFsz+FvKnV3z7Q
 FwMpJpyWYhiWdSIF7lpAuZy5GkrP8szrWSVF7vkMyhXnjXx7gRzR2evPzUQOsyYV5Fmr5e
 FLVnkjysybxjDKraHYJ/TX6UrfxNM2E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-Zu8CDGAuODKc2jZnw57tWw-1; Wed, 13 Apr 2022 12:30:52 -0400
X-MC-Unique: Zu8CDGAuODKc2jZnw57tWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l41-20020a05600c1d2900b0038ec007ac7fso3049887wms.4
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 09:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=JpsTDUjpmmHkgiKCF75tJ9Qb2QqmtHwjLJW7Lijr6Ec=;
 b=gWuK4Ok7uBcv5xx6xMBwwB+dVxEMWioSqNVU3LSahcF5JD45gq1CqUaOdSL3psvD3O
 JcRpMPzoD30VFHGlwgRlMmZkVUoRThl4BxaYNc7gb7ZkYDjyWP5QKjC4RxFb4n02bhHm
 lONMoSgDjVLdTgb3yPYGM/XgzlIvfOkrBuZLXILq1dSG+jGp0ZSV7PWPDHKNc346+D4f
 qDyH/yiWg7rVvrlHbmZCjWFe/YNMhPzCvd4QQdGV3h2QVDv6u7dyEyRGqxVFW4LdlHqq
 z4MG/hi0H1QcxINkDTTUzzWtzOGSqt0yoERLHS+kZZ8Khlh3e5OV5Qf/3x4COzuTzunH
 54xQ==
X-Gm-Message-State: AOAM533GU+omH6E+sBHb/EphLMeoO/o4/8I/sKB1Yu7zcEjV9GiTVuBk
 cAwme28WR3d2F3RW0ImUeQ/J4RgoxzLaZ515A7z5D6ctv5L2+ruE7N2mGsekLCLYM/uPZQYcOhu
 i85eIcNKf5Et1/q4=
X-Received: by 2002:a05:600c:3512:b0:38c:be56:fc9c with SMTP id
 h18-20020a05600c351200b0038cbe56fc9cmr9458253wmq.197.1649867450705; 
 Wed, 13 Apr 2022 09:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkytZT68ibSBKNJoHlOqbNjWnA9Zh1oDwEE8SJcMIkEgIwTu5PARnU1fLD1KJu/KXuQqJYmA==
X-Received: by 2002:a05:600c:3512:b0:38c:be56:fc9c with SMTP id
 h18-20020a05600c351200b0038cbe56fc9cmr9458202wmq.197.1649867450341; 
 Wed, 13 Apr 2022 09:30:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:5800:1078:ebb9:e2c3:ea8c?
 (p200300cbc70458001078ebb9e2c3ea8c.dip0.t-ipconnect.de.
 [2003:cb:c704:5800:1078:ebb9:e2c3:ea8c])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b0038cb98076d6sm3269751wmg.10.2022.04.13.09.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 09:30:49 -0700 (PDT)
Message-ID: <3b9effd9-4aba-e7ca-b3ca-6a474fd6469f@redhat.com>
Date: Wed, 13 Apr 2022 18:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Andy Lutomirski <luto@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
 <YlB3Z8fqJ+67a2Ck@google.com>
 <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
 <20220412143636.GG64706@ziepe.ca>
 <6f44ddf9-6755-4120-be8b-7a62f0abc0e0@www.fastmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
In-Reply-To: <6f44ddf9-6755-4120-be8b-7a62f0abc0e0@www.fastmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Dave Hansen <dave.hansen@intel.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> 
> So this is another situation where the actual backend (TDX, SEV, pKVM, pure software) makes a difference -- depending on exactly what backend we're using, the memory may not be unmoveable.  It might even be swappable (in the potentially distant future).

Right. And on a system without swap we don't particularly care about
mlock, but we might (in most cases) care about fragmentation with
unmovable memory.

> 
> Anyway, here's a concrete proposal, with a bit of handwaving:

Thanks for investing some brainpower.

> 
> We add new cgroup limits:
> 
> memory.unmoveable
> memory.locked
> 
> These can be set to an actual number or they can be set to the special value ROOT_CAP.  If they're set to ROOT_CAP, then anyone in the cgroup with capable(CAP_SYS_RESOURCE) (i.e. the global capability) can allocate movable or locked memory with this (and potentially other) new APIs.  If it's 0, then they can't.  If it's another value, then the memory can be allocated, charged to the cgroup, up to the limit, with no particular capability needed.  The default at boot is ROOT_CAP.  Anyone who wants to configure it differently is free to do so.  This avoids introducing a DoS, makes it easy to run tests without configuring cgroup, and lets serious users set up their cgroups.

I wonder what the implications are for existing user space.

Assume we want to move page pinning (rdma, vfio, io_uring, ...) to the
new model. How can we be sure

a) We don't break existing user space
b) We don't open the doors unnoticed for the admin to go crazy on
   unmovable memory.

Any ideas?

> 
> Nothing is charge per mm.
> 
> To make this fully sensible, we need to know what the backend is for the private memory before allocating any so that we can charge it accordingly.

Right, the support for migration and/or swap defines how to account.

-- 
Thanks,

David / dhildenb


