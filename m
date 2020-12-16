Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9022DBF37
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:09:22 +0100 (CET)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUgL-00065l-Lg
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpUez-0005dh-9x
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:07:57 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpUew-0003Ww-Eb
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:07:56 -0500
Received: by mail-ed1-x535.google.com with SMTP id i24so24315872edj.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LW+CsWeusaHRlDUlX7KOsMgyM/XCUznVX26MgQTj6nQ=;
 b=DM0t+rD7PtW61TFYYPRo5JYJiTLvPRaoPhD45aGIpcX0Z2/68EXIikW0jmi/UdGOAd
 vsxkjQM6bHw5Nve0K2s+5Q7QzpB4RpNjcQJVLjWr7IhCvpbokGDWxQmjSYAvaOcRkKFe
 AWeKvZdmjEu8NpivqfIHgeSBumVtfttvEe/OQYUHGJWgDM7OtU9pVfi7Yahfh/lcmzMc
 eL6JK8roFlE5CdhkMfUE8NYzITGdL6gyE325C8KgmqjF+R2LRlz1BXRWu5RVlnLxz5q8
 1q6YH+9Dt8CTf/TDKtRxk0LEy+c8PVFQMDGq837TXnthY+jBo9Wb6Q4i4dxMUaYUIyns
 XeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LW+CsWeusaHRlDUlX7KOsMgyM/XCUznVX26MgQTj6nQ=;
 b=DFP91NwjlDsHDDB2gsj00YUwc7+YQVDMKODfqqhCQmorZAT/kxa/Wr9iHU2wyHG1nR
 +9jo7ZLYcpt50wwg1+7ne+0P2yMVjDwP6fJZvBibd2Ss3UdWpFchUEe02uy1RPd8xjRG
 6OsRcyVnb4MU856157xnLlYOd1jhyKeAfXcDVRvm7JI2EEPPQ+WsYu9mQc73XghhPa34
 jsaufCK8QI8ZfcffMM886X5B3QuefiuDCCXz2rnKqs31sLDOcbXk/75S0HtP3FXFyh26
 paYDrkBgx1OtcDlWctcQnIw+Q3jcZYeZLuxwqXQ5FVJihvjk3XlKlKZAt1KuEN2iBiAQ
 yb3g==
X-Gm-Message-State: AOAM5316X73RPTELVxz04N7qJ82UY3hf3erkQiGnzzqbxV/6lDFuZvTg
 1IFm/NTl/0Dg6tegagyGA/8zHt2PHA3BnLl3mLgNnQ==
X-Google-Smtp-Source: ABdhPJwG+XNIL8zwbSgtdybkG37s16Y4if8rkmUbSilrizdZHAnvi0kjlwl9gFZuuc6dsxI/qlJQyJl8uMOCyEdY4g4=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr32791091edr.251.1608116872764; 
 Wed, 16 Dec 2020 03:07:52 -0800 (PST)
MIME-Version: 1.0
References: <8732c6f5-34ac-dcce-ee9f-69e7dd612e4e@elloe.vision>
In-Reply-To: <8732c6f5-34ac-dcce-ee9f-69e7dd612e4e@elloe.vision>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 11:07:41 +0000
Message-ID: <CAFEAcA8L2gHB6HMPO8YHNZff4pfp+VTrgK++3DH--OeqCZh-3w@mail.gmail.com>
Subject: Re: Are user static builds really dynamically linked ?
To: "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 06:39, Tj (Elloe Linux) <ml.linux@elloe.vision> wrote:
>
> user --static builds are apparently resulting in dynamically linked
> executables (to the glibc library, not other shared objects )

I think you mean that you end up with an executable that's
dynamically linked but although it requires the dynamic
linker (ld.so) it has an empty list of dynamic libraries
(ie not even glibc).

> Concise summary:
>
> $ file ../qemu-aarch64_v*
>
> ../qemu-aarch64_v4.2.1: ELF 64-bit LSB executable, x86-64, version 1
> (GNU/Linux), statically linked,
> BuildID[sha1]=70f5e10ac0eb9b63d7758850e2f18d0a047d4b79, for GNU/Linux
> 3.2.0, with debug_info, not stripped
>
> ../qemu-aarch64_v5.2:   ELF 64-bit LSB shared object, x86-64, version 1
> (GNU/Linux), dynamically linked,
> BuildID[sha1]=91fda2fa08f46d1bb6d19b6f72a4819a7c20fd7e, for GNU/Linux
> 3.2.0, stripped
>
> $ ldd  ../qemu-aarch64_v*
>
> ../qemu-aarch64_v4.2.1:
>         not a dynamic executable
> ../qemu-aarch64_v5.2:
>         statically linked

Something has definitely changed here. What you had with 4.2.1
is what you should be getting. The obvious suspect is that
something weird happened in the meson conversion...

That said, there must be something specific to your setup which
is causing this. I just tried (on Ubuntu 18.04):

$ git clone  https://git.qemu.org/git/qemu.git
$ cd qemu
$ mkdir build
$ cd build
$ ../configure --disable-system --enable-linux-user --static
--target-list=aarch64-linux-user
$ make -j8

and 'file qemu-aarch64' says:
qemu-aarch64: ELF 64-bit LSB executable, x86-64, version 1
(GNU/Linux), statically linked, for GNU/Linux 3.2.0,
BuildID[sha1]=c3e1ffd0a2805a7043a40659ecbc7774cb42f7bf, with
debug_info, not stripped
and 'ldd qemu-aarch64' says:
        not a dynamic executable

as expected.

thanks
-- PMM

