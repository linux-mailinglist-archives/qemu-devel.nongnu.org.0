Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641DE3C9944
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 08:58:21 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vK8-0004Cm-0t
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 02:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3vJI-0003PW-Pb
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:57:30 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3vJE-0003RQ-Pu
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:57:28 -0400
Received: by mail-il1-x136.google.com with SMTP id a11so4097457ilf.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 23:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTehcWciicTIpg7kpFTdIa67eCIM5FUbxcT8SYCq6uY=;
 b=lbslSzj7Hlnpi+67Uyg9k6MEshYTFA2JSM8IVi7v5rJIEFJABWnK9Dtyg9WIF53lsV
 bKpfI4HGT69Vu1OT9/JROR68ktB2gj2z/JCIBjilo5Rqn3oNd/irHZNUEl3IAI/F+B4W
 hl1EhsJzOEZUoVXp9xkl9QQhI9zYWLgznO9WXK2jdKWIaZozQtub+9g7W6XakCaBGfBx
 gdn3oyuHXLKD2HBeomN24v99NOC5xY3POLysoLCppgmz6b+QAQ8IlzM5fDNYIFeXMIvq
 Pj2zI3li7aF0+AXH6pBePjLp+FHjIYQ+v9Txs0fWBiPMhMIHfG9JW2xD5TWVEEpIZXrz
 4n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTehcWciicTIpg7kpFTdIa67eCIM5FUbxcT8SYCq6uY=;
 b=nKq94iKCI10x7OfTNgbkjR50l3tjPSgZJYurX7hHlogiLyhh4gnepQhY231JVx3551
 bvy94AhTK9eW8DRl8nWDVSYl7wih7DpBlTI0F4SayIR93Fe7RZt7BRkKkDz//ze9CMJV
 Cvr4hOJQURt9trWvhuc+HT2d02x0LvOSeIZaPJNbSKtVgHT9Boq/5fvGuraiHTLTYzBA
 jIQSVDZHE9P9UrWaQYiEWZ8jCvu3X4TzI++pqStqnZc1uGje30xWfpRYn3jYxsJUIgaB
 DKGZr5QRmzHKj5Kw/xMsZCONzI3xGLb4hSksbuEO5BGYJ6eTUgSyk8gzWY80Hi1IC/yy
 37BA==
X-Gm-Message-State: AOAM533Mkhcf0t4T9vyo7Ohhdca/fGW5Q1trvForgKQoRehL2P9Fv//s
 L8QevwA32+yE4jUHI4aU1vjRo0cp3IMLYzOGYDw=
X-Google-Smtp-Source: ABdhPJzjSFGWwfUGtjFAu7bPmY/6sTPtlj/XHej4EBcREQQqZ/xkBNy7NbtYp7Y7L9q9Tmb+nx2PT3FtELgC3q01Mso=
X-Received: by 2002:a05:6e02:1d8d:: with SMTP id
 h13mr1666439ila.40.1626332241199; 
 Wed, 14 Jul 2021 23:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210712225348.213819-1-alistair.francis@wdc.com>
 <CAFEAcA-3Y=tmAsNNp9-8j6nbL0M-_GkFKDvU6RpHHkZ6CW8XzA@mail.gmail.com>
In-Reply-To: <CAFEAcA-3Y=tmAsNNp9-8j6nbL0M-_GkFKDvU6RpHHkZ6CW8XzA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 16:56:55 +1000
Message-ID: <CAKmqyKNVMV5fWkpEqaXfa5yx05yOtv8ebjQFi7Z8=ALwgZnT-A@mail.gmail.com>
Subject: Re: [PULL 00/11] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 4:01 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 12 Jul 2021 at 23:53, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320:
> >
> >   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' into staging (2021-07-12 19:15:11 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210712
> >
> > for you to fetch changes up to d6b87906f09f72a837dc68c33bfc3d913ef74b7d:
> >
> >   hw/riscv: opentitan: Add the flash alias (2021-07-13 08:47:52 +1000)
> >
> > ----------------------------------------------------------------
> > Fourth RISC-V PR for 6.1 release
> >
> >  - Code cleanups
> >  - Documentation improvements
> >  - Hypervisor extension improvements with hideleg and hedeleg
> >  - sifive_u fixes
> >  - OpenTitan register layout updates
>
> Hi; this fails to compile on some hosts:
>
> ../../target/riscv/csr.c:437:48: error: initializer element is not constant
>  static const target_ulong vs_delegable_excps = delegable_excps &
>                                                 ^~~~~~~~~~~~~~~
>
>
> That happens on s390x, x86-64, aarch32, NetBSD. I think this is
> "gcc older than gcc 8 is stricter about what it allows as a
> constant expression". If I understand the GCC bugzilla issue I
> ran into via a bit of googling, the C spec is quite limiting in
> what it considers to be a "constant expression", and in particular
> "some other variable with the 'const' attribute" isn't one.
> The spec does allow compilers the impdef leeway to allow a wider
> range of things to be constant expressions, and gcc 8 is cleverer
> here than gcc 7 was.
>
> If delegable_excps was a #define rather than a 'const' variable
> it would be OK here, I think.

Sorry about that, sending a new version.

Alistair

>
> thanks
> -- PMM
>

