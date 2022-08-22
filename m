Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748659BC00
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 10:51:24 +0200 (CEST)
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ39X-0004Ww-6y
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 04:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ37M-0002Wm-D1
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:49:08 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ37J-00042y-Ku
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:49:08 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-333b049f231so274073217b3.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Y1tq57XZ7tNymxEq/Ld+j6n7bfRd7i1VNn8oFC6wGks=;
 b=ioIopFoZrqUUUv/22xSoeWKFXgF1qAIWJL4FafaIv0LBeGQsMqTcx7LXk2GZQb7yQn
 XDcVGMitI/RFlFJk6af2ePLuv+I/HwqE4828hEWqzDNfi+HEc2UFzlfFU3/nRUzmuC5N
 yU9FUQMjsPtjLZ04ekGnZ78iFj6F9wJ+VoM1NY8n9D2dW5Ry+WAAcXFCIfCI0C763L9Q
 268dAbMP1Wnctjpfge/RGqa28SWVhJqfKIHCNA2KgGEJ3wFfDLUTQ+Yo9QaYg+iH6nOl
 SSR+y6VIm+zdUES2ojsTYX6J2676voaIJbvr/ieURdfKW2lGD89U56zPHCMupqMPpvG6
 UXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Y1tq57XZ7tNymxEq/Ld+j6n7bfRd7i1VNn8oFC6wGks=;
 b=tOq3nJX+F778PbNVHBOn9DqX16keDZnUw9L0G1tq+HV6YxJyMtcJ43VDOGkMmEc1rs
 p7Ct8ucseTNCRW9Y9xoXHPjQgie7+nK7a1KGyNkR+PzjuM+QGiCoRhb5F85cF8OkXjrw
 h+fZAKeqkI7GYe3rhloKe6wLrV/DEVMMjVJabQ3Wo+hNr19hz22MggHy4cF6GduybtUT
 IZEHbyiQFDMDa1G2kA8K7fezNLvxhpDseC+9svGpeJCJr2N0RTLOrvy8o4UWMqef85rl
 V44kB+ZAIO/nTKwshUakw5X8p1MloSv5ySWap2oawK4quXF+t9BaGJPl7ZmfMQIyj1yR
 TrRA==
X-Gm-Message-State: ACgBeo0Or3LNYWYcKypx7wKnRR498QpY99ASuIpbifVBnGZjsuz6W667
 BMC5YRFfSgVSrNY8jRXzKR/fK2KmZ3kj6OvpguUHzg==
X-Google-Smtp-Source: AA6agR7P6hFzFxpC8jRRshvfh86GfDJ/oTssG1+m9CZ8kU6lNmS0TOMjoR47Ka2ecMfrnC0S4kmC54fG28iQYRUGz/8=
X-Received: by 2002:a81:9145:0:b0:33b:52b8:5335 with SMTP id
 i66-20020a819145000000b0033b52b85335mr5082492ywg.347.1661158144038; Mon, 22
 Aug 2022 01:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-2-peter.maydell@linaro.org>
 <669d1687-3ffa-0616-a623-239f479ba717@linaro.org>
In-Reply-To: <669d1687-3ffa-0616-a623-239f479ba717@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 09:48:22 +0100
Message-ID: <CAFEAcA_xC6Nkz0PvHN0op=WHD08Gcvf41Nso5iW+ZXWSNaBBWw@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Make cpregs 0, c0, c{3-15}, {0-7}
 correctly RAZ in v8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Sat, 20 Aug 2022 at 03:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/19/22 04:00, Peter Maydell wrote:
> > In the AArch32 ID register scheme, coprocessor registers with
> > encoding cp15, 0, c0, c{0-7}, {0-7} are all in the space covered by
> > what in v6 and v7 was called the "CPUID scheme", and are supposed to
> > RAZ if they're not allocated to a specific ID register.  For our
> > pre-v8 CPUs we get this right, because the regdefs in
> > id_pre_v8_midr_cp_reginfo[] cover these RAZ requirements.  However
> > for v8 we failed to put in the necessary patterns to cover this, so
> > we end up UNDEFing on everything we didn't have an ID register for.
> > This is a problem because in Armv8 some encodings in 0, c0, c3, {0-7}
> > are now being used for new ID registers, and guests might thus start
> > trying to read them.  (We already have one of these: ID_PFR2.)
> >
> > For v8 CPUs, we already have regdefs for 0, c0, c{0-2}, {0-7} (that
> > is, the space is completely allocated with no reserved spaces).  Add
> > entries to v8_idregs[] covering 0, c0, c3, {0-7}:
> >   * c3, {0-2} is the reserved AArch32 space corresponding to the
> >     AArch64 MVFR[012]_EL1
> >   * c3, {3,5,6,7} are reserved RAZ for both AArch32 and AArch64
> >     (in fact some of these are given defined meanings in Armv8.6,
> >     but we don't implement them yet)
> >   * c3, 4 is ID_PFR2 (already defined)
> >
> > We then programmatically add RAZ patterns for AArch32 for
> > 0, c0, c{4..15}, {0-7}:
> >   * c4-c7 are unused, and not shared with AArch64 (these
> >     are the encodings corresponding to where the AArch64
> >     specific ID registers live in the system register space)
> >   * c8-c15 weren't required to RAZ in v6/v7, but v8 extends
> >     the AArch32 reserved-should-RAZ space to cover these;
> >     the equivalent area of the AArch64 sysreg space is not
> >     defined as must-RAZ
> >
> > Note that the architecture allows some registers in this space
> > to return an UNKNOWN value; we always return 0.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++----
> >   1 file changed, 60 insertions(+), 5 deletions(-)
>
> This is the thing at the top of H.a page G7-8990, yeah?

Yes, that's the one.

-- PMM

