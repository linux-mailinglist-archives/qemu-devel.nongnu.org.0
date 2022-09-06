Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D355AF252
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 19:21:35 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVcGU-0001Tq-FK
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 13:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVcC6-00081Z-0c; Tue, 06 Sep 2022 13:17:03 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:34642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVcBz-0001Wd-MD; Tue, 06 Sep 2022 13:17:00 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso8510980otv.1; 
 Tue, 06 Sep 2022 10:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ku8zmnh5nqqZap6oUYDLxyRzuhGbK2y+9xiL+CM8Od4=;
 b=mUnpcpRvC06oZnN1Vs4EgqIomWlq3Owgeh255VIPCkFdZAEBhCDtCDFbeSjqxhle+2
 gqFvBj4+ANawANbFltzZ/UzavS5pZGK07Z4fCh2iPTpg5fTqQmSuZLiaRpGex6G9JUF/
 zcO4ZRgIVVGGam6jc+aqnTxsqvQVd4rWaIJoSk95uQDqhrUEx9ifwv3xMGbv4F9Uh5Xz
 9jhFA/N8qbkRNTAlHTLb7KcALKp+q2DY/ScBdpB1LiURKmWg/6K9XOuLP8wC6JaFYQKg
 /ZK6Nf/IE8fIDl9Q+Yy3uKJKLgt1CZCDkGVXM4KAfbltZBMaJ3gnWWmzN4aVoEQg0uQK
 HheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ku8zmnh5nqqZap6oUYDLxyRzuhGbK2y+9xiL+CM8Od4=;
 b=5keSsm5xDH62NIkEW4QfqJdze6Otf/BzvY5QhmMb+EEgcSWuCsYwadQyIftD0S4KE6
 duYRaQfFedjCHsZUl40HKPVM0OrIV1sQkYdnV+hMOosyyWmad0KsaBefZYq1W5yia31K
 Xqs9jOLaSbhPMrAGuYmJId2Xrbshx1yWKUGwXbvVt3DfgoZ3L7+3wIYtyc+FhH7O1tpE
 2ghUdluOecOA+YFZR/KOXfFOkZKL/HMIC0WdxHZaKRW16YSgD9vMPczgYjEl6LyJU9DQ
 vsYZY5caKJfZThaDTk4LNx+zn/Cg8S4yVF0z2PY4NRoMcZIcHJl/7KPnJt0RSiMGCPvD
 gj9A==
X-Gm-Message-State: ACgBeo0EdyH3YIgYqr6INj53dHbQkFVFZfVl06pOh5cNsv2dOvBIp4Xx
 hXmzO+yTFGGHqxEk+oYrL64=
X-Google-Smtp-Source: AA6agR6X+bWrBSPiA22lqQDRyRX3pphYL4//qfZUKY87neTMXZKzW4pPtrYmdGs7hd+QITkpg7aUCg==
X-Received: by 2002:a05:6830:d10:b0:63b:318e:403a with SMTP id
 bu16-20020a0568300d1000b0063b318e403amr16166414otb.348.1662484612846; 
 Tue, 06 Sep 2022 10:16:52 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 i4-20020a9d68c4000000b00638c25074afsm6053572oto.34.2022.09.06.10.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 10:16:52 -0700 (PDT)
Message-ID: <440d5928-9dcb-5961-2a99-1778f768252c@gmail.com>
Date: Tue, 6 Sep 2022 14:16:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 8/8] target/ppc: Clear fpstatus flags on helpers
 missing it
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
 <20220906125523.38765-9-victor.colombo@eldorado.org.br>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220906125523.38765-9-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.752,
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



