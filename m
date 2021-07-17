Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672383CC263
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:08:23 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hF8-0004zL-GS
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4hDh-0003RD-4w
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:06:53 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4hDf-0005Jx-Ji
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:06:52 -0400
Received: by mail-ej1-x62c.google.com with SMTP id qb4so19151743ejc.11
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lxgv7J2hQCIDbuwwemUSH0cAp5apuA6AMtxTkbp6Exo=;
 b=uZ3OmUG0QF7NLOeAORW8gEzf9G5yG5Y+WQE6MpdWzcGKe+o1wYIm8CBvMbOgzm2s+M
 Bmsw0JoyewWOHtFRr+f8WQOY8QroA7D+P9+h08svPb70k7QKwC8jrOcGBI12x5omA+kp
 aw5i13xDv4wvVcJZaHD2DFMdYZiFXYl1IlwL6iWV3c5En3L91UzDQ2zsacee9KMUhgSD
 pik+AbJJRP7Dyl3vwp5tntZB4+cJkSd6E/Dyr+Vvapl0ivH24ImcMXX3Vqui4LNoJcis
 GfXXS9d92EG36xOlRleTwVrMDJ/VcqK3QPVdHHPG/4RKjSlr/hJhE3DHdahfm+AJpf4P
 TDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lxgv7J2hQCIDbuwwemUSH0cAp5apuA6AMtxTkbp6Exo=;
 b=AAIXHWXZ/6MJ95NX1c8Ucow90BX3k+gA4eT0/pwJ7jOr53yRK/5rIxu3LTISGCQWN8
 bvRGm2cjcDlroBzfOOUKsW2Br9fJNS/MwOTqKK0mhp5pL98qCWsPYAzqCSj76NJsVweE
 QxhLf62EJcc7v6shxqoJTfvrHC17azLDLdU4JUhmsnu7z+MvAwlj6wEEsF+BDPWGPbJV
 u1V169DVrjEK83MHki6MNsizG6gH4Pjuef8akeQujQb4bxPMAo8xlglnl008Gd68Paqq
 OuO6GRZ82IPn5lpkniW0QPCpMCjXDrs2ckK/N2IL8iqzPm0FlI/mNzAKgJAWtyphZhAI
 flaw==
X-Gm-Message-State: AOAM532D3+JFA7C4+X7foXH1XkLKpgugZPdkbPGqrallV0orLy2Mliui
 /SD2khbsdkjRIARR5ipE2m011JUCKkdNeEzcmj6qcT2yT1zVfA==
X-Google-Smtp-Source: ABdhPJyBX/rrhDOnqumW4FxXiZXBEitOeV41Y5PGP9yw+M9t/Bndf7/4QEVNF+u8cNVYr/Bl+zaQv418wioaUix9w2c=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr16555511ejb.382.1626516410137; 
 Sat, 17 Jul 2021 03:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-18-peter.maydell@linaro.org>
 <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
In-Reply-To: <e3f557f7-c65d-428e-a0b5-68d1ffc01df4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 11:06:10 +0100
Message-ID: <CAFEAcA-o=rC1Zm6JyFECZ_uXndbRurrZdYVWTn9aq=dHXsWJSw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 17/34] target/arm: Implement MVE VMLAS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 16 Jul 2021 at 23:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > Implement the MVE VMLAS insn, which multiplies a vector by a vector
> > and adds a scalar.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/helper-mve.h    |  8 ++++++++
> >   target/arm/mve.decode      |  3 +++
> >   target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
> >   target/arm/translate-mve.c |  2 ++
> >   4 files changed, 44 insertions(+)
> ...
>
> > +/* Vector by vector plus scalar */
> > +#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
> > +
> > +DO_2OP_ACC_SCALAR_S(vmlass, DO_VMLAS)
> > +DO_2OP_ACC_SCALAR_U(vmlasu, DO_VMLAS)
>
> This is confusing.  The ARM says
>
> # Operations that do not perform
> # widening are always unsigned (encoded with U=1),

I have noticed that that text often appears for insns where it doesn't
really apply. I mostly ignore the text in favour of looking at
the pseudocode for working out what is supposed to be done.

-- PMM

