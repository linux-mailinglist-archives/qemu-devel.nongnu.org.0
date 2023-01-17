Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C605966DF01
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmAH-0001fp-Jk; Tue, 17 Jan 2023 08:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmAE-0001dS-69
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:38:10 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmAC-0003jM-9k
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:38:09 -0500
Received: by mail-pf1-x434.google.com with SMTP id 207so7376523pfv.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxEhWfSfRmCA3vaULf3RhUCXXQ4gmytIb3p4HyoDtDs=;
 b=r9oRBWdY6k9ZpeVGZZ8T7Xo9qZHmysHfztE8K/3WnkdTpApUlJ/5nqr9uy4cZuLJKh
 0pqSk2Lmcb9bcwcwoOw1JWyH4N5djl21Q+bPXR0lBKSKXX1p1xEo7EYqECncjjk+h6yk
 q3ggB3MBm7nPogSLQevLDTGnXp7UH27YYFxocLnmbxkgtUKpSkz4Z4T31PRhaqDShhjv
 2bsl6mvDjW6FTFwZxWwj8O8kHSJc0Pc4FPgSDyQisYo7YgYvDEvMHP7gi/CJ1Dy6Pk6W
 h9IbYv80gbjiHfwH70a3HTnP44duk1vb1XUSllkW+Pb4lV8wJO8d5Cxk3fMtm8VLFESa
 bYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZxEhWfSfRmCA3vaULf3RhUCXXQ4gmytIb3p4HyoDtDs=;
 b=R3cHhfNvHMycUJ4dgwleN1iUqUstfqBvE5eUx2MpqdynIRsFsLxAKJDgt1KxVAWxbC
 yaIHvMCLnh1M69c2b2JE0LqKWFbsdTiqg031vWJmHFjYK48nC4fFDxcy9TOMsy2JhD6x
 jXq3LAXQrvX0eFluZiMGpOyLapdDqWM2OYuTt9e6dfQalQy3J0gYcz8qNOXtTljq14wG
 7IpJuPUD0hvzeIlN12JhFvx+TcoPQpCmxwKJJIkhRz5fhzFPppi8tZtSW1HPv4JIMH8c
 1Mnzy9k+wXJGKtsVFJ7K88wwb3uvMRSU7S+Zm/bBp3ic3YsX9/XQlw9IodVdskfPlpKF
 b9bg==
X-Gm-Message-State: AFqh2krCoKMw5pOrVbXop7c5H7CavnLfGzYLTPbDLnBjN/qm7TfAq2Qw
 YVdD5Z/rRWOUbKKbqOklw+zYIxkE/Tl/YyG9ZvRd0A==
X-Google-Smtp-Source: AMrXdXssO9iHTXEgjyJOKmSNz6rynWvxHo5hLk6btLOHCmMpmk/j2wBNJ/pcrY9PwwBTU1COOctRYK/34egqB/c3eEU=
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr265197pfs.3.1673962686650; Tue, 17 Jan
 2023 05:38:06 -0800 (PST)
MIME-Version: 1.0
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
 <167330628518.10497.13100425787268927786-2@git.sr.ht>
In-Reply-To: <167330628518.10497.13100425787268927786-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:37:55 +0000
Message-ID: <CAFEAcA8sHX0g6nYJ0F34=JvRJkRNhSMmjMKpHqFbCfP5LankEQ@mail.gmail.com>
Subject: Re: [PATCH qemu 3/3] target/arm/gdbstub: Support reading M security
 extension registers from GDB
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 9 Jan 2023 at 23:18, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> Follows a fairly similar pattern to the existing special register debug
> support.  Only reading is implemented, but it should be possible to
> implement writes.
>
> Signed-off-by: David Reiss <dreiss@meta.com>

> +static struct v8m_stack_registers get_v8m_stack_registers(CPUARMState *env)
> +{
> +    uint32_t current_ss_msp;
> +    uint32_t current_ss_psp;
> +    if (v7m_using_psp(env)) {
> +        current_ss_msp = env->v7m.other_sp;
> +        current_ss_psp = env->regs[13];
> +    } else {
> +        current_ss_msp = env->regs[13];
> +        current_ss_psp = env->v7m.other_sp;
> +
> +    }
> +
> +    struct v8m_stack_registers ret;
> +    if (env->v7m.secure) {
> +        ret.msp_s = current_ss_msp;
> +        ret.psp_s = current_ss_psp;
> +        ret.msp_ns = env->v7m.other_ss_msp;
> +        ret.psp_ns = env->v7m.other_ss_psp;
> +    } else {
> +        ret.msp_s = env->v7m.other_ss_msp;
> +        ret.psp_s = env->v7m.other_ss_psp;
> +        ret.msp_ns = current_ss_msp;
> +        ret.psp_ns = current_ss_psp;
> +    }
> +
> +    return ret;
> +}

