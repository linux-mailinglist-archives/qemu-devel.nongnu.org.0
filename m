Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B343E6D0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:06:56 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8rf-0005Es-8v
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8pc-0004Bt-J6
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:04:48 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8pa-0001ey-8l
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:04:48 -0400
Received: by mail-pg1-x530.google.com with SMTP id h193so7047459pgc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TAuk+/GbNk+S4DEOjrJKC85QSxOjo5xs5z+Xa0FHo04=;
 b=dBvy/cSrYyyYWVQB0XRHcVbZq/VMQm3JhX8uH/Ib4VGyrCatlWIclgBuIDSkf+FaSK
 6MVVWOt1FsRe1dccBLAJvRSPFDTbKBZp0kE6r7sWU0csJOEeRJ9wV1oIa+P0oOLO9Qst
 rYOI6BmjgXB0y/VIQ/J/CxjLBmH3II2QmAkDtD2l1OR608ZLatkYgmVGbAEwn3V+BFBJ
 2mXATWyWknOjTaxEFeDxcdQr7YUL/P17ndMsgPBZjXgAtEuB0bq/nnlSIqXyEs2aiQUy
 EjIkJ02Yhmmsiv26mFaYa5qCFGW9O/MdBviN4ZFB+5NuKmA1R5ioVcSmRmXrr1OzHsm4
 yIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TAuk+/GbNk+S4DEOjrJKC85QSxOjo5xs5z+Xa0FHo04=;
 b=zgobjP3MjxdHU/HbLqbP949OpK6Dp7fzNHvYcxqOytGX5nSsj87jkZ3c+k7zRr+JxE
 Z4y3gNjAWHBP2rN6OtPNQD73XxaO7bNyziMAOEvq6bCVTEOaeYoD1QqrcBeFP3k3FT/1
 VWAbCiplLhA0+ftD0Sf4ygJmLTcNpaZ6JOF8zcfG6Mt8v1RX8M1o1I6739qbKypekQ9U
 +UFhVINyCUa6XOW9a3f7j4bMBlTecskmIhfE/2fvzuv15phZyDwT4KVEO7psE7BBxVXe
 5P8tORSIKnJT/ZgB6WrRR01OzYvekfF9QBcJEK6x0t7unIg5xPl1Q0GGFKfNfZsKYAPp
 kn9Q==
X-Gm-Message-State: AOAM5330bz7qnAIFX+KRlq2/LLeLUI8GnBNp98l2Zzk/di7C9uRrjian
 o9QB3J/OIWOcNczXXWeH/9zxuw==
X-Google-Smtp-Source: ABdhPJyRE+hJmufbJHk09WXJQGD94TWywaCts+zcHNAUMNVhzgO/lR8Z2Hn3WSWzcwyPiUgrrLlNAw==
X-Received: by 2002:a63:2cf:: with SMTP id 198mr4136728pgc.274.1635440683750; 
 Thu, 28 Oct 2021 10:04:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z7sm3118220pgo.11.2021.10.28.10.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:04:43 -0700 (PDT)
Subject: Re: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1e69181-4c2e-7578-e50d-7813cfaaf0b2@linaro.org>
Date: Thu, 28 Oct 2021 10:04:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-19-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +/* arm/arm/machdep.c */
> +struct target_sigcontext {
> +    target_sigset_t sc_mask;    /* signal mask to retstore */
> +    int32_t     sc_onstack;     /* sigstack state to restore */
> +    abi_long    sc_pc;          /* pc at time of signal */
> +    abi_long    sc_reg[32];     /* processor regs 0 to 31 */
> +    abi_long    mullo, mulhi;   /* mullo and mulhi registers */
> +    int32_t     sc_fpused;      /* fp has been used */
> +    abi_long    sc_fpregs[33];  /* fp regs 0 to 31 & csr */
> +    abi_long    sc_fpc_eir;     /* fp exception instr reg */
> +    /* int32_t reserved[8]; */
> +};

 From the set of registers, this seems to be copied from mips.

The contents of sys/arm/include/signal.h are

struct sigcontext {
         int _dummy;
};

so I'm not sure what you're doing here.


r~

