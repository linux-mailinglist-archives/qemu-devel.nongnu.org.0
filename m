Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEE4E7451
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:38:53 +0100 (CET)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXk9T-0006zs-F3
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:38:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXk8N-0006Jo-Ez
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:37:43 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=39926
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXk8L-0006NA-VE
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:37:43 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id t11so14098856ybi.6
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMyLEv3+olXGQ2ARfz+7T5YR2k+ttPfPwqMm++Ulipc=;
 b=ArsTmtBB+hj4kyaKaZTgUiDDIGUVb8f/2I/kqLFOVQL38Ww4QIrkIhHl5U/Olsr73+
 okVvaZU12gVhBS7vx3bp7sVTpsAFFS4f2fEL5Xkc4GSqr9Mz07ewzzUqXxiEIbVUAbK/
 iv7wSMxjHWz8dR5B8640DLgyaV4qgJ5emP4R76fN3X6KUrPTim26IjXe81TbM9r8InUd
 E4trVTovigubKukgVepc0OvwA5lzSFpyKMi+EoB2uav3NEUs6mcsa+ClTtp/P6G90Q5E
 PS2XeeXoTDy/OTWaz6Zcsn3TuMb/2vnPEzNVd+jNj9XaP/nZEDP6pJGotPDq7V7fZkOL
 srrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMyLEv3+olXGQ2ARfz+7T5YR2k+ttPfPwqMm++Ulipc=;
 b=fSU+qhUQEfOAYLA5Q6Ck8a6qBENhzp8kvMqyq8Ogza3lPGK3mW+Dlm7cnSOp4yovNV
 Dspi+JpV3Gt2PgcKB1DKdYE2nyCRairq0QW4caMwWHRROvQpDsiwH+4Pj0mcIlo0ZI5S
 qplZ02Z3WN+0oASuJPfqAilCQ9y0VOVT0wHh5BIYbLSovxKKv7c4elCkXBW5gctOClA7
 LKV01F3gdct/34S8sgW23uUoWPaZrjaNrlIwQWyBM5TIuk4Tr1bv6e7azv8XcJ/EoPtd
 /DlVC4AjpNvi3I8g5L1uaKVI+vXbWPvbBD42piLdTavYfXGFQmU9yHQUG4UURAsCUztM
 QXEA==
X-Gm-Message-State: AOAM530/Opq4kyji+gAt36oxPfBBorM6htQ8j5XYTplGHmJ6CddXM9hv
 FxNrBTrR1U7h0e+uitxpsrCjs89H6pREuFR6qsRYWw==
X-Google-Smtp-Source: ABdhPJxsBNna0NoVxsyDIiNsQuDaKKyXvJuccfSpzuF/8gQbv4NdyClje0Aa9vPEwQqXdDHhjgGII/1SobyItoMwP60=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr9791318ybu.140.1648215460994; Fri, 25
 Mar 2022 06:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-4-richard.henderson@linaro.org>
 <CAFEAcA-RSLe-fF+EcuoOfXnOynz8zc7_N_AnNt3uRx5PZTvq9A@mail.gmail.com>
In-Reply-To: <CAFEAcA-RSLe-fF+EcuoOfXnOynz8zc7_N_AnNt3uRx5PZTvq9A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 13:37:27 +0000
Message-ID: <CAFEAcA9fDkVZB5StxGBp=7cy02zQwtZ+ZLVzxQcH3-bJ8hv51Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] linux-user/nios2: Adjust error return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 12:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 20 Mar 2022 at 16:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Follow syscall_set_return_value rather than the kernel assembly
> > in setting the syscall return values.  Only negate ret on error.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  linux-user/nios2/cpu_loop.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> > index ac71f4ee47..2ae94f4a95 100644
> > --- a/linux-user/nios2/cpu_loop.c
> > +++ b/linux-user/nios2/cpu_loop.c
> > @@ -48,9 +48,18 @@ void cpu_loop(CPUNios2State *env)
> >                                   env->regs[7], env->regs[8], env->regs[9],
> >                                   0, 0);
> >
> > -                env->regs[2] = abs(ret);
> > -                /* Return value is 0..4096 */
> > -                env->regs[7] = ret > 0xfffff000u;
> > +                /*
> > +                 * See syscall_set_return_value.
> > +                 * Use the QEMU traditional -515 error indication in
> > +                 * preference to the < 0 indication used in entry.S.
> > +                 */
>
> Well, it is traditional, in that we've used it for sparc for
> instance right back to commit 060366c5ad18b3e in 2004, and
> even earlier for ppc since commit 678673089d1b.
> probably for about as long for ppc. But *why* do we use this?
> Well, 516 is ERESTART_RESTARTBLOCK, and that's what the
> arch/sparc/kernel/entry.S code is comparing against (it does a
> greater-than-or-equal check, I think, hence 516, not 515).
>
> For powerpc, however, the kernel handles setting the CCR
> bit in syscall_exit_prepare(), and there it checks against
> -MAX_ERRNO.

This turns out to be because in 2015 kernel commit c3525940cca5
switched powerpc from checking against 515/516 and instead made
them check MAX_ERRNO (4095).

(If anybody cared about seccomp on sparc hosts they'd probably
want to fix the sparc kernel similarly, but presumably nobody
does :-))

The kernel commit message mentions some infrastructure in
the form of force_successful_syscall_return() where syscall
implementations can force that a value above -MAX_ERRNO
is still treated as "success". In theory perhaps we should
have something similar...

-- PMM

