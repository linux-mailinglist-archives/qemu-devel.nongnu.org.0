Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A4472015
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 05:43:53 +0100 (CET)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwdBo-0004aH-ID
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 23:43:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwdAE-0003EK-Pc
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:42:14 -0500
Received: from [2a00:1450:4864:20::330] (port=35733
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwdAC-0001nx-Fk
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:42:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so13232321wme.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 20:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xqCJCFenZgSfOUl/R4/U5gUMa3ys+XwRbdFxwDxzVI=;
 b=v+4+5tDc+1I7MKA8DsmriXHI5GHQNcgvZkDy3QRlLzvN8Xyt2LOhd0jeygmuzoP35o
 AqWE+PkcZtfGODyckJ71I+X6J/y04K9zdKlkxzF1mw50sTuCW2gnqsn3IdfXAjv7QmwN
 CL9BT8dfmdIXMZoZjbenzI4xFEZTlyNM/2oyktf1Y12NybkdIGxXCOHTachQYkggQe/V
 +3spzsQBs/5d4iFGxfiw3NKxBIrPDAgYk1w9AzDy7BPXH2/ZREk5JFkr0H15t3Q5Exix
 jNMLcGdTwbLeRS4szddE1C0v+75SGngsCoOAbKv3co1AiZ7tAjT9E0D6d2FekoNC0LFd
 aCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xqCJCFenZgSfOUl/R4/U5gUMa3ys+XwRbdFxwDxzVI=;
 b=FeSgou19tIilryk9m64CZze6+dTNZCuDVjhGHaB5N9ZBLW6Lbt2DL5ztIgwuWK56ew
 EjvWlmZa08hyHrfytIu/U8bZZ/IzDvRBDKuiJ6yljSWKSo0C+Wp1nTsNPJMa67z2hx4p
 ZbdcHALG/l7ve3YIXfW/IJ08XeA79Ta5tMaSs8Nf1ju4mgaOp37coSOcKqS3P/LGB/AG
 CGLQaHHxa1na390nk+d8mmVypS92vg1Zb9w//PCJggn/aJiAIFXm34b1C0DOUh/a1IPt
 7oGY2M82Mwn01wGOFIOrNJk58Ap9WyPyTdIc3BDtaPTfoy7fFsENBVLkIQ8T/3ExRVfY
 F1hg==
X-Gm-Message-State: AOAM533bfv5xb7Ty2YUesjA6yodtDxtQRqsK9bpsJ0c7IqpIf0Gi+y8D
 IVzX8svMfxdIiEDM7qw24AD0nE9E0N7idczMSQA/dA==
X-Google-Smtp-Source: ABdhPJzorqtXGn5jowXDbWdLBNKLpCk/IlBNYlbHqTEuTlQaxIoYUzbl/nmKUQFFbSTBgGYotftzdwkI6SaDQ5MVD+U=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr34740152wmb.137.1639370531176; 
 Sun, 12 Dec 2021 20:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-13-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:12:00 +0530
Message-ID: <CAAhSdy34UorkvYVi7vUUifBh_TRvrQZW4c7uy1nQrj0UNMKGbg@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 3:38 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add virtual time context description to vmstate_kvmtimer. After cpu being
> loaded, virtual time context is updated to KVM.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/machine.c | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ad8248ebfd..f46443c316 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,10 +164,42 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +

Remove extra newline from here.

> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (kvm_enabled()) {
> +        env->kvm_timer_dirty = true;
> +    }
> +    return 0;
> +}
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
> +    .post_load = cpu_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -218,6 +250,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_hyper,
>          &vmstate_vector,
>          &vmstate_pointermasking,
> +        &vmstate_kvmtimer,
>          NULL
>      }
>  };
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

