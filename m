Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249174C3A4C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 01:26:07 +0100 (CET)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNOQv-0004Cg-OA
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 19:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNOOx-0003Ui-Az
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:24:05 -0500
Received: from [2607:f8b0:4864:20::433] (port=43829
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNOOu-0002YQ-TW
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:24:02 -0500
Received: by mail-pf1-x433.google.com with SMTP id d187so3274818pfa.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 16:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5xId7IbM/cQB2Q3JBSdNWNKaMW8yFuKHfh7lAP2GaRI=;
 b=jl/A9P4ELXtSEUgCwqVRLToDpxRg/BmkYVL4PhQTHEncZOld7PlawxEc3sseQbfs2g
 59MUqrwebtWgmpzCahotuzhRQHyZvry3bybR2zRQKPf8+mIEG2Xoj2HZXHQjvofes8Mr
 XVHUkt2l5KlJIa9GdK9CPU00p85o++z2O0KFINV4RGuX3xk1L4FCL5/s2MgX0iigbJqL
 S61UaqoNwPuIODjotpz9kbmj4WXG4K2w1pcGBSpjNrmlFDdQBQHbHSFfLK2sz4LEL/z2
 3U7cd+uHkrbRN9stJmwtht+C5Znv9js4fqqIFspyc+Z9kyb+ZyX0vjrLn23cmGIuaYjC
 iU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5xId7IbM/cQB2Q3JBSdNWNKaMW8yFuKHfh7lAP2GaRI=;
 b=N1ZGQSnT9GZxlYhtaL+NlqN8K2YrEZUDV2WAb8fl7piLf73DNLUwhod2MxaBs92ho1
 yb7dsLu2KbgtjV8iIpi6TfrGBPEcOfwJz3v2sCb98YM6bZyatqOVEmk/jjNMXrbuAK9R
 u8IA20L/KiPibMQgT6hmh4zh4LioJKHiqgNTd96xvupM2fNczyrQwFlmyTQYTwl9WxE4
 3byboO1Hw8wCukh4VhChayWX5+ld84T5fpsxaLM6F+ONjdHJfvaMRyvpt3fOIbi0xZ/A
 tpiLxOVr4gSH9Z3NAYx0ZRZBSgbC/34Rp4qdYTgxWrKs+KLO/pRgJf03jHLnRAuUxeEL
 4Byg==
X-Gm-Message-State: AOAM530CQAeJC74+N9qwxFvx6ZF1Mly0JO6hKvZG1b27LgZqPW24PgcV
 iHlklu3sE17933gPcMDKIpjmeA==
X-Google-Smtp-Source: ABdhPJzNE2uNzx99RUu3PfKM0Iwlw604HvdZuznoYaualrQOoYNVXQUf0VUZgVupMf2pxlRbtVZ41g==
X-Received: by 2002:a62:1881:0:b0:4e0:1b4c:36f8 with SMTP id
 123-20020a621881000000b004e01b4c36f8mr5212970pfy.26.1645748639317; 
 Thu, 24 Feb 2022 16:23:59 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s11-20020a056a00194b00b004e1131f86d2sm690114pfk.8.2022.02.24.16.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 16:23:58 -0800 (PST)
Message-ID: <cf2e9636-5824-d96d-9a4f-60c677edbbbe@linaro.org>
Date: Thu, 24 Feb 2022 14:23:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] accel/tcg/cpu-exec: fix precise single-stepping after
 interrupt
Content-Language: en-US
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20220214132656.11397-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220214132656.11397-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 03:26, Luc Michel wrote:
> In some cases, cpu->exit_request can be false after handling the
> interrupt, leading to another TB being executed instead of returning
> to the main loop.
> 
> Fix this by returning true unconditionally when in single-step mode.
> 
> Fixes: ba3c35d9c4026361fd380b269dc6def9510b7166
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
> Coming back on this issue I worked on with Richard in 2020. The issue is
> that when debugging the guest with GDB, the first instruction of the IRQ
> handler is missed by GDB (it's still executed though).
> 
> It happened to me again in TCG RR mode (but not in MTTCG). It seems that
> cpu->exit_request can be false in RR mode when returning from
> cc->tcg_ops->cpu_exec_interrupt, leading to cpu_handle_interrupt
> returning false and the next TB being executed, instead of the EXCP_DEBUG
> being handled.
> ---
>   accel/tcg/cpu-exec.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 8b4cd6c59d..74d7f83f34 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -796,13 +796,17 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>                   /*
>                    * After processing the interrupt, ensure an EXCP_DEBUG is
>                    * raised when single-stepping so that GDB doesn't miss the
>                    * next instruction.
>                    */
> -                cpu->exception_index =
> -                    (cpu->singlestep_enabled ? EXCP_DEBUG : -1);
> -                *last_tb = NULL;
> +                if (unlikely(cpu->singlestep_enabled)) {
> +                    cpu->exception_index = EXCP_DEBUG;
> +                    return true;

By returning here, you also need to qemu_mutex_unlock_iothread().

> +                } else {

You can remove the else after the return.
Otherwise this looks good; sorry for the delay.


r~

