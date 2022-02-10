Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE74B16BE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 21:10:16 +0100 (CET)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIFle-0007f6-Um
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 15:10:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIFk6-0006kA-Td
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 15:08:38 -0500
Received: from [2607:f8b0:4864:20::1033] (port=37496
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIFjs-0007jj-TJ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 15:08:38 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so9721857pjl.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JR9e9fWcfms64DuhxI4GYueHehDidQTtSLd+kfj1mKQ=;
 b=f2guZVxZRF8qfzBz/UmneI8yyIbdut+kYFi7gohaMlOhx40ZHp39Yk4xtDmyND8wa/
 Jvd71uDw6hXdzQLRQDbdlxu/P7traoHtzgnJTou8dCxuF7XH5BxxvZAJEoYG6c7KSJET
 kugHg+qUn2WoL4DUkb2Y4RBjDAXDKaifTvVq8HL6Vg1dU4mN1wZswK6DOBc2O8JtI9Dw
 o1OYvugMkD6GKEo4d6rNAnyz7kL/WgLLwYXHCIP4cv/e2SN35JT8ikHWljRbKSW8yfL2
 xqmVqkcfaEAtwQ5tbT9tZ/ZUsiFK4R9uGrOvzd5QdmfhJTdFc+j8u0zVb5aajFUdoFWW
 1Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JR9e9fWcfms64DuhxI4GYueHehDidQTtSLd+kfj1mKQ=;
 b=oKatuy7qcR7pwAGag/3o5xTBr/YwnU+QduwRuWbjuFITcB05kvg12t+HeQdrlLQqp6
 NQu+42209XqDsJ7al/QsFwmTIoPZ22BQjmhhuAgxWP+02Wwj1+qRzbbMgvZ5p1zyImzm
 vjFEZI0vOxkigcYdoSt1BJe+/h1IsUndjfF94OZc4HiNyYHxMxUXhtrDF3eeCimHSfEc
 13a+6g6d05VcjxoQCE0xetfjkDzJVfe/k9wXzl/r3Kzu5o4Xqqw3SQr383VGT2/isb08
 qkx2p5U3BZqw5swoeKMAqOwvzjyxk+DNQrqDH7z69kBUn5Lg7/E7pfEB3ryaGwIAnsY0
 vlIQ==
X-Gm-Message-State: AOAM532x3BefcrXeT+ksqBa0T1l4h4nYvh93xoyWzhH61c1VXgYojDxU
 V63jJigVLoJP6vuwH97B3Zo/3F5Xk68zNfhza0eBBg==
X-Google-Smtp-Source: ABdhPJyIGg7okmfocGhux8HM+rm+tCU0/f5ZGkP5zDQcSp0DXaADi9rshYKMg0BgHS178Xlmartu8VVlNcy/zO/pSs0=
X-Received: by 2002:a17:902:6902:: with SMTP id
 j2mr9181538plk.141.1644523689272; 
 Thu, 10 Feb 2022 12:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
 <CAFEAcA-bn0mQw5Xsn4+-b6_Qa67TViKsVK4uVmNmNkkcq5FqTw@mail.gmail.com>
 <CAH8FvQuJAkum69p6dX6mCR0kKZ7zZaM4GikcahCbsJxC3LBXsA@mail.gmail.com>
In-Reply-To: <CAH8FvQuJAkum69p6dX6mCR0kKZ7zZaM4GikcahCbsJxC3LBXsA@mail.gmail.com>
From: Jimmy Brisson <jimmy.brisson@linaro.org>
Date: Thu, 10 Feb 2022 14:07:58 -0600
Message-ID: <CAH8FvQvtxCB1_T+CkXn1urRcqGUaoaQ2+MyLcnOQ+xeyhRxFOw@mail.gmail.com>
Subject: Re: [PATCH v1] an547: Correct typo that swaps ahb and apb peripherals
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jimmy.brisson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 09:13, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
>
> On Fri, 4 Feb 2022 at 11:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 2 Feb 2022 at 15:23, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
> > >
> > > Turns out that this manifests in being unable to configure
> > > the ethernet access permissions, as the IotKitPPC looks
> > > these up by name.
> > >
> > > With this fix, eth is configurable
> > >
> > > Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
> >
> > Can you explain the issue here in more detail, and maybe
> > provide a repro case ?
>
> Sure. I documented how I found this on my blog here:
> https://theotherjimmy.github.io/blog/blog/2022-01-31-debug-qemu-eth.html
> It's long, so I'll provide a quick summary here.
>
> My reproducer is the following zephyr example:
>
> ```
> west build -p auto -b mps3_an547_ns zephyr/samples/net/dhcpv4_client \
>   -d build/mps3_an547_ns/net/dhcpv4_client -- \
>   -DOVERLAY_CONFIG=overlay-smsc911x.conf \
>   -DCONFIG_NET_QEMU_USER=y \
>   -DCONFIG_BUILD_WITH_TFM=y \
>   -DCOONFIG_TFM_IPC=y
> ```
>
> As part of my debugging, I was using gdb on both the guest (tfm &
> zephyr and host qemu).
> I was able to reproduce this quickly by dumping the associated
> smsc911x struct in guest gdb, and
> watching the breakpoints in the `tz_ppc_read` function. Digging
> through, it seems that when setting
> up the peripheral access control in `iotkit_secctl_update_ppc_ap`, it
> wrote the lowest 3 bits of the ap
> and ignored the rest. This matches the expected behavior from the APB PPC EXT0.
>
> Let me know if you have further questions,
> Jimmy
>
>
> > The AN547 document definitely thinks
> > that APB PPC EXP 0 has the Memory Protection Controllers and
> > AHB PPC EXP 0 has the GPIO, USB and Ethernet devices:
> > https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
> > (tables 6-2 to 6-4 on pages 35, 36).

I looked that up, and funny story, the _actual_ problem is that we're
missing the User AHB interface 0-3 peripherals.
Without this change, and adding empty peripherals e.g. {},  as
placeholders it seems to work correctly.

> >
> > thanks
> > -- PMM

