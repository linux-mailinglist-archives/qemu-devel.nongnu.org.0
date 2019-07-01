Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7C5C4DF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 23:15:13 +0200 (CEST)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi3do-0003WH-LN
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 17:15:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47493)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3Iu-0005e4-Kn
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3Ir-0003iR-IY
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:53:34 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3Ir-0003i2-9O
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:53:33 -0400
Received: by mail-ot1-f65.google.com with SMTP id r6so14922195oti.3
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Po+hiKTXl/WW1dV5JyskiYwMafDOR2b4UMvJ2DcVI6w=;
 b=DMH/Q39r2kVmR+yR6bIkb3m2K6AsAlftGzdRwC4X0Sqo+rRxhb//JORU1G70gPwXeS
 Bq+vPI3RxA5PeAxqCjlBJN92op1jcLvFi988TwoqS96uEz79O6IG/Xvk6StrvgtTgEMg
 dpIvOuu69N/p2QHyIeKc7qYohUQWhIAixAHQyBn7axkjhRzzRuXW3UXzyX0F+hGec+uv
 r8y1CVEO54GfEGNTSHJ2o8T96HOtDXlAvP2md5cRJ1fi8n9pSDpSTkMkP4zyTRagkBB8
 4URLY5qGMb+36LoCWUQCsUk2YZ/iRUrl2Nexq94/xl9wD9MRrbKS9e6amCLPIVjTI0cm
 v/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Po+hiKTXl/WW1dV5JyskiYwMafDOR2b4UMvJ2DcVI6w=;
 b=cA4dBusQjeIrve4qAOaN1dVmdheQ+TYzTMvYkEXpW7+DJ1Q5iEUrT571uJTvdov212
 50EBTl5Ck7KmvBay6v+CzU91D8zPG8mrb93MXMQiLKE/zjIczcDyWkaZBi6hv/YmU3iS
 mrKyNYQ9XiROLXqle2XjLC9MIZnY9yMl8YcD6t/cXXnHnBdDhIvurRsOG6w5tGZYV8OM
 5TsisK379/Ovdx79Brpxb/oqf4xT1shMLLO0Ztqq/fJ7IJqdEq9deMLY/cQQf84Hy5fD
 N17eaKxiJ6tkSZTdnBs5bV662U0SWH/R3ycQY2D68UFaBMzQiB/AvRh4UUllbfIo/FQW
 DrPA==
X-Gm-Message-State: APjAAAUyxbv40uZscMAILsIjyrfXBpZ+/zu7MiQ9cUrPl5khoE2irBav
 AM17Zm42Y/jfiBmmgALVDs3uzhqm3MW0BHOUzbRSIGJc15g=
X-Google-Smtp-Source: APXvYqxA15DfX9/7DbGg+LDBhBbxkNdJNSZN8gzwLSPFJ9qy4sJTdUIKX7wGQBOe9P0AjlbL4CqhCGeygbTPycs32bo=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr21350613otk.232.1562000091810; 
 Mon, 01 Jul 2019 09:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
In-Reply-To: <20190627152011.18686-34-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 17:54:40 +0100
Message-ID: <CAFEAcA8sscJQ2GCwL1gM+EcRtfHQb1v0BwORt6ncH54x51TCVg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.65
Subject: Re: [Qemu-devel] [PULL 33/34] roms: Add OpenSBI version 0.3
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jun 2019 at 16:24, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  .gitmodules                                  |   3 ++
>  Makefile                                     |   5 +-
>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 0 -> 28848 bytes
>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 0 -> 28904 bytes
>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 0 -> 28904 bytes
>  roms/Makefile                                |  48 ++++++++++++++-----
>  roms/opensbi                                 |   1 +
>  7 files changed, 44 insertions(+), 13 deletions(-)
>  create mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin
>  create mode 160000 roms/opensbi
>
> diff --git a/.gitmodules b/.gitmodules
> index 2857eec76377..7a10e72e09cd 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -55,3 +55,6 @@
>  [submodule "slirp"]
>         path = slirp
>         url = https://git.qemu.org/git/libslirp.git
> +[submodule "roms/opensbi"]
> +       path = roms/opensbi
> +       url = https://github.com/riscv/opensbi.git

It would be nice to state the license for new blobs we're
adding to the source tree... In particular, I find the
readme at https://github.com/riscv/opensbi a bit confusing
because it says it's 2-BSD but also that some parts are Apache-2.0;
the latter is *not* GPL-2.0 compatible. That makes it not completely
obvious to me that we can ship this with QEMU.

Also, new git modules in .gitmodules should be qemu.org
URLs, not random external ones. (ie, we should set up
mirroring of any new external repo we start shipping
code and binaries for). We can set this up and fix up the
gitmodules file after the fact, but the ideal is to do
it in advance rather than afterwards.

thanks
-- PMM

