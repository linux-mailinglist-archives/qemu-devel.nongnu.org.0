Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BEE3CFD13
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:09:54 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rNZ-0001mX-7V
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5rMT-00015e-Da
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:08:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5rMQ-0007dx-3p
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:08:44 -0400
Received: by mail-ed1-x534.google.com with SMTP id ec55so28890808edb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13cs9OHchSxSpBR1bFGBjqsUOYFoqUA2Sc2eFN2wmyc=;
 b=dSJxFJTpoGeNclVZdorukZpNYzzuZWkGYAqD9bma/D9zo4qjlH0UFUkZSqYY2aezh0
 V/Y1miDqS1g3jGkz63I+c87Osv2VvQoYdBQzqHskzmzrFhknqjZa3p1qDijDF0wB9DpM
 r8HSKFLFWINVzEuvEaLTmntjSN9dHWKkd+pLfvt1QU5T9t+Fzg8R0oJoaOzyvCqWg622
 jkioAIWnt1yj+7w2f8y+7LZDYCaM5hi3bHHrZPaNPPh3AsWqSIL806O22y78blA0CSY9
 oLPT7RHDsKJLSyrb+nJHJekGWbtndsQMxvEt9NXO897d36K1ApyvvFwHtgdg+koxEK+O
 heHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13cs9OHchSxSpBR1bFGBjqsUOYFoqUA2Sc2eFN2wmyc=;
 b=mNV4cdGi4cNO8KNY2m/S2BclvhS/e4kNzfDWXAhAdFGMQv0WhDHVsrIJVotjG/a5K6
 EgcHfPECdXswaPNHpN1sJqQtlYft+8MlVBKR7R/z+pqCaUIrthu3r6rvK++e2EakBkRT
 zQQSKxuwRrYRBW1QEjfI0QlHYYc5+g0GzVn6t+Jd+V7HdRbjj6TYxXtdWMSy8vOgQZAc
 /obRSBAJSIfjjxkf41pbCEcnTXJJ5ywOMLaJ3xf6rss2Q5BNO4dUug/Tn7AggfPEPjcf
 VtDQdbCEJ0HGboDdfGvaFYsJN8z95h+sxn8RN83AODbQwI5CLx+bhwHPEh7YOk945LNy
 htNw==
X-Gm-Message-State: AOAM532gH+YkHl+ELc4xoNtOEoyb8BXtGXtyp6gYQ/HmVijGrI91Ihl1
 0aFUijjIS+ATQ+2vvifRuR+HqS6I6PmqsZAPQIZtBg==
X-Google-Smtp-Source: ABdhPJwKKOcraa3qsC7QKbE5d1cUuzFjZjnH5g534M2gEMSHoo+jh2p9JMQs0Qs2de6fCZm7mUNvArwd0JUyafCxhHs=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr41975682edq.146.1626793720414; 
 Tue, 20 Jul 2021 08:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
 <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
 <CAFEAcA_cYZHr=Kz2JakLpxkdyBWGJUUpJWZyyV_yMq59X7YJGw@mail.gmail.com>
In-Reply-To: <CAFEAcA_cYZHr=Kz2JakLpxkdyBWGJUUpJWZyyV_yMq59X7YJGw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 16:07:59 +0100
Message-ID: <CAFEAcA-sq2GfHkpVc8BF-n=KEVwwrtzsbhM9w+_O=GmN+gg5WQ@mail.gmail.com>
Subject: Re: Error in accel/tcg?
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 16:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 20 Jul 2021 at 10:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller
> > <kennethadammiller@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > I get the following error:
> > >
> > > <long cmd here> -c ../accel/tcg/cputlb.c
> > > ../qemu/accel/tcg/cputlb.c: In function 'tlb_flush_page_by_mmuidx':
> > > ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true due to limited range of data type [-Werror=type-limits]
> > >     } else if (idxmap < TARGET_PAGE_SIZE) {
> > >
> > > I don't know why that suddenly shows up.

> You'll get this warning, incidentally, if you have a
> target which sets TARGET_PAGE_BITS to 16 or more.
> Currently the only target which does that is hexagon, and
> that is linux-user only, so it doesn't run into this (yet).
>
> The warning is harmless (apart from preventing compilation with
> -Werror), but there's no in-theory reason why softmmu shouldn't
> work with 64K pages, so we should figure out a way to rephrase
> the cputlb.c code to suppress it.

Assuming you do have something with TARGET_PAGE_BITS 16, if
you rewrite the conditions to
 "if ((uint32_t)idxmap < TARGET_PAGE_SIZE)" does that make
the compiler happier ?

-- PMM

