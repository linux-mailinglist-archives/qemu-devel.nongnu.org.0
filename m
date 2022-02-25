Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40104C4DB6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:27:01 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfIy-0005iQ-SZ
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:27:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNenP-00037h-N4
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:54:23 -0500
Received: from [2607:f8b0:4864:20::1129] (port=34224
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNenO-0000cG-2U
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:54:23 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2db2add4516so9176767b3.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AAwGBoDhAHAzPzPh7KV0Suze6+dW50yTAloSXTjsH3k=;
 b=XSY77/rYIPj53La5I6eSFwtwsUqXdo8UiOqGplo1xe8ly1ojpxIKYpQhQsJnnUnaWP
 iNriXq1BSXrilqVOBIrV+bz6p/li4TvHhyFezmHamTIXxZRrCY8W5Kg8R831PqLtm1R2
 oIUDimDyWH/KGLShic6hHT3sJfZLlG36Ta9wrCfKhTCcKQuk5/jdgJa9q0g3ftUgbzi2
 ANyM96XZ8s8TY7SmWcbhrwBmWTwYf8ApMeHVxMy/W3tWFev46F96P3O4EAYIaFfWXaHG
 r7wHVHQ5iw2x233+p/LnDQQYq2vuylqZPUkz89m41Zh6F2XQ7H0IgFzPATqpoHXfWZ3X
 1ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AAwGBoDhAHAzPzPh7KV0Suze6+dW50yTAloSXTjsH3k=;
 b=ySpcHiPJu6Jvtved3mqhoCuYOMZoYOt8M34AL9ezvFiDnIZWrRktRK1iI4AXXVPe/X
 AZg3YkJ/V6UX55sulYWl9TB2Wnje8aD2wMXBnXaw1V/9qag2+ImogXq3b8HcxXGEI8dI
 xIoo1Bu3eSomORuRGthsvqI23M2+dbn2ntZPtlIZEz/as5DqKFa71BJw5T3xMA3+B+Ko
 ofeOtZOv0ZHpWjbQg4J7ErHN7LLvLFC6XbJzQTZWl5kANZsLVEPB7jmGqPuWKvd0wyr2
 jcEZ1Faw3/MguHvl5txIdEzT1B4pWu/7e+4vwpd4UxXrsifMe2Ca8Uw+JGnihfZSaZvf
 ofQA==
X-Gm-Message-State: AOAM532ZZvm2ACDJyNfTU39qhtc/OTzy+wWMGuCL4Fo4ZTdOELQUlACz
 PUaHudu0Yq1G3q372f1JAcPI4gjdSukdEivBvSk8cQ==
X-Google-Smtp-Source: ABdhPJwAxIz0UxN/rtKNJuykgT8smRgnYw3XkxJmMo6xagv/4KViT/4RaCmpEk7Nk6olikxuNdiYZVXBPpLOIgLSsbo=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr8595419ywd.10.1645811661144; Fri, 25
 Feb 2022 09:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-3-amir.gonnen@neuroblade.ai>
 <bc2f558f-ae52-34ef-6901-3192f1d2fc45@linaro.org>
In-Reply-To: <bc2f558f-ae52-34ef-6901-3192f1d2fc45@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 17:54:10 +0000
Message-ID: <CAFEAcA_byoEDECy8NC0b4X_34EjegzMEtQAP+Rp6zQe_9VB1xQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] target/nios2: Exteral Interrupt Controller (EIC)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: Marek Vasut <marex@denx.de>, Amir Gonnen <amir.gonnen@neuroblade.ai>,
 Chris Wulff <crwulff@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 23:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/24/22 03:48, Amir Gonnen wrote:
> > +static void nios2_cpu_set_eic_irq(Nios2CPU *cpu, int level)
> > +{
> > +    CPUNios2State *env = &cpu->env;
> > +    CPUState *cs = CPU(cpu);
> > +
> > +    env->irq_pending = level;
> > +
> > +    if (env->irq_pending && nios2_take_eic_irq(cpu)) {
> > +        env->irq_pending = 0;
> > +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> > +    } else if (!env->irq_pending) {
> > +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> > +    }
> > +}
>
> This looks wrong.  Of course, so does nios2_cpu_set_irq, from which you've cribbed this.

Bit of a thread from 2020 on nios2's odd interrupt handling;

https://lore.kernel.org/qemu-devel/3260735e-05ab-2d42-f7e4-914ad804f543@linaro.org/

though it's mostly just you saying the same things you're saying now :-)

xtensa's also weird in a similar way.

-- PMM