I wondered about using get_v7m_sp_ptr(), but this is fine I guess.

> +static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    switch (reg) {
> +    case  0:  /* MSP_S */
> +        return gdb_get_reg32(buf, get_v8m_stack_registers(env).msp_s);
> +    case  1:  /* PSP_S */
> +        return gdb_get_reg32(buf, get_v8m_stack_registers(env).psp_s);
> +    case  2:  /* MSPLIM_S */
> +        return gdb_get_reg32(buf, env->v7m.msplim[M_REG_S]);
> +    case  3:  /* PSPLIM_S */
> +        return gdb_get_reg32(buf, env->v7m.psplim[M_REG_S]);
> +    case  4:  /* PRIMASK_S */
> +        return gdb_get_reg32(buf, env->v7m.primask[M_REG_S]);
> +    case  5:  /* BASEPRI_S */
> +        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.basepri[M_REG_S]);
> +    case  6:  /* FAULTMASK_S */
> +        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.faultmask[M_REG_S]);
> +    case  7:  /* CONTROL_S */
> +        return gdb_get_reg32(buf, env->v7m.control[M_REG_S]);
> +    case  8:  /* MSP_NS */
> +        return gdb_get_reg32(buf, get_v8m_stack_registers(env).msp_ns);
> +    case  9:  /* PSP_NS */
> +        return gdb_get_reg32(buf, get_v8m_stack_registers(env).psp_ns);
> +    case 10:  /* MSPLIM_NS */
> +        return gdb_get_reg32(buf, env->v7m.msplim[M_REG_NS]);
> +    case 11:  /* PSPLIM_NS */
> +        return gdb_get_reg32(buf, env->v7m.psplim[M_REG_NS]);
> +    case 12:  /* PRIMASK_NS */
> +        return gdb_get_reg32(buf, env->v7m.primask[M_REG_NS]);
> +    case 13:  /* BASEPRI_NS */
> +        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.basepri[M_REG_NS]);
> +    case 14:  /* FAULTMASK_NS */
> +        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.faultmask[M_REG_NS]);
> +    case 15:  /* CONTROL_NS */
> +        return gdb_get_reg32(buf, env->v7m.control[M_REG_NS]);
> +    }
> +
> +    return 0;
> +}
> +
> +static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
> +{
> +    /* TODO: Implement. */
> +    return 0;
> +}
> +
> +int arm_gen_dynamic_m_securereg_xml(CPUState *cs, int base_reg)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    GString *s = g_string_new(NULL);
> +    DynamicGDBXMLInfo *info = &cpu->dyn_m_securereg_xml;
> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
> +
> +    g_autoptr(GArray) regs = g_array_new(false, true, sizeof(const char *));
> +    /*  0 */ g_array_append_str_literal(regs, "msp_s");
> +    /*  1 */ g_array_append_str_literal(regs, "psp_s");
> +    /*  2 */ g_array_append_str_literal(regs, "msplim_s");
> +    /*  3 */ g_array_append_str_literal(regs, "psplim_s");
> +    /*  4 */ g_array_append_str_literal(regs, "primask_s");
> +    /*  5 */ g_array_append_str_literal(regs, "basepri_s");
> +    /*  6 */ g_array_append_str_literal(regs, "faultmask_s");
> +    /*  7 */ g_array_append_str_literal(regs, "control_s");
> +    /*  8 */ g_array_append_str_literal(regs, "msp_ns");
> +    /*  9 */ g_array_append_str_literal(regs, "psp_ns");
> +    /* 10 */ g_array_append_str_literal(regs, "msplim_ns");
> +    /* 11 */ g_array_append_str_literal(regs, "psplim_ns");
> +    /* 12 */ g_array_append_str_literal(regs, "primask_ns");
> +    /* 13 */ g_array_append_str_literal(regs, "basepri_ns");
> +    /* 14 */ g_array_append_str_literal(regs, "faultmask_ns");
> +    /* 15 */ g_array_append_str_literal(regs, "control_ns");

In patch 1 you skip the registers that don't exist without
the main extension, but here you throw them all in regardless.
Why the difference ?

(If we do want to have the xml be fixed and not dependent on
whether the main extension exists, we don't need to runtime
generate it, but can instead use a fixed xml file, as we do with
eg arm-m-profile-mve.xml.)

> +
> +    for (int idx = 0; idx < regs->len; idx++) {
> +        const char *name = g_array_index(regs, const char *, idx);
> +        if (*name != '\0') {
> +            g_string_append_printf(s,
> +                        "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
> +                        name, base_reg);
> +        }
> +        base_reg++;
> +    }
> +    info->num = regs->len;
> +
> +    g_string_append_printf(s, "</feature>");
> +    info->desc = g_string_free(s, false);
> +    return info->num;
> +}

thanks
-- PMM

