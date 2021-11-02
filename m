Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D14429A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:39:59 +0100 (CET)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpKo-00033m-6h
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpJ2-0001zD-FO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:38:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpJ0-000214-Ea
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:38:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id v127so14900042wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BVP2S75eoU4XoUHZTuEL7Ws/+vPyQwpN4pIg5tPMXUo=;
 b=R93dQ73dhtkbwrg6HNLD7Sd9LEmgLUpwpDhbDz6gleCIsYsAgKOLb+/Xq3mblmNrIw
 vRqO7eMiO13hc+YuuYnanxppWPp2TYgbXZuG2YRJSZ8l64AuPeAY35p9YkkqNwfJjmfU
 1ADUKYKCHgOhUgyHKb9mOFp6BJ2/MGzxZHybngMX11K3LcYwETMG7HRX5px7F1rzTtvC
 S/U7DC/QHHcuCk6NCCFKmNyb0fcDmjOzgmsBNqwpMzGXAUwZdOccwJmzgUnKx725uZEa
 J+NO/pCg2geHB5XcCaPlqV1cuTfaHkOk5a476/JFzxIgDmzgy0kq40fxfGv2gAUGwWjP
 8R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BVP2S75eoU4XoUHZTuEL7Ws/+vPyQwpN4pIg5tPMXUo=;
 b=quN/ZOnTXRhKl3YIqnPTAotuoFVa0LG8mZHrnc0a9hBXh8vNBQVAC0ulo4dLRCaAmZ
 Vh/rcCZVIQXyPq/UgyN4qJZCToYHoXW0Wsd5ZdGMwCXx7rC+h+QySkot6wDiyTGpiAV0
 6Ftiif/kFzIeP7+AhfnttlyZzl/wgZyKSyAPidzvq+5GK9NhXyKYThBT3oOWTz4UO0Nd
 7yT6V6qQpKtWu8xNX4ANPKHljQaHM/UB/GZpMORj0q5iGBPRN6Kn8K6xhccAw8LgACS9
 TYTi1u6fR40kLbwGBADGJISR3SdaFm9CzUfcWBcEGxBNDBSebIzsj2M4rqK+ZzrZkr/Y
 8ujg==
X-Gm-Message-State: AOAM5334daCTQkixj5a/ELSgcmDJ8ApddBGgJdDi6nIP4Q3UOKcSLeYO
 J/iNiy6F0P1Yea6TiV2kuaw=
X-Google-Smtp-Source: ABdhPJyQg48XZ7kxDHL7uY2zuOEwYnBiRzAqhxkpKKc9y30AoRAFA1KsE6qnSqG2zbvI0PysyilLag==
X-Received: by 2002:a05:600c:c1:: with SMTP id
 u1mr5166849wmm.163.1635842284906; 
 Tue, 02 Nov 2021 01:38:04 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x13sm12623241wrr.47.2021.11.02.01.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:38:04 -0700 (PDT)
Message-ID: <bdc9d879-dbe7-dc48-7bf5-4d150996174a@amsat.org>
Date: Tue, 2 Nov 2021 09:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 02/29] target/loongarch: Add core definition
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
 <1635760311-20015-3-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1635760311-20015-3-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, i.qemu@xen0n.name,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 10:51, Song Gao wrote:
> This patch adds target state header, target definitions
> and initialization routines.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  target/loongarch/cpu-param.h |  19 +++
>  target/loongarch/cpu.c       | 352 +++++++++++++++++++++++++++++++++++++++++++
>  target/loongarch/cpu.h       | 254 +++++++++++++++++++++++++++++++
>  target/loongarch/internals.h |  22 +++
>  4 files changed, 647 insertions(+)
>  create mode 100644 target/loongarch/cpu-param.h
>  create mode 100644 target/loongarch/cpu.c
>  create mode 100644 target/loongarch/cpu.h
>  create mode 100644 target/loongarch/internals.h

> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c

> +static void set_loongarch_cpucfg(CPULoongArchState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < 49; i++) {
> +        env->cpucfg[i] = 0x0;
> +    }
> +
> +    env->cpucfg[0] = 0x14c010;  /* PRID */

Why do you insist in calling this generically and not
loongarch_3a5000_initfn()? If you want a generic function,
why not pass PRID and xtal freq as arguments?

