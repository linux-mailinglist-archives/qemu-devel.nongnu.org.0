Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE969F8DC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrnu-0000ce-OR; Wed, 22 Feb 2023 11:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUrns-0000cN-9V
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:17:12 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUrnq-0007mI-Kg
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:17:12 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so5745331wmq.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gocHSuxyi3k08qqM9s5R4cwvr6IvnypcxzQE0QSemHs=;
 b=wJKq44DpfAJRvrUxLvX+x+Ac/nhmYvEeXwA/YLIEzf3N3p3roI1gf1vdGW2To2OEv+
 CA6Ih2NeOkJmUxMdh83xU0+7+9zzRDdvwDLXibensXKB5WNqjZqWWm4fGtD7jT4x0pfD
 E/sgSMc1S3sT71zNq/4o9cRaVzR5gt0GGHuydSBo8/7bwoJaYlDEXHQgn4TRkCnOpFNs
 NM5B06Xi8J29IX3n+adUqNRBamHIjhnzPDxCTYWduzCMI1TcACXeOz3bq5HNsCHCDN2Z
 LxYHqisvZuo4Uz01uQZAxDOI4S8J2WDFVjNuJ4pp5jfURhmHgmGvC4F+X5EvLNqJ1WAq
 S2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gocHSuxyi3k08qqM9s5R4cwvr6IvnypcxzQE0QSemHs=;
 b=OSyNLUEAcs8YWmhHsrKmE9BHfjZ6Fz0yErdSBN3oKXWl1v3UhX/FTEzwnK5tuo5TjU
 rkrCOx/vdeDzNYR0STtMMBrKq8TAcihwPMx+tl6VftSfcr5qQ+GSIYdsnURoLpyIl0De
 T09YZQygkfQ5k7vmGM6CRpLqxTcbFxvVFnuniESvjmGSvqiYk50l9sWzl3hKevrp5FDv
 9cOgODDHy3QJlYCCPm1GwdYs9mMgrAZe8bT2f376kZylq16QM9IJ+1zwudTHZfMXyfk/
 jPPzwjMkWZme92v0+E6lg2G/y3jtp4fZhLKygyNFpGG7kagy/kQEM/DGyEPpk+mcRpfw
 ooJQ==
X-Gm-Message-State: AO0yUKUJiVLUpvM1r/3DgC3w5a1uyHEwjFX3ScxaEZR/AnSMGU2vmIk5
 tCHUj1VZyXgi84cDTLFLCidTiQ==
X-Google-Smtp-Source: AK7set/yk9limTQdII915Wu/tXKbv5oEpiHtTqUPIsCJhGd1OxCXs9ynIjdtAKgHuP4WKvKmKCMyfg==
X-Received: by 2002:a05:600c:331b:b0:3df:e4b4:de69 with SMTP id
 q27-20020a05600c331b00b003dfe4b4de69mr6093721wmp.27.1677082628635; 
 Wed, 22 Feb 2023 08:17:08 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c458800b003db01178b62sm1745083wmo.40.2023.02.22.08.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:17:08 -0800 (PST)
Message-ID: <fa7ff862-32fd-edd2-1629-ee68e920c68d@linaro.org>
Date: Wed, 22 Feb 2023 17:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-3-pierrick.bouvier@linaro.org>
 <5a61bdc2-1bc0-7147-8053-2ef1d2fbcb2f@linaro.org>
 <8fc239ec-b01c-019a-9c8c-b276bbf3fd02@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8fc239ec-b01c-019a-9c8c-b276bbf3fd02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/2/23 17:08, Pierrick Bouvier wrote:
> On 2/21/23 23:27, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 16:30, Pierrick Bouvier wrote:
>>> Windows implementation of setjmp/longjmp is done in
>>> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
>>> perform stack unwinding, which crashes from generated code.
>>>
>>> By using alternative implementation built in mingw, we avoid doing stack
>>> unwinding and this fixes crash when calling longjmp.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    include/sysemu/os-win32.h | 28 ++++++++++++++++++++++++----
>>>    meson.build               | 21 +++++++++++++++++++++
>>>    2 files changed, 45 insertions(+), 4 deletions(-)
>>
>>
>>> -#if defined(_WIN64)
>>> -/* On w64, setjmp is implemented by _setjmp which needs a second 
>>> parameter.
>>> +#if defined(__aarch64__)
>>> +/*
>>> + * On windows-arm64, setjmp is available in only one variant, and 
>>> longjmp always
>>> + * does stack unwinding. This crash with generated code.
>>> + * Thus, we use another implementation of setjmp (not windows one), 
>>> coming from
>>> + * mingw, which never performs stack unwinding.
>>> + */
>>> +#undef setjmp
>>> +#undef longjmp
>>> +/*
>>> + * These functions are not declared in setjmp.h because __aarch64__ 
>>> defines
>>> + * setjmp to _setjmpex instead. However, they are still defined in 
>>> libmingwex.a,
>>> + * which gets linked automatically.
>>> + */
>>> +extern int __mingw_setjmp(jmp_buf);
>>> +extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
>>> +#define setjmp(env) __mingw_setjmp(env)
>>> +#define longjmp(env, val) __mingw_longjmp(env, val)
>>> +#elif defined(_WIN64)
>>> +/*
>>> + * On windows-x64, setjmp is implemented by _setjmp which needs a 
>>> second parameter.
>>>     * If this parameter is NULL, longjump does no stack unwinding.
>>>     * That is what we need for QEMU. Passing the value of register 
>>> rsp (default)
>>> - * lets longjmp try a stack unwinding which will crash with 
>>> generated code. */
>>> + * lets longjmp try a stack unwinding which will crash with 
>>> generated code.
>>> + */
>>>    # undef setjmp
>>>    # define setjmp(env) _setjmp(env, NULL)
>>> -#endif
>>> +#endif /* __aarch64__ */
>>
>> This comment is confusing, the previous if ladder is about i86. Maybe
>> better not add any comment?
> 
> If I am not mistaken, before we had:
> 
> #if x64
> define setjmp as _setjmp(env, 0)
> #endif
> // nothing done for x86
> 
> and now we have:
> 
> #if aarch64
> define setjmp as __mingw_setjmp
> define longjmp as __mingw_longjmp
> #elif x64
> define setjmp as _setjmp(env, 0)
> #endif
> // nothing done for x86
> 
> Maybe the patch format is confusing, or I missed what you pointed.

Oh OK, we are good then, sorry :)

