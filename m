Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBD4FC116
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:40:57 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw9v-0007N0-7Q
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndw7I-0005Aj-TW
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:38:13 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:35884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndw7H-0007pl-5j
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:38:12 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so111320447b3.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHD2buQ4j4vnn0IHH++ySlQ/DIoPPoqbreA7afSC2+s=;
 b=INTr20K2YNYZO+kXeC4OZLqozBFW3CEwCjVqSkLvJnZupJ9oZLtBS3pNoC4sdhlph3
 WUX5Vu9MHUZ57moR1KopyL2KDB6X8i+JHOCOy0zxWGWZ9PoaB+XBI54s0t4rNNgfXnpb
 zB713m4CeiBwMMTIEiqC2LfdXhVaQmKV2eHSZk97Kf0G+yuFvrP8/VMzt8jh1fIDKn1Z
 Iq+60N4ZMZfjNibW03y3ecbwhNjOUEd2ooy5V6VQwUzgmjB6QVoL2o3XzpNM6nv2xnX4
 42MHBwbXQUXazoQoK0xs5wj9eS/eap5UcXJ5LJjSamnNcZ/vTYOlVgxKyVDq4QDd+TcF
 XnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHD2buQ4j4vnn0IHH++ySlQ/DIoPPoqbreA7afSC2+s=;
 b=5E/OOcW70p9tG3luMECuEznFwRKpZPCwau6KLslTi72NBGBppcuIzlFGeiMuUk6KgZ
 2S05PvZymzZrlD0LXUNfoNLvitbMRc8AG+mRUty93nM5Zc6RWS3Sro5IDlz593kykjU5
 n/teI4nu5iP7RL1oBkFKoRnqFhWPQLhwXQfrYvcu9AhjCLfxJIkO4N7TpN3UuGS4ueU5
 RFREh73UlrabTr4Rm4sUKP+04ZUNH633LG3aNw4Ly95sltkpWJ2XyBfIKgfocinHzD+t
 sXnBEBVERvHSDAJijd2+37OEhE4peWYz9ifbazfPiKMq5puPuGU2VfRVmoMKOeL89WFw
 ThQw==
X-Gm-Message-State: AOAM531/96JPTze35NXzcKsmZREN2lNSXDER8AgTYePZrwD9gnQKPGqb
 /YWE1Gyru1TkONb+m1eZZA2r2TW/ZxDuzG9aLQl11A==
X-Google-Smtp-Source: ABdhPJxDfLn3K/GkP5FhMlJwCl9W0DZTCW510yA9CF4Mp/ZZpqZXVifOH/DOwJDKWkV6xC5fi4pgWM/UUycgOesrCdQ=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr4252307ywt.10.1649691490149; Mon, 11
 Apr 2022 08:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-4-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 16:37:59 +0100
Message-ID: <CAFEAcA_HUXLC1Rr05rVCsMyY_EgqdQxpx3mnrrJA2p-WL79c0A@mail.gmail.com>
Subject: Re: [PATCH 03/16] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of starting with cortex-a15 and adding v8 features to
> a v7 cpu, begin with a v8 cpu stripped of its aarch64 features.
> This fixes the long-standing to-do where we only enabled v8
> features for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 134 ++++++++++++++++++++++++++-----------------
>  1 file changed, 80 insertions(+), 54 deletions(-)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..43ac3e27fa 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -938,71 +938,97 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
>  static void arm_max_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    uint32_t t;
>
> -    cortex_a15_initfn(obj);
> +    /* aarch64_a57_initfn, advertising none of the aarch64 features */
> +    cpu->dtb_compatible = "arm,cortex-a57";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x411fd070;

If we're going to claim in the MIDR that we're an A57 then we
should provide the A57's impdef sysregs, at least those of
them that are visible to AArch32. This may otherwise cause
problems if the guest OS tries to write to one of them as
part of some errata workaround.

thanks
-- PMM

