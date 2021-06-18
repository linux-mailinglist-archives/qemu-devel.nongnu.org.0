Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2313AD551
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:40:21 +0200 (CEST)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luN9w-0003FS-Rq
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN8K-000226-3r
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:38:40 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN8H-0004iB-GK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:38:39 -0400
Received: by mail-pl1-x633.google.com with SMTP id x19so5452191pln.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sJQeqqvXEjfDkptjZZL1bgXSdetckaUsdId3eQqBRho=;
 b=CRflsCINw6xXDHimdqnbpyc7n9pGe5Okgh3JXNX8jsbI7vS1Fz1UZyGiVQvttDAwj7
 gRojvv5AYzcUPoELg57zO5zkxsI67rbtu9frlOWXLMxxkabknwAKq5DfgUL7BsXTsNkS
 QHecUCxwjQOn0BY8+TcLtOJQTYnmj8QnY7IflHRwTyAmbWq5ryN2E6CkmRFc4llVcLfb
 0uD6hnctqRcXl6sYrcYLcQ4JjioDv7YvYXqcNdCzjPF0mVO9aVQAONpr9PjEUWiN82o8
 bsR7T9D8Vk3cv/dbjMzZ5K6CT6RzGl3ePuQldaGukJMGQlTSB2SxfaSPVehKqOZ2o2ly
 PtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sJQeqqvXEjfDkptjZZL1bgXSdetckaUsdId3eQqBRho=;
 b=A60HeKy3qBFqUo149aNn2zSMNvjca7lOd8l63zhqZBPeAPJPt/W20wfshR/rxQYhYU
 X0PlaIv2zoQh1UXs40T5WPA62fJBaMpg969+mdAPpIEVWMOLfMGF+Zq2JXezbHxZF9Lm
 ajr+pVJOJkeVXX3RieNzLPBiiZngpYP98YTZKSOpmoNDz+7Y6kUgBlMLEOOQZc1rJrkN
 dsIe+Zz2ax0HLJV1ge3YHgf4HmgnpEp8GtB0wEf5eIrJhyRy7VBeWItO1y2bvNkQ/FPP
 7TeB5HfSIDE1OQsiIGHLJ+AAFDP8kHZT7yAfjej9UcwrhfguJUO08vDp7eLg16tHS9IY
 FCyQ==
X-Gm-Message-State: AOAM530CM/h6vEbYNeGHpaWw6QGPqCWFWzz3+mgu5Tvcx/1ADU0uEnpN
 5+yqzFJ4RH0PD+vt2JNH2XjdHQ==
X-Google-Smtp-Source: ABdhPJwTbg0fsJPy92NPyJh9Rt5NGCGkYXxMXfd0gdZPk0yN1XQRPCPK7CckAD5pm2pI0BTFZNzNiA==
X-Received: by 2002:a17:902:ff11:b029:114:37a7:21ad with SMTP id
 f17-20020a170902ff11b029011437a721admr6637872plj.68.1624055915985; 
 Fri, 18 Jun 2021 15:38:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y3sm4036179pga.72.2021.06.18.15.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:38:35 -0700 (PDT)
Subject: Re: [PATCH 5/9] target/mips: Restrict some system specific
 declarations to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e884ae7-321f-ce37-44f6-1790b319e7c5@linaro.org>
Date: Fri, 18 Jun 2021 15:38:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> Commit 043715d1e0f ("target/mips: Update ITU to utilize SAARI
> and SAAR CP0 registers") declared itc_reconfigure() in public
> namespace, while it is restricted to system emulation.
> 
> Similarly commit 5679479b9a1 ("target/mips: Move CP0 helpers
> to sysemu/cp0.c") restricted cpu_mips_soft_irq() definition to
> system emulation, but forgot to restrict its declaration.
> 
> Commit a2b0a27d33e ("target/mips: Move TCG source files under
> tcg/ sub directory") restricted mips_cpu_do_unaligned_access()
> to system emulation but forgot to guard the declaration.

FWIW, I think the unaligned_access tcg_ops hook should be available for user-only as well, 
like for tlb_fill.  That it is sysemu only at the moment is a bug that affects user-only 
atomic access.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> To avoid polluting user-mode emulation with these declarations,
> restrict them to sysemu. Also restrict the sysemu ITU/ITC/IRQ
> fields from CPUMIPSState.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cpu.h              | 10 +++++++---
>   target/mips/tcg/tcg-internal.h |  6 +++---
>   2 files changed, 10 insertions(+), 6 deletions(-)


