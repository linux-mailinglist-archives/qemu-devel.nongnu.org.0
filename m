Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA169E5FA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWOz-00078q-Oq; Tue, 21 Feb 2023 12:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWOv-00078A-P2
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:26:03 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWOu-0000bM-1g
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:26:01 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c1so6075153plg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MJC/NE6Sdq2vQ3Pt4HPxp2Xn0sEI9GRgJASE3NV66A0=;
 b=bJt62hCesSeym65YmHbmnE8dcXCf9WKJPjetgNGDKjnhRmS7LbrsOK5xuxeRh91Nni
 43kda8Xi+fvYXrwqr2LkMntzIThbiMiydHU4kwrEQ0Zx5HAsVMTaMvfK/0HVND27Exu2
 VCO8cbWbGiPETTBhNCwz5w2s5rKB7ZJPhNEuxW3Xb1EjtfAyHweSl8X23WCsgchjkhzg
 FWx9ti5cX2MISiPGIfGmQ0PbhdSrCh/uMKgjJeI7tsBrGpG7Ug/E2vc2PFxnwR8Vdsfq
 5cVhnD8ZZZby563DTpqi7aB2RRn0PtAIshibiQ9BfvGko7mULjGBRK/lqMGi4VJsdW+K
 boMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MJC/NE6Sdq2vQ3Pt4HPxp2Xn0sEI9GRgJASE3NV66A0=;
 b=tyHCVOxziMiVM3ybrVLmem83ZZslX9+KTO/iwG2P+KmTy/evsGQ6mHldE9YfqaNQtI
 4kP69OHFLjyCurHwf6fjPw1pM34LLa47CtO7srfhWSIbXqW3tZX0dn528mDFuo27mUQ0
 FRW0PrNIp8Zg99f2lHDFptlmQHG6le1nqGIiyQxmSV1z0r1OPePNIcIgr9CcwH0CK9BA
 g0ZqHAP4cmdT+x6xHk8xG69iSrwOG/Ket7Obavn7Huv+p9IND44a5aJTVAINPSPxqAME
 SrH5BpzylAKsZqaz3DkhV2iZ+Vsp93R4UPDkYqSFJmRcPfVV1LCg6lsFdjAEHr9BJEZH
 Lkvw==
X-Gm-Message-State: AO0yUKU9nB+gscCXv0HQOlSVxGMRbPzvoa812kbVkz5U4pUOGPxojFzH
 DxOf35KM03I5WweA8oVvbz99rVhQmU/KHp1S3PD4aQ==
X-Google-Smtp-Source: AK7set/VcxDP2b/DokM+BEk4AzX3Ssxw49vhXGfm3ktm7RD+PrUPOTIjFHFOsUJu1nVpJFTfCLrtx7vqFO4CnvChwzI=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1925894pjb.92.1677000358370; Tue, 21
 Feb 2023 09:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-15-richard.henderson@linaro.org>
