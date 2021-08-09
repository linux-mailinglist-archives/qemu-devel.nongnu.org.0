Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7BD3E4E35
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 23:02:17 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDCPY-0003zo-BB
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 17:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDCOA-0003J3-Pt
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 17:00:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDCO8-00035e-Uj
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 17:00:50 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so958606pjr.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ucoyu0ZYw3RsoZcbeawVGmU4QBM5LNXV8Dl8l57btZ4=;
 b=GCN44q+X8t/+ynwDQQW8JW/hz20usHr5TkenoAMglO7ihKbXZKoWWZsIdnz64KaDJA
 y+63mUIjjgSnAlv938vuY99JT/0Ub7rqY+YPgqiHRyi92KtPlUsbZdM96FfdUkC+ADa8
 fC1w11c4xmN91k5fJzD9oT1Jn5XaaE4JEkgnTJq/Z8RXSMwmjZ5N9MgZwXgca8iqZE0f
 tX2GGojCb+kV2yUzGO6gfZ2wjooSsnwgEpNszVnjjs9wnTaXv0F1hMNPQ4V5cOdy9DYU
 ti5oNfVmif8NmlxC7DAdL9TOXJMHQyIVaNU+REbIz/TyvkMYNAAE6uEz35E4cpDyNMVW
 HGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ucoyu0ZYw3RsoZcbeawVGmU4QBM5LNXV8Dl8l57btZ4=;
 b=D8n8RvXi0+Pf3p9d9sNXRdB8mKJ/OLkgZd/achT0N2x2LCFshQMACxnbvsBGSgusgX
 9+1dq/N5HLSj3NPwUClX+2dv5pivn42fiMCVm2v+AzQNBc6eI+wZAqFvUvlaOY2iT9YX
 G6vOt0NMumdFwrl/LU4/BPqI9nKInfINUCqX+5Bimpem/YMRc+L/rbK150s2asBclwRX
 MwKCmRIh4rriMbJsLJiT79VsEfgO1zquk53uuJKZMJe2NZF+DvofxZeYCiY55AL5/Kql
 37ERm2Y9rP/55+UbB1lZzXFOGHMsjOUtI43aKNJvUZP2kgfBxyrlrhL4wMqE256EbvzP
 GSaA==
X-Gm-Message-State: AOAM531LxLMQr4BKWx4XqmTvBKpH7nR02F2xZIi9zTewUcjxmXeyy68c
 MlpXY0JhPe7MpJL8nKwGh+CInw==
X-Google-Smtp-Source: ABdhPJz443AoqsSZR+gYKjHeWLd8uPtRZSXa4kMniFNRjYCHWxRBFKGs8r50tL5GZTjg6OowcNFj/w==
X-Received: by 2002:a17:902:d4cc:b029:12c:dd57:d097 with SMTP id
 o12-20020a170902d4ccb029012cdd57d097mr11348196plg.23.1628542847250; 
 Mon, 09 Aug 2021 14:00:47 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm18705755pjb.31.2021.08.09.14.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 14:00:46 -0700 (PDT)
Subject: Re: [PATCH for 6.2 28/49] bsd-user: Move stack initializtion into a
 per-os file.
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-29-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ac9c3db-b7e0-9439-b2b5-a6ff3ed38b18@linaro.org>
Date: Mon, 9 Aug 2021 11:00:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-29-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
> +static inline int setup_initial_stack(struct bsd_binprm *bprm,
> +        abi_ulong *ret_addr, abi_ulong *stringp)
> +{
> +    int i;
> +    abi_ulong stack_hi_addr;
> +    size_t execpath_len, stringspace;
> +    abi_ulong destp, argvp, envp, p;
> +    struct target_ps_strings ps_strs;
> +    char canary[sizeof(abi_long) * 8];
> +
> +    stack_hi_addr = p = target_stkbas + target_stksiz;
> +
> +    /* Save some space for ps_strings. */
> +    p -= sizeof(struct target_ps_strings);
> +
> +#ifdef TARGET_SZSIGCODE
> +    /* Add machine depedent sigcode. */
> +    p -= TARGET_SZSIGCODE;
> +    if (setup_sigtramp(p, (unsigned)offsetof(struct target_sigframe, sf_uc),
> +            TARGET_FREEBSD_NR_sigreturn)) {
> +        errno = EFAULT;
> +        return -1;
> +    }
> +#endif

Hmm.  The x86 version you just added always returns -EOPNOTSUPP.  Therefore I conclude 
that TARGET_SZSIGCODE is unset.

Perhaps a better interface would be

   p = setup_sigtramp(p, ...);
   if (p == 0) {
     // fail
   }

then you don't need to expose TARGET_SZSIGCODE or have conditional compilation here.

Perhaps for the to-do list...

> +    /* Add canary for SSP. */
> +    arc4random_buf(canary, sizeof(canary));

You should use qemu_guest_getrandom_nofail here.

> +    /*
> +     * Deviate from FreeBSD stack layout: force stack to new page here
> +     * so that signal trampoline is not sharing the page with user stack
> +     * frames. This is actively harmful in qemu as it marks pages with
> +     * code it translated as read-only, which is somewhat problematic
> +     * for user trying to use the stack as intended.
> +     */

A decent short-term solution.

I'll draw your attention to my vdso patch set for linux-user:
https://patchew.org/QEMU/20210706234932.356913-1-richard.henderson@linaro.org/

Modulo randomness,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

