Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E87330F8D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:39:32 +0100 (CET)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJG6d-0004kq-3T
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJG5G-0003RH-OV; Mon, 08 Mar 2021 08:38:06 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJG5F-0003Uw-82; Mon, 08 Mar 2021 08:38:06 -0500
Received: by mail-io1-xd31.google.com with SMTP id k2so9914388ioh.5;
 Mon, 08 Mar 2021 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRZZ3NmuNmMen6Ygr2JxTxV9jSL4/3wNcB5Wux9QOQU=;
 b=hI4Fy0vi9FW5ST0Gnf6+tO30c9DCA1hwaJlQ6xcJtVAzIcd6JhvGO4VoXrkmlvU0+f
 Uj/YqCQAYkAvxEj08zozGthSjn5jgxrn5qy1s/MSlEU8BT0jAGyQ6UOPG4Y0YIRAVreb
 97pGzQsi2ar2WJsSIDGoO+Og4IX7T/ff9OQ80SuD2cRdWWdmILXtn1AL3lZNCt0Dr3Ro
 aLNf1wNX7JH5t4LmyeEyyrvdMW/ymnvJw69vDTc4htK2Yh5bKCv6QHl1b713lwWz6C1E
 l+t1ollv8tqkIwCpmc1Yej20fwt2+EuydBN3nln03u6nFzRMX88vVwAWL8EjNfp1w5JL
 Fv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRZZ3NmuNmMen6Ygr2JxTxV9jSL4/3wNcB5Wux9QOQU=;
 b=QdjWpSjDhKwFv98sR6EdWv9q2PihWp4C1pth1eTxDUyZU2uXfjx2GAkpzqCk5A08jX
 1Z+wq0RF9gRdQRIGHP2xe71JDylA8JZqVYrfe+6CPUujry4UxkRFLQi3w/0NmkQNw7uT
 ai2DiMAI5TJl/xm0wQcWXEHti6ttoMUN21gwbjvBjfoZeO9GUnH9QMW8ZnqLP9zZ9pYS
 q/Zu89GHgfREfXvgw5NP3qFnjDYoknIEHb8zNIifPsH0XdX+ELPrKYdnXGdcltkHfEgR
 Cg6W+JGB0PKyr3ZOahIVpWeKNPg0lB7sirHCV8HjDqACyRu6z0YOd3vLM2xAdCbVYjDY
 6STQ==
X-Gm-Message-State: AOAM531I4liQL+F3WkC09DALmLFWdGDZo8zVZRHWgwpcH7nwCB7EdmU0
 ZEcAIxCGJGMma0Q+EhCIiIrBCGjt1unijBtMBJk=
X-Google-Smtp-Source: ABdhPJxbrEkWSF7CgK3+YztN7QniYLnNxfa+QbAD+wEiitVRABqUoOCUP95BFwKSLtvSjN8vQza4PSYVeXXt4/pireU=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr23025681jap.26.1615210683172; 
 Mon, 08 Mar 2021 05:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
 <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
 <87o8fwfcjd.fsf@keithp.com>
 <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
In-Reply-To: <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Mar 2021 08:36:44 -0500
Message-ID: <CAKmqyKMmS3uasofFLvteZyZVJTR8mrmVtTM=WKUD_DQ_8rHmqw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>, Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 8, 2021 at 5:10 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 6 Mar 2021 at 16:54, Keith Packard <keithp@keithp.com> wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > > Part of why I asked is that the current RISCV implementation
> > > is just looking at sizeof(target_ulong); but the qemu-system-riscv64
> > > executable AIUI now supports emulating both "this is a 64 bit
> > > guest CPU" and "this is a 32 bit host CPU", and so looking at
> > > a QEMU-compile-time value like "sizeof(target_ulong)" will
> > > produce the wrong answer for 32-bit CPUs emulated in
> > > the qemu-system-riscv64 binary. My guess is maybe
> > > it should be looking at the result of riscv_cpu_is_32bit() instead.
> >
> > Wow. I read through the code and couldn't find anything that looked like
> > it supported that, sounds like I must have missed something?

riscv_cpu_is_32bit() is somewhat new, so it might not have been there
when you wrote the patches.

>
> I thought Alistair had done that work (which brings riscv into
> line with the other 32/64 bit QEMU targets, which all support
> the 32-bit CPU types in the 64-bit-capable executable). But maybe
> it hasn't landed in master yet?

I have started on the effort, but I have not finished yet. Adding
riscv_cpu_is_32bit() was the first step there and I have some more
patches locally but I don't have anything working yet.

Alistair

>
> thanks
> -- PMM

