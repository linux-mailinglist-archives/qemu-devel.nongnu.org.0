Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B213E59F484
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 09:50:04 +0200 (CEST)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQl9H-0001u3-IH
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 03:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQkuP-0005PC-9D
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQku7-00079A-6y
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661326461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vb54fpuG84Ck7ZLr0ztdq2vV+UY5/pqq2uSCkoL6DY=;
 b=UaPE36vZJQnD/KRFwHW6hmpbW8mvjKTiXooCxeNHkr2pbDX3pU+ZtirWwxXEIVj5Cxc7Bm
 SO15w8IDmqhHrLQc4Foro9altT6NxHmMX10UYBnmel7Zfv0lX1XTU3imNvYSM7toNa29Pb
 sS683l+4I7JwHqE8X1cHS4tTo7XAxmk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-9cif6FClOaafy6-p48bXFA-1; Wed, 24 Aug 2022 03:34:20 -0400
X-MC-Unique: 9cif6FClOaafy6-p48bXFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so2559383wra.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 00:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=/vb54fpuG84Ck7ZLr0ztdq2vV+UY5/pqq2uSCkoL6DY=;
 b=rVC4nLOKp1b6mjSpw6TM/db3xZNH1NsOMrVSrt6ihm2Shq8wNyX72cLBHAXrPdRQr8
 6ttV3PgG4+tB3IQk9aCBqVU1B6+oX4B/EtWrH7zcOO2Tu06Ndc0x/i4+7RjhOuNy65p8
 puV6zyfj/qVoJZ7jiLzJqE+lNfcImrrpWIAYxjp78aK2G2b9zHtYz2yHC68sSuZY2CDP
 RbEmQSfM6OfD/ULzDtOBRsmMg+KM0H6750KaZtcCglq72axJ1gXpEOL1gTTPF07hYZFv
 MFpgkezcIJ8/mjvJB9PIKHDsORlPzlqbHLk2Atz8ioVqvlk5PY7RiQfqeV+LzwfZpvVW
 h+MA==
X-Gm-Message-State: ACgBeo3zCiC+TO3ODsiJVJGwpIGRhUs/PrSyOfxiaGxnecx6X3I1RaLW
 dcpF9z+6uyCioweGw8nFR6dds+fXKoyUOBhIkWkawyrv4GpZ3Iu9el9/aMco7bb+VRl7/TtmtgB
 5WZjWtw0gI8KDHzA=
X-Received: by 2002:a05:600c:502b:b0:3a5:d36a:8b93 with SMTP id
 n43-20020a05600c502b00b003a5d36a8b93mr4294329wmr.180.1661326459000; 
 Wed, 24 Aug 2022 00:34:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AodQUnYdyDJnOSyvdS6I6u4LGpvKKh665w2Ru5PDWWTlaawKX5KWVIdIDVAwzg2vEJo5MRg==
X-Received: by 2002:a05:600c:502b:b0:3a5:d36a:8b93 with SMTP id
 n43-20020a05600c502b00b003a5d36a8b93mr4294314wmr.180.1661326458760; 
 Wed, 24 Aug 2022 00:34:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73?
 (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de.
 [2003:cb:c707:c500:5445:cf40:2e32:6e73])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c40c400b003a5a5069107sm911040wmh.24.2022.08.24.00.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:34:18 -0700 (PDT)
Message-ID: <cab7188e-dc8f-2caf-af61-98c0090f23e6@redhat.com>
Date: Wed, 24 Aug 2022 09:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] Revert "target/s390x: Use probe_access_flags in
 s390_probe_access"
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220823213805.1970804-1-richard.henderson@linaro.org>
 <20220823213805.1970804-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220823213805.1970804-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
> This reverts commit db9aab5783a2fb62250e12f0c4cfed5e1778c189.
> 
> This patch breaks the contract of s390_probe_access, in that
> it no longer returns an exception code, nor set __excp_addr.
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index fc52aa128b..4c0f8baa39 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -142,12 +142,20 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>                               MMUAccessType access_type, int mmu_idx,
>                               bool nonfault, void **phost, uintptr_t ra)
>  {
> -#if defined(CONFIG_USER_ONLY)
> -    return probe_access_flags(env, addr, access_type, mmu_idx,
> -                              nonfault, phost, ra);
> -#else
>      int flags;
>  
> +#if defined(CONFIG_USER_ONLY)
> +    flags = page_get_flags(addr);
> +    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
> +        env->__excp_addr = addr;
> +        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
> +        if (nonfault) {
> +            return flags;
> +        }
> +        tcg_s390_program_interrupt(env, flags, ra);
> +    }
> +    *phost = g2h(env_cpu(env), addr);
> +#else
>      /*
>       * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
>       * to detect if there was an exception during tlb_fill().
> @@ -166,8 +174,8 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>                               (access_type == MMU_DATA_STORE
>                                ? BP_MEM_WRITE : BP_MEM_READ), ra);
>      }
> -    return 0;
>  #endif
> +    return 0;
>  }
>  
>  static int access_prepare_nf(S390Access *access, CPUS390XState *env,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


