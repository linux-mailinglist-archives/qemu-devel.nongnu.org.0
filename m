Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAC85A24E8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:49:27 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRVxu-0003uG-Kz
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRVuW-0001jY-FQ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRVuR-0004vX-I9
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661507150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kyWpXiYwLh7b5zouXS7oBJJM1cyjCNsdN8KBCB8aLRQ=;
 b=QpFbh+gjOD3+H1BxDCgGX5tnPzdnsYjaGTdeZFE6Ku9sr8CAFzmJghZcp2iixbyXf8mTtn
 lcyySOZAHOzVOLfM68KNrvdrX+72YFrXeKdSNTLv57jrt+IWjJ8wGBHjuIV11gSu4TL1O6
 4ccYl10kSsbDemyq9d4cKYQg71+bgEE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-TNVdj0TsPoGLOqDAuYtLAw-1; Fri, 26 Aug 2022 05:45:46 -0400
X-MC-Unique: TNVdj0TsPoGLOqDAuYtLAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so725857wma.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 02:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=kyWpXiYwLh7b5zouXS7oBJJM1cyjCNsdN8KBCB8aLRQ=;
 b=IQHEVePuKQS+9JOtN/hoQBMPaf4zz5Mb4ZyXYuB98uQ3NeL+TcaeoMMRdP3Gv+siHF
 aUOHMMalTTg4+YNLBvWNFPc+zGPdn34LYu1r1louOhOW9Xw4tKXZ2uoWMWKKvk9yKAw9
 KSTBIj0Gg4qzALFYAFh4175mr5ggvWqmuJaDiMACROJVdGXivbSVyqJRi3QyuNpNldJ8
 oTD0uyJtQ9YZSyJvXip3Cfx8IIB91L9zG3HYPZLqsBmbvmnZnZKMz0TCvDKBDvTRPUhR
 r89nBkyJhtuXNEqoWQWjJsHADXcUApZ42kgSxlgtSnj9JL5qJxEyqDNKLmu4pmSsy0PD
 2BVg==
X-Gm-Message-State: ACgBeo1s1bLeF8hL3Do8R4iJPUGjU7Z3If3fMmHMRu3chvWNTwPSdH5Q
 Llt7GOeHE3SAAFboMpv/8BpD0Pdq9+LYwF6V/HQeH2rAfuu0wk9ayfRWjIgDLUL388TDXaeJNF8
 /rHK56++F9J48RLk=
X-Received: by 2002:adf:d1e4:0:b0:221:6c37:277e with SMTP id
 g4-20020adfd1e4000000b002216c37277emr4558063wrd.498.1661507145570; 
 Fri, 26 Aug 2022 02:45:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6vxjrCf82RsITE5Xlbf2Oa5lYkw6mC2BL2o1piD9qKvPJSCKQp107YuAsUnn7V/xDGt0OWsw==
X-Received: by 2002:adf:d1e4:0:b0:221:6c37:277e with SMTP id
 g4-20020adfd1e4000000b002216c37277emr4558050wrd.498.1661507145248; 
 Fri, 26 Aug 2022 02:45:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 co12-20020a0560000a0c00b0021eed2414c9sm815471wrb.40.2022.08.26.02.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:45:44 -0700 (PDT)
Message-ID: <b56c6030-8976-f2a1-d411-d892d362d486@redhat.com>
Date: Fri, 26 Aug 2022 11:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-2-marcandre.lureau@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/2] dump: simplify a bit kdump get_next_page()
In-Reply-To: <20220825132110.1500330-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 25.08.22 15:21, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This should be functionally equivalent, but slightly easier to read,
> with simplified paths and checks at the end of the function.
> 
> The following patch is a major rewrite to get rid of the assert().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  dump/dump.c | 30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..18f06cffe2 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1107,37 +1107,31 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
>      uint8_t *buf;
>  
>      /* block == NULL means the start of the iteration */
> -    if (!block) {
> -        block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
> -        *blockptr = block;
> -        assert((block->target_start & ~target_page_mask) == 0);
> -        assert((block->target_end & ~target_page_mask) == 0);
> -        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
> -        if (bufptr) {
> -            *bufptr = block->host_addr;
> -        }
> -        return true;


Instead of the "return true" we'll now do take the  "if ((addr >=
block->target_start) &&" path below I guess, always ending up with
essentially "buf = buf;" because addr == block->target_start.

I guess that's fine.

> +    if (block == NULL) {

What's wrong with keeping the "if (!block) {" ? :)

> +        *blockptr = block = QTAILQ_FIRST(&s->guest_phys_blocks.head);

Another unnecessary change.

> +        addr = block->target_start;
> +    } else {
> +        addr = dump_pfn_to_paddr(s, *pfnptr + 1);
>      }
> -
> -    *pfnptr = *pfnptr + 1;
> -    addr = dump_pfn_to_paddr(s, *pfnptr);
> +    assert(block != NULL);
>  
>      if ((addr >= block->target_start) &&
>          (addr + s->dump_info.page_size <= block->target_end)) {
>          buf = block->host_addr + (addr - block->target_start);
>      } else {
>          /* the next page is in the next block */
> -        block = QTAILQ_NEXT(block, next);
> -        *blockptr = block;
> +        *blockptr = block = QTAILQ_NEXT(block, next);

Another unnecessary change. (avoiding these really eases review, because
the focus is then completely on the actual code changes)

>          if (!block) {
>              return false;
>          }
> -        assert((block->target_start & ~target_page_mask) == 0);
> -        assert((block->target_end & ~target_page_mask) == 0);
> -        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
> +        addr = block->target_start;
>          buf = block->host_addr;
>      }
>  
> +    /* those checks are going away next */

This comment seems to imply a story documented in code. Rather just drop
it -- the patch description already points that out.

> +    assert((block->target_start & ~target_page_mask) == 0);
> +    assert((block->target_end & ~target_page_mask) == 0);
> +    *pfnptr = dump_paddr_to_pfn(s, addr);
>      if (bufptr) {
>          *bufptr = buf;
>      }


Apart from the nits, LGTM.

-- 
Thanks,

David / dhildenb


