Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D439B66D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 20:51:44 +0200 (CEST)
Received: from localhost ([::1]:32805 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Ef1-0007b1-CY
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 14:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i1ES8-0004hn-2K
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i1ES6-0001aC-Vu
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:38:23 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i1ES6-0001ZB-Nz; Fri, 23 Aug 2019 14:38:22 -0400
Received: by mail-lj1-x244.google.com with SMTP id e24so9719585ljg.11;
 Fri, 23 Aug 2019 11:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HhYI+d7TeubtlYOr+ttlgbGlwQjGw9ZjQgyvEJ38N8=;
 b=gxwbgYZSsX3yuob6P6IoGNXR5SrPTI+cHY7rlbiQp6jka0DSR2jRlLs60V1LDYeLJA
 /ulfSReTFQiht8wWhLNso13G/+EmFVygGThjW1yQeCnshx5w6h5gIL9wueSpW0h7VrFr
 /CMGAV6imZm7ooiGv76RPgS32LO5RcWervzoYjcPj7MWnBiR3UUnKyV8DKAwcy56z/xd
 kKuBda7CAsSMK3JPK92gRoZvPzEaStOWByTjUI3LbSDUcOmiVR4xC4zKpcv3vO2Vo/Zq
 6eKnQxf6QVqX6XcwaajBS7EBAuq4weOQXg43OP92QQ7QxtV/kt+y+ipNP1X8Ce+yOnv2
 Oz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HhYI+d7TeubtlYOr+ttlgbGlwQjGw9ZjQgyvEJ38N8=;
 b=J6i0t9cKa4W1IuZJ29Qw42V4vvg5hko2UseYwm0pSIM+VarLOT5xu1YFqvt4jZG67L
 lBXdJfte9L2ztX224Gegwy7WUuiuBVn/AJGMcwXnjhejajMIsFpENy10GdZUQSuiYfdH
 7r4BMRgFpuuDG+NzjQQOUtdaMNnCVTKunWuIIO7bbpaxz2smn3C3htxWsxkTTmY4gDcN
 fj/AnfyZG7o/guS8SlpfxzSII9PhA7/i2DnLT+wk28EkMaKHNt4582qYPn/oiNt8Q5Xp
 bZEzcZt50qQTl4jyttwvy/puUGdhq6TWvpGSunCCpEFBKq5ofznltb9YFxObxhDXLB6U
 nSBA==
X-Gm-Message-State: APjAAAVGoFHp8E5SpXDXztSCt4Qr4Ch8ElnGk7cxjcodcI6sbxcHdGsT
 8gTxUA+zqp1eMvsF8l7p0Jh96/i4VSI8+s+ZG5s=
X-Google-Smtp-Source: APXvYqw1xGrtGrV/qucFpDd49EKbjbyoYbhWxzNIGmPw1llA8cFPlsRZeh9PajYgoa0HTb6SobJ7IK2SaJkRd+U1srE=
X-Received: by 2002:a2e:8102:: with SMTP id d2mr3837034ljg.58.1566585500903;
 Fri, 23 Aug 2019 11:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
 <1566537069-22741-18-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1566537069-22741-18-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Aug 2019 11:34:14 -0700
Message-ID: <CAKmqyKNGVkqqdPWWy1-mvi=EW1Axw4GAWFGHvSSYAsbvo6b3qg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v5 17/30] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 10:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> It is not useful if we only have one management CPU.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Ah, I jumped the gun with patch 16. This should be before patch 16,
otherwise patch 16 is fine.

Alistair

>
> ---
>
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
> - use management cpu count + 1 for the min_cpus
>
> Changes in v2:
> - update the file header to indicate at least 2 harts are created
>
>  hw/riscv/sifive_u.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 0e5bbe7..a36cd77 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -10,8 +10,8 @@
>   * 1) CLINT (Core Level Interruptor)
>   * 2) PLIC (Platform Level Interrupt Controller)
>   *
> - * This board currently generates devicetree dynamically that indicates at most
> - * five harts.
> + * This board currently generates devicetree dynamically that indicates at least
> + * two harts and up to five harts.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -485,6 +485,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
>      mc->desc = "RISC-V Board compatible with SiFive U SDK";
>      mc->init = riscv_sifive_u_init;
>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
> +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>  }
>
>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> --
> 2.7.4
>
>

