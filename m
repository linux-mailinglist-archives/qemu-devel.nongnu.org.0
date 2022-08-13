Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D737591ADC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 16:19:28 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMrz4-0003hj-UN
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 10:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMrxo-0001ND-Qv
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 10:18:08 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMrxn-0003dG-25
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 10:18:08 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i62so5487874yba.5
 for <qemu-devel@nongnu.org>; Sat, 13 Aug 2022 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=cln1ienKJU2fm+CMnf2Xs3JEnZca3prWoVGFOCyv7u4=;
 b=IkE2GE6nUJO9WgSIPAHmUxd/eC2/TH+LxLM7g+VU0uJoKMmH42xmedfoAqy+boGkUd
 DVkVFHGlqr7Gzhe7wNLYMxovXwOmLpO4lNJ/Hw33aYcbJC68HL16/ubZNnLRkYAqOPld
 w+7HYz3aTjYjqN6ezsDLx1Ja2FUPTLM8BCKor+krky33yxxLpvHhuBPQ99yfEugxji0v
 HooRJyOLMSKYg6UuZbZjEVk5Wkw5HILICe4gBu/y//CGi2P4WNGE3X3siTSaAnIZcX/c
 qXbm6gq7TvQCjfyktFiD+IQ9YHjLzPYSCJbgb+nNSAr+wIu/PX8h4MLj61pZQaxo5YO7
 qdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=cln1ienKJU2fm+CMnf2Xs3JEnZca3prWoVGFOCyv7u4=;
 b=XApb1dFPNgu1wO+O0hU1TkEBATd85rZGhn8ED4rB3w0HtqgnkIGBIjq7b6JtmCQdCH
 93lu30hU8HKJCKlAemLRLv+2vDL9FKGv4e/ohXtG4ntMqwewpD41CLYmg6XHTq71rEYG
 sfC2sy2UNG/DDMhUQ6ZaULmpKbQT6IoI1aOKGA+I1vStlLx+dpnieXtC86sUf2nbXViV
 Bp9GOQgcxjE/aH/gikTzgAJs7S1DghQQ2m4BZ1JZmIV2fazSRx0sX9Z7NTKiBIoUcjiW
 kT7phy8pxaCPfLWdpVpCWrp02GDtgE7uSb8ilOnoqfO4KktJId5nQCqOiisv0lQQ8s5K
 lf8A==
X-Gm-Message-State: ACgBeo0l+Jj2h01D9omVgwIi8XKLEbwGqQbnXmBo5XPBcQpGY7Agv56k
 ROErhJe3WODXfQwJxwyLO+bRY37b+IwdVG5hUur00w==
X-Google-Smtp-Source: AA6agR6uuAx06kP73vr9GX+tNDZmyQqMT5/u6HKXzKeIowiRyH0+DY+rc/GEQSUGHDaeUjxMvKLbTS4yyeCpYBUJ+bc=
X-Received: by 2002:a25:3d0:0:b0:67c:2231:65e with SMTP id
 199-20020a2503d0000000b0067c2231065emr6112145ybd.67.1660400285880; 
 Sat, 13 Aug 2022 07:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220813112559.1974427-1-anton.kochkov@proton.me>
In-Reply-To: <20220813112559.1974427-1-anton.kochkov@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 15:17:24 +0100
Message-ID: <CAFEAcA9TAsaz2edpQ+V0LqZ1NPfd6Tz4M5A-OL0naz-Owo=32Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/nvic: implement "num-prio-bits" property
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 13 Aug 2022 at 12:27, Anton Kochkov <anton.kochkov@proton.me> wrote:
>
> Cortex-M NVIC can be configured with different amount of
> the maximum available priority bits. FreeRTOS has asserts
> that checks if the all unavailable priority bits are unset
> after writing into this register in real hardware.

This assert in FreeRTOS is misguided, incidentally. It's
reasonable to assert that the CPU has at least enough priority
bits for whatever the OS build was configured for, but
asserting that it exactly matches is pointless unless you're
trying to write a test suite for "test that software model
exactly matches hardware".

> To allow setting this number depending on the machine or
> configuration expose priority bits as QDev property
> which is by default is set to 8 as it was hardcoded in the past.
> Thus, existing code doesn't require any additional changes,
> and it doesn't change the default behavior of NVIC.
>
> Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1122
> ---
>  hw/intc/armv7m_nvic.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 1f7763964c..b8959d645d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2580,6 +2580,8 @@ static const VMStateDescription vmstate_nvic = {
>  static Property props_nvic[] = {
>      /* Number of external IRQ lines (so excluding the 16 internal exceptions) */
>      DEFINE_PROP_UINT32("num-irq", NVICState, num_irq, 64),
> +    /* Number of the maximum priority bits that can be used */
> +    DEFINE_PROP_UINT8("num-prio-bits", NVICState, num_prio_bits, 8),
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> @@ -2690,7 +2692,9 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>      /* include space for internal exception vectors */
>      s->num_irq += NVIC_FIRST_IRQ;
>
> -    s->num_prio_bits = arm_feature(&s->cpu->env, ARM_FEATURE_V7) ? 8 : 2;
> +    if (!arm_feature(&s->cpu->env, ARM_FEATURE_V7)) {
> +        s->num_prio_bits = 2;
> +    }

Thanks for this patch. It's correct as far as it goes, but it's
missing some pieces.

Firstly, armv7m_nvic_realize now needs to do sanity checking
on the num_prio_bits value at the top of the function, the way
we do for num_irq, so that we return an error if the property
was set to an out of range value (ie less than 2 or more than 8).

Secondly, the armv7m container object needs to have an alias
property for this (because SoCs don't create the NVIC directly,
they create the armv7m object). That's just a one-liner in
armv7m_instance_init() to call object_property_add_alias() the
way we do already for "num-irq". You also need to add a line to
the comment in include/hw/arm/armv7m.h that documents the
properties of the container object describing the new property.

Thirdly, you need code in the board models which actually sets
the property to something other than the default when it creates
the armv7m container (at least for whichever board model you care
about, we don't necessarily have to fix all of them). Otherwise
this is all dead code that doesn't change QEMU's behaviour.

thanks
-- PMM

