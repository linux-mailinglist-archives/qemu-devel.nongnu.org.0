Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AA694D91
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcB8-0001Jk-UW; Mon, 13 Feb 2023 11:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRcB6-0001JO-8l
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:59:44 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRcB0-0006mj-5Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:59:41 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e17so5269906plg.12
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NsvtVvw7T1GMc9kMqiVnYI0aKhZu9oU9cluMSV24Bbc=;
 b=PA6gOXQ9Npf/QsQ5qXhZbIjfiBjehHiDP98K8KjDMBFzZiM+DUTiaj/xI78daqfUtV
 exC5V07HW9ygnVNOe+mQFmtyGKNAVm45y6DFIID4Z00VSX40hpkmQ4PDdD2gt8ShIzlN
 Wp1iGJxcgXngC4XvUe5iUMxZykJUKZDn35U/4NClzdULiFcVzT4IUMVB7bTL7OsjFDRm
 CQPOUPBgpvzQntX1OvFHyQ8hZtzuX5DB8b0wLT3k9ope7kv6QASSJMPnkLnud4vSXHAe
 EGZVJFXuL95ELsTclQ+Yi6LwYT86q3Yp2ZoWR2N4T4f6coLiToLx6b9UcLvZ9zh+2MrZ
 85Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NsvtVvw7T1GMc9kMqiVnYI0aKhZu9oU9cluMSV24Bbc=;
 b=s/bAguxGUYfzGqAJUkop3bb3rwJZzn+6gv1N60OS6HhZvh549S3AWkchBV00elaOnR
 8jgp0Iv7s1uDHHrBhS4SUqEoBABYVWstsJJpoZVYE4sXkkSg4E0q8QMB+PQicweDmANz
 Ed82YzXcHJYrkaSkU3lqj7ZGDykEmSC5sI2GDboF4aoLkNNUDQauOFSnOYKhAXTtZJv0
 Y4bdtBdClq5kxC2T+xaCtSC7ZqfkBg7iGs/B5hpTQJDSNY+a0KsyKWyAIjXkdrymhi6F
 A0YBk1Knopqrv9jO+N8uvAJA1XaUmwwaJFl9MJ9hTdlBryAV1grwKYIdEbh1sPkK+G+G
 bZJg==
X-Gm-Message-State: AO0yUKUs2Xyz9jcFNI4q4+8u5k2GxzptGnBPMdqcMAkgQXLuCUd4JEQG
 vZrv9tMjc8UrmCFA/qUeBPnNCWJ2o/wao8DdThlqpg==
X-Google-Smtp-Source: AK7set9B2He/riW52EJ9DOMBhNIHTE9r2V8WCim/fYUAsYxzSxXz1HNe+BGykFh0iYpCP38+mwoQ4YEzkEaFp1fGstI=
X-Received: by 2002:a17:90a:3cc5:b0:229:fe24:91c with SMTP id
 k5-20020a17090a3cc500b00229fe24091cmr4676856pjd.16.1676307576004; Mon, 13 Feb
 2023 08:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-7-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-7-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:59:24 +0000
Message-ID: <CAFEAcA_Vyi7EaEC92WZGT0vujxuiUoZLorXdVhux8A2PASsWeQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 26 ++++++++++++++++++++++++++
>  target/arm/syndrome.h     |  6 ++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index 66dc90a289..3a2772de0e 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -385,6 +385,21 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
>      return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
>  }
>
> +static G_NORETURN
> +void pauth_fail_exception(CPUARMState *env, int error_code)
> +{
> +    int target_el = arm_current_el(env);
> +    if (target_el == 0) {
> +        uint64_t hcr = arm_hcr_el2_eff(env);
> +        if (arm_is_el2_enabled(env) && (hcr & HCR_TGE))
> +            target_el = 2;
> +        else
> +            target_el = 1;
> +    }
> +
> +    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(error_code), target_el, GETPC());

This won't work -- you must call GETPC() from the top-level helper
function directly called from JITted code, so that it can get the
PC of the callsite in the JITted code. Otherwise you'll get a PC
somewhere inside QEMU's C code, which won't do the right thing.
This is why pauth_check_trap() takes an 'ra' argument (for
'return address') and all the top level helper functions call
GETPC() to get the value to pass.

> +}
> +
>  static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>                             ARMPACKey *key, bool data, int keynumber,
>                             bool is_combined)
> @@ -403,6 +418,17 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>          uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
>              ~MAKE_64BIT_MASK(55, 1);
>          result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
> +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
> +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
> +                 !is_combined)) {
> +            int fpac_top = param.tbi ? 55 : 64;
> +            uint64_t fpac_mask = MAKE_64BIT_MASK(bot_bit, fpac_top - bot_bit);
> +            test = (result ^ sextract64(result, 55, 1)) & fpac_mask;
> +            if (unlikely(test)) {
> +                int error_code = ((data ? 1 : 0) << 1) | (keynumber);
> +                pauth_fail_exception(env, error_code);
> +            }
> +        }
>      } else {
>          test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
>          if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
> index 73df5e3793..885a85735c 100644
> --- a/target/arm/syndrome.h
> +++ b/target/arm/syndrome.h
> @@ -48,6 +48,7 @@ enum arm_exception_class {
>      EC_AA64_SMC               = 0x17,
>      EC_SYSTEMREGISTERTRAP     = 0x18,
>      EC_SVEACCESSTRAP          = 0x19,
> +    EC_PACFAIL                = 0x1c,
>      EC_SMETRAP                = 0x1d,
>      EC_INSNABORT              = 0x20,
>      EC_INSNABORT_SAME_EL      = 0x21,
> @@ -221,6 +222,11 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
>          | (is_16bit ? 0 : ARM_EL_IL) | etype;
>  }
>
> +static inline uint32_t syn_pacfail(int error_code)
> +{
> +    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | error_code;

You need ARM_EL_IL here too, I think.

I would suggest that you make the syn_pacfail() function take
two arguments (bool data and int keynumber), and put them in to
bits 0 and 1 in this function. That avoids the need to
construct an error code at the callsite.

> +}
> +
>  static inline uint32_t syn_pactrap(void)
>  {
>      return EC_PACTRAP << ARM_EL_EC_SHIFT;
> --
> 2.25.1

thanks
-- PMM

