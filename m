Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB2694BF2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbH3-0000P0-Nu; Mon, 13 Feb 2023 11:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbGy-0000Mk-Sf
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:01:46 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbGw-0003S0-0c
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:01:44 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g9so8241401pfo.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676304100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SPYd2GWyjSrPJ6422NzWzWB23rJk3/Q3uSi6v0okH/E=;
 b=f01iZ7qmrvJVJ9PLBk5d4R9LV1jAcEMSuA8IXg5sz96VH/TLJ/Vt5Ey7Hf8Fn6cPGQ
 CsaUHmtr6ogp8T2SQOREG4itkcSke7uSggMt9t5xTYrtJtGARhIdMio6yMPNvpQe8AVH
 eT3TUFWww6bUs7tLuUDmsA3HeZU+1e227CzDN+59TF9726HHhDBOYtQsIHK9gYkjftNa
 CZWCy2NPwIlsAm4Euzoip/kppstyKfBu94HCtlhJFNzFti2NvzWsFrPAk2HHYCO2xcSL
 YzmJD9D4btgDP9AKvjAczyzl8H0Q519tWuF2u9arPsQlAaKtkm9GNsTfH3bn5sE8r6k5
 wwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676304100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SPYd2GWyjSrPJ6422NzWzWB23rJk3/Q3uSi6v0okH/E=;
 b=RZpmppgRxjbftEJcoS2XNhlxyj/DTuUsCnMtWNaZBnunEIJ+IBbGH9NL7j7zmU05In
 47SsHG/08aoP0HoowkcNk6hS/3dclGu8vQ8IDjZuiWdfYNgxPrkL0ugJEPZKVybOxyjc
 VehArHCFwg4ccKoqvb7W441lN0kG5qPMXW8uDqPFwWRh5c5B+CSd+CyN7GS6UebDPTN3
 hgB05E0UzFFGyMZ6kqUNTkoozF/VQe/eWv5Pj2sKc29pIRtQnKIf+L1iKYKCfAE6kC7O
 80Y2dA3pM0b7jNxntOK/M1AXAJC9s3j3kiTcpdNN+e99XKpgr2be41ziPvZoUlOF0KVP
 7shA==
X-Gm-Message-State: AO0yUKVjexQtCoB2NFpwto1UzMcHNplyU4EGd88ey+FmAQ7j7T7/11Au
 LbaIRxP4z3yYFw6JoQGeNVEzcUHxUt7hERZmYXh2Fw==
X-Google-Smtp-Source: AK7set9DPHkjBbnm5ItEOKqGvX+9TOHuULG/aSMzsk9nmIJ7rU+nsqGgu21kd7lop7tspvNDmKy0IAVCa9LmuKuc3fc=
X-Received: by 2002:a62:1b83:0:b0:593:fa6a:b960 with SMTP id
 b125-20020a621b83000000b00593fa6ab960mr4939267pfb.48.1676304100585; Mon, 13
 Feb 2023 08:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-2-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-2-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:01:29 +0000
Message-ID: <CAFEAcA8uVVCfWwEYVs5ATzi7jNh9--cN+TVQ63M_ZW_bWwqtxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h          | 57 ++++++++++++++++++++++++++++++++++++---
>  target/arm/helper.c       |  4 +--
>  target/arm/pauth_helper.c |  4 +--
>  3 files changed, 58 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8cf70693be..9be59163ff 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1001,6 +1001,7 @@ struct ArchCPU {
>          uint32_t dbgdevid1;
>          uint64_t id_aa64isar0;
>          uint64_t id_aa64isar1;
> +        uint64_t id_aa64isar2;
>          uint64_t id_aa64pfr0;
>          uint64_t id_aa64pfr1;
>          uint64_t id_aa64mmfr0;
> @@ -3902,18 +3903,68 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
>              (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
>               FIELD_DP64(0, ID_AA64ISAR1, API, 0xf) |
>               FIELD_DP64(0, ID_AA64ISAR1, GPA, 0xf) |
> -             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
> +             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0 ||
> +           (id->id_aa64isar2 &
> +            (FIELD_DP64(0, ID_AA64ISAR2, APA3, 0xf) |
> +             FIELD_DP64(0, ID_AA64ISAR2, GPA3, 0xf))) != 0;
>  }
>
> -static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
> +static inline bool isar_feature_aa64_pauth_arch_qarma5(const ARMISARegisters *id)
>  {
>      /*
> -     * Return true if pauth is enabled with the architected QARMA algorithm.
> +     * Return true if pauth is enabled with the architected QARMA5 algorithm.
>       * QEMU will always set APA+GPA to the same value.
>       */
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
>  }
>
> +static inline bool isar_feature_aa64_pauth_arch_qarma3(const ARMISARegisters *id)
> +{
> +    /*
> +     * Return true if pauth is enabled with the architected QARMA3 algorithm.
> +     * QEMU will always set APA3+GPA3 to the same value.
> +     */
> +    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
> +}
> +
> +static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_pauth_arch_qarma5(id) ||
> +        isar_feature_aa64_pauth_arch_qarma3(id);
> +}
> +
> +static inline uint8_t isar_feature_pauth_get_features(const ARMISARegisters *id)
> +{
> +    if (isar_feature_aa64_pauth_arch_qarma5(id))
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    else if (isar_feature_aa64_pauth_arch_qarma3(id))
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    else
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
> +}
> +
> +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0010;

This should ideally be ">= 0b0010", but it depends a bit on
where we call it.

This field, like most ID register fields, follows the "standard
scheme", where the value increases and larger numbers always
imply "all of the functionality from the lower values, plus
some more". In QEMU we implement this by doing a >= type
comparison on the field value.

The PAC related ID fields are documented slightly confusingly,
but they do work this way. The documentation suggests it might not
be quite that way for FEAT_EPAC because it says that
HaveEnhancedPAC() returns TRUE for 2 and FALSE for 3 and up.
However this is more because the definition of the architectural
features means that FEAT_EPAC is irrelevant, and it's an accident
of the way the pseudocode was written that means that
HaveEnhancedPAC() ever gets called when FEAT_PAuth2 is present.

Other than EPAC, the rest of the values in these fields are
straightforward and we can implement the isar_feature functions
with a single >= comparison.

> +}
> +
> +static inline bool isar_feature_aa64_fpac_combine(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0101;

Should be ">= 0b0101".

> +}
> +
> +static inline bool isar_feature_aa64_fpac(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0100 ||
> +        isar_feature_aa64_fpac_combine(id);

Should be ">= 0b0100", no need to || with fpac_combine().

> +}
> +
> +static inline bool isar_feature_aa64_pauth2(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0011 ||
> +        isar_feature_aa64_fpac(id);

Should be ">= 0b0011", no need to || with fpac().

> +}
> +
>  static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 72b37b7cf1..448ebf8301 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8028,11 +8028,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
>                .resetvalue = cpu->isar.id_aa64isar1 },
> -            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = 0 },
> +              .resetvalue = cpu->isar.id_aa64isar2 },
>              { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
>                .access = PL1_R, .type = ARM_CP_CONST,
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index d0483bf051..a0c9bea06b 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -282,8 +282,8 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
>  static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
>                                   uint64_t modifier, ARMPACKey key)
>  {
> -    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
> -        return pauth_computepac_architected(data, modifier, key);
> +    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
> +        return pauth_computepac_architected(data, modifier, key, false);
>      } else {
>          return pauth_computepac_impdef(data, modifier, key);
>      }
> --
> 2.25.1

thanks
-- PMM

