Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41260C1A7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:24:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9Yh-0002y6-Cf; Mon, 24 Oct 2022 22:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on9Ye-0002v1-IY
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:20:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on9Yc-0004In-W6
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:20:48 -0400
Received: by mail-pf1-x436.google.com with SMTP id f140so10621970pfa.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ScyE5ptKB7D6TStUw1sX/KBGX+dTB2LUf+Z/S+yxlmA=;
 b=gEipV5mH8zVVeMWOmOWE6lX+NSPLORbf6VxlJTgXMIj5nANQv8Hdnk+wyrtyQ/u5oS
 mwJtjM7G5HEKaFPvvj0aHKmmbHsg+Wx8/T/kBL/HLO8baFXaCRN+r2ii1x3wsW8R1bVc
 S5Q5vAPd3pAYobXLZq9rpDrTMyf9icqc0hZQPYMQCmbeIdKTYlLJJSEjrGJjU8t5TWn5
 kvznHz6/KaOnfPq0qnplGqEoZ765WdEvc1ai4y0HeitLj/P6NQ0ji0q1TUS+IL2lj1qf
 5LCm5QttTZ6ALIUiUHc8JlzN4SEVTjVelLjLcmL3PfctT9ycZ8hUmqTti9p1qPHuqXFs
 RZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ScyE5ptKB7D6TStUw1sX/KBGX+dTB2LUf+Z/S+yxlmA=;
 b=tLtXGeEHeaeErv2MyONugUppw3ScO13kap1gkLbFBG4hRpn0FDSdfioV0biBoJj3ve
 AYu1xXC5V4peBTfKwjTWh4Z4QJvEczIcgQU4kH2KbvJtyS19Yj2adVJa+Kf/KvdhWc8A
 NkwfsgBSBRQHxzYr0+LBmtJAwc42Bk4sBFIrI4pPPaW0N11gLEU70lTyLxvXWjwNdVtu
 APfXmXqtFvWCOTiCx9Mzg61NKXdmPtgc6SIEsIR1z9EKHPimBCeortrAouKD9J1krUyS
 g1/j6TcgdcWsp5fId9am/+pfbuOCP8+7sILF0GR9jotm1vzMOZskrWeMz+YLCWMf5BOY
 PQOA==
X-Gm-Message-State: ACrzQf1oFi5XKIupbxQLGW1SOhNuGY5VuyTy0c7CrPJTnP1LO5jErYKh
 6xKzu8PKcwu2qORU4HU3Yv7gOIi9h6ynsWjpa3KZER2McyS5bw==
X-Google-Smtp-Source: AMsMyM4Kcr6wAjzAOi2vFIMrUZBTpVYgnfhb7qaLLV+QSgT6W+AJvuSaVE0wLkChWmtvcLH+MMS3qpLBlFf9P3j4yb8=
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr37223387pfh.60.1666664445650; Mon, 24
 Oct 2022 19:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221020233836.2341671-1-richard.henderson@linaro.org>
In-Reply-To: <20221020233836.2341671-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 12:20:19 +1000
Message-ID: <CAKmqyKO1Wuru30xtJLeYFbuvzMM_3AT+ZtJ8=YGkoXrC0=xp7g@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Fix reg overlap case in tcg_out_addsub2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 9:47 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was a typo using opc_addi instead of opc_add with the
> two registers.  While we're at it, simplify the gating test
> to al == bl to improve dynamic scheduling even when the
> output register does not overlap the inputs.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Supersedes: 20221020104154.4276-4-zhiwei_liu@linux.alibaba.com
> ("[RFC PATCH 3/3] tcg/riscv: Remove a wrong optimization for addsub2")
> ---
>  tcg/riscv/tcg-target.c.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 81a83e45b1..1cdaf7b57b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -687,9 +687,15 @@ static void tcg_out_addsub2(TCGContext *s,
>          if (cbl) {
>              tcg_out_opc_imm(s, opc_addi, rl, al, bl);
>              tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
> -        } else if (rl == al && rl == bl) {
> +        } else if (al == bl) {
> +            /*
> +             * If the input regs overlap, this is a simple doubling
> +             * and carry-out is the input msb.  This special case is
> +             * required when the output reg overlaps the input,
> +             * but we might as well use it always.
> +             */
>              tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
> -            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
> +            tcg_out_opc_reg(s, opc_add, rl, al, al);
>          } else {
>              tcg_out_opc_reg(s, opc_add, rl, al, bl);
>              tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
> --
> 2.34.1
>
>

