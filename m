Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507F357611
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 22:32:11 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUEqQ-0004mW-ID
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 16:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEpH-0004Fe-Na
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:30:59 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEpE-0000a9-RC
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 16:30:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so1956475pjb.0
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W0hc5Bm7oMiIDOpoPlXJJxGGtWi0inbZKjsUytplVDs=;
 b=GQ53kQfjgTGTfb0LkeP+wQ7dl1EYXPCCAXC2awna7sX3UzRV0UdXtkfw+glEW7iLBS
 FZTexhVBW9wJugCRyb8FFwrzr/wki/LBDyKZR4KhS6UE6tVsx4baUmNae9kM3kb65m3k
 VoIOH9YtLKBk99T2wzRQqWcDvAe83+eIsUMQ0xXU/F3cmkor9tXKdK4KssRZdCD4bgkp
 rXeGtV/+nle/tFZ8ai2LiKwrgDE+0ApB7rs7TW/fCiNKATM5SKAVrtvQCPXOPlnyDEEb
 eMZef2Cint/3BP5z/74Ou+4bmx+mJ4dXqY6+ep+cTgMFAz+2TdI2wAOhPHWCZ9NmUT1c
 YLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W0hc5Bm7oMiIDOpoPlXJJxGGtWi0inbZKjsUytplVDs=;
 b=W/XnhB4jKAAVQc2sYS0MLiZKyjkwZBmGhuIXWr7EnrxYt+TgmKsQLBNVVV29dhvoHZ
 Tv4vVKxaVJoD5d7ZRT3DXvSkeaE54U0cPuqvncMUEOQTyDvWacq2+V6wH/8lHobzi2or
 lxHztucnq+BfZaVDALTm7TibeToRX2d6eo0lQVQnawb761i+pwQld36k6xEWTZHqwH0m
 2hpgPfZlUifh6DVuMIYYi00ptKFFTpOyNe68fU1qbwdTpCq/MvtmqJ1iyVpRxCaCnZf/
 V/pnf5iInrpgzrpCxshw/3fUDF8b1VJSBTBc4jjQJUovLbDuzB0ESR3XjkGcHKnJjUhC
 DzTQ==
X-Gm-Message-State: AOAM5320kAg6i8mFoKJbFnbXxq0fKliNd3bXVAp8e2O4+7o4LDZXLMaB
 CWmEdWkgT0+iL7FNRwtmJNuOlg==
X-Google-Smtp-Source: ABdhPJxw7cWxVANg8g6NqBNkKplxqoBhNKtvRggsUOzT5zu6rKQgT1LPJeeBn6tzf14BUHumtDLMvg==
X-Received: by 2002:a17:90a:474e:: with SMTP id
 y14mr5068956pjg.127.1617827454964; 
 Wed, 07 Apr 2021 13:30:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x20sm6199291pjp.12.2021.04.07.13.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 13:30:54 -0700 (PDT)
Subject: Re: [PATCH 14/27] arc: Add support for ARCv2
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-15-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <598705ec-c0fb-1808-e532-e764e2d87104@linaro.org>
Date: Wed, 7 Apr 2021 13:30:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-15-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> diff --git a/configure b/configure
> index 535e6a9269..80d993fac7 100755
> --- a/configure
> +++ b/configure
> @@ -680,6 +680,8 @@ elif check_define __arm__ ; then
>     cpu="arm"
>   elif check_define __aarch64__ ; then
>     cpu="aarch64"
> +elif check_define __arc__ ; then
> +  cpu="arc"
>   else
>     cpu=$(uname -m)
>   fi

This is host related, not target.

> diff --git a/disas.c b/disas.c
> index a61f95b580..a10fa41330 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -208,6 +208,8 @@ static void initialize_debug_host(CPUDebug *s)
>       s->info.cap_insn_split = 6;
>   #elif defined(__hppa__)
>       s->info.print_insn = print_insn_hppa;
> +#elif defined(__arc__)
> +    s->info.print_insn = print_insn_arc;
>   #endif

As is this.

Until arc can self-host qemu, you don't need them.

> --- a/hw/arc/Makefile.objs

Leftover from before meson.build.


r~

