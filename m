Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FEF3E392E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 08:26:07 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCcG6-0001vv-1C
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 02:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCcEo-0000ct-NI
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 02:24:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCcEl-0008O9-QK
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 02:24:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id nh14so22943976pjb.2
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=alWpjczuru/Kg94eP7g7wXcb+NfJY/1uuMngqv8uNJ8=;
 b=KiyIO+6TeSt3pT8bR47dftEpMY28moR6aIiIvd0TwMWOszecQ9LumtziQBUSns25Hf
 V+b1ybTkQ6i0hhVWmLJVXCSgNYWIlhPkxC+yqCkG7RqTt9RhSH82/3RRVLfFMoO0/bkO
 1zJcP8l0f0lQNjlcH4XznocSWlHu1qapRMukp98R3F7CQ0at8AI6e46U/u+gITC+LvRb
 CHIwjrEjHFmjL2FcKI7T0440whJ3JWFVnBgJUswvldZ1dHXW+ece+nCTAsFj6ZQ3k7sZ
 AdN5+U6Ap037gbICGRzYCUlVkjYRqMAnuS3ceYY795cmjFNDQDMFwPLgqkIqcHayKpUR
 Dpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=alWpjczuru/Kg94eP7g7wXcb+NfJY/1uuMngqv8uNJ8=;
 b=kUVi/7SjDo7FgG0DEq8Mzf5JIMmbax+7pDpvVurVew6xuLSTYnSRgyhI7t3GFYbubz
 vV20Sbg7rtfA9zlb5MDhUfAJqr04NOmOoEnKdaOFYLdaR5k+iYGFOBQG00tgFuWvqeEf
 /RIqvzLB/mEV5w7n3d/e7qU1quaMzMLevqcv5h2VwplTGXGdjJevL96HN3Wu2+i8AKeM
 sumBih22+YkJ2/cIfd/r5LTlUaAqG+/sl5p09mveTa089BSY3+PO7vWzzYN6fNbztzR5
 KDN53hbqGVjSA9nxtlcZ467qc3y3vD8UznT8rHC/940OsfMEgJ1szWwPS4/l3mrRU2K0
 r7BA==
X-Gm-Message-State: AOAM530X6UDgUy9eL6tpP2yMwbbWgHyjYWVcHV9qZql2tDfZ3rKUSM0C
 qUbn/VDhE566egZRpYCxoLspkw==
X-Google-Smtp-Source: ABdhPJx6VeYL9henJecPtmmv+SWtcRbozwFeH4Ys9jD+QzXplULRTk2h9dCR7Q7PAV8rTCQnbI+EFw==
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr15477744plo.37.1628403882014; 
 Sat, 07 Aug 2021 23:24:42 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b20sm15153576pfl.9.2021.08.07.23.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 23:24:41 -0700 (PDT)
Subject: Re: [PATCH for 6.2 23/49] bsd-user: pull in target_arch_thread.h
 update target_arch_elf.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-24-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d20c2d8b-6020-2f4c-d3b1-ad8e66ec836e@linaro.org>
Date: Sat, 7 Aug 2021 20:24:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-24-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> +++ b/bsd-user/x86_64/target_arch_elf.h
> @@ -19,48 +19,14 @@
>   #ifndef_TARGET_ARCH_ELF_H_
>   #define_TARGET_ARCH_ELF_H_
>   
> -#define ELF_PLATFORM get_elf_platform()
> -
> -static const char *get_elf_platform(void)
> -{
> -    static char elf_platform[] = "i386";
> -    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
> -    if (family > 6) {
> -        family = 6;
> -    }
> -    if (family >= 3) {
> -        elf_platform[1] = '0' + family;
> -    }
> -    return elf_platform;
> -}
> -
> -#define ELF_HWCAP get_elf_hwcap()
> -
> -static uint32_t get_elf_hwcap(void)
> -{
> -    X86CPU *cpu = X86_CPU(thread_cpu);
> -
> -    return cpu->env.features[FEAT_1_EDX];
> -}
> -
>   #define ELF_START_MMAP 0x2aaaaab000ULL
> -#define elf_check_arch(x) (((x) == ELF_ARCH))
> +#define ELF_ET_DYN_LOAD_ADDR    0x01021000
> +#define elf_check_arch(x) ( ((x) == ELF_ARCH) )

This appears to be unrelated?  Should this have been in a previous patch?  Or is this a 
rebase mistake that gets corrected later?

I'll trust the target_os_thread.h thing becomes useful later.
So, modulo the target_arch_elf.h weirdness,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

