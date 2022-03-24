Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5274E68F5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:58:46 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSfV-0000ge-Ue
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:58:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXSdU-0007Wr-Im
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:56:40 -0400
Received: from [2607:f8b0:4864:20::1130] (port=43269
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXSdS-00028t-UM
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:56:40 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e5e31c34bfso60896177b3.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nNX5PVqUaKMriNKsqTEKDYcnWC9Um6fex5Z0ZRMg2Q=;
 b=xavnYDu30MNPMdj6EEhrKMXaP2Y5nOgAW8sbnBO4x1/YHa/CUAdIWDqXmub6+LZ7en
 1HHytxfr/1sNdSMeTinM0DdLw1P7Yo7jnF7LgDULuz6f4sLn84NhkkdPolFCUkzFxXvs
 /cEBtMECIF6v3kuHiuDUHocFCSa3HJ3wnDhoEcb08msf8AAb8hfk2SyJhgsojhbUKFEb
 NSvqRwNzKo0GRzzjzRDynTisvRo4oeEsCqonh9lcxPUhR0SYMfabJv0zLCVmfDxwQeWp
 eEHon+wzAW3JU18MrPWaxb9USKFlk97Bgr+iP2fwP8xwXd7teT5SRjZ3CKVqZ/EcHaC1
 gQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nNX5PVqUaKMriNKsqTEKDYcnWC9Um6fex5Z0ZRMg2Q=;
 b=Dk8x1+ZW6eGfu8jGCPF6XCOBMam6VckJowg6pWoAI/G7IE3fI1jjUmAm+rjWMASqAH
 2veaJhAxZWTiitD+u1umVyykMOl6Yc/DKLlOTOS+fQD2qxGf8+W19h6BgroluHAHEBvJ
 QMVB+6TbH56AxYzrl+uE7Dhnku9KarfB6rCU9BObB3sUH54tDq67LcCkKSxuZxjj4MZn
 itMtffN2Hunatq5XaLr3vOAHVxuOek5sv9TZAlisfUp4xxz9lJ9mcf3odrDvaVvtVclt
 R0VeIcljIvEZjp1rN/bTEcWuHVBoRa5ORp7vGxoSL/zAPMWgjx8NV3sjFAQomtaltz+n
 KD/w==
X-Gm-Message-State: AOAM530E3m2t/SJG3+WW462XhK2eyg9GzWXbwXnQYoUZ+gXOBj9ZaLdJ
 xtlYZ9N0Uuucdbcq9dDOpRHZsldv0tM1DgIK8xaN8Q==
X-Google-Smtp-Source: ABdhPJyEWos9n8tdxBSG2mwQgtEdBaB9vFf3y/zjF30ck6ZLj8eFpHpw3Eqg2P6MhjqeI7R4tMmEalctyxtxnSOPN6k=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr6496469ywb.257.1648148197651; Thu, 24 Mar
 2022 11:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
 <20220324171756.196654-4-zongyuan.li@smartx.com>
In-Reply-To: <20220324171756.196654-4-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 18:56:24 +0000
Message-ID: <CAFEAcA9GA79yUQj3i5MdLWK6+r3bDObKQS+8_bfx=47TKbLHJQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 17:18, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/exynos4210.c           | 26 ++++++++++++
>  hw/intc/exynos4210_combiner.c | 79 +++++++++++++++++++++++++++--------
>  hw/intc/exynos4210_gic.c      | 36 ++++++++++++----
>  include/hw/arm/exynos4210.h   | 11 ++---
>  include/hw/core/split-irq.h   |  5 +--
>  5 files changed, 124 insertions(+), 33 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 0299e81f85..10826706b2 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -288,6 +288,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
>      for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
>          sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
>      }
> +    // SplitIRQ for internal irq realized here
>      exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
>      sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
>
> @@ -299,6 +300,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
>      for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
>          sysbus_connect_irq(busdev, n, s->irqs.ext_gic_irq[n]);
>      }
> +    // SplitIRQ for external irq realized here
>      exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
>      sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);

This all looks very odd. I'll have a closer look at it later.

> diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> index ff8852f407..eb485dd7a6 100644
> --- a/include/hw/core/split-irq.h
> +++ b/include/hw/core/split-irq.h
> @@ -42,9 +42,6 @@
>
>  #define MAX_SPLIT_LINES 16
>
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> -
>  struct SplitIRQ {
>      DeviceState parent_obj;
>
> @@ -52,4 +49,6 @@ struct SplitIRQ {
>      uint16_t num_lines;
>  };
>
> +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> +

What's this change for ?

thanks
-- PMM

