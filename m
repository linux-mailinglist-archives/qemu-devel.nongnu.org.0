Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5E60D4AB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:27:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPXh-0007AY-Gl; Tue, 25 Oct 2022 15:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPXa-0006k0-Rq; Tue, 25 Oct 2022 15:24:49 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPXY-0002el-O5; Tue, 25 Oct 2022 15:24:46 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso11121846fac.13; 
 Tue, 25 Oct 2022 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pU2dBjDKoZUYiLlwdkd7SiLOzXhafGS+IObSX4QEItI=;
 b=dfTKizD0hQ0HUq8xO+3j1rHmC+N76e45x4lisb4TtQTKDAsqTom8XzTjHCD+kdR4EI
 3heGhajL4HFc3+LHhwqC2BdL2s5frUs9BEIOHYFjkWngcCMF25TVFxHn6GJ3awWWexZ5
 b08IIpD5d3IVhJd0mgXh3r7+/5MYc2pnlXlPDnWDZZHtfC+d3wjRmRsAu19wvvKxgFkD
 g8qCqJA/CkAEY/nmYWgzoR4/Dy3yt3wGB/rfibC0+jjwzsZj5JRv5XnxuEtgxynYekek
 FIOZABZHlveDUZAgcr2ddOPQ26PiWmrM5giE+tHR9YDW1gWDibU0kAjeMpw1VR05jGpC
 FHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pU2dBjDKoZUYiLlwdkd7SiLOzXhafGS+IObSX4QEItI=;
 b=BU+ygq3keLF4QXqd3NbRwXJs+nzJ7GxompnRy4MhXDRKjQIY3UVKYvLDuLyvgS4MHr
 NzIpuUet78Ur5mCuvvREbXjcRESW/+CCwMLjTW8CbYNvqb2+jyzQj1iNfiT1HADJ2HSy
 0sqhdqH/+Wth6D3xuG6YHRrmj2qm0DzklAhDYfjO3pl4Z1JwYNYg1F3DyLzZ3YI3FZlR
 /FN1FP93/A9snyiczfz3PA0N/wH8OiO2rNn8pJvHL1gPEoQFzWzBePvMgcHp5XADWRls
 DanUfv9hfpcqyUzDpNtWDaDUxC5dwY9zf/WL3Qd+TJcGMrUzqSh0uFNFNGnF+12pD6U/
 67ww==
X-Gm-Message-State: ACrzQf0GJZLNWiIrxHpKM8s0dlJXTK3xUT8sR5MQGV/ILuzoYSUodr8G
 nHa9UIeC867AotfdDGIjq/E=
X-Google-Smtp-Source: AMsMyM6gcWnd4HaCJUH7o5R/F/ZCtNusHVOE97GvsuWhZRTAS0JtmzbNjugWnd9cTOmRKs9idcqDBw==
X-Received: by 2002:a05:6870:179c:b0:136:3c63:3b86 with SMTP id
 r28-20020a056870179c00b001363c633b86mr25825996oae.131.1666725880150; 
 Tue, 25 Oct 2022 12:24:40 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 q84-20020acac057000000b00354d8589a15sm1236368oif.45.2022.10.25.12.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 12:24:39 -0700 (PDT)
Message-ID: <6124d4d2-2197-8950-261e-2b5c21e8dc45@gmail.com>
Date: Tue, 25 Oct 2022 16:24:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/3] target/ppc: Add new PMC HFLAGS
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
 <20221021170112.151393-3-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221021170112.151393-3-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/21/22 14:01, Leandro Lupori wrote:
> Add 2 new PMC related HFLAGS:
> - HFLAGS_PMCJCE - value of MMCR0 PMCjCE bit
> - HFLAGS_PMC_OTHER - set if a PMC other than PMC5-6 is enabled
> 
> These flags allow further optimization of PMC5 update code, by
> allowing frequently tested conditions to be performed at
> translation time.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/cpu.h         | 4 +++-
>   target/ppc/helper_regs.c | 6 ++++++
>   target/ppc/translate.c   | 4 ++++
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index cca6c4e51c..28b9b8d4e3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -696,7 +696,9 @@ enum {
>       HFLAGS_PR = 14,  /* MSR_PR */
>       HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
>       HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
> -    HFLAGS_INSN_CNT = 17, /* PMU instruction count enabled */
> +    HFLAGS_PMCJCE = 17, /* MMCR0 PMCjCE bit */
> +    HFLAGS_PMC_OTHER = 18, /* PMC other than PMC5-6 is enabled */
> +    HFLAGS_INSN_CNT = 19, /* PMU instruction count enabled */
>       HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
>       HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
>   
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 12235ea2e9..65f5f7b2c0 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -109,6 +109,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>       if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
>           hflags |= 1 << HFLAGS_PMCC1;
>       }
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE) {
> +        hflags |= 1 << HFLAGS_PMCJCE;
> +    }
>   
>   #ifndef CONFIG_USER_ONLY
>       if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
> @@ -119,6 +122,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>       if (env->pmc_ins_cnt) {
>           hflags |= 1 << HFLAGS_INSN_CNT;
>       }
> +    if (env->pmc_ins_cnt & 0x1e) {
> +        hflags |= 1 << HFLAGS_PMC_OTHER;
> +    }
>   #endif
>   
>       /*
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e810842925..8fda2cf836 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -177,6 +177,8 @@ struct DisasContext {
>       bool hr;
>       bool mmcr0_pmcc0;
>       bool mmcr0_pmcc1;
> +    bool mmcr0_pmcjce;
> +    bool pmc_other;
>       bool pmu_insn_cnt;
>       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>       int singlestep_enabled;
> @@ -7574,6 +7576,8 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->hr = (hflags >> HFLAGS_HR) & 1;
>       ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
>       ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
> +    ctx->mmcr0_pmcjce = (hflags >> HFLAGS_PMCJCE) & 1;
> +    ctx->pmc_other = (hflags >> HFLAGS_PMC_OTHER) & 1;
>       ctx->pmu_insn_cnt = (hflags >> HFLAGS_INSN_CNT) & 1;
>   
>       ctx->singlestep_enabled = 0;

