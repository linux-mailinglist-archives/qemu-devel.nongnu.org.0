Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D098F4AFFE8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:12:06 +0100 (CET)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvC1-0004rP-Sc
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:12:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHuxd-0007HX-62
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:57:13 -0500
Received: from [2607:f8b0:4864:20::433] (port=43894
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHuxb-0008PT-Gl
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:57:12 -0500
Received: by mail-pf1-x433.google.com with SMTP id d187so6716927pfa.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1fWnYAgdd6W4c97+7rqkG3ENQw1D1kINYaL1yf5uU3Y=;
 b=MoG6VparQsQPVF6hG7CEx8YkTpq1W3MLvyxPOUVX4e0u/xDs4mavHPN81n8rTCG07k
 ni2hbnUcZU2AE2dxpILoiJf0UBnvYOWp4oly0USSM9EUNbHWznN7ZZX2OAoGCguxp01W
 Hg70WRErYgX2sOitXR7xadD1Pc7sTq8dgINcrLepr8NtObT8T+MsAkEQ2sw0RWhNfEsd
 J2usuqDK/jlprq5LOJs2mLS+zwmk/z43A1Benusa2Jny3rqurvlve1ctjrIdoGBPYWQG
 8Uqiu8MjcnYn/U+5KCqq8fAv6k5NlkzZ/kuPwj0nn7ckAgRlDC83K3s7+M4t58FTk08m
 hKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1fWnYAgdd6W4c97+7rqkG3ENQw1D1kINYaL1yf5uU3Y=;
 b=Y8Hh+b6MUY+iCLxbVqUuy/gOCL1diZcahDEGF299D9WLDJzwlzRaawPwhnmW6Kz8o2
 8MXmL0boGOeUBo6C75kZDOHfU9CADdoe/jlizzxA6ijsRfoPmySxNPFHw2+488Q783Os
 1eS0ZwsRRSQ2/sp820PPZtPeZccjBgsedMhHi+90SDyMb9cDB0d+JAGEXrcse0kCf5C3
 nM9M+yVlcKOB/xyLlLW8obce02lYoEkgJ+AoqePj0JxuO6SdPE1UtswlTqUwfRWIH3b2
 Do2L2V3Bv9rXbF9xYVwKzK8IMZHTjbnTygQNmBX4CbaS0LZRs65Ni6AbVcgfCcsU4MFJ
 3+5Q==
X-Gm-Message-State: AOAM530RBkBpIfdglUitbHq7Tx7i9mQPc6dlDN6Z1aRG/IAU83/zEXVp
 5qBA40jUCD7dJtpF5i3CPEDInQ==
X-Google-Smtp-Source: ABdhPJxPggrR01+u/DCN/EAvMkCXBzN+WTrpG6sVFWthwCPyMaUend0BswDqA+51elzLnjqwoloE4g==
X-Received: by 2002:a65:4886:: with SMTP id n6mr3523614pgs.515.1644443814614; 
 Wed, 09 Feb 2022 13:56:54 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id c18sm20165903pfp.181.2022.02.09.13.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 13:56:54 -0800 (PST)
Message-ID: <518fd6d9-4b74-d8ad-3e72-360c5ca899f6@linaro.org>
Date: Thu, 10 Feb 2022 08:56:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] linux-user: trap internal SIGABRT's
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220209112207.3368139-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209112207.3368139-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 22:22, Alex Bennée wrote:
> linux-user wants to trap all signals in case they are related to the
> guest. This however results in less than helpful core dumps when the
> error is internal to QEMU. We can detect when an assert failure is in
> progress by examining __glib_assert_msg and fall through to
> cpu_abort() which will pretty print something before restoring the
> default SIGABRT behaviour and dumping core.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   linux-user/signal.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 32854bb375..8ecc1215f7 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -809,6 +809,8 @@ static inline void rewind_if_in_safe_syscall(void *puc)
>       }
>   }
>   
> +GLIB_VAR char *__glib_assert_msg;
> +
>   static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>   {
>       CPUArchState *env = thread_cpu->env_ptr;
> @@ -821,6 +823,10 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>       uintptr_t pc = 0;
>       bool sync_sig = false;
>   
> +    if (__glib_assert_msg) {
> +        cpu_abort(cpu, "internal QEMU error, aborting...");
> +    }

I think we should not be trapping SIGABRT.  I think we can preserve all guest behaviour 
wrt SIGABRT by stealing another SIGRTMIN value, and remapping the guest signal number.  We 
can produce the correct result for the system by mapping it back to host SIGABRT in 
core_dump_and_abort().


r~

