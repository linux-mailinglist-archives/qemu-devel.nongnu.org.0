Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F270A59F489
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 09:51:29 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQlAf-0002GZ-17
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 03:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQkuI-0005Oy-Os
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQkuH-00079x-9e
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661326471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9scmDlJk9sS2HYRLXY1xrxlVkb+S0eAQSxWKLdw2UnE=;
 b=MAkd6wzsbhIwvYFgfj0mR25zcuThPRlbaB+KyR6c4QUwTBfDHwhvamwcTe+nldALUeRpSl
 wFgmMKIirKC2FR7EuijUhieU0TfxlH5MriOuWVfMH3vX18FLtkYpKhhD61nDOjj6YVn5az
 rXHNrtqvqKxgfkfWrm7fkJG8JGr0+qs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-cAw1DE03Mt2l5j92zpXx2w-1; Wed, 24 Aug 2022 03:34:28 -0400
X-MC-Unique: cAw1DE03Mt2l5j92zpXx2w-1
Received: by mail-wr1-f69.google.com with SMTP id
 l25-20020adfa399000000b002252058bad2so2613703wrb.11
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 00:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=9scmDlJk9sS2HYRLXY1xrxlVkb+S0eAQSxWKLdw2UnE=;
 b=zOrGZ2YJup3vRh3YP0Pf6Y74TLGLQ/Zf/suxlPZUyP8pqwhpb7KnytUdeOAR4kt8FH
 eUpvTq2I9/tAP0F8x/ONPIIgaK6BLzTVAHzKFZPs5HCOJFJiLZ/iyO3iMIPvHbKHSkqj
 UcZhiK2Fchk3iajao0/EqqJvPE7kmiWxTxC5jK9OZ/Ofk/QIsblyOOWcnnH5iZPGxgGP
 wnEsJIpL/4CWM/OlguZ6ab9VA5i94SHtZRgO+azDIIzVKRWzPd00T3a9gJdWfli9fCYp
 lYyQ1uIBYLJV2d+JRzP8CK9WnguvWkaQWZc2Qx24kSwYUnUKy8i4/TXgpHWf2LvVFqC1
 H3Ew==
X-Gm-Message-State: ACgBeo3C4Xa69tKaMWRla0b/OdRpcW3/0MccPbuyFWfaWYcObRLcy9AX
 Kz9Evn3Kte7mrEi6n5gTxfP0b7IzIShuY5KwsE6h5MF3Ob5Qshe7Bbj8z+pG1TbQ8Mlj5lMlLjq
 uXfg0sZjI+m3fbms=
X-Received: by 2002:adf:e10c:0:b0:225:3168:c261 with SMTP id
 t12-20020adfe10c000000b002253168c261mr14447169wrz.159.1661326467457; 
 Wed, 24 Aug 2022 00:34:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ssxzlx5myCcR18ngStnuRyuM4YgJZiPTzcLAOcaf9fnAECOzh4f/WtnfDrG1Yk+G89sfAcg==
X-Received: by 2002:adf:e10c:0:b0:225:3168:c261 with SMTP id
 t12-20020adfe10c000000b002253168c261mr14447156wrz.159.1661326467203; 
 Wed, 24 Aug 2022 00:34:27 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73?
 (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de.
 [2003:cb:c707:c500:5445:cf40:2e32:6e73])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb07000000b0021d6924b777sm16263850wrr.115.2022.08.24.00.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:34:26 -0700 (PDT)
Message-ID: <c227bc0a-c676-1f69-95e6-b814b92f0fb0@redhat.com>
Date: Wed, 24 Aug 2022 09:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] target/s390x: Align __excp_addr in s390_probe_access
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220823213805.1970804-1-richard.henderson@linaro.org>
 <20220823213805.1970804-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220823213805.1970804-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 23.08.22 23:38, Richard Henderson wrote:
> Per the comment in s390_cpu_record_sigsegv, the saved address
> is always page aligned.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 4c0f8baa39..19ea7d2f8d 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -147,7 +147,7 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>  #if defined(CONFIG_USER_ONLY)
>      flags = page_get_flags(addr);
>      if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
> -        env->__excp_addr = addr;
> +        env->__excp_addr = addr & TARGET_PAGE_MASK;
>          flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
>          if (nonfault) {
>              return flags;

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


