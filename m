Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43E5F6A50
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:10:12 +0200 (CEST)
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSVn-0000z4-Sh
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ogSRV-0004Q8-Pm
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ogSRS-0003Wo-Js
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665068736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KsDQCZivcs5q3LIQk4JqK7qJdKXwyCza9bMFTKn2SaE=;
 b=NkVylDZLPvkcF1VLZgvDYzMuTLvYdsvOSrelzrW2DZDfiK1pBEp471jYrub2hqOtSBNW4d
 34TOE5cBzVD59VhR8LLGvTQqGXw7glMHmIU6VwEXAQCyBADQSujZrmwF6PAwTWGnjrDewC
 6nfvbvOrdDKOcpVblBdV0c1sGPSQU9g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-T17otGC3Pb69BO_wKRqxPg-1; Thu, 06 Oct 2022 11:05:35 -0400
X-MC-Unique: T17otGC3Pb69BO_wKRqxPg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g10-20020a7bc4ca000000b003c29da13d23so91003wmk.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KsDQCZivcs5q3LIQk4JqK7qJdKXwyCza9bMFTKn2SaE=;
 b=bCYJ23CDJWP3ML9jDt0QBWJxhnUElvUzFJIIuWAuCmzdncpjXgtAmz9zO5TnBB9ah3
 hozvtLoDqI/hCIzFb7Dg6GruswKmga2a7Iu7dqAIB7OmFyysrmbqVpv0c7UUgU37LYmx
 KJCr4DJt9ubYOXj+/3f5t9n9ncNL+aLU2pjXiPn4GbMtmyUfSFphIGpFG/LB6fVyQv20
 5QL4GbdwAx2ZUywbMMRmnFqoY7sF5Th4Xhwcs2v38QbFh/ITtJ2Rx1/YBTOKlnwS9rAa
 CYwo4jUHCJgtV5stLEFaPp++a0cde1Gq9x2KaimMP5iyWppTTr1g2DnSkxWR5EAiD9kJ
 pdBA==
X-Gm-Message-State: ACrzQf2kLvwWZlfRQ+a0MeU1vO/tSPBRL7IfsTwP+emBJYh5igx/kTWC
 WwZba2Fh+HIpKyvaspi7PO2hh8vNHFszDxqe7SxiYcSRnFNWYMSNcSJh0Ou5Cr3xp+EiQJ4/eJx
 vtTBU/wtSGyXSkIY=
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr7566109wmb.50.1665068732153; 
 Thu, 06 Oct 2022 08:05:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58CxfaUhDp+jzJqAO0QQvreqx3cQZQArtNnrcWO2rDAkIAqEoAOiIkx72p7sKYYDiMeMPrOg==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr7566082wmb.50.1665068731850; 
 Thu, 06 Oct 2022 08:05:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:3700:aed2:a0f8:c270:7f30?
 (p200300cbc7053700aed2a0f8c2707f30.dip0.t-ipconnect.de.
 [2003:cb:c705:3700:aed2:a0f8:c270:7f30])
 by smtp.gmail.com with ESMTPSA id
 k16-20020adfd850000000b0022e3538d305sm15603883wrl.117.2022.10.06.08.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 08:05:31 -0700 (PDT)
Message-ID: <88875089-b671-f2d6-07c7-7c6f1a2a26f3@redhat.com>
Date: Thu, 6 Oct 2022 17:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
 <20220905125741.95516-3-marcandre.lureau@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/2] dump: fix kdump to work over non-aligned blocks
In-Reply-To: <20220905125741.95516-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.09.22 14:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Rewrite get_next_page() to work over non-aligned blocks. When it
> encounters non aligned addresses, it will try to fill a page provided by
> the caller.
> 
> This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
> qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
> uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
> ~target_page_mask) == 0' failed.
> 
> because:
> guest_phys_block_add_section: target_start=00000000fed40080 target_end=00000000fed41000: added (count: 4)
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=2120480
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   dump/dump.c | 79 +++++++++++++++++++++++++++++++++++++----------------
>   1 file changed, 56 insertions(+), 23 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index f465830371..500357bafe 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1094,50 +1094,81 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uint64_t pfn)
>   }
>   
>   /*
> - * exam every page and return the page frame number and the address of the page.
> - * bufptr can be NULL. note: the blocks here is supposed to reflect guest-phys
> - * blocks, so block->target_start and block->target_end should be interal
> - * multiples of the target page size.
> + * Return the page frame number and the page content in *bufptr. bufptr can be
> + * NULL. If not NULL, *bufptr must contains a target page size of pre-allocated
> + * memory. This is not necessarily the memory returned.
>    */
>   static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
>                             uint8_t **bufptr, DumpState *s)
>   {
>       GuestPhysBlock *block = *blockptr;
> -    hwaddr addr, target_page_mask = ~((hwaddr)s->dump_info.page_size - 1);
> -    uint8_t *buf;
> +    uint32_t page_size = s->dump_info.page_size;
> +    uint8_t *buf = NULL, *hbuf;
> +    hwaddr addr;
>   
>       /* block == NULL means the start of the iteration */
>       if (!block) {
>           block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>           *blockptr = block;
>           addr = block->target_start;
> +        *pfnptr = dump_paddr_to_pfn(s, addr);
>       } else {
> -        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
> +        *pfnptr += 1;
> +        addr = dump_pfn_to_paddr(s, *pfnptr);
>       }
>       assert(block != NULL);
>   
> -    if ((addr >= block->target_start) &&
> -        (addr + s->dump_info.page_size <= block->target_end)) {
> -        buf = block->host_addr + (addr - block->target_start);
> -    } else {
> -        /* the next page is in the next block */
> -        block = QTAILQ_NEXT(block, next);
> -        *blockptr = block;
> -        if (!block) {
> -            return false;
> +    while (1) {
> +        if (addr >= block->target_start && addr < block->target_end) {
> +            size_t n = MIN(block->target_end - addr, page_size - addr % page_size);
> +            hbuf = block->host_addr + (addr - block->target_start);
> +            if (!buf) {
> +                if (n == page_size) {
> +                    /* this is a whole target page, go for it */
> +                    assert(addr % page_size == 0);
> +                    buf = hbuf;
> +                    break;
> +                } else if (bufptr) {
> +                    assert(*bufptr);
> +                    buf = *bufptr;
> +                    memset(buf, 0, page_size);
> +                } else {
> +                    return true;
> +                }
> +            }
> +
> +            memcpy(buf + addr % page_size, hbuf, n);
> +            addr += n;
> +            if (addr % page_size == 0) {
> +                /* we filled up the page */
> +                break;
> +            }
> +        } else {
> +            /* the next page is in the next block */
> +            *blockptr = block = QTAILQ_NEXT(block, next);
> +            if (!block) {
> +                break;
> +            }
> +
> +            addr = block->target_start;
> +            /* are we still in the same page? */
> +            if (dump_paddr_to_pfn(s, addr) != *pfnptr) {
> +                if (buf) {
> +                    /* no, but we already filled something earlier, return it */
> +                    break;
> +                } else {
> +                    /* else continue from there */
> +                    *pfnptr = dump_paddr_to_pfn(s, addr);
> +                }
> +            }
>           }

The loop is a bit confusing and the code is not that easy to follow.

... but I don't have a good idea to do it any better/cleaner. :)

So I assume as long as testing is good, this is fine

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


