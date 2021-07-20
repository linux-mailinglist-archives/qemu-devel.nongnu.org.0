Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392773D018E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:23:32 +0200 (CEST)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uOx-0000tE-8x
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5uNl-0008RI-Iv
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:22:18 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5uNi-000492-Np
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:22:17 -0400
Received: by mail-ed1-x52e.google.com with SMTP id k27so29628591edk.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YfAD22Jw66ezaOC24V5pE3rC5yvIvB10KUaXT9/HQ0=;
 b=qNpK5rNnju2eEomZC8nan0xpOHcD4hSwKVvjrTX0oGhep+gC8BedgpOLchS3v4evkZ
 qnuvp6AA3zOb3VOUWeybnqHrmjgvrptvXeYb3OaxStAJl7rXWLS1WkaYD/tj5fTGfdQR
 rLZjrApurINZdvg5bFsB7tKLkl5kigdIZIHRT76ap/DdEs+ag34G3SdUGkW/jwJK9ZsF
 9ZhPr8nSoIp95WHkzOwCUmFdjBDjK5DPJn61O+HDA1OS5duIkcFfSnYESldmQTii9aqF
 OprAppLpN1c+ZggtTq6IyFS3MjFrZT84TssOiPpD3KF6nLduimuZ+p7kkP2SikUlEU1E
 vI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YfAD22Jw66ezaOC24V5pE3rC5yvIvB10KUaXT9/HQ0=;
 b=NtVGfL73cElAY8OV9TdF4ScxdD8WkPwmfF+ondbW9Nuk0jFfggDFYbkiioGyl6f8zJ
 CeMJMvCviYG0JnrTFTnKUDWOIS1rey2KgjmE3g0fcreoZDZTgM4ZA4SK3uTPVC6TH5o8
 IzRs7RYet15DNBLi3XXU61LEgotSs6tguvFMebTfQPFMteZ+N/S5CYhNsf36Ww5w5jSU
 zxpuYd7uCnXg/Ba/stfXjmCyhanDx52wnKsJV7dfE8wq9FC0Bl1tfdgc27vkAY/OcYHc
 ThSSNKDrtL8cWZ/Nm/T8ONA5yoCUaCp/mjgcJRmfD2P4EAL2VVClTojrxpsQGDfyq0CN
 CQvQ==
X-Gm-Message-State: AOAM531xeVpJw7KJNR7mMZxMsyNG8c3XHg67AYtlcWPNZf7r8V9/o6gm
 BU+56QbiPgArFbZ++iHr2bu38gxKQjgFwzUWki2LLQ==
X-Google-Smtp-Source: ABdhPJxlkBXq75KPSaSrGN12++TW/K5bvnQ3vB1D60Qi0dwCiTmGA+yP7l6LwSMZ13NgD7M0RgBBpdS2CtDJ5UV/LaQ=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr42765840edb.52.1626805332299; 
 Tue, 20 Jul 2021 11:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-21-peter.maydell@linaro.org>
 <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
 <CAFEAcA81nfSPcYDk1FsVqAcxq5D4NXhtXP5c90_0MLtBVxvr0g@mail.gmail.com>
In-Reply-To: <CAFEAcA81nfSPcYDk1FsVqAcxq5D4NXhtXP5c90_0MLtBVxvr0g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 19:21:31 +0100
Message-ID: <CAFEAcA8scVSuS=Yn0qCssNiS=wBeQSDJTYyL=z2Lm1J=uy_wOg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 16:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 17 Jul 2021 at 21:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 7/13/21 6:37 AM, Peter Maydell wrote:
> > > +/* Max and min of absolute values */
> > > +static int64_t do_maxa(int64_t n, int64_t m)
> > > +{
> > > +    if (n < 0) {
> > > +        n = -n;
> > > +    }
> > > +    if (m < 0) {
> > > +        m = -m;
> > > +    }
> > > +    return MAX(n, m);
> > > +}
> >
> > This doesn't look quite right.  The n operand is extracted unsigned, and only the m
> > operand is subjected to ABS.
>
> Yes, you're right (this patch does always extract ra (here n)
> unsigned, so the only case where it makes a difference is
> VMINAV when the input ra is negative). I noticed this wrinkle
> when implementing the FP variant of this insn, but missed it here.

In fact it doesn't make a difference for this integer version:
because we always extract n as an unsigned value, 'n' is always
positive (either because it's the initial unsigned 'ra' or
because it's the result of a previous do_maxa/do_mina, which
must also always be positive) and so taking the absolute value
of 'n' never affects it. But we might as well delete the unused code.

(For float it *does* make a difference, because there's no
"extract as unsigned" for floats, and so the input 'ra' and
thus the first 'n' can be negative there.)

-- PMM

