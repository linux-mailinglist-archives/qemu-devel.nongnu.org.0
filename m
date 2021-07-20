Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0583CFD04
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rLy-00080i-6Z
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5rKf-0006ed-Fp
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:06:53 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5rKc-0006NW-JL
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:06:53 -0400
Received: by mail-ej1-x62d.google.com with SMTP id nd37so34825728ejc.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gomc3251J6LBaFqeNxOh1UPjCtBwmiWuJiKagOzeVH0=;
 b=ShBFQCdF75SsY3VaMcTsZUfZiacbhBoBem/sK6STWfpanjVwm5dXyBPOuN7PBSzgAR
 saL0QLp4SkiwdFhabH9LohLzQoOI1gnCScUv5GPZ174Dws21JzqxcPTc/6zAxNywdbOX
 fCHYCJ26Yao9t4o51KfmJ29KjAPVJV75WA6hMMbSxMi962RqdDsN2DXClFUx55DL75xb
 E4yxiTDc6obOkc4idWicgRZZuB86Q/R8aHq6bUzILPUJJmdUzNBvWJ2PdPDru2m6YTUa
 ZG8F6ckQbalNP7zIfYY4EkAauGSebeLVR/JVv0SmEqeWe1XEYcIqbHMcEOGjune+Q2s4
 fH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gomc3251J6LBaFqeNxOh1UPjCtBwmiWuJiKagOzeVH0=;
 b=MABm0l+xZGCgaEwBnMwO4T88zRd1k/TLjQs49g7ET+IYBCVwNKgWq94tSEft6DcILo
 NE7ExVSvkR+zA2TgvT3aQj2YBkXTFrXhI9F/esvzt/vuqwHHGfWQMcKjxIiP9LB4a3ZZ
 HtPtD5TVVaTWzfeCZ5OcxZNXBQIRzoR4ymG6EjxuoMoPoXoS2uJRcNGhyPgahZ7fsPQi
 DfaPM60Rd5zUc55aFgjCW7AbphkCExKJibTu2FodbAAkX42/lxj84Ghlbrv3piPEBurZ
 ePmVSRIpez/V2c6be1ALiCxmWgJEfoPtlUyFopa2lScLxfMqYR77SXJhEMSmx+Oe2teN
 GQVw==
X-Gm-Message-State: AOAM532gIXma87tIx4UwFFe9fwyl24HGD0VU4DuDH3cmentWMmGZv7LA
 vjSuV0y3Fr5kRUtyIv0CeYZo7Mr30oKdZoFB8KkZdQ==
X-Google-Smtp-Source: ABdhPJzm3pTz2wKLXids3umWtH6ROVxjmkO8bD0KUEJeMUcLFe6pd5U0nU2CQ5M3bHwYGE8hWzHWgSPo5tgd0P+3tiE=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr33673481ejc.56.1626793607506; 
 Tue, 20 Jul 2021 08:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
 <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Dmof7gi9MRxjo0FcYN8ZW0NTKi2+SAgO1V8-VMndN-A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 16:06:06 +0100
Message-ID: <CAFEAcA_cYZHr=Kz2JakLpxkdyBWGJUUpJWZyyV_yMq59X7YJGw@mail.gmail.com>
Subject: Re: Error in accel/tcg?
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 20 Jul 2021 at 10:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 19 Jul 2021 at 23:20, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> >
> > Hello,
> >
> > I get the following error:
> >
> > <long cmd here> -c ../accel/tcg/cputlb.c
> > ../qemu/accel/tcg/cputlb.c: In function 'tlb_flush_page_by_mmuidx':
> > ../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true due to limited range of data type [-Werror=type-limits]
> >     } else if (idxmap < TARGET_PAGE_SIZE) {
> >
> > I don't know why that suddenly shows up.
>
> So, which target are you building for, which host, and which
> compiler version? (TARGET_PAGE_SIZE gets a value that depends
> on the TARGET_PAGE_BITS setting for the target.)

You'll get this warning, incidentally, if you have a
target which sets TARGET_PAGE_BITS to 16 or more.
Currently the only target which does that is hexagon, and
that is linux-user only, so it doesn't run into this (yet).

The warning is harmless (apart from preventing compilation with
-Werror), but there's no in-theory reason why softmmu shouldn't
work with 64K pages, so we should figure out a way to rephrase
the cputlb.c code to suppress it.

-- PMM

