Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E9D66DF2F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:46:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmHF-0003wZ-Ej; Tue, 17 Jan 2023 08:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmGu-0003rn-7b
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:45:06 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmGr-0004Ws-CD
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:45:03 -0500
Received: by mail-pl1-x629.google.com with SMTP id v23so28668025plo.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9DBVjHmK/Gp2h0tDw8WZJxPqApxTpONbAH4i/We4NXk=;
 b=uSp/VeMDeOU0v5u0Q2T3zQ0/Tni+yX3MNaoUeqBVopsSmixzpOFyf1WXIIKdOkqOSR
 Oglzy+51HgPDI6wPfKODvLEw139BKm+KcVrAMG8faJYAT2ulq2p5/bZDS8vxw1mRvJC4
 C58rocXlo/EOHwQpABg9qEM1lqYhgTU1nX0M16kwbqAdSVfpY63tGSP194ouYPG3wy2D
 64j/f8mQLOnUGFIkpldxbEmOuEGVpRJz10GLvIAi6v1ocmtVf/mawopUA5rCox8WVLRk
 8GeUoEggiuG/dFcPsR3NPaSaTp4dHeTPNyoiBO/eJAPHH5HvT2l704KHxJ5uL1wRYlmr
 r8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9DBVjHmK/Gp2h0tDw8WZJxPqApxTpONbAH4i/We4NXk=;
 b=7UtKhc/aa5sbfo0cUEhAkJLFOEAXvsnc446oyWOTUkJ1Xg+yNdqf/MDvv5VwGdSaWx
 h9cpSIEz+PiJXGi7kg4gH4Zx4ZdwXzSVL/JLItH20JaFNdlIkssMNOJW8hx6Gtvp/BEL
 e0gjJRRMJGT2fd7IXvO+RNkXg0pOUlISEg8ACz8axTm+1c62MHvGOBlAW244WkJvHyRI
 JFpruhBaIERCiKNgbf2EY63x36kyY2XMOlVbmPZLBaug2Ha0WGMRDRFHeTPRyBwpnwiY
 ZOxPfOcOx7XCz8nV7YA737Vy7Pg5gLuHHlAHx0DC3d1haMgFJq73ZZF5IMDiJ9JlyNqC
 d+eg==
X-Gm-Message-State: AFqh2krZHQIZToBjuWbi68cgzwrgkzgZqfX2p1MiZk9KHJ2pumpxX30S
 oSSm0H47CkR5/RGxhj+o2FiEzBD2d0wXxXPkNB20yw==
X-Google-Smtp-Source: AMrXdXsPGsfe+ycgqdSjU9jKuEXhf8FO/CFsEP1xHkVq4xjQuPHVXKFRoBf39DJep8CFZZ0eJ/3zHhW6CtJOya+f/0g=
X-Received: by 2002:a17:902:c10d:b0:189:a5b9:4838 with SMTP id
 13-20020a170902c10d00b00189a5b94838mr226199pli.104.1673963099474; Tue, 17 Jan
 2023 05:44:59 -0800 (PST)
MIME-Version: 1.0
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
 <167330628518.10497.13100425787268927786-1@git.sr.ht>
