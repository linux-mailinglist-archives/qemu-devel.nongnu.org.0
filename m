Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D378B58AF92
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 20:08:08 +0200 (CEST)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1jz-0002AD-GY
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 14:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oK1i8-0000be-Id
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 14:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oK1i5-0004Ck-JV
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 14:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659722768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTG5sYKz5wYWpj0OuPtAuT0vzoUTMIRW2UW4E5SQLSQ=;
 b=EqtatFDulK1RwYEUXVMucgeZtcmVXqtT8a4mf7nysaZnENR/B78tcR/PjnyTpZs7euqc4r
 /xsrR39d50VVRXAPVuQ+Fry6vuDwWyRKOM9Nc8HfsLjvPZQjxweQffVfEiqPz5dhr2xZqE
 oFEPcIKVnFDX4tLmD5mv3ASVCl9MFrw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-UQKonpQ2NFmQiM2RWZXtzg-1; Fri, 05 Aug 2022 14:06:06 -0400
X-MC-Unique: UQKonpQ2NFmQiM2RWZXtzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i9-20020a1c3b09000000b003a511239973so1912451wma.7
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 11:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=gTG5sYKz5wYWpj0OuPtAuT0vzoUTMIRW2UW4E5SQLSQ=;
 b=Q3cfn8OuAE+8C1+Io2q9PcsZi94RLFKAGydNhSHKKi35FTyGRsDfNmS9zUir0r/dm7
 8vNnvx7dQwviljj9a3PiHxBVJNkIsswn9t3v/uNw9VssQbgk/Nj2JpJwwm5XOtS/ub21
 TsbENZ8H+VmJaVFyyt651cI/mbXhk5PXKeTkgpCpDEU6x11DGIF7QORWCT/vNS3+/Q1o
 DAKzxcWjuXMNKCNMeX6IM9Wm324gdvTN/KEy0I1t5NpVvu7jyTy1oc6YCTFozCFwKZ9+
 tu/AoWdU+gL58gr2UZgOrLxyHZ9ywnymbT6HTxiZfmMtcN1GmVO59OTmPWdi5QWfmI7J
 ELxg==
X-Gm-Message-State: ACgBeo0ByLBVSYbhKl+36IPZx37HkJfit+JacQb/a3sS91erDzFWbQrH
 YGTnEqj/NITIaS51AVJqfgCXUPneJnGwOkFuwZcPQQUeP6+xIGOthF0RAl/JSqyAYzmeMAd1q5/
 dQNIco491rCHP04s=
X-Received: by 2002:a05:6000:811:b0:220:6262:ac66 with SMTP id
 bt17-20020a056000081100b002206262ac66mr4741237wrb.529.1659722765762; 
 Fri, 05 Aug 2022 11:06:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YiYJd4RGqr8HPcVnnEu37Kzz2xizPBJ/DFAoYEPdnVgyVJMfvEXwBl3Yrl6juKrdXAyBEpQ==
X-Received: by 2002:a05:6000:811:b0:220:6262:ac66 with SMTP id
 bt17-20020a056000081100b002206262ac66mr4741186wrb.529.1659722765470; 
 Fri, 05 Aug 2022 11:06:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a31b79dc0esm26070221wmq.1.2022.08.05.11.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 11:06:05 -0700 (PDT)
Message-ID: <a2b8fa73-4efd-426f-abcd-7975ff9a7101@redhat.com>
Date: Fri, 5 Aug 2022 20:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Sean Christopherson
 <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
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
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 05.08.22 19:55, Paolo Bonzini wrote:
> On 7/21/22 11:44, David Hildenbrand wrote:
>>
>> Also, I*think*  you can place pages via userfaultfd into shmem. Not
>> sure if that would count "auto alloc", but it would certainly bypass
>> fallocate().
> 
> Yeah, userfaultfd_register would probably have to forbid this for 
> F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for 
> this, adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then 
> userfault_register would do something like 
> memfile_node_get_flags(vma->vm_file) and check the result.

An alternative is to simply have the shmem allocation fail in a similar
way. Maybe it does already, I haven't checked (don't think so).


-- 
Thanks,

David / dhildenb


