Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1000850B3AF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:13:45 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpMG-0003LG-4v
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhopR-0000dc-8P
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:39:50 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhopP-0006W9-DS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:39:48 -0400
Received: by mail-yb1-xb31.google.com with SMTP id v10so4438771ybe.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5m1RJ7QYQ8PodX60mljRnorDu+JPGwZK9A8heCnabjo=;
 b=tPnjG5g13X/tquX0VJgzmzGO4pWMeGy/E//RCQHciSHY/6gqHSxivAa1dK/58p3py3
 0PsZYakOQRfUDz5HHDKpsOmraI9EABJARiyhqCWkCeNPVMXqtaUh9Pb34rC6RO8Nm+/B
 i2cKV8r7x5T3+huei74dh69pzdO4KNe/DShWone5gVhrZANJYvmcUPuCeiSXylqpnHis
 M72KTytwWG8xDWy8aSN9RnSk7sSD3dbPSL0/AfIVaz0LasDrvqqe7K6C3ZbNuq8qWeK4
 fRKc8lOg/jMUIqLJ7VEJAXB44mPu7J+CRQWCNHKYV+iufoFnsSMsXC000JJ5JFAJhKCu
 rThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5m1RJ7QYQ8PodX60mljRnorDu+JPGwZK9A8heCnabjo=;
 b=uuk41nLfWgWLi6dfWDqgWjJj+bsX3bJYDxAPYDZbGLB6KKzhYpqq/xPs6KAkDcC8Vx
 UgRZIS4z+50wpWqHa9FjFl7A08m0NZy9lH6O6nzuiZDtpMCBgFTKlt/gkxCoRQTskkUR
 oKzLSydxS0bHiQKZu2JSca5CjyjFAqIViFKqAiB2FPZK8WdvXxq8ZI4L0d1YiazqIDBK
 AmzVOd/lQBhdowpIa/OrplAVX8XjNlY8gtRX08Kbyh/CrMRhFmoE0bCR2azJFuAviOjB
 oDDklszuX35FfYgt12sbT/UJedrlT/jwmVJOpUshVFXZoFnbCWBjnonc4At9UKwKnJnX
 AOxQ==
X-Gm-Message-State: AOAM533yTpElC3vQlAc942xn/JpNhui6ImgV3pUjpCWWZPA2wjz8m9VZ
 suEy8dRSHUiWbwfnWX9Rcn2+HNtWnMkUw7ZCuGUK0w==
X-Google-Smtp-Source: ABdhPJwCgI7kP2nYzz79IEzDi8nqZ8xH21M/VoD0NYM4pYUKnwTe3OlY0i3SVY+JLnQB2mBoPb4jDmnuo35Jz4BNoCQ=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr2214419yba.193.1650616786251; Fri, 22
 Apr 2022 01:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-23-peter.maydell@linaro.org>
 <05bad303-e4d7-c776-5105-6b74a559fc38@linaro.org>
In-Reply-To: <05bad303-e4d7-c776-5105-6b74a559fc38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 09:39:35 +0100
Message-ID: <CAFEAcA__r7FnyuS=wt_zk2b0n6sV191pceZBFWHfMFOrxQDHrw@mail.gmail.com>
Subject: Re: [PATCH 22/41] hw/intc/arm_gicv3: Implement GICv4's new
 redistributor frame
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 19:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/8/22 07:15, Peter Maydell wrote:
> > diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> > index 7c75dd6f072..9f1fe09a78e 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
> >        * in the memory map); if so then the GIC has multiple MemoryRegions
> >        * for the redistributors.
> >        */
> > -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> > -    offset %= GICV3_REDIST_SIZE;
> > +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> > +    offset %= gicv3_redist_size(s);
> >
> >       cs = &s->cpu[cpuidx];
> >
> > @@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
> >        * in the memory map); if so then the GIC has multiple MemoryRegions
> >        * for the redistributors.
> >        */
> > -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> > -    offset %= GICV3_REDIST_SIZE;
> > +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> > +    offset %= gicv3_redist_size(s);
>
> In these two cases, it would be better to call the function only once.

The compiler is smart enough to only actually call the function once
(and thus to do the / and % with a single div and imul), so I don't
think that explicitly adding a local variable and doing the call-once
by hand is really worthwhile.

thanks
-- PMM

