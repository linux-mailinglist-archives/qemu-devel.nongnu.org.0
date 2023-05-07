Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D915F6F9C76
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 00:23:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvmmW-0001rI-Uu; Sun, 07 May 2023 18:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvmmS-0001qs-DL; Sun, 07 May 2023 18:23:00 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvmmP-0000gt-SP; Sun, 07 May 2023 18:22:59 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-43551f23c49so444156137.0; 
 Sun, 07 May 2023 15:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683498176; x=1686090176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQgU2FjsIHLUzHDXk7A4n6uMai51qFDo/55MYDuSSRM=;
 b=p489Qrehn4KJFC2pIJeG9KfBAeF+4a3vuSB2TQdF+BChGiRI5vl+BwyhB+AnGmZ8l7
 TXT4s/bU8SGjIH/cwZhmYXbKAviELHg9TRqqCVCc7A3SGMbkSO6QMFcYnlYle+boJfvq
 HLn65sW/zqM6PRGwTw7UI8tJlPo2+KvbQJSNybLO/PQGVB6xO6QJF9U7NjavWWX0+GA4
 S41Q7mrL5dF2T6BWpLMmDfqIqSmlJP6pTp6TdNz1juacFljXi/vdVwSCJlhH3woJjRK4
 2Dq/yrlHZgTGZ7+6kGkEYhOB3TNxy3ofKRmHF56i7TST7T8fEjAR05W6z+Xi5un2Nsh3
 CmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683498176; x=1686090176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQgU2FjsIHLUzHDXk7A4n6uMai51qFDo/55MYDuSSRM=;
 b=k4ESHEbdsGc1We1AkzsXOVHMwE3nHJKZ2sjburmh3DdItMhE7wtgzCNETR1zqgoSQi
 aw81B1vxQAc//5VNAOE00wU64d46DMQ7PInLzIwy5hWBq005oxNUELi3/2S0sFxV+Ud6
 fDgotPmiSzZhmLP80GDTKtdHswPLLbs64G/xe+8xNBwPLQbEtm0cVujkwxTE+dYqKpav
 g668tLh+js2ClTINoAYIYkNny1DELuvcuYEpPzlHAPYYbZA14GWKZGmjRVsfg03AfvbX
 syp6JGxGbUOsLEMXVbWrBhKvXJty4cKH6HR9sxg/+yvRmbk0/QK2JJqlj+v6tkozKeI6
 v3nQ==
X-Gm-Message-State: AC+VfDzsS0RLrCe1hw41mhNntHcm9yA2qdbA9mHNlCHVV/gA0dehz/th
 YbwCEOChpnYTfRAo3iYu2MmADhJ/1x8nmfVXhtrx5tOcBX8=
X-Google-Smtp-Source: ACHHUZ4KKVHSZ8UqnCnohu/kRIwuaydXPV46muW21PJ+IuPz9yZN3I/6KXp2TPKne8YsPxTvSNFNizbhLekDgy7pfBU=
X-Received: by 2002:a67:fd71:0:b0:430:4725:2697 with SMTP id
 h17-20020a67fd71000000b0043047252697mr2392484vsa.24.1683498175990; Sun, 07
 May 2023 15:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230505010241.21812-1-alistair.francis@wdc.com>
 <20230505010241.21812-20-alistair.francis@wdc.com>
In-Reply-To: <20230505010241.21812-20-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 08:22:30 +1000
Message-ID: <CAKmqyKNSSbsBmTdTc3eAhu2umqR75_5qbugH5Kv=6dZTGQo+wQ@mail.gmail.com>
Subject: Re: [PULL 19/89] target/riscv: Fix itrigger when icount is used
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 5, 2023 at 11:04=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> When I boot a ubuntu image, QEMU output a "Bad icount read" message and e=
xit.
> The reason is that when execute helper_mret or helper_sret, it will
> cause a call to icount_get_raw_locked (), which needs set can_do_io flag
> on cpustate.
>
> Thus we setting this flag when execute these two instructions.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

This is also a good candidate for 8.0.1

Alistair

> ---
>  target/riscv/insn_trans/trans_privileged.c.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
> index 59501b2780..e3bee971c6 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -77,6 +77,9 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>  #ifndef CONFIG_USER_ONLY
>      if (has_ext(ctx, RVS)) {
>          decode_save_opc(ctx);
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }
>          gen_helper_sret(cpu_pc, cpu_env);
>          exit_tb(ctx); /* no chaining */
>          ctx->base.is_jmp =3D DISAS_NORETURN;
> @@ -93,6 +96,9 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  {
>  #ifndef CONFIG_USER_ONLY
>      decode_save_opc(ctx);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
>      gen_helper_mret(cpu_pc, cpu_env);
>      exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp =3D DISAS_NORETURN;
> --
> 2.40.0
>

