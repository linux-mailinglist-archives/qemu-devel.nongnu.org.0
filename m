Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1B5AD903
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:27:16 +0200 (CEST)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGoV-0007Nk-IM
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGir-0000yI-OQ; Mon, 05 Sep 2022 14:21:25 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGin-0001rf-7a; Mon, 05 Sep 2022 14:21:25 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11eab59db71so22968108fac.11; 
 Mon, 05 Sep 2022 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DlF5rX4Thk8WInUhhGWH0Ghj+1W0aH+WuSEMJ66Fz0E=;
 b=jvUCNJClC7o4csNsn9FD9u3I1h6I15ahUsAhtnzCHYq75v/Xm5fX4xWO5wnbdk4ef+
 yLUARaOuAMOszFcV668TlA0aMP5fDUQ4831NFrHgZYqjq/g2wmscgm5Jlg/ZSS1eQQU3
 aTmOtSnQXiyUmMCMUm7ZS9Aht3lZ9G4MSMn+Wt9TlDnzwCFvyDqLvJvVJ2z59N+N79Y1
 5SF11XvQGDPa1MleTJKBtf0ywWFLllG0YtqsWH4k3OJVPQuGRMFZ6g1vbC0tI2CDVfZn
 k0LdwdsOQNf4V76kSpx9mp8yc3efgHGHpYxJOCsBBpPgSfgnWMuNlAlikczDUa13R+OL
 A73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DlF5rX4Thk8WInUhhGWH0Ghj+1W0aH+WuSEMJ66Fz0E=;
 b=TzJXHevt5q/sI1YMHy/mKXEfPFf2k/3tVwLG/w1JCU6rNKtCsrY5kyuHrfp/MviniR
 BJ98IQMwghJzifzWnXWJ01qz8tlzNGCsgu9OtQuDguwnwmg4/xHPpw7KLu4j1tcmTPtL
 msgddhLJ8gLbXFxA15yIII1msI2NOOer4eZ85a/GRybBaX5uWGZSXNKkf5F6816SJiVD
 XXK03MFyvdcxYGJpw7zkZwLFjIChqMXLycBOJq1wW/RKX/F33Vw0oDtQuf2Uli6PPskd
 7biXi5ReCdZuriX3uqiLbWsRkPLAp0q2lK8KZpiRqd9buZCsCR/svmhpxB8QxJUnFXZg
 hZRw==
X-Gm-Message-State: ACgBeo2b0ZXuyHdaLNsObU93SOlxlOsrFqCs3fTXK9HhfDqQHP5F4eVa
 /q8BlUFMa2kAlbu9IP7ZJuI=
X-Google-Smtp-Source: AA6agR5VPV4rcMlg8fxsCM9gF49gaLFhHQNXAH+05jGtqYGtxAVfDmZxUgB+92fp/83sWK62QcDaZA==
X-Received: by 2002:a05:6808:1395:b0:345:29c9:eec9 with SMTP id
 c21-20020a056808139500b0034529c9eec9mr8656292oiw.10.1662402079674; 
 Mon, 05 Sep 2022 11:21:19 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056870c14c00b0012644cc4feasm3231647oad.55.2022.09.05.11.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:21:19 -0700 (PDT)
Message-ID: <85d51bff-9943-06e6-6cac-473ebf5bea4f@gmail.com>
Date: Mon, 5 Sep 2022 15:21:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 04/19] target/ppc: Set result to QNaN for DENBCD when
 VXCVI occurs
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-5-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-5-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
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



On 9/1/22 10:17, Víctor Colombo wrote:
> According to the ISA, for instruction DENBCD:
> "If an invalid BCD digit or sign code is detected in the source
> operand, an invalid-operation exception (VXCVI) occurs."
> 
> In the Invalid Operation Exception section, there is the situation:
> "When Invalid Operation Exception is disabled (VE=0) and Invalid
> Operation occurs (...) If the operation is an (...) or format the
> target FPR is set to a Quiet NaN". This was not being done in
> QEMU.
> 
> This patch sets the result to QNaN when the instruction DENBCD causes
> an Invalid Operation Exception.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/dfp_helper.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
> index be7aa5357a..cc024316d5 100644
> --- a/target/ppc/dfp_helper.c
> +++ b/target/ppc/dfp_helper.c
> @@ -1147,6 +1147,26 @@ static inline uint8_t dfp_get_bcd_digit_128(ppc_vsr_t *t, unsigned n)
>       return t->VsrD((n & 0x10) ? 0 : 1) >> ((n << 2) & 63) & 15;
>   }
>   
> +static inline void dfp_invalid_op_vxcvi_64(struct PPC_DFP *dfp)
> +{
> +    /* TODO: fpscr is incorrectly not being saved to env */
> +    dfp_set_FPSCR_flag(dfp, FP_VX | FP_VXCVI, FPSCR_VE);
> +    if ((dfp->env->fpscr & FP_VE) == 0) {
> +        dfp->vt.VsrD(1) = 0x7c00000000000000; /* QNaN */
> +    }
> +}
> +
> +
> +static inline void dfp_invalid_op_vxcvi_128(struct PPC_DFP *dfp)
> +{
> +    /* TODO: fpscr is incorrectly not being saved to env */
> +    dfp_set_FPSCR_flag(dfp, FP_VX | FP_VXCVI, FPSCR_VE);
> +    if ((dfp->env->fpscr & FP_VE) == 0) {
> +        dfp->vt.VsrD(0) = 0x7c00000000000000; /* QNaN */
> +        dfp->vt.VsrD(1) = 0x0;
> +    }
> +}
> +
>   #define DFP_HELPER_ENBCD(op, size)                                           \
>   void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
>                    uint32_t s)                                                 \
> @@ -1173,7 +1193,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
>               sgn = 0;                                                         \
>               break;                                                           \
>           default:                                                             \
> -            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
> +            dfp_invalid_op_vxcvi_##size(&dfp);                               \
> +            set_dfp##size(t, &dfp.vt);                                       \
>               return;                                                          \
>           }                                                                    \
>           }                                                                    \
> @@ -1183,7 +1204,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
>           digits[(size) / 4 - n] = dfp_get_bcd_digit_##size(&dfp.vb,           \
>                                                             offset++);         \
>           if (digits[(size) / 4 - n] > 10) {                                   \
> -            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
> +            dfp_invalid_op_vxcvi_##size(&dfp);                               \
> +            set_dfp##size(t, &dfp.vt);                                       \
>               return;                                                          \
>           } else {                                                             \
>               nonzero |= (digits[(size) / 4 - n] > 0);                         \