> +
> +    uint32_t data = 0;
> +    data = FIELD_DP32(data, CPUCFG1, ARCH, 2);
> +    data = FIELD_DP32(data, CPUCFG1, PGMMU, 1);
> +    data = FIELD_DP32(data, CPUCFG1, IOCSR, 1);
> +    data = FIELD_DP32(data, CPUCFG1, PALEN, 0x2f);
> +    data = FIELD_DP32(data, CPUCFG1, VALEN, 0x2f);
> +    data = FIELD_DP32(data, CPUCFG1, UAL, 1);
> +    data = FIELD_DP32(data, CPUCFG1, RI, 1);
> +    data = FIELD_DP32(data, CPUCFG1, EP, 1);
> +    data = FIELD_DP32(data, CPUCFG1, RPLV, 1);
> +    data = FIELD_DP32(data, CPUCFG1, HP, 1);
> +    data = FIELD_DP32(data, CPUCFG1, IOCSR_BRD, 1);
> +    env->cpucfg[1] = data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG2, FP, 1);
> +    data = FIELD_DP32(data, CPUCFG2, FP_SP, 1);
> +    data = FIELD_DP32(data, CPUCFG2, FP_DP, 1);
> +    data = FIELD_DP32(data, CPUCFG2, FP_VER, 1);
> +    data = FIELD_DP32(data, CPUCFG2, LSX, 1);
> +    data = FIELD_DP32(data, CPUCFG2, LASX, 1);
> +    data = FIELD_DP32(data, CPUCFG2, COMPLEX, 1);
> +    data = FIELD_DP32(data, CPUCFG2, CRYPTO, 1);
> +    data = FIELD_DP32(data, CPUCFG2, LLFTP, 1);
> +    data = FIELD_DP32(data, CPUCFG2, LLFTP_VER, 1);
> +    data = FIELD_DP32(data, CPUCFG2, LSPW, 1);
> +    data = FIELD_DP32(data, CPUCFG2, LAM, 1);
> +    env->cpucfg[2] = data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG3, CCDMA, 1);
> +    data = FIELD_DP32(data, CPUCFG3, SFB, 1);
> +    data = FIELD_DP32(data, CPUCFG3, UCACC, 1);
> +    data = FIELD_DP32(data, CPUCFG3, LLEXC, 1);
> +    data = FIELD_DP32(data, CPUCFG3, SCDLY, 1);
> +    data = FIELD_DP32(data, CPUCFG3, LLDBAR, 1);
> +    data = FIELD_DP32(data, CPUCFG3, ITLBHMC, 1);
> +    data = FIELD_DP32(data, CPUCFG3, ICHMC, 1);
> +    data = FIELD_DP32(data, CPUCFG3, SPW_LVL, 4);
> +    data = FIELD_DP32(data, CPUCFG3, SPW_HP_HF, 1);
> +    env->cpucfg[3] = data;
> +
> +    env->cpucfg[4] = 0x5f5e100; /* Crystal frequency */
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG5, CC_MUL, 1);
> +    data = FIELD_DP32(data, CPUCFG5, CC_DIV, 1);
> +    env->cpucfg[5] = data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG16, L1_IUPRE, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L1_DPRE, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRE, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L2_IUUNIFY, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRIV, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L3_IUPRE, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L3_IUUNIFY, 1);
> +    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1);
> +    env->cpucfg[16] = data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003);
> +    data = FIELD_DP32(data, CPUCFG17, L1IU_SETS, 0x60);
> +    env->cpucfg[17] =  data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG18, L1D_WAYS, 0x8003);
> +    data = FIELD_DP32(data, CPUCFG18, L1D_SETS, 0x60);
> +    env->cpucfg[18] = data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG19, L2IU_WAYS, 0x800f);
> +    data = FIELD_DP32(data, CPUCFG19, L2IU_SETS, 0x60);
> +    env->cpucfg[19] = data;
> +
> +    data = 0;
> +    data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 0xf00f);
> +    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 0x60);
> +    env->cpucfg[20] = data;
> +}
> +
> +static inline void loongarch_3a5000_initfn(Object *obj)

'inline' is not justified.

> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
> +    CPULoongArchState *env = &cpu->env;
> +
> +    set_loongarch_cpucfg(env);
> +}

