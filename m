Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C4363766
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:49:24 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDQ3-0006Yv-WF
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDON-0005ic-A8
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:47:41 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDOF-0006I3-QU
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:47:37 -0400
Received: by mail-qt1-x832.google.com with SMTP id z25so1946489qtn.8
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wYDohcX3+dDL//obqwcBMv60jbzOvkRlr4ThKh+XlE0=;
 b=UUDBDPa/2SDshkeTj6BMr9ihYd629syRMVK5RYmjeGDBqUFiXSUSCPtt5X6arregwR
 WB6kqW51lMzLwklsK5KG0Ae/d501hPsKHCjf6lSon9GaXB0lCJH8HUMlTWxTTjUlYWx4
 E5Yr8E3qmm+GBPI2fkwhjDfkqu8BFjKT4xQZhpdv0wVCJfnYC39chO3zHDQt61WK4+JR
 ko65IkYGQP3DGwQQsCGEUFZ4HYYdJ+RjjIiugLgIF/TkhMIENnPQS1KmXcJTaNDUKdqG
 wT3ImdOQNFH9ONkn+pX0IxukuHmahmzAVJRDYZa8BM/qMN9QfFLuTygigoqxACVlfGwN
 ONlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wYDohcX3+dDL//obqwcBMv60jbzOvkRlr4ThKh+XlE0=;
 b=MqezprahCNuQZnutKLtp0tiaBw2GT7lRoUwJWcbPwOqzxJqNtULWDeVZflCQTErrNP
 MhNUh7lAvc2ymIkVGYdUr/YMCpJbmTK2xD9yl8wcQRJ4d7YQm4K+wPDV62NyjE+v08Pg
 DLa3V+DUruaO6viaHOTxyIAR3I7nXx3KWP9J5JZy9/Am6mufKdzAvhrwCYaiiLMsBdqE
 ssYo0Pi/H4ztQC9Qb9mo3DyqN8TScLZY3hgyJOo4HsqknHg2tZT4rmeT/8ghF/Rhb2Ki
 BiYTrt0vL2YP511Gj+EKNKPIRFPB8rsLZkXXmVhbYvNnh7dHEfbdU2FkGqGgQWFnbuyC
 fgvQ==
X-Gm-Message-State: AOAM533fUpn/BnZ0B8jMQQOmyGcmqijpF8rh8qtDqmDBr2MMPRg7BcIf
 iAQT0n4sAuSkdvfEBPBz65ekcw==
X-Google-Smtp-Source: ABdhPJwsVJ9mpMpIddmDYoaXNeJXJloQ0P+r7n5SPu3UgRJ9UMGz0u7aOF9iRtUsT241icirDiq+Ow==
X-Received: by 2002:a05:622a:3cf:: with SMTP id
 k15mr8349113qtx.282.1618775250672; 
 Sun, 18 Apr 2021 12:47:30 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id b4sm8392164qkf.64.2021.04.18.12.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:47:30 -0700 (PDT)
Subject: Re: [PATCH 18/26] target/mips: Move Special opcodes to
 tcg/sysemu/special_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c41b44fe-99b2-cb97-f486-07a539a0aa4d@linaro.org>
Date: Sun, 18 Apr 2021 12:47:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Move the Special opcodes helpers to tcg/sysemu/special_helper.c.
> 
> Since mips_io_recompile_replay_branch() is set as
> CPUClass::io_recompile_replay_branch handler in cpu.c,
> we need to declare its prototype in "tcg-internal.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -static void set_pc(CPUMIPSState *env, target_ulong error_pc)
> -{
> -    env->active_tc.PC = error_pc & ~(target_ulong)1;
> -    if (error_pc & 1) {
> -        env->hflags |= MIPS_HFLAG_M16;
> -    } else {
> -        env->hflags &= ~(MIPS_HFLAG_M16);
> -    }
> -}

I'll note that this is identical to mips_cpu_set_pc, bar CPUState vs CPUMIPSState.


r~