In-Reply-To: <20230221021951.453601-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:25:46 +0000
Message-ID: <CAFEAcA8nexWsqRKfjR20_OhNr5d54LMHCsGwZHrZmkng2jwgOw@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile
 systemreg and secext
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 21 Feb 2023 at 02:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
> go ahead and implement the other system registers as well.
>
> Since there is significant overlap between the two, implement
> them with common code.  The only exception is the systemreg
> view of CONTROL, which merges the banked bits as per MRS.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Substatial rewrite using enumerator and shared code.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     |   2 +
>  target/arm/gdbstub.c | 194 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 196 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 059fe62eaa..6e97a256fb 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -869,6 +869,8 @@ struct ArchCPU {
>
>      DynamicGDBXMLInfo dyn_sysreg_xml;
>      DynamicGDBXMLInfo dyn_svereg_xml;
> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;
> +    DynamicGDBXMLInfo dyn_m_secextreg_xml;
>
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 062c8d447a..fef53e4ef5 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -322,6 +322,180 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
>      return cpu->dyn_sysreg_xml.num;
>  }
>
> +typedef enum {
> +    M_SYSREG_MSP,
> +    M_SYSREG_PSP,
> +    M_SYSREG_PRIMASK,
> +    M_SYSREG_CONTROL,
> +    M_SYSREG_BASEPRI,
> +    M_SYSREG_FAULTMASK,
> +    M_SYSREG_MSPLIM,
> +    M_SYSREG_PSPLIM,
> +} MProfileSysreg;
> +
> +static const struct {
> +    const char *name;
> +    int feature;
> +} m_sysreg_def[] = {
> +    [M_SYSREG_MSP] = { "msp", ARM_FEATURE_M },
> +    [M_SYSREG_PSP] = { "psp", ARM_FEATURE_M },
> +    [M_SYSREG_PRIMASK] = { "primask", ARM_FEATURE_M },
> +    [M_SYSREG_CONTROL] = { "control", ARM_FEATURE_M },
> +    [M_SYSREG_BASEPRI] = { "basepri", ARM_FEATURE_M_MAIN },
> +    [M_SYSREG_FAULTMASK] = { "faultmask", ARM_FEATURE_M_MAIN },
> +    [M_SYSREG_MSPLIM] = { "msplim", ARM_FEATURE_V8 },
> +    [M_SYSREG_PSPLIM] = { "psplim", ARM_FEATURE_V8 },
> +};
> +
> +static uint32_t *m_sysreg_ptr(CPUARMState *env, MProfileSysreg reg, bool sec)
> +{
> +    uint32_t *ptr;
> +
> +    switch (reg) {
> +    case M_SYSREG_MSP:
> +        ptr = arm_v7m_get_sp_ptr(env, sec, false, true);
> +        break;
> +    case M_SYSREG_PSP:
> +        ptr = arm_v7m_get_sp_ptr(env, sec, true, true);
> +        break;
> +    case M_SYSREG_MSPLIM:
> +        ptr = &env->v7m.msplim[sec];
> +        break;
> +    case M_SYSREG_PSPLIM:
> +        ptr = &env->v7m.psplim[sec];
> +        break;
> +    case M_SYSREG_PRIMASK:
> +        ptr = &env->v7m.primask[sec];
> +        break;
> +    case M_SYSREG_BASEPRI:
> +        ptr = &env->v7m.basepri[sec];
> +        break;
> +    case M_SYSREG_FAULTMASK:
> +        ptr = &env->v7m.faultmask[sec];
> +        break;
> +    case M_SYSREG_CONTROL:
> +        ptr = &env->v7m.control[sec];
> +        break;
> +    default:
> +        return NULL;
> +    }
> +    return arm_feature(env, m_sysreg_def[reg].feature) ? ptr : NULL;
> +}
> +
> +static int m_sysreg_get(CPUARMState *env, GByteArray *buf,
> +                        MProfileSysreg reg, bool secure)
> +{
> +    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
> +
> +    if (ptr == NULL) {
> +        return 0;
> +    }
> +    return gdb_get_reg32(buf, *ptr);
> +}
> +
> +static int m_sysreg_set(CPUARMState *env, uint8_t *buf,
> +                        MProfileSysreg reg, bool secure)
> +{
> +    uint32_t *ptr = m_sysreg_ptr(env, reg, secure);
> +
> +    if (ptr == NULL) {
> +        return 0;
> +    }
> +    *ptr = ldl_p(buf);
> +    return 4;
> +}
> +
> +static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    /*
> +     * Here, we emulate MRS instruction, where CONTROL has a mix of
> +     * banked and non-banked bits.
> +     */
> +    if (reg == M_SYSREG_CONTROL) {
> +        return gdb_get_reg32(buf, arm_v7m_mrs_control(env, env->v7m.secure));
> +    }
> +    return m_sysreg_get(env, buf, reg, env->v7m.secure);
> +}
> +
> +static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
> +{
> +    /* Control is a mix of banked and non-banked bits -- disallow write. */
> +    if (reg == M_SYSREG_CONTROL) {
> +        return 0;
> +    }

You also want to enforce the RES0 bits on registers like
PSPLIM, MSPLIM, FAULTMASK, PSP, MSP, if you're going to
implement writes. Effectively you really end up wanting to
get helper_v7m_msr to do the work for you.

> +    return m_sysreg_set(env, buf, reg, env->v7m.secure);
> +}

-- PMM

