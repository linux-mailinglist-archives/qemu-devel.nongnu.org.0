Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0313B999
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 07:32:15 +0100 (CET)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ircDu-0008KH-EI
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 01:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1ircC7-0007PF-2u
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 01:30:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1ircC5-0001uG-26
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 01:30:23 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1ircC1-0001rM-4e; Wed, 15 Jan 2020 01:30:17 -0500
Received: by mail-lj1-x244.google.com with SMTP id m26so17153738ljc.13;
 Tue, 14 Jan 2020 22:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBDFz10dNP9KBcZ/NwD9W/X3GBIY4HIJ8Uqwl6EJlnk=;
 b=VUjufHuiHergk/WvyxPr/ERZT+G3Wh3J2LrHBKXKVUQCc57d9ssKG79/p1L71xWsAF
 upLzvoDp5VAWV7QuoU9NK7ypGHw5x9Ckl+Q6diueKUN4taJ3ZjhU/VirmyNy2G6M+vSK
 q+TTCFRxROStiEaMPbRrsb0VIlbin7OR6Wsj2yQMRr7/U5Xvl3ak0IJZIwmtahI1cSDO
 /vSm0N+VrfAeDqEpNUdEVIPFnwJntWwTCkVUmbtUOdQ4PtgvlOLKc8WsieQzuKR88FGs
 p01+92lV21D0plR3Cpl4BmEeJjqkIV3g5RbXNUkxoi6879pnvhXqLPxhen4e6+p42JDn
 hp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBDFz10dNP9KBcZ/NwD9W/X3GBIY4HIJ8Uqwl6EJlnk=;
 b=krZa1chIzmfTOVMpYY18KlvOTjuvn3mX7ir/DmPoYyH5eqwE1ZOvGe/8TkjTWNF/Tp
 osF+U8GtZENqc6YbXizTDlpkr72VHd8aa5lA0CBnyX4nJTV38gRfYchHvQkjKz7KyDmq
 NiYJs8LyI9AlwEKDy3E9TOhKOAflUtlGUKxg3E38owmaulMfcMs0+ADSatLFuKr0F64q
 R+Rdwl4uKro6uKsHTiEWzhqXUkOoxtNC6ncO2drmjBoi6bVCJok/FWDY/eoHB6a6jpJ3
 QoXo0ZHh7/3CUaoTZPtKSe0gNVwkNjR9f2ygwwPMaHb1nitMSPRnJnwxjD6mJorhBUIO
 Fxzw==
X-Gm-Message-State: APjAAAUWCCaomyhPSq79h854NSzzB1r7l/brinhOtgWjnfLrrQGNXRqR
 2NMVkY9/fbpR7K8fDQJ3/cUUKJld2g4jqS4yNM9o2XL+cig=
X-Google-Smtp-Source: APXvYqy8cdeBw4e830uUKIITNAnNbDAYjJszbesm/5gs0cVO1Qovf0ivhDeVasQKBJyeFJ9bL/LOsq8DlE5HFVv30Zw=
X-Received: by 2002:a2e:8946:: with SMTP id b6mr761437ljk.1.1579069816062;
 Tue, 14 Jan 2020 22:30:16 -0800 (PST)
MIME-Version: 1.0
References: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
 <1579069053-22190-2-git-send-email-shihpo.hung@sifive.com>
In-Reply-To: <1579069053-22190-2-git-send-email-shihpo.hung@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Jan 2020 16:29:49 +1000
Message-ID: <CAKmqyKOm_kA5LG6aodo5G9=-zn1z1=2_gF1qYJrGXfVg_VAmxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: fsd/fsw doesn't dirty FP state
To: shihpo.hung@sifive.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 15, 2020 at 4:18 PM <shihpo.hung@sifive.com> wrote:
>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvd.inc.c | 1 -
>  target/riscv/insn_trans/trans_rvf.inc.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
> index 393fa02..ea1044f 100644
> --- a/target/riscv/insn_trans/trans_rvd.inc.c
> +++ b/target/riscv/insn_trans/trans_rvd.inc.c
> @@ -43,7 +43,6 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
>
> -    mark_fs_dirty(ctx);
>      tcg_temp_free(t0);
>      return true;
>  }
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
> index 172dbfa..e23cd63 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -52,7 +52,6 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>      tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
>
>      tcg_temp_free(t0);
> -    mark_fs_dirty(ctx);
>      return true;
>  }
>
> --
> 2.7.4
>
>

