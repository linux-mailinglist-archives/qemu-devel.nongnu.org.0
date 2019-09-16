Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7AB4348
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 23:36:14 +0200 (CEST)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9yfN-0005DW-Sb
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 17:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9yd9-0003pG-Rg
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9yd8-0006GJ-RB
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:33:55 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:37070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9yd7-0006Fg-Oy; Mon, 16 Sep 2019 17:33:54 -0400
Received: by mail-lf1-x141.google.com with SMTP id w67so1145913lff.4;
 Mon, 16 Sep 2019 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFzMaL0xFQFOEUoKgKzc361NWhxPrdYCvHGNa9V4cuo=;
 b=W9gX6BOqr24tpW/Bgh3rio0LWnucWy1+cxf2b5ugsdSz0GiipFDayUdanxbtInIyav
 hTlM6jAu3SVf1vaO9Ams2615ppRGtCMujY8FrGP1R1JNIcc0jIQzhsSmk9LmXTHoAUZA
 mv4JJOdXs4jinyYYyJIGm3nFbQWq+sLqv69HGl6Hszj8jK7M4XYUE0iXSu5lc1KHyh+K
 4z69JtgRqKBEJF+37htenZs/5KsR4WWhaVVhOY63ehUhX58HMtIGgA27qcpkJCFR8gix
 nl32v2yjuHeG6S5QySYxwnNP/5uDAc7hqbneTbSSdIhSX7SSH0KZe0eLitKlfgC1uFgy
 Xalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFzMaL0xFQFOEUoKgKzc361NWhxPrdYCvHGNa9V4cuo=;
 b=fjEU4KJkZiOfgc3WCFalRvrYDiT+ObVVerVeodx4SsaVxwtFXS2MgDmA6OkQONo98Q
 hLchnvjV885v6a/Hj5FraAx/7wP0x0zMu6AygpuSvBDZbo6y5mizJPSIV6gY77WCcTnT
 kJPKbeDrI1H62uwicNMcTzf9Nsa1IZSyM6J8C8IKxjIuWMLRg/P/5xy0oTVB2kZzA8V/
 SpnLhjfA+zGamsdFUSdP4zrZISezfXclPCWDGkpba/lOLAcnuavT3MLlHvOZNBTMJ0Np
 Mz3jPCuRh2BzWyY/6O9XkOGUbck5g0/Q9Tgy7dUzyfDvt7xmQM9q3Dhn3/mOIyX1/xR/
 Nw2Q==
X-Gm-Message-State: APjAAAXGDLWmHVbtoRPbTdXstK3iCnI/8a9jP67r07dB7DTMUukk4+9I
 hzH4m+qjM2lp1uKtmJNlc1Ji/CZ62LN9bxT8pp8=
X-Google-Smtp-Source: APXvYqw97x/naFKy8KmhT76zixyo+ounStBVot1DwCNoEhyLWRNfgC5cxTQOHptYY+TniyJIdLvxcK4qnE1xvxOPA1I=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr154264lfq.5.1568669632472;
 Mon, 16 Sep 2019 14:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <1568103341-28636-1-git-send-email-frederic.konrad@adacore.com>
In-Reply-To: <1568103341-28636-1-git-send-email-frederic.konrad@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:29:21 -0700
Message-ID: <CAKmqyKNOzrgWWRyJOKucN5eVi-rbJ9z6=jn+4WfEGOzv8BpOZQ@mail.gmail.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-devel] [PATCH v1] gdbstub: riscv: fix the fflags registers
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 10, 2019 at 1:16 AM KONRAD Frederic
<frederic.konrad@adacore.com> wrote:
>
> While debugging an application with GDB the following might happen:
>
> (gdb) return
> Make xxx return now? (y or n) y
> Could not fetch register "fflags"; remote failure reply 'E14'
>
> This is because riscv_gdb_get_fpu calls riscv_csrrw_debug with a wrong csr
> number (8). It should use the csr_register_map in order to reach the
> riscv_cpu_get_fflags callback.
>
> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/gdbstub.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 27be932..ded140e 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -313,7 +313,8 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>           * register 33, so we recalculate the map index.
>           * This also works for CSR_FRM and CSR_FCSR.
>           */
> -        result = riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
> +        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], &val,
> +                                   0, 0);
>          if (result == 0) {
>              return gdb_get_regl(mem_buf, val);
>          }
> @@ -335,7 +336,8 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>           * register 33, so we recalculate the map index.
>           * This also works for CSR_FRM and CSR_FCSR.
>           */
> -        result = riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
> +        result = riscv_csrrw_debug(env, n - 33 + csr_register_map[8], NULL,
> +                                   val, -1);
>          if (result == 0) {
>              return sizeof(target_ulong);
>          }
> --
> 1.8.3.1
>
>

