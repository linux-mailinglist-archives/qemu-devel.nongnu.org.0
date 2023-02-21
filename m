Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C297069E4B0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:31:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUxU-0005ZQ-Dy; Tue, 21 Feb 2023 10:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUUx7-0005EB-AY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:53:17 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUUwx-00059G-Fr
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:53:06 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n5so2942585pfv.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676994781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pWFK5qIFgC7qCknW3ibU+4+aHlVPEt4EMZYLHyBAnGw=;
 b=yd8NmAcM3pgzEWancyifE3n9SD+zM5JhUH7gY4wBk2ZjDEnXL2nLp+7vy2hr7ecXIR
 msZwkM2p5dSwrol41t6ZsFxDeHbybU7oStJEBdXexnZ2HX+9N0QzxLaHOsvjWTq5CM88
 OW7qvt2W5gASAtU5SUwaOvmJx0IW/BQHH+YZcWhC2B4gFQZTFfMWo/ICp1+3DuOF3SSb
 43STxh28hN19TayBhROLvW2daFR9qUHro7D4W6UkS3kTPfRdS7ULyHtexu+a83inWDYC
 yz85vfkJ6ktJAlyaJzy81l0CHSar2yToeQGS/Nmp0Q6SRh7aSokKV/fpzTtcNWtgUOJY
 IStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676994781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pWFK5qIFgC7qCknW3ibU+4+aHlVPEt4EMZYLHyBAnGw=;
 b=4hN3+duMHKk4jYD/INXTQpcB1Aeatug0z7dlOHKZdokKWSzXobPDNfzpjuZdCGxzHM
 xxOi6lHnBzs9KnHB/j7wqtNUOKzPB5RZ+n9lXAkH5WYOqC92+q8hEKNdw84XT1s3V24u
 mzMlod/O2aIj1FG6vXmb4ndNdRakN6sIwmzJPwGW90M6I33L11MNjaSS0JRrTqdvmsf1
 B1hLRuxz7QrTtFYs8bBg2HIxWujv5Kk3BF/0rrtCoEyrPUhiketb7gGhJF6EKrR4gq7C
 NQ6PKgbLE+kT3E/7ywthL1ykG39CAUYmUnYQclj1sN/GfP5YQfLo5dSh3Ofbc7dXGWcf
 m3BQ==
X-Gm-Message-State: AO0yUKXexGfgCcQcWB/H3Ws44K+iGr7n9FcouDiE1XMs7JTzyAN8Xa9s
 bY9AhvJGt0ItaLj+o5PTQ1WZ3QRuNunNER4uF+cr9w==
X-Google-Smtp-Source: AK7set/BRK4JTSohuG1eaqBEogz37gd3YBd6xR3E3n+yJT+nc8U5E4I8QeMqmPyquFSqRjZ0aORk+EUAmBTjyLia8lU=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr883096pfw.48.1676994780827; Tue, 21 Feb
 2023 07:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20230220032338.5619-1-richard.henderson@linaro.org>
 <CAFEAcA_89gi6r-fmPSohpho2fOMu_oh-kBG6oQO+6uC0mZR1TQ@mail.gmail.com>
 <CAFEAcA_VqoEQKN4Guo=PVm_6usvz-HDW3Lb672P16rKNOEmf2g@mail.gmail.com>
In-Reply-To: <CAFEAcA_VqoEQKN4Guo=PVm_6usvz-HDW3Lb672P16rKNOEmf2g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 15:52:49 +0000
Message-ID: <CAFEAcA8-9EDDVz28WEbuKN7DyykiAvHY=5hY=NEp_S7POm+8SA@mail.gmail.com>
Subject: Re: [PULL 0/7] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Feb 2023 at 14:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 21 Feb 2023 at 14:04, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 20 Feb 2023 at 03:23, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > >
> > > The linux-user patches are on the tcg-ish side of user-only
> > > emulation, rather than the syscall-ish side, so queuing here.
> > > Solving the deadlock issue is quite important vs timeouts.
> >
> > aarch64 host, aarch64 guest, segfault on bti-3 in tcg-tests:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3806772144
> >
> > TEST bti-3 on aarch64
> > Segmentation fault
> > make[1]: *** [Makefile:170: run-bti-3] Error 139
> >
> > Might be a pre-existing intermittent :shrug:
>
> It didn't happen on a rerun. But here's another one, clang-user build,
> on the new test case:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3806772115
>
> TEST linux-fork-trap-with-libsyscall.so on s390x
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped

This one fails consistently, so not an intermittent. Here's
the retry job:
https://gitlab.com/qemu-project/qemu/-/jobs/3807471447


-- PMM

