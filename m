Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74FC320BC1
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 17:35:22 +0100 (CET)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDrhZ-0006xx-SC
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 11:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDrgN-0006X1-Af
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:34:07 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDrgL-00065F-GF
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:34:07 -0500
Received: by mail-ed1-x531.google.com with SMTP id s11so18942534edd.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 08:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MLvXn1iajIp1MsNrRM4auCTqR67yytm920Z8VhT0WfA=;
 b=ZRRZ5gjs8IScIREM3W09FlVUjefBkZ1FWOSpS39rlLWjTecg90aKNIcPq1E7/4LMpZ
 LX/1QBvEj/5Vu7sCYpLf/+WK6k0O3CALdJhKBzFqFAGbla6j+OkyVdJRLq+AsPsQBrfG
 7A/TOz2HOv+xzxYCSn0/rQzSDHvOQL/u4Dk8mgw8Tkj4UrhZFmcYTXMrulDGCp8Sw29R
 W8aje7gosYvyUuBcxc0P0MGvLlmaHvUnxRMxkXu6UDqgv5i7ZO0XZbNtXfTdfRCwu6i6
 5xfJjKhg7MXdtLrQr9KW/S78BBMb8sfeI/ihvsQpgjQPgV6r54BEQveds6ZkKPpTbudz
 djIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MLvXn1iajIp1MsNrRM4auCTqR67yytm920Z8VhT0WfA=;
 b=hDKVGsu+QMufSgjlB2qpbVKHkFGbA5TI5TdnGsWnfYHv1uEfr5u3+3JJjc6lbZh66z
 39NiPVLrOqstoK+s6xm6bamV0hi2CGakcjkOA2maYO1nbxOzi1eFfNtnObqxq5MrBo24
 dI+5Cw7KMsM5XGga4aYdOAfbMkzY+5P+j33u7JQJY/o5edntQa6Qepi14cF9pkCJS+1J
 rxvrnBED1WYDs+FQQDLBnq+iAqE4w7Kr0Uwu40kFIryX4OUdQqN/t8anfubDO4x7V6kV
 4ssUTbN7q9ar7I+3aB/k4DEzJn4vehfMYuHrBntPhCYt1bnMUVKOGGHnScqPSq5BWjVJ
 fLGQ==
X-Gm-Message-State: AOAM530CzpwTJDYlZG5jRjV9XSK9XkdyzUKzCltdOWWE8FqpB+xhV9Rw
 5nFK3ONB/IyMOGKjujXfK81bRt2oo7ThdCkgSn+LAw==
X-Google-Smtp-Source: ABdhPJxyyq+BiFn8BAyrqo0ZexAOdq+P9+/68OjOIgXidLEGhmWTWopKHIglhZ1IN8/hfkvQmXJhqjX0p+JRtgi7yk0=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr18594416edd.52.1613925243402; 
 Sun, 21 Feb 2021 08:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20210221160044.28581-1-alxndr@bu.edu>
 <CAFEAcA__DGB0T==xLwUNmizHznnzoYVMUOSOG8wB43LFJWLcqg@mail.gmail.com>
 <20210221162745.m3gtnkcgnt377c3v@mozz.bu.edu>
In-Reply-To: <20210221162745.m3gtnkcgnt377c3v@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 16:33:52 +0000
Message-ID: <CAFEAcA8_TiUQKxDm04V-oJm-p9kiJ6mjvhqKPw+LZJvHoyM0Vg@mail.gmail.com>
Subject: Re: [PATCH] configure: fix --enable-fuzzing linker failures
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 16:28, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 210221 1622, Peter Maydell wrote:
> > On Sun, 21 Feb 2021 at 16:03, Alexander Bulekov <alxndr@bu.edu> wrote:
> > >
> > > With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
> > > This should allow us to build non-fuzzer binaries using objects
> > > instrumented for fuzzing. However, to do that, we also need to link with
> > > -fsanitize=fuzzer-no-link. We were not doing that.
> > >
> > > Reported-by: Li Qiang <liq3ea@163.com>
> > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > ---
> > >  configure | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/configure b/configure
> > > index a79b3746d4..02aaea31c8 100755
> > > --- a/configure
> > > +++ b/configure
> > > @@ -6097,6 +6097,7 @@ if test "$fuzzing" = "yes" ; then
> > >    # needed CFLAGS have already been provided
> > >    if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
> > >      QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> > > +    QEMU_LDFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> >
> > Did you mean  ="$QEMU_LDFLAGS ... ?
>
> Yes... It somehow passed my build-test. Should I send a v2?

Yes, please.

> > >      FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"

It might also be helpful to have a brief comment explaining
why we need to set fuzzing related options in all three of
QEMU_CFLAGS, QEMU_LDFLAGS and FUZZ_EXE_LDFLAGS (ie what the
difference between them is).

-- PMM

