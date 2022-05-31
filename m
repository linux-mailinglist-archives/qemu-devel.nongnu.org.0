Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86708539371
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:58:07 +0200 (CEST)
Received: from localhost ([::1]:33928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3Ju-00072G-4v
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw3Hp-0005z1-2G
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:55:58 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:37880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw3Hn-0008Qb-AW
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:55:56 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ff90e0937aso142563627b3.4
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ysINbQHcUnxGeRnEoXCrG9JCUoms8oF+WIu6lzKxHSc=;
 b=LDDOqslbQTBDjyCuOT1GMA9kMUWRoCjSoaSaogT9wZKMq6Sb0eQg1yKo1PZGzFU9vo
 /TXGd+kj6T+MjIEWLDCLqTq52vze12iFz7AHsWND7SWtDAuWkjaM2zYA43QF5zJNgyS/
 buRW2TNX/jAsRa/b8slvvXFByDBn0GBfh/xUwR8bftdm2lwPuRWClG/CuwGhu4AgZ7bL
 E42JslHZl+8jbS4u42uJ1U1u9mAiPhzMpAVcKM/DbB7OrXtrpS2LGVgM1LjQEREvycEi
 U0QPyEhGi9U0VW6gvLNjW7+vmOcAi83rVsN1B1pShZ2E/sh7qiPqQWijcQ8Lzl3icvLK
 3Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysINbQHcUnxGeRnEoXCrG9JCUoms8oF+WIu6lzKxHSc=;
 b=mlmstxl4JynT7HP/XdQNwFV0h4B42Ej4xzqP3/c2uMivSz8RfxIrJ8xNpk2Zpop9aU
 Ux/NpvlTOQDfrlXs/44+8a1x+SZdIBA/9ZdXqzm1OCBasLUQ0IKfuroCvwkijGRh7f+1
 ea3Dvaf0X6Zf8aYNjqVcxBRdD0J2NUAB0Vfxwf4yW6wQpaZaf6yiZ//PvXzaNpVaSHj+
 9TjjQa3JCvEkiRNTW96YnBUiIZogFd7LJ+XS2qhssAL4K1ZUUVsv/U4hB0AYYGe4ISvT
 McmuCeGN4/LJa6+9FUc7FBEuEvQVFPhEMP5frfoNtYpxcMprqIn+10jTkCwPqYhZhvIr
 pygA==
X-Gm-Message-State: AOAM53381/l2j3y4/lLlb130Z7A95U+yujgUUXv/CS6YczID03iEOsHs
 XSK8YC1oTAmWX5OfahSlbIxTrdG+XfOfZJbLaAhIvA==
X-Google-Smtp-Source: ABdhPJzahlogWzzEXsw53QRELOW2t5M4M7+K+uQTbsRHoX6TJ0ZSR5VmbQYaOqnUhGNIMU4ZhzJunhGOi528n5gBJqo=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr47980071ywb.10.1654008954093; Tue, 31
 May 2022 07:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-4-richard.henderson@linaro.org>
 <CAFEAcA8XTYwjshU1cUNtW0uzFQBa2rBJd+5JbraFP6iJ3g1Fwg@mail.gmail.com>
 <cebbfbb8-fabb-25ce-5fd8-5f6391d543fe@linaro.org>
In-Reply-To: <cebbfbb8-fabb-25ce-5fd8-5f6391d543fe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 15:55:42 +0100
Message-ID: <CAFEAcA-UA2D+AkRBKLofMDvwOf-hQYmOgtXpU6K92gEZy-RwGA@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 31 May 2022 at 15:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/31/22 05:15, Peter Maydell wrote:
> > On Fri, 27 May 2022 at 19:07, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We don't need to constrain the value set in zcr_el[1],
> >> because it will be done by sve_zcr_len_for_el.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/cpu.c | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> >> index d2bd74c2ed..0621944167 100644
> >> --- a/target/arm/cpu.c
> >> +++ b/target/arm/cpu.c
> >> @@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
> >>                                            CPACR_EL1, ZEN, 3);
> >>           /* with reasonable vector length */
> >>           if (cpu_isar_feature(aa64_sve, cpu)) {
> >> -            env->vfp.zcr_el[1] =
> >> -                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
> >> +            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
> >>           }
> >
> > I'm still not a fan of the zcr_el[] value not actually being
> > a valid one. I'd rather we constrained it when we write the
> > value into the field.
>
> It is an architecturally valid value, exactly like the kernel might write while probing
> for supported vector lengths.  It will result in this, or the next smaller supported
> vector size, being selected.

Mmm, I guess so (having re-read the ZCR_EL1 docs).

-- PMM

