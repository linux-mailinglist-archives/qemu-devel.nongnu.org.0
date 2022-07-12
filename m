Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE25711A2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:59:34 +0200 (CEST)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7zh-0000lQ-NQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7sH-0004Xe-VI
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:51:56 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7sE-00069B-Py
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:51:52 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y9so6495010pff.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=vtUHf4u1UHMjILb7P+zr79jU//IlIqKKH/MA/LVyU+A=;
 b=sOO8Dov+2LK02vkPH5m5N3konRKdZN2WIvYiEecv1qIbvmP4RY84QRZFD8KaJm7rsF
 KxNIQs+MbDlHU+ngMZXl66Yee+ThF+Jfkob8Mgv5kCgQtU96lD86J9jxXPwPvOReRasK
 Jrih93PtSsRLk5QZiGZkVW5uTZws0M4KZKJdyhY6RhyLSzzLjM2O3Ty3iPvzD68s0LnH
 r+eF1cPM2O32udlPKbSPZGWqjXaLUEISz/XK6O8BxXh9VuasUECba0ilp0QcayKztqcm
 MAMA7u5cfKDfP+Pv4D0DQ4zog/uxOYy4xUhEmorGwoN8DrnISUxFzCEf5dh0ebNl0ZY4
 ilhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vtUHf4u1UHMjILb7P+zr79jU//IlIqKKH/MA/LVyU+A=;
 b=MRdHgrZp2k0cL7aycfeM800hHLHut+FhktoPEOwmno3/+wBdX8bOApSSA+im1xJ7+b
 jYctQgP1z5EGVXZ7ZFv7sAKWQQglqYftq1wWhZj2damQHjh/mAKZuLBzblRV4CiL/8mJ
 wPOR8BQ78tpdRab7QtzV90mm6baGlx9xukqlpIbg+PUBBIyk4Sym6Js9hjbxZ0UtmjBA
 hIaEhS4NneprDL5Yzxuv8CXH4NjcEA4lMkxk7n4qKN//Msn8dGUtEMdqKnHMYg6YWNpj
 Ck3JebB3Xx3YEVkL6yoeS3WXrM4OrTlVFRVyLTnqRrL0MuSceCEBRZ70Kiz9cNw0agQk
 A2nw==
X-Gm-Message-State: AJIora9krgVHGozG6cTDqTSkwZsgLNp2JDIUfcgD1MhGRN7HE7VD5vs0
 OJnvSsWjm/bEJb35g2c1Rkg0wg==
X-Google-Smtp-Source: AGRyM1u7cwnJsZ71dcnTU63XUGHGVf/tFAv2oTwE+K0VyIOPqW8C0UD8S+gzA17SdiDghsyy/30+DQ==
X-Received: by 2002:a63:82c6:0:b0:416:1717:4add with SMTP id
 w189-20020a6382c6000000b0041617174addmr4946010pgd.472.1657601508432; 
 Mon, 11 Jul 2022 21:51:48 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090341c700b0016befcc142csm5651018ple.293.2022.07.11.21.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:51:48 -0700 (PDT)
Message-ID: <bcb30961-ab68-3782-e763-cd1c4b9601d4@linaro.org>
Date: Tue, 12 Jul 2022 10:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: en-US
To: Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20220711220028.2467290-1-vitalybuka@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711220028.2467290-1-vitalybuka@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 03:30, Vitaly Buka wrote:
> aarch64 stores MTE tags in target_date, and they should be reset by
> MADV_DONTNEED.
> 
> Signed-off-by: Vitaly Buka <vitalybuka@google.com>
> ---
>   accel/tcg/translate-all.c | 24 ++++++++++++++++++++++++
>   include/exec/cpu-all.h    |  1 +
>   linux-user/mmap.c         |  2 ++
>   3 files changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ef62a199c7..d6f2f1a40a 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2314,6 +2314,30 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>       }
>   }
>   
> +void page_reset_target_data(target_ulong start, target_ulong end)
> +{
> +    target_ulong addr, len;
> +
> +    /* This function should never be called with addresses outside the
> +       guest address space.  If this assert fires, it probably indicates
> +       a missing call to h2g_valid.  */
> +    assert(end - 1 <= GUEST_ADDR_MAX);
> +    assert(start < end);
> +    assert_memory_lock();
> +
> +    start = start & TARGET_PAGE_MASK;
> +    end = TARGET_PAGE_ALIGN(end);
> +
> +    for (addr = start, len = end - start;
> +         len != 0;
> +         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
> +        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
> +
> +        g_free(p->target_data);
> +        p->target_data = NULL;
> +    }
> +}
> +
>   void *page_get_target_data(target_ulong address)
>   {
>       PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index f5bda2c3ca..491629b9ba 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -271,6 +271,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
>   
>   int page_get_flags(target_ulong address);
>   void page_set_flags(target_ulong start, target_ulong end, int flags);
> +void page_reset_target_data(target_ulong start, target_ulong end);
>   int page_check_range(target_ulong start, target_ulong len, int flags);
>   
>   /**
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 4e7a6be6ee..c535dfdc7c 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -894,6 +894,8 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>       if ((advice & MADV_DONTNEED) &&
>           can_passthrough_madv_dontneed(start, end)) {
>           ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
> +        if (ret == 0)
> +            page_reset_target_data(start, start + len);
>       }
>       mmap_unlock();
>   


