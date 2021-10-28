Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE343E70F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:20:25 +0200 (CEST)
Received: from localhost ([::1]:45408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg94i-00008u-1Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg93J-0007jx-83
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:18:57 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg93G-0004yA-Gu
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:18:56 -0400
Received: by mail-pf1-x430.google.com with SMTP id m26so6633625pff.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3dnXvJiaEJhOoylD0zukyq17fGPu7MUyZlx6XYx5UHU=;
 b=sCiWCvWwF/+qO0h+pK1QCFIKXMmlya5DjJjN69XQcH8D+WyEhIubjzNrqn89t3m2qS
 jBOcktNB6YGixY/K0wk4Ska887uB66g6KCgKs6f3MntYpDGBQUEbbIFwKufpXGKT0sjv
 lXtxyx416RSu0xFcfIHJst/qytf1pKXUfEwryfaNsOqMPft34n7desmgXKfNLqFEkfYl
 qmQF/68YFzL9vtX/TTjKtgUn0l2pZMn6ledcNmPROZVHJyTwv3SI34m27JK9KII+zo4/
 911+vneaDmdJzvO5NdnbKZyy14Hwt9OTIV7E/5Sl9SyNF9kGVda/g3HtuNXD0L+out6W
 YVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3dnXvJiaEJhOoylD0zukyq17fGPu7MUyZlx6XYx5UHU=;
 b=perS5L6+qJbLORSC5vgv3mKCg/m3gCWhE7YG/Cb/5Qvg4Zk5S4C5YroyQ72g0l+aAf
 bBvEwDgv23uUGCwHsKSIZNipUHhFRKZzgh9Sbas6D0jIzRTjMh/X7ef7i0NbPgIITBlJ
 NZeDeyEB0nFNDIU0/hs5TGGkkd6KKi6brQKd4eQ1ZMeaV5aqS9DE5sxj1D9mgCjeifj0
 c1N0eGNipBnePiqoyq5kifGx1cSD7K0SjjHl4y+XJiOV4I3oFUuYqVRlLbFtXyxsb/z7
 7NJttto9G7HN+wjCvKQ9olGezPnSNcqUsIaL0895wwD1Hu4R9unfuUSmcVUIgEnW0kBp
 Vc1A==
X-Gm-Message-State: AOAM533ncF7aGbN47eIsQ0UgC1LQIEzk9A2w5bMH8TgRt3vqo3csQR6J
 FxHH0ZUjZhVIBoML3hIA1/b0NA==
X-Google-Smtp-Source: ABdhPJwP5HyG1feYtzBYPPNxN4YssTHk7SRVPJ+xn3OH7Gge6hPBWX5c0yvoT1AyU8Q+EGDzazfliQ==
X-Received: by 2002:a05:6a00:168c:b0:44c:dc5a:7ee0 with SMTP id
 k12-20020a056a00168c00b0044cdc5a7ee0mr5792521pfc.40.1635441532841; 
 Thu, 28 Oct 2021 10:18:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id n2sm3552533pjo.20.2021.10.28.10.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:18:52 -0700 (PDT)
Subject: Re: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4289206-5b16-574d-34bc-42bce93837bc@linaro.org>
Date: Thu, 28 Oct 2021 10:18:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-19-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
> +typedef struct {
> +    uint32_t    __fp_fpsr;
> +    struct {
> +        uint32_t    __fp_exponent;
> +        uint32_t    __fp_mantissa_hi;
> +        uint32_t    __fp_mantissa_lo;
> +    }       __fp_fr[8];
> +} target__fpregset_t;
> +
> +typedef struct {
> +    uint32_t    __vfp_fpscr;
> +    uint32_t    __vfp_fstmx[33];
> +    uint32_t    __vfp_fpsid;
> +} target__vfpregset_t;
> +
> +typedef struct target_mcontext {
> +    uint32_t        __gregs[TARGET__NGREG];
> +    union {
> +        target__fpregset_t  __fpregs;
> +        target__vfpregset_t __vfpregs;
> +    } __fpu;
> +} target_mcontext_t;

This doesn't match what I see in sys/arm/include/ucontext.h at all.
I don't even see the string "fstmx" anywhere in the source tree.


r~

