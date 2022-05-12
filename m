Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCE525288
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:28:46 +0200 (CEST)
Received: from localhost ([::1]:58126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBgD-0007hq-GE
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npBau-0004YV-DN
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:23:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npBas-00038c-J3
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:23:16 -0400
Received: by mail-pf1-x436.google.com with SMTP id x52so5231139pfu.11
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jbMajgACfEG4N2+wj8hWnvACNoW9EW4V2ysY0ay4WF8=;
 b=lDInX2VhCYpVhAFEyMC0g+NlLSlenr33aAgKPAPeNYvxv3pFEzi2LuXkpLrQ5IuNBZ
 FuUhe3vj9t8Gp2Ef+pyqJzaRN1SdMJnxZA38QDYpwUdB8+gUGrfq9UIRffJjW6k/uwBe
 z8+szmtpknQTVC3i5g8MQOggwVNeI/thZDRuR/LGnpqE3WAZ3ggSBZ/jplOZXGWX1bWw
 B+SeR3xHnzhm7p+m0E66chiimMFXuGs1fSSjeykKzi8AW3tx54r/LM+mJIKs8wOAPG/N
 99Xyv7aN6IhSoEEpFtpEWG23gJaoY2khx8l2t1AVoTmYH4QN5oqLHV5IybdRfFln1jf6
 fcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jbMajgACfEG4N2+wj8hWnvACNoW9EW4V2ysY0ay4WF8=;
 b=TwmOsc0CWd0B3z1o5lKO7W6r3axu01gFFVACxZ0rwhSPZh4AfLxUkbGlTPDq+j5N2R
 +WIRX8b23YdFcGkz9aY2jSuEySVAc0aCatanzMPiJeaR+aDZJCHnBF2EBJhl341foQvS
 0GDLQ4L7CGpWxdVdOQSskxPyl8nUyGlzPOLSM7TlUUCharBqLXrA4VhKr6uJZUzt+Rbo
 /yp8fvvNhV+j/NI/KMU3n+shirZOIu2ZN00hQ0EUZHLDOkavAEm8K5c+8f/+F0/Aj+tB
 S+g3aI/lWRatGtfD5P7wlIihrMNv/w/g1OT77qB+YVcIaTte010H1K6V3n9/NDvqe09d
 zIpQ==
X-Gm-Message-State: AOAM530ypY4/+5Amk8RliqEHwmg2H+SzT2/p00hoIa+HMwv4624xEm3U
 t1D4EVy03C7JuPans1I3LS83tQ==
X-Google-Smtp-Source: ABdhPJwlAmn6BtlHDbDgXNpBPxUs/krJze/CYEADsary7VZqVMTiUtx2ykNy0xkrSRbqTSUh6LF9OQ==
X-Received: by 2002:a63:3409:0:b0:3ab:4d72:1f0a with SMTP id
 b9-20020a633409000000b003ab4d721f0amr367229pga.420.1652372591894; 
 Thu, 12 May 2022 09:23:11 -0700 (PDT)
Received: from ?IPV6:2607:fb90:2827:e3d7:b6c9:cd59:fac5:b31a?
 ([2607:fb90:2827:e3d7:b6c9:cd59:fac5:b31a])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a62f84c000000b0050dc762812dsm62555pfm.7.2022.05.12.09.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 09:23:11 -0700 (PDT)
Message-ID: <6c7fef22-3ac6-ae93-7cd4-0753db428682@linaro.org>
Date: Thu, 12 May 2022 09:23:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Fix aarch64 debug register names.
Content-Language: en-US
To: Chris Howard <cvz185@web.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <4127D8CA-D54A-47C7-A039-0DB7361E30C0@web.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4127D8CA-D54A-47C7-A039-0DB7361E30C0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/22 02:42, Chris Howard wrote:
>  From 5de17d5aacb9cf21de4c9736b227b0498c607709 Mon Sep 17 00:00:00 2001
> From: CHRIS HOWARD <cvz185@web.de>
> Date: Thu, 12 May 2022 11:35:17 +0200
> Subject: [PATCH] Fix aarch64 debug register names.
> 
> Signed-off-by: CHRIS HOWARD <cvz185@web.de>
> ---
>   target/arm/helper.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 432bd81919..0dd97cb905 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6543,14 +6543,16 @@ static void define_debug_regs(ARMCPU *cpu)
>       }
>   
>       for (i = 0; i < brps; i++) {
> +        char *dbgbvr_el1_name = g_strdup_printf("DBGBVR%d_EL1", i);
> +        char *dbgbcr_el1_name = g_strdup_printf("DBGBCR%d_EL1", i);
>           ARMCPRegInfo dbgregs[] = {
> -            { .name = "DBGBVR", .state = ARM_CP_STATE_BOTH,
> +            { .name = dbgbvr_el1_name, .state = ARM_CP_STATE_BOTH,
>                 .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
>                 .access = PL1_RW, .accessfn = access_tda,
>                 .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
>                 .writefn = dbgbvr_write, .raw_writefn = raw_write
>               },
> -            { .name = "DBGBCR", .state = ARM_CP_STATE_BOTH,
> +            { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
>                 .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
>                 .access = PL1_RW, .accessfn = access_tda,
>                 .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
> @@ -6558,17 +6560,21 @@ static void define_debug_regs(ARMCPU *cpu)
>               },
>           };
>           define_arm_cp_regs(cpu, dbgregs);
> +        g_free(dbgbvr_el1_name);
> +        g_free(dbgbcr_el1_name);

If you felt like doing another revision, using g_autofree on the declaration would be 
preferred.  However,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

