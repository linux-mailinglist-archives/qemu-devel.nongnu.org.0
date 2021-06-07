Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C139EA33
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 01:33:54 +0200 (CEST)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqOki-0000OK-KO
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 19:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqOjy-0007xp-JO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:33:06 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqOjw-0004gj-Cz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:33:06 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso1049640pjb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 16:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kibhoWl62ieWnz0106xsENCYNjBvHQXnyP6B2d2eI7U=;
 b=in2hcb0EcYkR6sqL7aKdoLgcXkE9YZ6zHcSLpG7sywb0/HJnOjw9mzsgPBa2BVRDNd
 f+s4q9hWYCNthozrOQ+DvB6E/GBAECm67vNHvkQXaYZuUvFBA2I+AIzZp/5Ec58Nxiww
 cU8/wpZH8dCLSyNG6cE9lGTWTLxkSn1LlEh5RBhug7whFWx48VNVc/xlq6P1ephoIMdN
 8RHTgBM7+etWRI6UYGHAp0aAbFnYyZPwQtQiPk0JA9ZSurF9mVrUCITXi2A5/P7dBD2N
 yr8B8tOnUSWUB1YsYZEN8G2Xb/0se58iVHa673xFluhCWcEkCvE2mkAqEqxZN/nnKokb
 FmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kibhoWl62ieWnz0106xsENCYNjBvHQXnyP6B2d2eI7U=;
 b=H2P88YElqIo3CnJNbO7LrmBb9fpnCKlEembkqAAMkEPGzqPNkcJXlCv9ScEeHJwTrH
 a2gGAEapsZij/2vhslmPLNbIoMVMzoQa3A8ucARN/bJLOTvPmXK885RUvDE/w2WQ12Ry
 /YdXzL5TBcovmSOqdhdAM4uv7OPI0s/tWM/jEHYXNBAEKQ1KvnGpV3pzypt3rW4EQmaq
 pTp6Md1Dh3j+1dNID8/vQC5FMe/OpKvN8WlXkaA0QUlGZ3v0tX7+h9i/OI9rJp7oeCH/
 BwtJSCjf/flgVIY3IdHJPLSoPSd3jMsKxQQIuSmFDxQEmd5NNj5KSUk3Sh6nxDR2P3UF
 lZaA==
X-Gm-Message-State: AOAM533JwdzrIwKxZvsTt7EArYrLmxRgU0g6Iq5tYrJVrFlev4BIq+FS
 UnrWYpw/LIRMro6fLO2X8F9vDuLLOp7Blg==
X-Google-Smtp-Source: ABdhPJwwXMTgpgKGnkFQVR22DN+ORnZcrz8dkRi2dEvuFqTu0Iftg7ic4Qx7trdO6BjQA7n/IXW87g==
X-Received: by 2002:a17:902:6a87:b029:ef:2942:89fc with SMTP id
 n7-20020a1709026a87b02900ef294289fcmr20449491plk.36.1623108782536; 
 Mon, 07 Jun 2021 16:33:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w2sm9157149pfc.126.2021.06.07.16.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 16:33:02 -0700 (PDT)
Subject: Re: [PATCH 04/55] target/arm: Add handling for PSR.ECI/ICI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d54b1117-b25a-ff6f-3166-87fd282b674c@linaro.org>
Date: Mon, 7 Jun 2021 16:33:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +void clear_eci_state(DisasContext *s)
> +{
> +    /*
> +     * Clear any ECI/ICI state: used when a load multiple/store
> +     * multiple insn executes.
> +     */
> +    if (s->eci) {
> +        TCGv_i32 tmp = tcg_temp_new_i32();
> +        tcg_gen_movi_i32(tmp, 0);

tcg_const_i32 or preferably tcg_constant_i32.


> +    /*
> +     * the CONDEXEC TB flags are CPSR bits [15:10][26:25]. On A-profile this
> +     * is always the IT bits. On M-profile, some of the reserved encodings
> +     * of IT are used instead to indicate either ICI or ECI, which
> +     * indicate partial progress of a restartable insn that was interrupted
> +     * partway through by an exception:
> +     *  * if CONDEXEC[3:0] != 0b0000 : CONDEXEC is IT bits
> +     *  * if CONDEXEC[3:0] == 0b0000 : CONDEXEC is ICI or ECI bits
> +     * In all cases CONDEXEC == 0 means "not in IT block or restartable
> +     * insn, behave normally".
> +     */
> +    if (condexec & 0xf) {
> +        dc->condexec_mask = (condexec & 0xf) << 1;
> +        dc->condexec_cond = condexec >> 4;
> +        dc->eci = 0;
> +    } else {
> +        dc->condexec_mask = 0;
> +        dc->condexec_cond = 0;
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            dc->eci = condexec >> 4;
> +        }

This else leaves eci uninitialized.

>       dc->insn = insn;
>   
> +    if (dc->eci) {
> +        /*
> +         * For M-profile continuable instructions, ECI/ICI handling
> +         * falls into these cases:
> +         *  - interrupt-continuable instructions
> +         *     These are the various load/store multiple insns (both
> +         *     integer and fp). The ICI bits indicate the register
> +         *     where the load/store can resume. We make the IMPDEF
> +         *     choice to always do "instruction restart", ie ignore
> +         *     the ICI value and always execute the ldm/stm from the
> +         *     start. So all we need to do is zero PSR.ICI if the
> +         *     insn executes.
> +         *  - MVE instructions subject to beat-wise execution
> +         *     Here the ECI bits indicate which beats have already been
> +         *     executed, and we must honour this. Each insn of this
> +         *     type will handle it correctly. We will update PSR.ECI
> +         *     in the helper function for the insn (some ECI values
> +         *     mean that the following insn also has been partially
> +         *     executed).
> +         *  - Special cases which don't advance ECI
> +         *     The insns LE, LETP and BKPT leave the ECI/ICI state
> +         *     bits untouched.
> +         *  - all other insns (the common case)
> +         *     Non-zero ECI/ICI means an INVSTATE UsageFault.
> +         *     We place a rewind-marker here. Insns in the previous
> +         *     three categories will set a flag in the DisasContext.
> +         *     If the flag isn't set after we call disas_thumb_insn()
> +         *     or disas_thumb2_insn() then we know we have a "some other
> +         *     insn" case. We will rewind to the marker (ie throwing away
> +         *     all the generated code) and instead emit "take exception".
> +         */
> +        dc->eci_handled = false;

This should be done in arm_tr_init_disas_context, I think, unconditionally, 
next to eci.

> +        dc->insn_eci_rewind = tcg_last_op();

I believe that this is identical to dc->insn_start.  Certainly there does not 
seem to be any possibility of any opcodes emitted in between.

If you think we should use a different field, then initialize it to null next 
to eci/eci_handled.


r~

