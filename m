Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366B5986C7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:03:55 +0200 (CEST)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOh3p-0006lj-Rk
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOgze-0002pE-Fo
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:59:34 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOgzb-00035O-RB
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 10:59:33 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3378303138bso7933747b3.9
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=bgqiSKA5S+ohEA7sQE95LemuafEEHdalqBhWPWevwyc=;
 b=Ce8BDW2qeVUIO2++PuIxZSveWuNY19S7kUFTJfVSfqgI21r1tVLP679EcDLvVoijvI
 reYxNMN3y4095x2/9HqeBLvKdT2lrziYTMtC0/VgGihexg4VsGRRvHFUiDQhybD42Hz8
 a5vUmbPPDxvI4upslvRQdkj7FxzBCafmk0C005va3Fb1i+ddMBCR7RxeS9Srt0gPVqak
 1lKHuTaMd8RKtKUSsN0EI4f621vb9WGE+8RRwI8kShN/xdKV3F6GivrNBtTudyM71c5c
 35GVNd42699XlkLf+aNsy4WbWv7tcd74xFAeX97usnvq3/X8dME5oMcWKHu5n4hODyP6
 OHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=bgqiSKA5S+ohEA7sQE95LemuafEEHdalqBhWPWevwyc=;
 b=FjsW4sgbmW/cF74IHqd45YM2tWQoxthzMBBjEsLz57vIOjR+Gct76qPgXajw+XYRRm
 HK+w/G969M6NV36bG8wxgw4cylsPoCFIsKEReHYXo8TAEnc8MSJAPdRWtJBUBQW9xx2s
 uPMeGoqayHxv8xBOPRGBzVv8n/0xNjB7tyx1lTA/48nsmu5MoZNvwbvhaJyR1iNl41jK
 MBu7vZDok25TSuuu3JPPkQcH24+vZO9hJpGLpPXmoxUOJBqghzIAyRJhkjK0qZ4mlCiW
 sNRtZuJqe9P5M9oY4ucTJWPziigJQ/83zy5GMf1nyiC4T0e7OMLuf3PhtHdazIM2pqig
 fbSg==
X-Gm-Message-State: ACgBeo02/qLyAMGVQej6eVTSooAmRf6kKD9oXVQatJmtDUC3MO6h97fV
 JRXJip2la8jSDRhntLAq+ERXDuSdKYhPxBw0UUiytg==
X-Google-Smtp-Source: AA6agR5ewWe4Pyh975AgdMpVsRaUzwE4ocGxzhviHpsw+GOmTDUocQtDO+i4ejzbJQiI648nbGzRsqngdzsOJsT/XKQ=
X-Received: by 2002:a81:10a:0:b0:333:618e:190b with SMTP id
 10-20020a81010a000000b00333618e190bmr3035672ywb.10.1660834767115; Thu, 18 Aug
 2022 07:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220815213458.733701-1-wuhaotsh@google.com>
In-Reply-To: <20220815213458.733701-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2022 15:58:45 +0100
Message-ID: <CAFEAcA_nJzdtuMQtDQN6Fn1dHyTDFA4=qoYDUe1Bpjy8RiQpUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add cortex-a35
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Aug 2022 at 22:35, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add cortex A35 core and enable it for virt board.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>

> +static void aarch64_a35_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a35";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +
> +    /* From B2.2 AArch64 identification registers. */
> +    cpu->midr = 0x410fd042;

The r1p0 TRM is out, so we might as well emulate that: 0x411FD040

A few fields are missing:

 cpu->isar.dbgdidr
 cpu->isar.dbgdevid
 cpu->isar.dbgdevid1
 cpu->isar.reset_pmcr_el0
 cpu->gic_pribits

(these probably landed after you wrote these patch).

Otherwise looks OK.

Remind me, what did you want the Cortex-A35 in particular for ?

thanks
-- PMM

