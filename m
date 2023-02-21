Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E169EA26
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUb7F-0006zh-CB; Tue, 21 Feb 2023 17:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUb7D-0006zO-NK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:28:03 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUb7C-0007ow-3Y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:28:03 -0500
Received: by mail-wm1-x335.google.com with SMTP id l6so4315488wms.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N2qNnSlT1wFSn7Zff2ug5Cbh4FxyzYgxwsinn2JI2S4=;
 b=VM1rtySyxZu2hLJtD/5/bItOrxG+DLb2heBK8hmo6QuMkDaMopgOww5pZN+SoU+rT9
 GQ/Jfq8P7dVRskMDVpUH5954si2d8kg4oStdbRX2EmGQ4H5jUcSVqVjyTficVVfz8HEi
 S7oPRdknJlQ+tjZTdxvj3LNQBLqyKv653Z1Tsx87cvM75TWRWH6L/kz9qg+l4BBvnLqx
 ktVXBoP1/PBe9VSl1ErZdF3p7G843We+ANNOwMQb+7z0jfl2nbSotsiF8xbcAA+uhsWN
 jHnbquFvu8nX325eexoAiADWp5PsxUIh44qij4T1H52MSIsMl+tMreTbwBeV93+YxiB5
 m8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2qNnSlT1wFSn7Zff2ug5Cbh4FxyzYgxwsinn2JI2S4=;
 b=UOHKkX7uQYk6sDxtK4Q/YAfsKYEs1QzMBFFVSU5cOT33FoV5nBN8KGuekJpv1ut2KV
 KBrKdnkeLVpAnAp4yOkHFHDLU6w5jmv0XVgN+fJT5cFPmM62VmbOcPI+8udpukFLAmbS
 M00nILlx7wyeAtP3QgnT/2SBitReEpmSeW9EANBtsr9ag+tMvAxOdH3ekGVflZKZFKlM
 DQd7miHgKCCSc4BaOSK2gkm8qhCdEBd5htwemIo1ZZyvWA1yV+ETplEaOqqKeGec23I7
 XbU2UYZPldT/PleqgmDhzcF6XEBVSKzHOMDa8kgaiFc7bu6XBrfWm0U9l6a0dtswPqdT
 NZgw==
X-Gm-Message-State: AO0yUKVW3jXS6MbBKgX51r0OZxh+Ce5HxVC/E1UMXolHGTHlQykjXwtr
 Z57v+mzLTuATNRj8sdgJTZ97YQ==
X-Google-Smtp-Source: AK7set90ytIf3KKBwaVoTJ1z/pXe/KFc43aLNjru08CDn0ACjA3WZbjd/EB8RU4nJLf+quORBn5ZWg==
X-Received: by 2002:a05:600c:16d3:b0:3dc:5950:b358 with SMTP id
 l19-20020a05600c16d300b003dc5950b358mr11310240wmn.14.1677018480328; 
 Tue, 21 Feb 2023 14:28:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a7bc39a000000b003d9aa76dc6asm13637157wmj.0.2023.02.21.14.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:27:59 -0800 (PST)
Message-ID: <5a61bdc2-1bc0-7147-8053-2ef1d2fbcb2f@linaro.org>
Date: Tue, 21 Feb 2023 23:27:57 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221153006.20300-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 16:30, Pierrick Bouvier wrote:
> Windows implementation of setjmp/longjmp is done in
> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
> perform stack unwinding, which crashes from generated code.
> 
> By using alternative implementation built in mingw, we avoid doing stack
> unwinding and this fixes crash when calling longjmp.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/sysemu/os-win32.h | 28 ++++++++++++++++++++++++----
>   meson.build               | 21 +++++++++++++++++++++
>   2 files changed, 45 insertions(+), 4 deletions(-)


> -#if defined(_WIN64)
> -/* On w64, setjmp is implemented by _setjmp which needs a second parameter.
> +#if defined(__aarch64__)
> +/*
> + * On windows-arm64, setjmp is available in only one variant, and longjmp always
> + * does stack unwinding. This crash with generated code.
> + * Thus, we use another implementation of setjmp (not windows one), coming from
> + * mingw, which never performs stack unwinding.
> + */
> +#undef setjmp
> +#undef longjmp
> +/*
> + * These functions are not declared in setjmp.h because __aarch64__ defines
> + * setjmp to _setjmpex instead. However, they are still defined in libmingwex.a,
> + * which gets linked automatically.
> + */
> +extern int __mingw_setjmp(jmp_buf);
> +extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
> +#define setjmp(env) __mingw_setjmp(env)
> +#define longjmp(env, val) __mingw_longjmp(env, val)
> +#elif defined(_WIN64)
> +/*
> + * On windows-x64, setjmp is implemented by _setjmp which needs a second parameter.
>    * If this parameter is NULL, longjump does no stack unwinding.
>    * That is what we need for QEMU. Passing the value of register rsp (default)
> - * lets longjmp try a stack unwinding which will crash with generated code. */
> + * lets longjmp try a stack unwinding which will crash with generated code.
> + */
>   # undef setjmp
>   # define setjmp(env) _setjmp(env, NULL)
> -#endif
> +#endif /* __aarch64__ */

This comment is confusing, the previous if ladder is about i86. Maybe
better not add any comment?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


