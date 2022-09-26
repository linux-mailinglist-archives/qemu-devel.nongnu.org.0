Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE445EAE05
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:20:12 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrm7-0006bV-Qj
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrUD-0000SO-Db; Mon, 26 Sep 2022 13:01:41 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrU4-0004Ce-J6; Mon, 26 Sep 2022 13:01:41 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so9996626fac.13; 
 Mon, 26 Sep 2022 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1Y/035a3Fx59JoSlTShhRSg92lYufJJaGWRxf9xq138=;
 b=jaeLmOGsL+73EPXobduTCZHa7VxfgU/DEsIlmDi8zduU7diTX0lqPA7fTXOSwrPTms
 LHHkFPU9cJAYj2G35WZmKKPWvYv+wKgFPlxPime1MUBNKlo+FGFsvDglYJWY5SrHjde9
 WZr94Yt4UQ3P4St927pgtILrfDA3o30fREplZKCfBNNNonQ8ZuCn/fcY5/f3J7Kjh5fY
 1kIHZGZfferm6CfCDHWv02PFLaXgyC56t23blfJy8ZMAc71Kci+RmnbtHZBLlJaiO5wY
 j+2uJOQiPInjvNp4qqgtyRYaKbjoj53cdS/LmrkbJanAo5y2HiKz45a0w/7SAeEc43Zf
 3wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1Y/035a3Fx59JoSlTShhRSg92lYufJJaGWRxf9xq138=;
 b=Dqa2XFFc5Z15DPFA1IRbeoLex7jdOIWkkc4tl6htvRty59qXcf9gsLQRoC6l7DZq5S
 tpFlb4/FVYpgg3dx2gQGi27KiAxoGgpYzBoEJfhUHXR5+5LKvpqW0rqlyjk6GMAJxfwZ
 3Zg5Ky4x9WLwpUqzNpPzZFZaoYCmeE4EGFXzmvQ2xxkj6OrMoeKJJC3S1++E7SUHkGVh
 3T0qpgtReW28VR5uHGqGPRbhgKSyzTTVAes+5As23Ty80AYODcEt77ig7QaUtGNX8X3V
 rmUXXak2Rb62eAfWX5VuDyosSYNcIvqkAXEBvMaur+Jg6vhLUTzgLa4kawuNVxuRZMsa
 Ml2w==
X-Gm-Message-State: ACrzQf3hRThZP8NnEmV/5ssne/ia6MvmwVdpSqKJyi0rT8VLbr9ggSYh
 8963u5urEMUcBpEAUCrfr/gcr8uTkco=
X-Google-Smtp-Source: AMsMyM7gzrRMfMziWq2ixtPkNWlWjU9bseAxdejUqpHYbQUwdBopV6o/y3e0L1h4QBOUM4aB/dWGBw==
X-Received: by 2002:a05:6870:1490:b0:126:e07:2a4a with SMTP id
 k16-20020a056870149000b001260e072a4amr12382986oab.2.1664211690123; 
 Mon, 26 Sep 2022 10:01:30 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 y17-20020a056870419100b0010d7242b623sm9407682oac.21.2022.09.26.10.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 10:01:29 -0700 (PDT)
Message-ID: <3b5fa719-ec05-3088-c502-d4afc9aecce8@gmail.com>
Date: Mon, 26 Sep 2022 14:01:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] target/ppc: restore powerpc_excp_booke doorbell interrupts
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220924114436.1422786-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220924114436.1422786-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 9/24/22 08:44, Nicholas Piggin wrote:
> This partially reverts commit 9dc20cc37db9 ("target/ppc: Simplify
> powerpc_excp_booke"), which removed DOORI and DOORCI interrupts.
> Without this patch, a -cpu e5500 -smp 2 machine booting Linux
> crashes with:
> 
>    qemu: fatal: Invalid PowerPC exception 36. Aborting
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   target/ppc/excp_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 214acf5ac4..43f2480e94 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1247,6 +1247,12 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>       case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
>           env->spr[SPR_BOOKE_ESR] = ESR_SPV;
>           break;
> +    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
> +        break;
> +    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> +        srr0 = SPR_BOOKE_CSRR0;
> +        srr1 = SPR_BOOKE_CSRR1;
> +        break;
>       case POWERPC_EXCP_RESET:     /* System reset exception                   */
>           if (FIELD_EX64(env->msr, MSR, POW)) {
>               cpu_abort(cs, "Trying to deliver power-saving system reset "

