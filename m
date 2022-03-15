Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABB4D98EE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:39:05 +0100 (CET)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4a0-0000P7-8e
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:39:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU4T1-0001Ce-5m
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:31:51 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=41827
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU4Sz-0005yI-8s
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:31:50 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id l2so36326616ybe.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zlrlh5TPi5kXMaNYiTVC+b6+c9SpiZrArsIVr9lcH2Q=;
 b=BCAtmwOgPhisi0WP+dBKxYtWh7mCf55b1HK+HBs5qrR3RYx/lLJ/6nsDyVwvpmgAUZ
 UpCTwJ45x+o2MDydkMtnEi7EKuHzDWbrS+zEI5W1To8ZbDctbcJnR1fb9BjrrtMZwzf5
 WKUr65CFh93+LF00/fiNHadT+HGebtSAAHeYFzyPopd40UuOaAmrzWliLY5zQ2GSVJNb
 PDaCTtrDtVB4YrfaQxfp+Aas7botCs8m2njZ/g8lHMTRoOr+eJc7AXjo5lGys4RNbdwa
 A+9/BMk4qXKHgsbBT7cvhDBgiUiAxgbaNIhXoHmDzWIi860oKv9yRZO3zZjzpNygIptE
 TofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zlrlh5TPi5kXMaNYiTVC+b6+c9SpiZrArsIVr9lcH2Q=;
 b=oj95dbkUKiiGJweIfmbQ2sHm6cpvAt2EJrwHd38uU1TvJo4snNCDxqjzrMwbtZqYgf
 TYAWi4VuvP4RalrpYb13kwgXJf8ILObmavhFYgrwNmE0+JIR5C9/ivSaBHbXdsc8gcqw
 AIQnFOJt6VO/nZJIBiyZN6fihv7YX9NiTfQmNQnMsxbwrtVNDWfLmhDuFZJEKtFG+w4m
 lPPCVf5ZuED9ng1mBX1/WRLx4VYUQIZfl9D/ZX8Ug3y9ZKmhAA+mRjjNhZr/VScNyrdH
 tL1YPygb/eUALimuTRu1KRsgzaifo+rJ6yKtMjVoFjBnd9EBVAi5WgJO+T3iYqTBOYkC
 ZXWg==
X-Gm-Message-State: AOAM530iz5JgpWxM3VMTrRrXuiszTkZdLKd/3H/cafSy6NH555CWlPOG
 493/LakzQeS5ynUCzItlRYi665e5r7Do8f4Z7TbbIA==
X-Google-Smtp-Source: ABdhPJwwjSQ1cvWecIZihzIxojaupN/dtGJqOzAi7Q4Fz4L8KcVGKQYNRDsozuHBqjzH5IZlZrIW4H3VAGlGjI2U8C8=
X-Received: by 2002:a25:2d27:0:b0:633:7521:4794 with SMTP id
 t39-20020a252d27000000b0063375214794mr2133796ybt.193.1647340308048; Tue, 15
 Mar 2022 03:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220315015740.847370-1-raj.khem@gmail.com>
 <71be7777-9888-18fd-bdd0-3cef3ada8728@linaro.org>
In-Reply-To: <71be7777-9888-18fd-bdd0-3cef3ada8728@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 10:31:36 +0000
Message-ID: <CAFEAcA9+ppnpHxjzScesj4ZzNDVJ8bNzb2nkcd8cN5+zMJwJfg@mail.gmail.com>
Subject: Re: [PATCH v4] ppc64: Avoid pt_regs struct definition
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/14/22 18:57, Khem Raj wrote:
> > Remove pt_regs indirection and instead reference gp_regs directly, this
> > makes it portable across musl/glibc
> >
> > Use PT_* constants defined in asm/ptrace.h
> >
> > Move the file to ppc64 subdir and leave ppc empty
> >
> > Fixes
> > ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: =
incomplete definition of type 'struct pt_regs'
> >      return uc->uc_mcontext.regs->nip;
> >             ~~~~~~~~~~~~~~~~~~~~^
> >
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> > Cc: Peter Maydell<peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
> > Cc: Richard Henderson<richard.henderson@linaro.org>
> > ---
> > v2: Drop ifdef __powerpc__
> > v3: Access go_regs directly and move the file to ppc64 dir
> > v4: Use PT_* constants defined in asm/ptrace.h
> >
> >   linux-user/include/host/ppc/host-signal.h   | 38 -------------------
> >   linux-user/include/host/ppc64/host-signal.h | 42 ++++++++++++++++++++=
-
> >   2 files changed, 41 insertions(+), 39 deletions(-)
> >   delete mode 100644 linux-user/include/host/ppc/host-signal.h
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I did a compile-check and confirmed that this builds OK
on glibc headers too.

-- PMM

