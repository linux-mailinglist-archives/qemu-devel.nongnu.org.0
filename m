Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311137583A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:08:51 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legYT-00063F-Ma
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1legQ2-0000WM-EL
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:00:06 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1legPv-0001Kx-8C
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:00:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id g14so6766347edy.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jjP2tVL8/5fMTkJrtwgNcBDcwQmnwEx/OAkZcrhoFzw=;
 b=iYjiLvZXn8FAfX8V7OtJx1T2eMni4SkjZFTpMgVdft9/9vTih/6KIUqaLSUVKVH2lB
 rdX96HR+vI+jPQTu0Bg8k4top/RzfLhFCp51C3D3vZwJ3Lx2gN6PMhXB7HNfXmwj2/MS
 kI5J/U4wGxqiwnePvRvhxDFK7DGjKaKGCQPGY1RxoiMLUcXBImS5YkpyXi+nD4wRRMIG
 Vd3pxC2/58fTEwi4VMe/tmPN/gEMKkjjO98VLjjlTuAj5j/qH8TyyuQoeRW6QPM2hpq0
 9h2avyy3pdpoxpVeIAZiywio5CJDgbn931Rl8r2vY2aO2dFJJLuDU5a50WV5oGdB6EFF
 G12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jjP2tVL8/5fMTkJrtwgNcBDcwQmnwEx/OAkZcrhoFzw=;
 b=sZ+2XgYYPUT6HlWB8/NFf+V6BhfwOac27AGDGgNVf/kWgrs2Gi+moHcLREVTX0hRsM
 uY71ifQ2gXUcdwimwoDw0ovqTS7OtaU+j7mktXabQSTsSusXgbOcbV5yL51DCySiRpNv
 c9luijq62XVlDApMKJ4aIznKBHBQZS9wgQl5Ke26Zjspk9xFJxsNhKpru0wmGHYxJ5+8
 dLT9eS26vL2BWykBrkMSfxwNr1AR85vwYiDFWpS28nsEbLfRBE+VSt1siUxC5p5tuEzk
 l5SuQ02TYp1cJQEJp3q2ZlXfy7pvwMqwswJi2EO3HZp/9E4Msb2jzMGgp01qWi6TnrXV
 EZsg==
X-Gm-Message-State: AOAM5307vVJVCoq6I7b+Y6bMX9KexbFzPrHSgBvBRefBWz83CxoUc9HC
 HGWZjHJiGSRqMCPhXTPT2c+kHngJswBXq1lSn44FYQ==
X-Google-Smtp-Source: ABdhPJy7C/ySonWlnTvVnDYUsB0oud7vURVnI7Vhk6vQ1/ROaTRg0RP3rpzkpDP4ZNY7nR3YGOvpTTaFjaMy9fc6+wM=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr6095158edx.52.1620316795885; 
 Thu, 06 May 2021 08:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
 <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
In-Reply-To: <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 May 2021 16:58:47 +0100
Message-ID: <CAFEAcA-V1DWhsFYuh-y5F2_PbO50KFoCm-XPrcMEYN1V2WHDfA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 15:57, Warner Losh <imp@bsdimp.com> wrote:
> malloc, on the other hand, involves taking out a number of mutexes
> and similar things to obtain the memory, which may not necessarily
> be safe in all the contexts system calls can be called from. System
> calls are, typically, async safe and can be called from signal handlers.
> alloca() is async safe, while malloc() is not. So changing the calls
> from alloca to malloc makes calls to system calls in signal handlers
> unsafe and potentially introducing buggy behavior as a result.

malloc() should definitely be fine in this context. The syscall
emulation is called after the cpu_loop() in bsd-user has called
cpu_exec(). cpu_exec() calls into the JIT, which will malloc
all over the place if it needs to in the course of JITting things.

This code should never be being called from a (host) signal handler.
In upstream the signal handling code for bsd-user appears to
be missing entirely. For linux-user when we take a host signal
we merely arrange for the guest to take a guest signal, we
don't try to execute guest code directly from the host handler.

(There are some pretty hairy races in emulated signal handling:
we did a big overhaul of the linux-user code in that area a
while back. If your bsd-user code doesn't have the 'safe_syscall'
stuff it probably needs it. But that's more about races between
"guest code wants to execute a syscall" and "incoming signal"
where we could fail to exit EINTR from an emulated syscall if
the signal arrives in a bad window.)

thanks
-- PMM

