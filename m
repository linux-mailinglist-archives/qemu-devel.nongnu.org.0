Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA10458B5F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:27:51 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5c6-0002EJ-LU
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:27:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp5ai-0000kG-Mo
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:26:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp5ae-0005UM-Lg
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637573178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W24LOqoXm5rO4QnnE3nnOA9qNOGul+S9uy89jqjOA+M=;
 b=M9SWiDlQlmjsbRXUaSKQ884eBAyR/4gyn54RGanf8kh25DNdqTD8jUBMR9J28hwfAfPbWH
 eYoGWAAWGxkEvoeSlJxC/9ggFqGsLeywZFHzbiCcr6aRX5WBhMvfAt8iwlMX8/AVHBJl5K
 Yp9o2jmYLeOjQtSLd16rQXHvfkzHdLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-7q9yg_1GPBykBpyI-cquLA-1; Mon, 22 Nov 2021 04:26:15 -0500
X-MC-Unique: 7q9yg_1GPBykBpyI-cquLA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a64-20020a1c7f43000000b003335e5dc26bso959955wmd.8
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 01:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=W24LOqoXm5rO4QnnE3nnOA9qNOGul+S9uy89jqjOA+M=;
 b=RjgSr2LGTFpXO7GJEl1oAdHfyYZPwLG7j3o0bQwoJoay64AY6NDiSrZiE4wAi28+8q
 QVrJUQX05khELQ64z9GUoIXOpWSUmURtJKABFB7Hpm56aSAMGYpf9LXIWQL4zAwyQ4Aa
 0r5uv7yuazoOrIC3ot8LW69kdvVk5xeHPA7um2DtbMFqNnqtJIFNCtzsYl+Nle7fcrI9
 JOg3/h9d03UmtPdmByAer59FxLtqFHUCmTXhSWXo2887+o+mSatXlVFHqR1+DQ5Pi18Y
 gY84PEvoNkgUz4ivL7powRWFtR9IBOXH+1aWPsubg1EfO9tKHzovz6CVJtEiH+KW/E7m
 amhQ==
X-Gm-Message-State: AOAM532L3EU2TqdpTiryLw4npDQGIf+VWZhbN93Ce71NVwFt6+a0F8zk
 jKe9TPb1qxypr5m/28iePySRERk/JHhMhz/ERcFW2fVYFZN9gZ+3PAFMIYS8ZyRz3WsbrPdOg0y
 2UQ0Ffe6wqtAfSEk=
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr28668577wmx.54.1637573174603; 
 Mon, 22 Nov 2021 01:26:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLFJu5j4VPLLnAmpU8CA4IejbWxqy8Vo0yv4T3cYINYpxhqk/tZpLIoYKCers6pf22TsjTpQ==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr28668518wmx.54.1637573174383; 
 Mon, 22 Nov 2021 01:26:14 -0800 (PST)
Received: from [192.168.3.132] (p5b0c667b.dip0.t-ipconnect.de. [91.12.102.123])
 by smtp.gmail.com with ESMTPSA id t8sm8351680wrv.30.2021.11.22.01.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 01:26:13 -0800 (PST)
Message-ID: <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
Date: Mon, 22 Nov 2021 10:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <20211119160023.GI876299@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211119160023.GI876299@ziepe.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.11.21 17:00, Jason Gunthorpe wrote:
> On Fri, Nov 19, 2021 at 04:39:15PM +0100, David Hildenbrand wrote:
> 
>>> If qmeu can put all the guest memory in a memfd and not map it, then
>>> I'd also like to see that the IOMMU can use this interface too so we
>>> can have VFIO working in this configuration.
>>
>> In QEMU we usually want to (and must) be able to access guest memory
>> from user space, with the current design we wouldn't even be able to
>> temporarily mmap it -- which makes sense for encrypted memory only. The
>> corner case really is encrypted memory. So I don't think we'll see a
>> broad use of this feature outside of encrypted VMs in QEMU. I might be
>> wrong, most probably I am :)
> 
> Interesting..
> 
> The non-encrypted case I had in mind is the horrible flow in VFIO to
> support qemu re-execing itself (VFIO_DMA_UNMAP_FLAG_VADDR).

Thanks for sharing!

> 
> Here VFIO is connected to a VA in a mm_struct that will become invalid
> during the kexec period, but VFIO needs to continue to access it. For
> IOMMU cases this is OK because the memory is already pinned, but for
> the 'emulated iommu' used by mdevs pages are pinned dynamically. qemu
> needs to ensure that VFIO can continue to access the pages across the
> kexec, even though there is nothing to pin_user_pages() on.
> 
> This flow would work a lot better if VFIO was connected to the memfd
> that is storing the guest memory. Then it naturally doesn't get
> disrupted by exec() and we don't need the mess in the kernel..

I do wonder if we want to support sharing such memfds between processes
in all cases ... we most certainly don't want to be able to share
encrypted memory between VMs (I heard that the kernel has to forbid
that). It would make sense in the use case you describe, though.

> 
> I was wondering if we could get here using the direct_io APIs but this
> would do the job too.
> 
>> Apart from the special "encrypted memory" semantics, I assume nothing
>> speaks against allowing for mmaping these memfds, for example, for any
>> other VFIO use cases.
> 
> We will eventually have VFIO with "encrypted memory". There was a talk
> in LPC about the enabling work for this.

Yes, I heard about that as well. In the foreseeable future, we'll have
shared memory only visible for VFIO devices.

> 
> So, if the plan is to put fully encrpyted memory inside a memfd, then
> we still will eventually need a way to pull the pfns it into the
> IOMMU, presumably along with the access control parameters needed to
> pass to the secure monitor to join a PCI device to the secure memory.

Long-term, agreed.

-- 
Thanks,

David / dhildenb


