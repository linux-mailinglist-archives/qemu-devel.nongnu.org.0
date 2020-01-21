Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BEA143B63
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 11:49:34 +0100 (CET)
Received: from localhost ([::1]:51350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itr6D-00060r-H3
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 05:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37653)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1itr4y-0005Ug-Cm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 05:48:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1itr4w-0008CG-9k
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 05:48:16 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40966)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1itr4w-0008Bx-2b
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 05:48:14 -0500
Received: by mail-lj1-x241.google.com with SMTP id h23so2223105ljc.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 02:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMK1nIIc9wgbENUnqtEmN31Kd3XFiwVAAC0pNc62PnE=;
 b=e5EiV/2afZIaFggbEeaaG3XaCw44/2xrZRhjopVqVbR9CgS27nd56j6DcQY5xgt5F2
 sJ2bnUrtrxVVpnioGPgoG0R4lI/mnU5Q4SYU0p+w20ZAfdnndnB08FaDHgH1+lALLQB2
 tzvIHNB5/pMwDwM/FPGkedz2T+qrGw9IH5mpabcgfLxVDO6DwSJrs8IQm8UL036knz8R
 LjC2Ms8r4c3GhUDHW8I39F3KReFsaQEFvQU3igseuEzXxh3vdBZFYiGv5COQGFwv4Koo
 3bmgWVph0hHPxA1jfK4P38/tCu52YONNiORNWD9O/YGt48PB+OkkhmA0Gcnh0+iyz5I+
 jP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMK1nIIc9wgbENUnqtEmN31Kd3XFiwVAAC0pNc62PnE=;
 b=Tlrvz9CtjsGqd5kBLDK+ehggkUTBJBC4Qx7XiCZEopi+e0oJDfCUMwTfi2uLFpQcd7
 XI95Ou6l1PBAmtAjCvT/QbzDBZ4RaR0viBf65cGR18d8LW5mjl7c5ZFzy9/Xl2vSKOov
 mq4MfqLOrUzFx9vuenkoC2/vWZ6ssBpxiP+C4fQZCfJGCT8NKXrYCgyXeP8AtrIjSbj7
 iU74LjMLWe9DVN3dX/MgjX0vM73mmosP7+uzXSzXOaQ7unyEK2PJzaSRBeM+QlUXtdhq
 xjXEyQZ/RzBP1AS+HviV+aRvUWtzCe4H4HsEvQzMm2GoBCpzV+TbGAqYTP/OANRr/op5
 qMDg==
X-Gm-Message-State: APjAAAWC4K8cDCQMvwZXLInll+63YGwIjUtlA0uVDTnGcTgUUCCGJWgS
 es1e9hitCCYtGI/r8Ef8fR0tpyxRsj3WyzZJuDc=
X-Google-Smtp-Source: APXvYqzdh2tZvajYtbMCsNEYmmrZPJJ+p2gbrzLfXOTOJV74LnbQ7WAlRXMkiwLM+qt63NSVovbCoIE3oMthYaFCwcg=
X-Received: by 2002:a2e:9157:: with SMTP id q23mr2287937ljg.196.1579603692988; 
 Tue, 21 Jan 2020 02:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20200121100732.28734-1-ianjiang.ict@gmail.com>
In-Reply-To: <20200121100732.28734-1-ianjiang.ict@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jan 2020 20:47:46 +1000
Message-ID: <CAKmqyKNpg4j4nZU19TNtJPs-oypOq=9mHJaM0ios=MbppKYfwg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix bug in setting xPIE of CSR for MRET and SRET
 instructions
To: Ian Jiang <ianjiang.ict@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 21, 2020 at 8:08 PM Ian Jiang <ianjiang.ict@gmail.com> wrote:
>
> According to the RISC-V specification, when executing an MRET or SRET
> instruction, xPIE in mstatus or sstatus should be set to 1. The orginal
> QEMU does not give the right operations.
> This patch fix the problem.
>
> Signed-off-by: Ian Jiang <ianjiang.ict@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/op_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 331cc36232..e87c9115bc 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -93,7 +93,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>          env->priv_ver >= PRIV_VERSION_1_10_0 ?
>          MSTATUS_SIE : MSTATUS_UIE << prev_priv,
>          get_field(mstatus, MSTATUS_SPIE));
> -    mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
> +    mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
>      riscv_cpu_set_mode(env, prev_priv);
>      env->mstatus = mstatus;
> @@ -118,7 +118,7 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>          env->priv_ver >= PRIV_VERSION_1_10_0 ?
>          MSTATUS_MIE : MSTATUS_UIE << prev_priv,
>          get_field(mstatus, MSTATUS_MPIE));
> -    mstatus = set_field(mstatus, MSTATUS_MPIE, 0);
> +    mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
>      riscv_cpu_set_mode(env, prev_priv);
>      env->mstatus = mstatus;
> --
> 2.17.1
>
>

