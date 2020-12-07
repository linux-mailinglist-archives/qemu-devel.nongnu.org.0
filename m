Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510F2D1850
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:17:33 +0100 (CET)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmL4m-0002vs-C9
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmL1s-0000zZ-Es
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:14:32 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmL1l-0006DI-5a
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:14:32 -0500
Received: by mail-ej1-x641.google.com with SMTP id b9so10505375ejy.0
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 10:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXJ0iJuSp7UraehvAbUlu3IM7yZ1UGPC+rx9fKr46/k=;
 b=lOhTOXTY3vI6HWWb7CIvgfb3nmp0oAtH8dRuh1n5FMIE2jVYZh8OU7aaOcnrlFF4eg
 ml5Yw5KjnuquLi/tiuytCZJSFUDF9oy6Aa1VgT3rZpISG6eo1JRpoR/cRLq8Pk2R66MI
 4HafgJIDniXuAv/5IpV9IWUjQ+NYDPsyiT8uZ5IQsQDnKx/BvaUUfysdXb8cl2aIAFH4
 dp0XaROGNaJtaS9/sbh+JDi0vH9rnY3bDzxxluhoeTLTW0XIjk1uVf587UHrMUWEht9I
 SZc61qNrI4QDclOizq2veE7WctcBA18PIibTpVU4r4wJVRXKCAVGLFh23hvWLnAYAsMi
 mOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXJ0iJuSp7UraehvAbUlu3IM7yZ1UGPC+rx9fKr46/k=;
 b=S+59Vd8v85zMmPh5pwol9V0NU/t/9tofIf2A7WbZegTd6KJ+E/KXrR5qbMk83s0OlX
 zKN8WdBawAyvHxDGv2/Cl+FubQqYjDX/0xXig9aOq3T8EWORiKl7cv00JSM/p4xrk6Nx
 9IYjNJxu3yqBtxD7fmQYogE5xKgywHbmzZFmgl4uv7jjAyktA/uswfIMx5sa9Y3Ceip8
 JfCiv+QqmbHsUFbsHbDQvXUB7/3WXzMOKorMvhTdWLnkhSabl54AO2lBYE4+sEqmY8t/
 2O8COPYrZKyy0gV1HjlRc8b5Ktsn/fyPiCGRrnolOmpaNvLY97uIQ6Y+Vov4eJ2rlkpZ
 dmTQ==
X-Gm-Message-State: AOAM530t3TEyqqY2/JW8GLvQAXNOIa33v0uDA6PrDrCrhYs+vKF2p2g4
 Hkn24SuiicAWzAJSyjNn7jDNez5PLy/bS5ZBBzq+gA==
X-Google-Smtp-Source: ABdhPJy8cFFZY/m5IHBqyZ8NBAwkclcvvxmSISp103l1QCHLlyaiwPL8f6HqgUbVincQ0jmbQY3CoZJ16uZ+TkRZ8aA=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr20209028ejb.56.1607364863096; 
 Mon, 07 Dec 2020 10:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <e770b13a-7ac7-00b6-99d1-0be24426ea8b@suse.de>
In-Reply-To: <e770b13a-7ac7-00b6-99d1-0be24426ea8b@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 18:14:11 +0000
Message-ID: <CAFEAcA_eRWndnSmQTnBWG=sopcqVs7SEA4LYkLURn9KNAuRynw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>,
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 18:08, Claudio Fontana <cfontana@suse.de> wrote:
> what about also the existing code with qemu-arm (user mode)?
>
> In that case do_interrupt is not set at all in target/arm/cpu.c, since it's protected by #ifndef CONFIG_USER_ONLY
>
> Did we have a potential NULL pointer trying to be dereferenced there?

No, because in user-mode there are never any interrupts or
exceptions invoked this way. The code in these methods is
strictly system-emulation only.

> Commit 0adf7d3cc3f724e1e9ce5aaa008bd9daeb90f19 says:
>
>  target-arm: do not set do_interrupt handlers for ARM and AArch64 user modes
>
>  User mode emulation should never get interrupts and thus should not
>  use the system emulation exception handler function.
>
> --
>
> But this was 2014. Is the comment above true today?

Yes.

> Looking at this commit in 2017, it does not seem to me to be the case:
>
> commit 17b50b0c299f1266578b01f7134810362418ac2e
> Author: Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
> Date:   Tue Nov 14 11:18:18 2017 +0300
>
>     cpu-exec: avoid cpu_exec_nocache infinite loop with record/replay
>
>     This patch
>     [...]
>     Second, try to cause the exception at the beginning of
>     cpu_handle_exception, and exit immediately if the TB cannot
>     execute.  With this change, interrupts are processed and
>     cpu_exec_nocache can make process.

This code only invokes cc->do_interrupt() in CONFIG_USER_ONLY
if TARGET_I386 is true. i386 does this stuff in a weird way
that's different to all the other target architectures.
(One day we should fix this inconsistency I suppose.)

> Is cc->do_interrupt supposed to be !CONFIG_USER_ONLY or not?

It's !CONFIG_USER_ONLY.

thanks
-- PMM