In-Reply-To: <167330628518.10497.13100425787268927786-1@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:44:48 +0000
Message-ID: <CAFEAcA-744v6jDHubPFTgWAMVFNnL7OJbqRt5eCXcJPSLd7Qpg@mail.gmail.com>
Subject: Re: [PATCH qemu 2/3] target/arm/gdbstub: Support reading M system
 registers from GDB
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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
> `v7m_mrs_control` was renamed `arm_v7m_mrs_control` and made
> non-static so this logic could be shared between the MRS instruction and
> the GDB stub.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---
>  target/arm/cpu.h      |  11 +++-
>  target/arm/gdbstub.c  | 125 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/m_helper.c |   6 +-
>  3 files changed, 137 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2b4bd20f9d..5cf86cf2d7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -852,6 +852,7 @@ struct ArchCPU {
>
>      DynamicGDBXMLInfo dyn_sysreg_xml;
>      DynamicGDBXMLInfo dyn_svereg_xml;
> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;
>
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
> @@ -1094,11 +1095,13 @@ int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>
>  /*
> - * Helpers to dynamically generates XML descriptions of the sysregs
> - * and SVE registers. Returns the number of registers in each set.
> + * Helpers to dynamically generates XML descriptions of the sysregs,

we can fix the typo while we're changing this line: "dynamically generate"

> + * SVE registers, and M-profile system registers.
> + * Returns the number of registers in each set.
>   */
>  int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
>  int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
> +int arm_gen_dynamic_m_systemreg_xml(CPUState *cpu, int base_reg);
>
>  /* Returns the dynamically generated XML for the gdb stub.
>   * Returns a pointer to the XML contents for the specified XML file or NULL
> @@ -1490,6 +1493,10 @@ FIELD(SVCR, ZA, 1, 1)
>  FIELD(SMCR, LEN, 0, 4)
>  FIELD(SMCR, FA64, 31, 1)
>
> +/* Read the CONTROL register as the MRS instruction would.
> + */

QEMU comment style is either
/* one line comment */
or
/*
 * multiline comment, with the opening and closing
 * slash-star and star-slash on lines of their own
 */

We do still have some older parts of the codebase with different
styles, but new code should follow the coding style.
scripts/checkpatch.pl usually but doesn't always catch this.

> +uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
> +
>  /* Write a new value to v7m.exception, thus transitioning into or out
>   * of Handler mode; this may result in a change of active stack pointer.
>   */
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 2f806512d0..4456892e91 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -322,6 +322,121 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
>      return cpu->dyn_sysreg_xml.num;
>  }
>
> +/*
> + * Helper required because g_array_append_val is a macro
> + * that cannot handle string literals.
> + */
> +static inline void g_array_append_str_literal(GArray *array, const char *str)
> +{
> +    g_array_append_val(array, str);
> +}
> +
> +static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    /* NOTE: This implementation shares a lot of logic with v7m_mrs. */
> +    switch (reg) {
> +
> +    /*
> +     * NOTE: MSP and PSP technically don't exist if the secure extension
> +     * is present (replaced by MSP_S, MSP_NS, PSP_S, PSP_NS).  Similar for
> +     * MSPLIM and PSPLIM.
> +     * However, the MRS instruction is still allowed to read from MSP and PSP,
> +     * and will return the value associated with the current security state.
> +     * We replicate this behavior for the convenience of users, who will see
> +     * GDB behave similarly to their assembly code, even if they are oblivious
> +     * to the security extension.
> +     */
> +    case 0: /* MSP */
> +        return gdb_get_reg32(buf,
> +            v7m_using_psp(env) ? env->v7m.other_sp : env->regs[13]);
> +    case 1: /* PSP */
> +        return gdb_get_reg32(buf,
> +            v7m_using_psp(env) ? env->regs[13] : env->v7m.other_sp);
> +    case 6: /* MSPLIM */
> +        if (!arm_feature(env, ARM_FEATURE_V8)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.msplim[env->v7m.secure]);
> +    case 7: /* PSPLIM */
> +        if (!arm_feature(env, ARM_FEATURE_V8)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.psplim[env->v7m.secure]);
> +
> +    /*
> +     * NOTE: PRIMAKS, BASEPRI, and FAULTMASK are defined a bit differently
> +     * from the SP family, but have similar banking behavior.
> +     */
> +    case 2: /* PRIMASK */
> +        return gdb_get_reg32(buf, env->v7m.primask[env->v7m.secure]);
> +    case 3: /* BASEPRI */
> +        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.basepri[env->v7m.secure]);
> +    case 4: /* FAULTMASK */
> +        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +            return 0;
> +        }
> +        return gdb_get_reg32(buf, env->v7m.faultmask[env->v7m.secure]);
> +
> +    /*
> +     * NOTE: CONTROL has a mix of banked and non-banked bits.  We continue
> +     * to emulate the MRS instruction.  Unfortunately, this gives GDB no way
> +     * to read the SFPA bit when the CPU is in a non-secure state.
> +     */

Indent on this comment seems odd.

> +    case 5: /* CONTROL */
> +        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
> +    }
> +
> +    return 0;
> +}
> +
> +static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
> +{
> +    /* TODO: Implement. */
> +    return 0;
> +}
> +
> +int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int base_reg)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    GString *s = g_string_new(NULL);
> +    DynamicGDBXMLInfo *info = &cpu->dyn_m_systemreg_xml;
> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
> +
> +    int is_v8 = arm_feature(env, ARM_FEATURE_V8);
> +    int is_main = arm_feature(env, ARM_FEATURE_M_MAIN);

Use bool for these, please. Also, coding style says don't declare
variables in the middle of a block.

> +
> +    g_autoptr(GArray) regs = g_array_new(false, true, sizeof(const char *));
> +    /* 0 */ g_array_append_str_literal(regs, "msp");
> +    /* 1 */ g_array_append_str_literal(regs, "psp");
> +    /* 2 */ g_array_append_str_literal(regs, "primask");
> +    /* 3 */ g_array_append_str_literal(regs, is_main ? "basepri" : "");
> +    /* 4 */ g_array_append_str_literal(regs, is_main ? "faultmask" : "");
> +    /* 5 */ g_array_append_str_literal(regs, "control");
> +    /* 6 */ g_array_append_str_literal(regs, is_v8 ? "msplim" : "");
> +    /* 7 */ g_array_append_str_literal(regs, is_v8 ? "psplim" : "");
> +
> +    for (int idx = 0; idx < regs->len; idx++) {
> +        const char *name = g_array_index(regs, const char *, idx);
> +        if (*name != '\0') {
> +            g_string_append_printf(s,
> +                        "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
> +                        name, base_reg);

Opinion seems to be divided on whether the registers here that
don't define all 32 bits should be reported as bitsize="32" or
not, eg OpenOCD reports primask etc as bitsize="1". But I found
at least one other generator of this XML which uses bitsize=32
throughout, so I guess we're good to do so also.

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

