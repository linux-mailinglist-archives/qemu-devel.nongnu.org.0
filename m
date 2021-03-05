Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B280432F631
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 23:56:07 +0100 (CET)
Received: from localhost ([::1]:43540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIJMc-0005zg-Qh
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 17:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIJLD-0005Lx-RC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:54:39 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIJL9-0005gd-Qq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:54:39 -0500
Received: by mail-ed1-x532.google.com with SMTP id b7so4855842edz.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 14:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OhDzm4pHloCI7PgBmv97B3kI3ArMztNJTPc5uSxw1LQ=;
 b=GeduCRBP3i5HZbMXwHf6PKS+KhtAotz0vIuaKz8Wf1PMrba+dYddrTwyi7P2Wh76dn
 BJQatV+iSgXnXcV8dBRa1s/0hv5oMw9dlNsmjr0D8vjNIAf8t0ZpjOcMdSBHOic+IszY
 hXEjp5K6EsPC7JR1H/M06kJOoeWqsBzIPyBQjhzMmUz+Mj0bMsVPcRlO2Eh20buk7Jj7
 l45C7whhteG64jGXcOd7vzG8HpyJp4bbgdvv7JIL7SqrJnLe9utNXzMGgezDCLOryoeN
 s78kBK6vOcSgzxeAx0s35OQHYiD7wOXFYRJRWLUXnJ4UccrBWEV4857N3TEzMdx5V4Lb
 eVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OhDzm4pHloCI7PgBmv97B3kI3ArMztNJTPc5uSxw1LQ=;
 b=WS2Ax+b5DG1opifoIC4eGo0XxXi8J3xAxirS0T8lOCwQ29RvtReL2gs5+YXRw1fyGU
 RetIAhg/3+J4RCtBxNe1HYt1hxA47uxnQUEuk1Cyngiiha6183tk8+L3DEkPcvnCFGuO
 rcH3/AhgACXDA8zlVS7DsjsBpmzZb9vt0y2RuopRvAY2UfrzlKU4ADVU+7CjflFY4+en
 y0mbRc6XU0BhgxDaG+CpxV5kCeUk98WSJSt3/tHvORGBmaMC1XoTmnvj6KLsNeh6NnNo
 N0iGMMEaAS/mRqYnVHjH9669EOp4aMnv4dJV+Al/sb9f9IUtS6rGf3hz/8YfM5uIm8HU
 20nA==
X-Gm-Message-State: AOAM531tJHm9O0jF+ws8lBiBNMyUXUYRncbRsi/JBfRkaH9Lf3tmkje4
 Ej4JnfJe6fD4y7CSJiP0e3BKwMkoKJLGt1CNr3C4cA==
X-Google-Smtp-Source: ABdhPJz9v0k0UWBnVRYpvF4mDAN3mDsc0GgXDAhN7LVgrk4sgIbMr9rnVWw0NkfjOkDJrMcbWlRjKfBeLamsYHtNaa0=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr11349809edr.52.1614984874405; 
 Fri, 05 Mar 2021 14:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
In-Reply-To: <87im65gxla.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 22:54:18 +0000
Message-ID: <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 20:22, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Also, you don't seem to have the correct "is the CPU in
> > 32-bit or 64-bit mode" test here: you cannot rely on target_ulong
> > being the right size, you must make a runtime check.
>
> Do you mean whether a dual aarch64/arm core is in arm or aarch64 mode,
> or whether an aarch64 is running a 32-bit ABI?

For semihosting for Arm what matters is "what state is the core
in at the point where it makes the semihosting SVC/HLT/etc insn?".

How does RISCV specify it?

thanks
-- PMM

