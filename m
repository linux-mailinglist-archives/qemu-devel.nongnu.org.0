Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9B59D27A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:43:40 +0200 (CEST)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOZV-0003GY-1x
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQOTD-0006bK-CA
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQOTA-0005oO-5T
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661240222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HohlDOM1an5R3Aeg0WJ6GQRtA32+l/PSRz3n64TVcFI=;
 b=QoG+AdmEJFhLTazALmYxXOH4iLtqDgwci802sX/4jdTKKs4NhjaLT9ue+8poTKZKPJXvue
 nmFmdOgkspSXedAXE3I5BMh6OLPQRUNlV1ya9JXx0gqdD0KegS/uqTRaEsMtd4r2rdDQv8
 MdDUr0stYsbatJPckuknEUldl2YOEEU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-pP46wUoaOqKdYh4aPFSsRg-1; Tue, 23 Aug 2022 03:37:01 -0400
X-MC-Unique: pP46wUoaOqKdYh4aPFSsRg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s20-20020adfbc14000000b002252dae05f7so2042817wrg.20
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=HohlDOM1an5R3Aeg0WJ6GQRtA32+l/PSRz3n64TVcFI=;
 b=oy7aqQ63730ZhR5XBgl+W5l1SlDQhPpsikOuXqFCiPUBHgzivCt+q+LDEP77d5uHti
 kmUboWceuxoa+vRrydoUfT5wY5HskpdlX3sWtzUvip/2Ag/Q4FUuv9FMUz+xcicCex1L
 rHy+3hw7WbpCJKf5MiU1FNz9LABBGFPrRVATq/pkqDBbKAbDNDukyNMAFWQRFKCrk85z
 iE8ihkbIe3jaW5sZ0BOROXHUyiSI9MxI9MRVXBBYGetp61fpNML1BHgOcAZi/aKREUA3
 KoI//kKtajPafpnfEHv0RFOu8xUJ6jW3/X2Jbt6NOOqX63AeJn39ZkRYvwmUiea9XO1Z
 He4A==
X-Gm-Message-State: ACgBeo2wgKzXvWbx1Q8FNcIkFFeE0JUVZd1VThbLwVJLCId4WTHYgVTi
 kHCHkahGRfMLShF2JqfVEjsTG1YjJx1NVxRTYA4Ny6cfTJi4h/yQTB2JGXKr21iV02JzlyiSSDp
 Hev6g5hWBwKhajVQ=
X-Received: by 2002:a05:600c:4e04:b0:3a5:a34e:ae81 with SMTP id
 b4-20020a05600c4e0400b003a5a34eae81mr1210685wmq.147.1661240219951; 
 Tue, 23 Aug 2022 00:36:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NUFG4IFicJqv+j50eM5lq6Rzd1ri/9X+RKdy6Bv7oWpP5THIKdol8DYBnS2vZ39y/40KufQ==
X-Received: by 2002:a05:600c:4e04:b0:3a5:a34e:ae81 with SMTP id
 b4-20020a05600c4e0400b003a5a34eae81mr1210635wmq.147.1661240219655; 
 Tue, 23 Aug 2022 00:36:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:1600:c48b:1fab:a330:5182?
 (p200300cbc70b1600c48b1faba3305182.dip0.t-ipconnect.de.
 [2003:cb:c70b:1600:c48b:1fab:a330:5182])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdb92000000b0021eaf4138aesm16379582wri.108.2022.08.23.00.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:36:59 -0700 (PDT)
Message-ID: <8f6f428b-85e6-a188-7f32-512b6aae0abf@redhat.com>
Date: Tue, 23 Aug 2022 09:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
 <20220817234120.mw2j3cgshmuyo2vw@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220817234120.mw2j3cgshmuyo2vw@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.08.22 01:41, Kirill A. Shutemov wrote:
> On Fri, Aug 05, 2022 at 07:55:38PM +0200, Paolo Bonzini wrote:
>> On 7/21/22 11:44, David Hildenbrand wrote:
>>>
>>> Also, I*think*  you can place pages via userfaultfd into shmem. Not
>>> sure if that would count "auto alloc", but it would certainly bypass
>>> fallocate().
>>
>> Yeah, userfaultfd_register would probably have to forbid this for
>> F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for this,
>> adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then userfault_register
>> would do something like memfile_node_get_flags(vma->vm_file) and check the
>> result.
> 
> I donno, memory allocation with userfaultfd looks pretty intentional to
> me. Why would F_SEAL_AUTO_ALLOCATE prevent it?
> 

Can't we say the same about a write()?

> Maybe we would need it in the future for post-copy migration or something?
> 
> Or existing practises around userfaultfd touch memory randomly and
> therefore incompatible with F_SEAL_AUTO_ALLOCATE intent?
> 
> Note, that userfaultfd is only relevant for shared memory as it requires
> VMA which we don't have for MFD_INACCESSIBLE.

This feature (F_SEAL_AUTO_ALLOCATE) is independent of all the lovely
encrypted VM stuff, so it doesn't matter how it relates to MFD_INACCESSIBLE.

-- 
Thanks,

David / dhildenb


