Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE77695A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:12:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpTN-0006Ru-4B; Tue, 14 Feb 2023 02:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRpTI-0006Q7-Jo
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:11:25 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRpTF-0000qg-Jl
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:11:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 hg24-20020a05600c539800b003e1f5f2a29cso504293wmb.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 23:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=occbuWtNkhijLN/HUlf5KFxQ8YgusYdjInUdyQwNzQc=;
 b=M3TCbzzx26H9aBJQVuJYhRN0wLvl4FZy2JuVMJuAwUzRsm1ZeD95T+ImHBr9W0O/Mm
 hQtc55O3SSFLY0tZURoyIIqibkAHHRgklag94buX0UU9/j+XfMHS3n62+EBXsQ94BBGu
 QKcH9niJhdy3pusadCMytBKFeRE2hQIn85XjpZqiyiONf4Zyh6qfchryRM4hFcv4DzhD
 qDyK9E7raQMWCkUkyFYhz3yfTIK7OXfc25cAp/USQAfud/58J73ouTLXCQk5jUrNUttf
 83u14APs8ThsdTbvHLAexEbwBcCUUZ1qjfYWy4MlGjuMQRltA6g2LlxOanzzYO4LYmKu
 qVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=occbuWtNkhijLN/HUlf5KFxQ8YgusYdjInUdyQwNzQc=;
 b=dAf912xlbTCd2+88RLqc4vVmNKnw/W2L3Vc6x0mzRYoczH50/Hg2zlQjAYj0TzP0U+
 0ZTlOUk3KovPJEuqcsAx69+9p+CzXGhb51fWNm0n+P/83hj84hW0MuIOrChseMZFp6QB
 e/1eiVu0yFmZNv6SuUnrpZoSwAzR3OstUU2j4GXxZkck38JFYFrdnn+DRNE+J+i1v4Rn
 49dbHZxDlWEAt4HVWRGkQSKEarCNcGf8EiM844brsocDGOZB0OpzIv51ogt+SqBQcwXu
 1mnAZkAxmDyoJxSmybfYxXjWxmYr2KHYzV3CZ4q/OpP6zFc0wSZMTKdhgbkwSQ9y+c6I
 cSLA==
X-Gm-Message-State: AO0yUKU/kL+S9uxX8JhTaiLtUzjJH3q43PaFF+Hb+HzC6N3iU+rSgxEd
 R7mN88y7dSQKwToYyxQp7luxSw==
X-Google-Smtp-Source: AK7set+hOIpUSOuyeZkdz8lNbN55SKVxDNSFflmOsYFdNuK7L9Ea98RBOhEm++jW0oprD0SeDhG7/Q==
X-Received: by 2002:a05:600c:816:b0:3d9:f85c:97ff with SMTP id
 k22-20020a05600c081600b003d9f85c97ffmr1124239wmp.16.1676358678428; 
 Mon, 13 Feb 2023 23:11:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c471300b003e1f2e43a1csm2009713wmo.48.2023.02.13.23.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 23:11:18 -0800 (PST)
Message-ID: <70e1b283-ac58-9df4-7e19-2ead4c680424@linaro.org>
Date: Tue, 14 Feb 2023 08:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 2/4] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Konstantin Kostiuk <kkostiuk@redhat.com>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-3-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213161352.17199-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

Hi Pierrick,

On 13/2/23 17:13, Pierrick Bouvier wrote:
> Windows implementation of setjmp/longjmp is done in
> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
> perform stack unwinding, which crashes from generated code.
> 
> By using alternative implementation built in mingw, we avoid doing stack
> unwinding and this fixes crash when calling longjmp.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/sysemu/os-win32.h | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index 5b38c7bd04..84f62d0a17 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -51,14 +51,28 @@ typedef struct sockaddr_un {
>   extern "C" {
>   #endif
>   
> -#if defined(_WIN64)
> +#if defined(__aarch64__)

Shouldn't we check for __MINGW64__?

    #if defined(__aarch64__) && defined(__MINGW64__)

> +/* On windows-arm64, setjmp is available in only one variant, and longjmp always
> + * does stack unwinding. This crash with generated code.
> + * Thus, we use another implementation of setjmp (not windows one), coming from
> + * mingw, which never performs stack unwinding. */
> +#undef setjmp
> +#undef longjmp
> +/* These functions are not declared in setjmp.h because __aarch64__ defines
> + * setjmp to _setjmpex instead. However, they are still defined in libmingwex.a,
> + * which gets linked automatically. */

So this is not stable. Better would be to check the symbols availability
at link-time via meson; see for example glusterfs_ftruncate_has_stat
which defines CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT.

A similar check could define CONFIG_MINGW64_HAS_SETJMP_LONGJMP.

> +extern int __mingw_setjmp(jmp_buf);
> +extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
> +#define setjmp(env) __mingw_setjmp(env)
> +#define longjmp(env, val) __mingw_longjmp(env, val)
> +#elif defined(_WIN64)
>   /* On w64, setjmp is implemented by _setjmp which needs a second parameter.
>    * If this parameter is NULL, longjump does no stack unwinding.
>    * That is what we need for QEMU. Passing the value of register rsp (default)
>    * lets longjmp try a stack unwinding which will crash with generated code. */
>   # undef setjmp
>   # define setjmp(env) _setjmp(env, NULL)
> -#endif
> +#endif /* __aarch64__ */
>   /* QEMU uses sigsetjmp()/siglongjmp() as the portable way to specify
>    * "longjmp and don't touch the signal masks". Since we know that the
>    * savemask parameter will always be zero we can safely define these

Regards,

Phil.

