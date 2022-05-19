Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B198B52DCE7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:34:46 +0200 (CEST)
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkyz-0006qh-B2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrkve-0005GW-EX
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:31:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrkvQ-0000RO-J5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:31:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id f10so6031679pjs.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=92wbUyI8RvzkWN+QXoy29OBYC8s3lzTau2Ood/gW8HQ=;
 b=NLGTqGpjV4zL0Bd3jvRR6s94iUbJfIhcxSce10wpiuxv/d14xB/VoAGo1Nt3gbM6R4
 n1XCaB4WA3WI0H/H3B19MC/fIuV+M9BDiWVKvl0N4cGT2GpsvT658gj1M6f2QFAGtOUL
 MV/nXsy1a5lvoChRvYssQm9xgzlOpzYIx8zeGJQHAAJQqExO+3fBf+oU98cGReFptwqF
 xMjD9XlgUUgxvaI4/nM37Tyd1H4UfWTTgJh0HMNRtOM4ccVIvusFaRwzbWQn0KPwtC/Q
 Cznzwl+ZuHMX8GTE/guXPrq4mBeYPLa/Fi/FcT9rhul1WLHdBKVW0gemLA+s83JBgqRm
 PCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=92wbUyI8RvzkWN+QXoy29OBYC8s3lzTau2Ood/gW8HQ=;
 b=rHRRwB9yQcNF+S+R05+ewA8CyP1IRQIavlDoHUIjTB8/rXJbwLyLG0SOIuIGZhSoTJ
 ywdctXKqKHzxuE5yjOciuR8LXn6xrO/4k56XNro1AEoHN/9yqS8VvLe3Wdz6H1Ez3G8M
 YNZzaF8SlbYknZSw/m+VCKk50mXSRbpBk+cl6EAf3E7hyjbJs+L9uzi7lhLI6h1x+7zs
 NrlGDUN3JLvDsTF0lV6LpyuTLcceXFObCDjeHK4TDmSY5+HeCBjqpNQBEsc6RFIWIDu4
 4R4UMK8CKFvl1AR3TyM3uioMIH508KZaOvBuUUWW7nVFWQs7I/tFeqTeTKXZXQu94A8H
 UDOQ==
X-Gm-Message-State: AOAM5318iVwL9KdHVPoNfhg038pF0kOKx8rgKpQ+5D64F0nnpFc9TB83
 da3OdKFhDBu0OjydwsfODNawRw==
X-Google-Smtp-Source: ABdhPJzcDe94/nbc7x44p7F8hqzvnyTavi4ruJ7muLYwLVD30zwSV+hT7cKcwVNmNcsOAoFi6LEbJQ==
X-Received: by 2002:a17:90b:1a88:b0:1dc:8e84:9133 with SMTP id
 ng8-20020a17090b1a8800b001dc8e849133mr6415877pjb.231.1652985063084; 
 Thu, 19 May 2022 11:31:03 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a17090a4b4f00b001cd4989febcsm149496pjl.8.2022.05.19.11.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 11:31:02 -0700 (PDT)
Message-ID: <e9d693db-f195-4bb1-c883-0805d910fe61@linaro.org>
Date: Thu, 19 May 2022 11:31:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] util: optimise flush_idcache_range when the ppc host has
 coherent icache
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220519141131.29839-1-npiggin@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519141131.29839-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/19/22 07:11, Nicholas Piggin wrote:
> dcache writeback and icache invalidate is not required when icache is
> coherent, a shorter fixed-length sequence can be used which just has to
> flush and re-fetch instructions that were in-flight.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> I haven't been able to measure a significant performance difference
> with this, qemu isn't flushing large ranges frequently so the old sequence
> is not that slow.

Yeah, we should be flushing smallish regions (< 1-4k), as we generate TranslationBlocks. 
And hopefully the translation cache is large enough that we spend more time executing 
blocks than re-compiling them.  ;-)


> +++ b/include/qemu/cacheflush.h
> @@ -28,6 +28,10 @@ static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
>   
>   #else
>   
> +#if defined(__powerpc__)
> +extern bool have_coherent_icache;
> +#endif

Ug.  I'm undecided where to put this.  I'm tempted to say...

> --- a/util/cacheflush.c
> +++ b/util/cacheflush.c
> @@ -108,7 +108,16 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)

... here in cacheflush.c, with a comment that the variable is defined and initialized in 
cacheinfo.c.

I'm even more tempted to merge the two files to put all of the machine-specific cache data 
in the same place, then this variable can be static.  There's even an existing TODO 
comment in cacheflush.c for aarch64.


>       b = rw & ~(dsize - 1);
> +
> +    if (have_coherent_icache) {
> +        asm volatile ("sync" : : : "memory");
> +        asm volatile ("icbi 0,%0" : : "r"(b) : "memory");
> +        asm volatile ("isync" : : : "memory");
> +        return;
> +    }

Where can I find definitive rules on this?

Note that rx may not equal rw, and that we've got two virtual mappings for the same 
memory, one for "data" that is read-write and one for "execute" that is read-execute. 
(This split is enabled only for --enable-debug-tcg builds on linux, to make sure we don't 
regress apple m1, which requires the split all of the time.)

In particular, you're flushing one icache line with the dcache address, and that you're 
not flushing any of the other lines.  Is the coherent icache thing really that we may 
simply skip the dcache flush step, but must still flush all of the icache lines?

Without docs, "icache snoop" to me would imply that we only need the two barriers and no 
flushes at all, just to make sure all memory writes complete before any new instructions 
are executed.  This would be like the two AArch64 bits, IDC and DIC, which indicate that 
the two caches are coherent to Point of Unification, which leaves us with just the 
Instruction Sequence Barrier at the end of the function.


> +bool have_coherent_icache = false;

scripts/checkpatch.pl should complain this is initialized to 0.


>   static void arch_cache_info(int *isize, int *dsize)
>   {
> +#  ifdef PPC_FEATURE_ICACHE_SNOOP
> +    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
> +#  endif
> +
>       if (*isize == 0) {
>           *isize = qemu_getauxval(AT_ICACHEBSIZE);
>       }
>       if (*dsize == 0) {
>           *dsize = qemu_getauxval(AT_DCACHEBSIZE);
>       }
> +
> +#  ifdef PPC_FEATURE_ICACHE_SNOOP
> +    have_coherent_icache = (hwcap & PPC_FEATURE_ICACHE_SNOOP) != 0;
> +#  endif

Better with only one ifdef, moving this second hunk up.

It would be nice if there were some kernel documentation for this...


r~

