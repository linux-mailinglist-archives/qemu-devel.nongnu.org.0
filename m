Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5A407A92
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 23:59:01 +0200 (CEST)
Received: from localhost ([::1]:51850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPB1Y-0004ql-DW
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 17:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPB0e-00048W-Qx; Sat, 11 Sep 2021 17:58:04 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPB0d-00036M-38; Sat, 11 Sep 2021 17:58:04 -0400
Received: by mail-oi1-f174.google.com with SMTP id c79so8493852oib.11;
 Sat, 11 Sep 2021 14:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uBp6b9I3LtR+DdOQ0GQJzAlWFjt0f1ZGtu1oLKfwOis=;
 b=QDW8ib8pXMx/PkSKbAubIrY3P06Kr+rUPlj9Wd6iraRoGfIc/7GAL1VL8vNethr8Ly
 mFyMEAy7KYYA9mp/ncfV9X9bVQZzb2ly/rHr5Wls+qBFWhodqA92kGP6NYLVZyj0OfEX
 tP3b1tMRpHvXP5PUKlJvpFHzq15WMRoq6zFS6KAQ8lTKrSFx44HtFpbcOnuvZ+fAlTZX
 ccy7zLZ4XsaLLRiT61fO+h3SGedpNKgeyJgZ31RcCAHrgS8HOweCzVXgA5bca1uUbOXa
 ZoETlK5HMS/iPuHK2NdRb8IxKQT2JFtFn7vqOp2z+Dcpy9wy4N20hbL/coagn50yuz6u
 Krtw==
X-Gm-Message-State: AOAM532liyrnRT295vZFlYqTzRTMGfMVwm7iQRBxF+tLBsQyCG9gunlO
 2GgYjNP3cMDnz9RY3fDn1dyMT4621rAjQcvK5ZU=
X-Google-Smtp-Source: ABdhPJxR9mInOGnDRTRHOvC4/F5jLEOtWBJFyO+NhL9NX8FGrfCfGDQ9VZInhEgsWXdjxMTz6+Yc+PVUg76tKL6r4Es=
X-Received: by 2002:a05:6808:f0b:: with SMTP id
 m11mr3011433oiw.46.1631397480168; 
 Sat, 11 Sep 2021 14:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210625091355.25673-1-alex.bennee@linaro.org>
 <20210625091355.25673-7-alex.bennee@linaro.org>
In-Reply-To: <20210625091355.25673-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 11 Sep 2021 23:57:49 +0200
Message-ID: <CAAdtpL5WpqJbTSs7SUxHXNsYGhAg5v1hAjH6vX6twTj7_sxG4A@mail.gmail.com>
Subject: Re: [PULL 6/7] tests/tcg: skip the signals test for hppa/s390x for now
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.174;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 11:21 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> There are fixes currently in flight but as this is getting in the way
> of a green CI we might as well skip for now. For reference the fix
> series are:
>
>   linux-user: Move signal trampolines to new page
>   20210616011209.1446045-1-richard.henderson@linaro.org
>
> and
>
>   linux-user: Load a vdso for x86_64 and hppa
>   20210619034329.532318-1-richard.henderson@linaro.org
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210623102749.25686-7-alex.bennee@linaro.org>
>
> diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.tar=
get
> index 8bf01966bd..71791235f6 100644
> --- a/tests/tcg/hppa/Makefile.target
> +++ b/tests/tcg/hppa/Makefile.target
> @@ -4,3 +4,7 @@
>
>  # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
>  EXTRA_RUNS+=3Drun-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-655=
36
> +
> +# There is a race that causes this to fail about 1% of the time
> +run-signals: signals
> +       $(call skip-test, $<, "BROKEN awaiting vdso support")
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.t=
arget
> index 241ef28f61..0036b8a505 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -8,3 +8,7 @@ TESTS+=3Dexrl-trtr
>  TESTS+=3Dpack
>  TESTS+=3Dmvo
>  TESTS+=3Dmvc
> +
> +# This triggers failures on s390x hosts about 4% of the time
> +run-signals: signals
> +       $(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")

Odd, still failing?
https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/536639512#L12456

