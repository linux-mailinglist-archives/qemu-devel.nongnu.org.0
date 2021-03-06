Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA432FB14
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 15:08:41 +0100 (CET)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIXbj-0007A2-Ni
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 09:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIXaa-0006cZ-3A
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 09:07:28 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIXaY-0002Da-GU
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 09:07:27 -0500
Received: by mail-ed1-x52d.google.com with SMTP id t1so7112928eds.7
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J4QN4hD69UaunxWNgbz6h/bF43tggDTuiIXPMwMmLQw=;
 b=ThrAPl4LVZ4tumEaRQwllFN7ZIF/0cdBnV5jPqStGNCVwi2pspRcinAYZhrx6UcO/V
 ov7zKXRxaMAZ4CKLoXFEV0jniMVFeX20Q59wXuqAHFnIogWQ/iWh4SSP5gE9vefOWJqC
 J/usChfgLVTQFM7uHj2+UkG2uz7ZZo7T+9LVodkm/c+W8/fZJSC4EnOuyj7YTzsAlKqE
 kYjzwLV8ouyFNeWGGzr+gzH79/sZv+2/dVnPNQfji8i1XaIMX3RbiNZjqxWHqSxHyLx5
 xgdlhPM4E7a/kDyJeSEDdQ4/wDW+x0hDTJKtToRBNvVlH4wROqEHjEj7SsToT0nkcjzg
 SlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4QN4hD69UaunxWNgbz6h/bF43tggDTuiIXPMwMmLQw=;
 b=fA68/S2C0UnYEPEgagIizDGsiKXFusxIVDv0m4nTbwRYlN/f+8Hs6Yc4StJzBr6GxO
 FUGPF3mjMZAlazda6PcGZFoHts9JBHHCuFWHSCccqRgsU/z7t4acvHiNZUe7VLGHi5A5
 WtLFALyVv8HNsMd+1miH7R8gGJaCbTqL/8hTgqKnqeFaKhymhisim5p4TSbAqno7mSiT
 zZmEzGmDMkznrNRaFtRgGPFlKVQ8Ea9YFWGKMqZsYMntUg7NLDdPiR1/rq7VM21+wwVI
 pFweMUMMwNLKll+i+8fgvoPLFpqXooyc/8Kw6Td3i3uDYGSxP2N+Px0o07cCVwE+QvWQ
 d2eA==
X-Gm-Message-State: AOAM532KtcvlgVPEUHtcabj6Py5A0V7t3hlhWOv3LMWN4D++sH7SAZeS
 74vW9uHJ1ToukSe+m3syrKFhTgemN4rmX7iZr4RY2w==
X-Google-Smtp-Source: ABdhPJzeFxbTs+vOkh0k20vQsJsV8sBRPSQtebjt+Sa3ZOQd+7Mnw9dLFLnmxag+HGHyONGH4fxzAsiLYN/w+Bq+IHg=
X-Received: by 2002:a50:d307:: with SMTP id g7mr13983845edh.204.1615039644655; 
 Sat, 06 Mar 2021 06:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
In-Reply-To: <877dmlgnrf.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Mar 2021 14:07:07 +0000
Message-ID: <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 23:54, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > For semihosting for Arm what matters is "what state is the core
> > in at the point where it makes the semihosting SVC/HLT/etc insn?".
>
> Ok, that means we *aren't* talking about -mabi=ilp32, which is good --
> in my current picolibc implementation, the semihosting code uses a pure
> 64-bit interface for aarch64 targets, even when using ilp32 ABI.

ILP32 for AArch64 is a zombie target -- it is kinda-sorta
supported in some toolchains but has no support in eg
the Linux syscall ABI. The semihosting ABI does not implement
any kind of ILP32 variant -- you can have A32/T32 (AArch32)
semihosting, where register and field sizes are 32 bit, or
you can have A64 (AArch64) semihosting, where register and
field sizes are 64 bit.

> > How does RISCV specify it?
>
> Because the ISA is identical between 64- and 32- bit (and 128-bit)
> execution modes, the only difference between the two is the Machine XLEN
> value which encodes the native base integer ISA width. You switch modes
> by modifying this value.

I meant, how does the RISCV semihosting ABI specify what
the field size is? To answer my own question, I just looked at
the spec doc and it says "depends on whether the caller is
32-bit or 64-bit", which implies that we need to look at the
current state of the CPU in some way.

> I don't know of any implementation in hardware or software that supports
> modifying this value. I'm not sure we need to support this in the
> semihosting code for qemu as I'm pretty sure getting qemu to support
> dynamic XLEN values would be a large project (a project which I don't
> personally feel would offer much value).

Part of why I asked is that the current RISCV implementation
is just looking at sizeof(target_ulong); but the qemu-system-riscv64
executable AIUI now supports emulating both "this is a 64 bit
guest CPU" and "this is a 32 bit host CPU", and so looking at
a QEMU-compile-time value like "sizeof(target_ulong)" will
produce the wrong answer for 32-bit CPUs emulated in
the qemu-system-riscv64 binary. My guess is maybe
it should be looking at the result of riscv_cpu_is_32bit() instead.

thanks
-- PMM

