Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D13C7614
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:02:24 +0200 (CEST)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Mjf-0002CN-3a
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Mig-0001U9-VN
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:01:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Mif-0003wr-C3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:01:22 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l26so26029056eda.10
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXbuq89leoPYFTvnpGXPwOjlYtuHZSZAx+IN0CsA0Qw=;
 b=ZAgK8wXql94l0YdKh4jbTtZWNMhuv4ISQ97pPElUoWJwnHJEAS7dsjRNP3ncgK15Gy
 1O+EdDYDG4kB2rm2wndt0uUozOr0mejg/32dF6rJN881A146fwZ7+c/Xl5EZWqE+30uX
 B73TKLJ4dLl/4ryOFA8Inz0HdIXlVhFwNz8phq3dnC8M66B6bTi9PlzrK8yOVFgiWkey
 r8PXLbX5QhHE1cXjgJSxENu6TAz9tiAfa1H5tWaXMZvFxUu5fyI3SdmnaJY9G6wj5YQu
 drZlChn4h4/BKNcxvQkN95x5QvHKEUWvlNoZqSPsuMknZasxWnrzePtXEQ/hqDaBNczS
 o22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXbuq89leoPYFTvnpGXPwOjlYtuHZSZAx+IN0CsA0Qw=;
 b=Ulxjhb7AKP2Reem95HAfChE1RnoMifAzjKdDPIsYq5DvcXvo0IbWRXzm3faEMLbIpP
 OVkIVJ4NvIr629RC6HlrprO3XKlw2KGgiNZdBF2r84lK53RFGZqt61XSaDnIbUk6iXoW
 LdC5YIOHEUfXdoKwjWqw7SJCjArXNCLVVOpmCOQUV5yIY6ubYc9A9d3b6IChx0cMPZMv
 qbAKGvZfk623ZKRoce6xHlUf+5In8fevRhzB4U/es4CePTb0oEBg3cip3GrSueVb3yZT
 PI0V5auInqMKB5ngZTW6PDKfSGk1Hc8fnbXIZ2NPWxu+F/KlkRRpo4ya44r5Fm+H3zi4
 BYzg==
X-Gm-Message-State: AOAM532K5o24b5yVZSvaIru9OZVLWHlSAqNcktkDaa61kL4xrA77hLAI
 UVdpGYbzNiEQhvtGXTVi7mmnPDb4Lhib9CTwBqYmKlcuRGexhYlK
X-Google-Smtp-Source: ABdhPJyr4k0HaDWlCrI8o6DzKSzdLSpJNlMspRclBp0gYl8mE8fGQAfi0Q5a9Syv+54XSBmohMHnSVEjkhKAvqq//Qg=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr7216617edt.100.1626199279462; 
 Tue, 13 Jul 2021 11:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210712225348.213819-1-alistair.francis@wdc.com>
In-Reply-To: <20210712225348.213819-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 19:00:39 +0100
Message-ID: <CAFEAcA-3Y=tmAsNNp9-8j6nbL0M-_GkFKDvU6RpHHkZ6CW8XzA@mail.gmail.com>
Subject: Re: [PULL 00/11] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 23:53, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' into staging (2021-07-12 19:15:11 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210712
>
> for you to fetch changes up to d6b87906f09f72a837dc68c33bfc3d913ef74b7d:
>
>   hw/riscv: opentitan: Add the flash alias (2021-07-13 08:47:52 +1000)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for 6.1 release
>
>  - Code cleanups
>  - Documentation improvements
>  - Hypervisor extension improvements with hideleg and hedeleg
>  - sifive_u fixes
>  - OpenTitan register layout updates

Hi; this fails to compile on some hosts:

../../target/riscv/csr.c:437:48: error: initializer element is not constant
 static const target_ulong vs_delegable_excps = delegable_excps &
                                                ^~~~~~~~~~~~~~~


That happens on s390x, x86-64, aarch32, NetBSD. I think this is
"gcc older than gcc 8 is stricter about what it allows as a
constant expression". If I understand the GCC bugzilla issue I
ran into via a bit of googling, the C spec is quite limiting in
what it considers to be a "constant expression", and in particular
"some other variable with the 'const' attribute" isn't one.
The spec does allow compilers the impdef leeway to allow a wider
range of things to be constant expressions, and gcc 8 is cleverer
here than gcc 7 was.

If delegable_excps was a #define rather than a 'const' variable
it would be OK here, I think.

thanks
-- PMM