On 9/6/22 09:55, Víctor Colombo wrote:
> In ppc emulation, exception flags are not cleared at the end of an
> instruction. Instead, the next instruction is responsible to clear
> it before its emulation. However, some helpers are not doing it,
> causing an issue where the previously set exception flags are being
> used and leading to incorrect values being set in FPSCR.
> Fix this by clearing fp_status before doing the instruction 'real' work
> for the following helpers that were missing this behavior:
> 
> - VSX_CVT_INT_TO_FP_VECTOR
> - VSX_CVT_FP_TO_FP
> - VSX_CVT_FP_TO_INT_VECTOR
> - VSX_CVT_FP_TO_INT2
> - VSX_CVT_FP_TO_INT
> - VSX_CVT_FP_TO_FP_HP
> - VSX_CVT_FP_TO_FP_VECTOR
> - VSX_CMP
> - VSX_ROUND
> - xscvqpdp
> - xscvdpsp[n]
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/fpu_helper.c | 37 ++++++++++++++++++++++++++-----------
>   1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 95b22d99b3..331361234f 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2637,6 +2637,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                     \
>       int all_true = 1;                                                     \
>       int all_false = 1;                                                    \
>                                                                             \
> +    helper_reset_fpstatus(env);                                           \
> +                                                                          \
>       for (i = 0; i < nels; i++) {                                          \
>           if (unlikely(tp##_is_any_nan(xa->fld) ||                          \
>                        tp##_is_any_nan(xb->fld))) {                         \
> @@ -2690,6 +2692,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
>       ppc_vsr_t t = { };                                             \
>       int i;                                                         \
>                                                                      \
> +    helper_reset_fpstatus(env);                                    \
> +                                                                   \
>       for (i = 0; i < nels; i++) {                                   \
>           t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);        \
>           if (unlikely(stp##_is_signaling_nan(xb->sfld,              \
> @@ -2715,6 +2719,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
>       ppc_vsr_t t = { };                                                \
>       int i;                                                            \
>                                                                         \
> +    helper_reset_fpstatus(env);                                       \
> +                                                                      \
>       for (i = 0; i < nels; i++) {                                      \
>           t.VsrW(2 * i) = stp##_to_##ttp(xb->VsrD(i), &env->fp_status); \
>           if (unlikely(stp##_is_signaling_nan(xb->VsrD(i),              \
> @@ -2752,6 +2758,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
>       ppc_vsr_t t = *xt;                                                  \
>       int i;                                                              \
>                                                                           \
> +    helper_reset_fpstatus(env);                                         \
> +                                                                        \
>       for (i = 0; i < nels; i++) {                                        \
>           t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
>           if (unlikely(stp##_is_signaling_nan(xb->sfld,                   \
> @@ -2787,6 +2795,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
>       ppc_vsr_t t = { };                                             \
>       int i;                                                         \
>                                                                      \
> +    helper_reset_fpstatus(env);                                    \
> +                                                                   \
>       for (i = 0; i < nels; i++) {                                   \
>           t.tfld = stp##_to_##ttp(xb->sfld, 1, &env->fp_status);     \
>           if (unlikely(stp##_is_signaling_nan(xb->sfld,              \
> @@ -2834,6 +2844,8 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
>       ppc_vsr_t t = { };
>       float_status tstat;
>   
> +    helper_reset_fpstatus(env);
> +
>       tstat = env->fp_status;
>       if (ro != 0) {
>           tstat.float_rounding_mode = float_round_to_odd;
> @@ -2855,6 +2867,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
>   {
>       uint64_t result, sign, exp, frac;
>   
> +    helper_reset_fpstatus(env);
>       float_status tstat = env->fp_status;
>       set_float_exception_flags(0, &tstat);
>   
> @@ -2910,22 +2923,20 @@ uint64_t helper_XSCVSPDPN(uint64_t xb)
>   #define VSX_CVT_FP_TO_INT(op, nels, stp, ttp, sfld, tfld, sfi, rnan)         \
>   void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
>   {                                                                            \
> -    int all_flags = env->fp_status.float_exception_flags, flags;             \
>       ppc_vsr_t t = { };                                                       \
> -    int i;                                                                   \
> +    int i, flags;                                                            \
> +                                                                             \
> +    helper_reset_fpstatus(env);                                              \
>                                                                                \
>       for (i = 0; i < nels; i++) {                                             \
> -        env->fp_status.float_exception_flags = 0;                            \
>           t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);  \
>           flags = env->fp_status.float_exception_flags;                        \
>           if (unlikely(flags & float_flag_invalid)) {                          \
>               t.tfld = float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC());\
>           }                                                                    \
> -        all_flags |= flags;                                                  \
>       }                                                                        \
>                                                                                \
>       *xt = t;                                                                 \
> -    env->fp_status.float_exception_flags = all_flags;                        \
>       do_float_check_status(env, sfi, GETPC());                                \
>   }
>   
> @@ -2977,12 +2988,12 @@ VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
>   #define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, sfi, rnan)                    \
>   void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
>   {                                                                            \
> -    int all_flags = env->fp_status.float_exception_flags, flags;             \
>       ppc_vsr_t t = { };                                                       \
> -    int i;                                                                   \
> +    int i, flags;                                                            \
> +                                                                             \
> +    helper_reset_fpstatus(env);                                              \
>                                                                                \
>       for (i = 0; i < nels; i++) {                                             \
> -        env->fp_status.float_exception_flags = 0;                            \
>           t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i),          \
>                                                          &env->fp_status);     \
>           flags = env->fp_status.float_exception_flags;                        \
> @@ -2991,11 +3002,9 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
>                                                 rnan, 0, GETPC());             \
>           }                                                                    \
>           t.VsrW(2 * i + 1) = t.VsrW(2 * i);                                   \
> -        all_flags |= flags;                                                  \
>       }                                                                        \
>                                                                                \
>       *xt = t;                                                                 \
> -    env->fp_status.float_exception_flags = all_flags;                        \
>       do_float_check_status(env, sfi, GETPC());                                \
>   }
>   
> @@ -3020,6 +3029,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
>       ppc_vsr_t t = { };                                                       \
>       int flags;                                                               \
>                                                                                \
> +    helper_reset_fpstatus(env);                                              \
> +                                                                             \
>       t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);      \
>       flags = get_float_exception_flags(&env->fp_status);                      \
>       if (flags & float_flag_invalid) {                                        \
> @@ -3032,7 +3043,6 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
>   
>   VSX_CVT_FP_TO_INT_VECTOR(xscvqpsdz, float128, int64, f128, VsrD(0),          \
>                     0x8000000000000000ULL)
> -
>   VSX_CVT_FP_TO_INT_VECTOR(xscvqpswz, float128, int32, f128, VsrD(0),          \
>                     0xffffffff80000000ULL)
>   VSX_CVT_FP_TO_INT_VECTOR(xscvqpudz, float128, uint64, f128, VsrD(0), 0x0ULL)
> @@ -3055,6 +3065,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
>       ppc_vsr_t t = { };                                                  \
>       int i;                                                              \
>                                                                           \
> +    helper_reset_fpstatus(env);                                         \
> +                                                                        \
>       for (i = 0; i < nels; i++) {                                        \
>           t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
>           if (r2sp) {                                                     \
> @@ -3124,6 +3136,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
>   {                                                                       \
>       ppc_vsr_t t = *xt;                                                  \
>                                                                           \
> +    helper_reset_fpstatus(env);                                         \
>       t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);                 \
>       helper_compute_fprf_##ttp(env, t.tfld);                             \
>                                                                           \
> @@ -3157,6 +3170,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
>       int i;                                                             \
>       FloatRoundMode curr_rounding_mode;                                 \
>                                                                          \
> +    helper_reset_fpstatus(env);                                        \
> +                                                                       \
>       if (rmode != FLOAT_ROUND_CURRENT) {                                \
>           curr_rounding_mode = get_float_rounding_mode(&env->fp_status); \
>           set_float_rounding_mode(rmode, &env->fp_status);               \

