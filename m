Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FFB4C38FF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:14 +0100 (CET)
Received: from localhost ([::1]:37062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNMuC-0001c9-PE
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 17:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNMt6-0000we-2N
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 17:47:04 -0500
Received: from [2607:f8b0:4864:20::62f] (port=33460
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNMsw-0004p6-9s
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 17:47:03 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c9so3201394pll.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 14:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XfcBg6aeHAWMYmU3+3oggTYtOPlCkqsLFEQdc+epOts=;
 b=LDGdKvfvPjlpLCrJAEm8+XawO48ArVRmUYq0Abk+Z49H2QVnsnPeQKdX1YOzAOc/nu
 gsYcZIH98+J/1pzaRcyuUd+fGe6CkUsgev6i9lrzj5Scbdo7VTyGClNstNQOiluytwzL
 9NZNRkVoPg08ST6w9DjzZEqvaNcKxgGe80+xb1w73r7towW2GN1H4fOgxwdImZwIdafp
 aEvFVcH+2Q7lppIcZcTjs3f9FK/j1Td5roRbQKPz3qzRiTyyk1d+Ij1fPF1guFTmnfk5
 RrlIi4QQ6D1EiKfBimKLMw1xYZHPnORJXv7kcoPXB5/oFIqXVZeYNKmNbQszduE1+uGC
 AyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XfcBg6aeHAWMYmU3+3oggTYtOPlCkqsLFEQdc+epOts=;
 b=iC4AXiy9LdpyqW2sRrRqbToqlYlzmM3snTTmuuLlX/8fJUmGHopGrMjZKkzFP4u5FB
 2adBWFEdxSovDV3L+uY/+Ai/v19CwFSFwN6HFM0lwUkRILVPyOlWahTt4KXAl00QUVWO
 qcDdiEry9hVRh65PHXPRG/g5mkE9jpX3xCeSiUuMgGr/b/spTaJu1Ib7lt+T0ZJNfgww
 VukjjCKbjfR2OBr9BJiXhpyrxxvK3OigKwIbNhT10JW6ex74fV2OyNiqfnKL2HiASeZ1
 NHKKERfyDTFmWq5ckKLqkg7fO5ADTcVKpvU2zg1dEDM4AbgNk4kNZIUMeoIqsB5eoPlR
 B6xQ==
X-Gm-Message-State: AOAM530nOg67QNWUn4PqVezoSyFRigU+aBvlj+veSkeND8xtE3r1bFNz
 9Poicgbl1WQ3hVN53nzOO7v9iw==
X-Google-Smtp-Source: ABdhPJwgZJtvtEX90eWAXqpXkEPo9JZ5CkcTrZ2jZJ0jNBH08Dl2aFb7PFjwTR7Klfdt9hjP/CVlCg==
X-Received: by 2002:a17:90a:bb0d:b0:1b8:a958:543d with SMTP id
 u13-20020a17090abb0d00b001b8a958543dmr285833pjr.51.1645742811756; 
 Thu, 24 Feb 2022 14:46:51 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00229000b004a818f896b4sm537240pfe.53.2022.02.24.14.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 14:46:51 -0800 (PST)
Message-ID: <60ce1408-c219-7a02-e993-442bb254fe7c@linaro.org>
Date: Thu, 24 Feb 2022 12:46:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] target/nios2: Shadow register set
Content-Language: en-US
To: Amir Gonnen <amir.gonnen@neuroblade.ai>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 03:48, Amir Gonnen wrote:
> +void helper_eret(CPUNios2State *env, uint32_t new_pc)
> +{
> +    uint32_t crs = cpu_get_crs(env);
> +    if (crs == 0) {
> +        env->regs[CR_STATUS] = env->regs[CR_ESTATUS];
> +    } else {
> +        env->regs[CR_STATUS] = env->regs[R_SSTATUS];
> +    }
> +    cpu_change_reg_set(env, crs, cpu_get_crs(env));

Hmm.  This could probably use a comment that the second computation of cpu_get_crs is 
using the value just restored into CR_STATUS.


> +void helper_wrprs(CPUNios2State *env, uint32_t reg_index, uint32_t value)
> +{
> +    uint32_t prs = cpu_get_prs(env);
> +    env->shadow_regs[prs][reg_index] = value;
> +}
> +
> +uint32_t helper_rdprs(CPUNios2State *env, uint32_t reg_index)
> +{
> +    uint32_t prs = cpu_get_prs(env);
> +    return env->shadow_regs[prs][reg_index];
> +}

These are fairly easy to compute inline, e.g. for rdprs:

     TCGv_i32 t = tcg_temp_i32_new();
     TCGv_ptr p = tcg_temp_ptr_new();

     tcg_gen_extract_i32(t, cpu_R[CR_STATUS],
                         R_CR_STATUS_CRS_SHIFT,
                         R_CR_STATUS_CRS_LENGTH);
     tcg_gen_muli_i32(t, t, sizeof(uint32_t) * NUM_GP_REGS);
     tcg_gen_ext_i32_ptr(p, t);

     tcg_gen_add_ptr(p, p, cpu_env);
     tcg_gen_ld_i32(t, p, offsetof(CPUNios2State, shadow_regs)
                     + sizeof(uint32_t) * instr.a);
     tcg_gen_addi_i32(cpu_R[instr.b], t, instr.imm16.s);

     tcg_temp_free_ptr(p);
     tcg_temp_free_i32(o);

> +static void rdprs(DisasContext *dc, uint32_t code, uint32_t flags)
> +{
> +    I_TYPE(instr, code);
> +    TCGv t = tcg_temp_new();
> +    gen_helper_rdprs(t, cpu_env, tcg_const_i32(instr.a));

You're missing a gen_check_supervisor here and in wrprs.

>  static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
>  {
> -    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
> -    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
> +    gen_helper_eret(cpu_env, cpu_R[R_EA]);

As an existing bug to be fixed by a separate patch, eret should also check for supervisor.

> 
> The contents of this email message and any attachments are intended solely for the addressee(s) and may contain confidential and/or privileged information and may be legally protected from disclosure. If you are not the intended recipient of this message or their agent, or if this message has been addressed to you in error, please immediately alert the sender by reply email and then delete this message and any attachments. If you are not the intended recipient, you are hereby notified that any use, dissemination, copying, or storage of this message or its attachments is strictly prohibited.
> 

You really need to suppress these footers when posting to a public mailing list.


r~

