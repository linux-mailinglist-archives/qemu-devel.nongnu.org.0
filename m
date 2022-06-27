Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277155BB3A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:05:42 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sBB-0001Qn-K0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5s7y-0007yW-8v
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 13:02:22 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5s7v-0001LJ-Us
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 13:02:22 -0400
Received: by mail-ed1-x52d.google.com with SMTP id n8so9847eda.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jm97EEskwj2lSxTO+8KzbfVf+emGlvpaptWBWKR7Lv0=;
 b=RjHbjE+LSW+XoRBGzf27AKadlsgM6VrYVOWW4ies+bqMbb0NcXj+6dSOJ6Ydz9Vvvz
 7He8QId5QagVh7fvZqz4Zw3dlT5NB6slQMgxXFArf5LoVUrqhwsGDTmB2DX7aWa2eN3k
 D3jwz68RJLk0DP2dM1NQB127Pe0zlqrdkZNWoy5LjJJe9PB3pqBMfDEQ5prcmzR9SAyZ
 I67z9NDO1WQ8H+Gbwb2WFG3IHW2ATYNyWtnQNLJJ6yIzR7bZxKtbhO//saeKDqcpdh04
 G0IY61mWvkqHmq99sN5GZr3wjn/2IrM2dpEM7hvPfNcE5NQHVxTd9kMPf6qhWBbtKt2n
 09Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jm97EEskwj2lSxTO+8KzbfVf+emGlvpaptWBWKR7Lv0=;
 b=sgNSolUa70HHuSb10ceZ5w5fmgVpSojwtBWS7v9LlRardJpob2Ft3caseYzAS3aCk+
 uFPH9l8K0Nxzgbn/nmh0hBvEYjHShlV7BUkoV/BhGa2wffZlns2ebyWPvs+Vp2+pbtYS
 Ie+0eHN+MAVkw1Dmv84x3eJvW0e1vdBFD7pYJVbqdG0odnBOkeYjwAHCrOt9GRnKH3Km
 oM3J31EQuPAnpNx3pXV1BbKD9zUKgcMN6c05BELtfyCUJ1FEb6xye2i29w3FamzSHgmi
 pBJH2PMUArqodCU+eGWi2SS1pAggC2lriKgN3SkS9yrNvVi5/AEc9Rc8Yr/pHMLJHdix
 2kBw==
X-Gm-Message-State: AJIora+qrxhxiCdRLCWwX4oh5WDg1kSdGTz81CT2yR6kD3cpKqPcRVhI
 MBqMOQlVgQlfwvX6NzTtvTM78OCQAntntbKl93Uk+A==
X-Google-Smtp-Source: AGRyM1tYeR56vtjZoiiZZJCmyno5FFYnL1U/pcLMZdii92nfxusKfwxiyEU8h5SwY5wp3lf9Q1HtddQkStKChgoCdNE=
X-Received: by 2002:a05:6402:154a:b0:435:5261:f776 with SMTP id
 p10-20020a056402154a00b004355261f776mr17458414edx.118.1656349337892; Mon, 27
 Jun 2022 10:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220627164956.1516487-1-rpathak@ventanamicro.com>
In-Reply-To: <20220627164956.1516487-1-rpathak@ventanamicro.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Mon, 27 Jun 2022 22:31:41 +0530
Message-ID: <CA+Oz1=ZmTp__w8tJ-CZLw3NX-+dfDU5BYDu6OR2kfbjpaRjwkQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>, 
 Rahul Pathak <rpathakmailbox@gmail.com>, victor.colombo@eldorado.org.br
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for spamming but my send-email script misbehaved
and sent the v2 patch two times. Please ignore one of
the v2 patch

On Mon, Jun 27, 2022 at 10:20 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> mhartid csr is not available in user-mode code path and
> user-mode build fails because of its reference in
> riscv_cpu_realize function
>
> Commit causing the issue is currently in Alistair's
> riscv-to-apply.next branch and need to be squashed there.
>
> Fixes: 7ecee770d40 ("target/riscv: Force disable extensions if priv spec version does not match")
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>
> Changes in V2:
> - remove the stray format specifier
> - add the Fixes tag and reference to external tree
> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e4ec05abf4..509923f15e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -636,9 +636,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
>              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x%lx because "
>                          "privilege spec version does not match",
>                          isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +#else
> +            warn_report("disabling %s extension for hart because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);
> +#endif
>          }
>      }
>
> --
> 2.34.1
>


-- 

Thanks
Rahul Pathak

