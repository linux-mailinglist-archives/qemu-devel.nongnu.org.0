Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03860444A8A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:58:09 +0100 (CET)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miOGm-0007Od-UF
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miOBd-0002Vl-0U; Wed, 03 Nov 2021 17:52:49 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miOBa-0008Gc-Ug; Wed, 03 Nov 2021 17:52:48 -0400
Received: by mail-io1-xd35.google.com with SMTP id q203so4477018iod.12;
 Wed, 03 Nov 2021 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XprijC3k3v+ALIh6PCF32SLkWMtOU9Afj6q7F8tZZ0c=;
 b=LiXgO4tQ/28iEZzooPhtVsJlN/dSA8IaxZRlEcP2VuOdn5Z4gQsWgzjNnBwi86y40a
 aEfDBU3T3+hjDGice1Ny+uTSQVycuu2RJbiRxfdnlhgHf08FVNX2KpbQ3U0/eK7yEld7
 llIK25B6pMkvrOJJuqKatJjZjRBKJ3oJIpOY37mvUFPbN03C92mT6hgLXMwOvys6g2pA
 BQ/B32iNR4x48kc82E8XBNdl/vdKWo77IBORBwzE5lEIOpb6wmKKd+VWqjKOQWZ2tNnL
 lVudN65O1X0zXQgXcT6PMh7b247MAUDjpBY7MCw8rgXnSQNCqcBPbDYessZUEZetAZRE
 YDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XprijC3k3v+ALIh6PCF32SLkWMtOU9Afj6q7F8tZZ0c=;
 b=7JDQsYiC5SrDa0gKGWlyMpBag8rERWi2Dtcpdy2QsDoRRfx1LL84rNEBRDmYOsOnrm
 E21dSSyF5S5Km9WuuLnISEoYylF80eaQRLnCJ620pgJs/qtn+jD144lXElOKcRFZVeHH
 df0pPxib4bdHSqcuKTDFF3BdUXLBaLvLb99bV1011gycg4jS5qr/5CvbhQEMXqWnJgS6
 WSRQBOsHFscyBvosvWtadxvyo58n1C33Z/JaCtDEHe9uDpEeunPlFX1Jd/bACSHjcXc1
 OQ4XJVDvXnKS/Z7VfpfFOut8zBFLsrxJmLUCO4dmxpp2K8YSyo0is+wpQB0j1hccX7Hd
 G3mQ==
X-Gm-Message-State: AOAM5315bQD6mNDQSa0PUMjb7VjO911/3VAi1opoXXaFV77PVQDpOkzK
 iWwvohaVHdEfl6ZHt9LmM3J5pfwEcRpYgrpeyds=
X-Google-Smtp-Source: ABdhPJxm3/BCrYOBMgHoW7Fcyl80jzlnKBs/GY87/d4RJV8SNweT+WvA2WtefABBNuOcMbSCLerN6yt0udqsNLUdUYw=
X-Received: by 2002:a5e:890e:: with SMTP id k14mr31680942ioj.187.1635976364464; 
 Wed, 03 Nov 2021 14:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211030030606.32297-1-bmeng.cn@gmail.com>
In-Reply-To: <20211030030606.32297-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Nov 2021 07:52:18 +1000
Message-ID: <CAKmqyKOYGrLTxR9XqP1KNuznud=aQS5FLWse4RQgEzfV+J8vvg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: machine: Sort the .subsections
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 30, 2021 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Move the codes around so that the order of .subsections matches
> the one they are referenced in vmstate_riscv_cpu.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/machine.c | 92 +++++++++++++++++++++---------------------
>  1 file changed, 46 insertions(+), 46 deletions(-)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 7b4c739564..ad8248ebfd 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -76,20 +76,50 @@ static bool hyper_needed(void *opaque)
>      return riscv_has_ext(env, RVH);
>  }
>
> -static bool vector_needed(void *opaque)
> -{
> -    RISCVCPU *cpu = opaque;
> -    CPURISCVState *env = &cpu->env;
> +static const VMStateDescription vmstate_hyper = {
> +    .name = "cpu/hyper",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = hyper_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> +        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> +        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> +        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.htval, RISCVCPU),
> +        VMSTATE_UINTTL(env.htinst, RISCVCPU),
> +        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> +        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>
> -    return riscv_has_ext(env, RVV);
> -}
> +        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> +        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
> +        VMSTATE_UINTTL(env.vscause, RISCVCPU),
> +        VMSTATE_UINTTL(env.vstval, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
>
> -static bool pointermasking_needed(void *opaque)
> +        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
> +        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> +
> +        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
> +        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
> +        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool vector_needed(void *opaque)
>  {
>      RISCVCPU *cpu = opaque;
>      CPURISCVState *env = &cpu->env;
>
> -    return riscv_has_ext(env, RVJ);
> +    return riscv_has_ext(env, RVV);
>  }
>
>  static const VMStateDescription vmstate_vector = {
> @@ -108,6 +138,14 @@ static const VMStateDescription vmstate_vector = {
>          }
>  };
>
> +static bool pointermasking_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return riscv_has_ext(env, RVJ);
> +}
> +
>  static const VMStateDescription vmstate_pointermasking = {
>      .name = "cpu/pointer_masking",
>      .version_id = 1,
> @@ -126,44 +164,6 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> -static const VMStateDescription vmstate_hyper = {
> -    .name = "cpu/hyper",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .needed = hyper_needed,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
> -        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
> -        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
> -        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
> -        VMSTATE_UINTTL(env.htval, RISCVCPU),
> -        VMSTATE_UINTTL(env.htinst, RISCVCPU),
> -        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
> -        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> -
> -        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
> -        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
> -        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
> -        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
> -        VMSTATE_UINTTL(env.vscause, RISCVCPU),
> -        VMSTATE_UINTTL(env.vstval, RISCVCPU),
> -        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
> -
> -        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
> -        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> -
> -        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
> -        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
> -        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
> -
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> --
> 2.25.1
>
>

