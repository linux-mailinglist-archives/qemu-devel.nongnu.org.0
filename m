Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBBE330AE4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:12:17 +0100 (CET)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCs4-0001U0-C8
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJCq0-0000CQ-8W
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:10:08 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJCpv-0005Ly-CJ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:10:08 -0500
Received: by mail-ed1-x530.google.com with SMTP id t1so13789802eds.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4gc62TWE5gqasqsKUNpHr6cpjOkd1uWEK4cQ/0LQGC8=;
 b=oKeYlGhJry5toGjDb06GaRP0C0yuZwQMOHr9n0YtxMPma5GV99xQGnVwa6Pjbb7+jY
 f792J7kfiGKaN9J+kugHNtPgAfbnykEqNihvOKVOGJKg0jsbuBfRvbLDU7YwQsfYS5hF
 RPGzanrZIShiW8O3XRZIuCfHTIFrCxEVz1Hk9gsaLXAPohAuJAMI6XxULT80k46M2O/R
 8BxwKKD9sfbL3mA4oi9K5gH1aXTAu6gZYNng5idE/aq7Npsr0BM7UoZKkzjRT4XT/Q2L
 E3RdgnCDayKNe2DfQLz19yOCgAtYSrxPcbraoVax3i+fvaHXafERvpyXZnbtbCOlyLIf
 5Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gc62TWE5gqasqsKUNpHr6cpjOkd1uWEK4cQ/0LQGC8=;
 b=Jeao2RM6d7OAry1HYzIUpLU3Fn/bSzt7o9S9sbqK7kboCPKu6GWQYTfZ+F7u3F87NF
 9O20eMWD3N6q7w1Ww+ffAo3Ge/K04dS1cvSuvc7ODCEOzl2I6Sp9pzx+HPvyAhkbVOdZ
 xqhcQw5uu4l3OF69X0UlmqorT5UTAGo+YQG7JNzTLg3gH+5ZPfznjSKZviVFjgGmp9ie
 F3U7fYefWCeVfDgGCIFPIUtX6uVXNCojd6XXecSAIvLG/YtOm46mzWprIhlSZrtAn/25
 Xde9gRa/7BHNZw1i5+IB2zZTYBqwjutKNSEIVhdWbYgs9fBlETsbQ9Z37WdYgpijxIto
 C4yg==
X-Gm-Message-State: AOAM531Rv7HH8r/VgfBBcdo4Wrtq/sHdiLB45UaGO2S63KeauWqpfEtn
 sZ0XUbBHQaDFQHTJXGqa0AbVYNiEOXiNIV1iAS8EsQ==
X-Google-Smtp-Source: ABdhPJwwS26xRUNCvR9URpXOo+g1KQhla4C3qajGDhejsEBW6BzNBQ6Vp89gPzU3Fx7cZEtWSeCyO2wPiMVdd4Xtujo=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr21093269edr.52.1615198200718; 
 Mon, 08 Mar 2021 02:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
 <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
 <87o8fwfcjd.fsf@keithp.com>
In-Reply-To: <87o8fwfcjd.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 10:09:44 +0000
Message-ID: <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Mar 2021 at 16:54, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Part of why I asked is that the current RISCV implementation
> > is just looking at sizeof(target_ulong); but the qemu-system-riscv64
> > executable AIUI now supports emulating both "this is a 64 bit
> > guest CPU" and "this is a 32 bit host CPU", and so looking at
> > a QEMU-compile-time value like "sizeof(target_ulong)" will
> > produce the wrong answer for 32-bit CPUs emulated in
> > the qemu-system-riscv64 binary. My guess is maybe
> > it should be looking at the result of riscv_cpu_is_32bit() instead.
>
> Wow. I read through the code and couldn't find anything that looked like
> it supported that, sounds like I must have missed something?

I thought Alistair had done that work (which brings riscv into
line with the other 32/64 bit QEMU targets, which all support
the 32-bit CPU types in the 64-bit-capable executable). But maybe
it hasn't landed in master yet?

thanks
-- PMM

